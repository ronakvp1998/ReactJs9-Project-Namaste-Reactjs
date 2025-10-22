import express from "express";
import cors from "cors";
import puppeteer from "puppeteer";

const app = express();
const PORT = 5000;

app.use(cors());

const BASE_LIST_URL =
  "https://www.swiggy.com/dapi/restaurants/list/v5?lat=19.2644981&lng=72.9652491&is-seo-homepage-enabled=true&page_type=DESKTOP_WEB_LISTING";

const BASE_MENU_URL =
  "https://www.swiggy.com/dapi/menu/pl?page-type=REGULAR_MENU&complete-menu=true&lat=19.264195729772464&lng=72.9737383972688&catalog_qa=undefined&submitAction=ENTER";

// 🧩 Fetch restaurant list
async function fetchSwiggyList() {
  const browser = await puppeteer.launch({
    headless: true,
    args: [
      "--no-sandbox",
      "--disable-setuid-sandbox",
      "--disable-blink-features=AutomationControlled",
    ],
  });

  const page = await browser.newPage();
  await page.setUserAgent(
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
  );

  console.log("🌐 Opening Swiggy restaurant list...");

  const [response] = await Promise.all([
    page.waitForResponse(
      (res) =>
        res.url().includes("dapi/restaurants/list/v5") && res.status() === 200
    ),
    page.goto(BASE_LIST_URL, { waitUntil: "networkidle2" }),
  ]);

  const json = await response.json();
  await browser.close();
  return json;
}

// 🧩 Fetch restaurant menu
async function fetchSwiggyMenu(restaurantId) {
  const url = `${BASE_MENU_URL}&restaurantId=${restaurantId}`;
  const browser = await puppeteer.launch({
    headless: true,
    args: [
      "--no-sandbox",
      "--disable-setuid-sandbox",
      "--disable-blink-features=AutomationControlled",
    ],
  });

  const page = await browser.newPage();
  await page.setUserAgent(
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
  );

  console.log(`🌐 Opening Swiggy menu for restaurantId=${restaurantId}`);

  const [response] = await Promise.all([
    page.waitForResponse(
      (res) => res.url().includes("dapi/menu/pl") && res.status() === 200
    ),
    page.goto(url, { waitUntil: "networkidle2" }),
  ]);

  const json = await response.json();
  await browser.close();
  return json;
}

// ✅ Route for restaurant list
app.get("/api/restaurants", async (req, res) => {
  try {
    const data = await fetchSwiggyList();
    res.json(data);
  } catch (error) {
    console.error("🔥 Error fetching Swiggy restaurant list:", error);
    res.status(500).json({ error: "Failed to fetch Swiggy restaurant list" });
  }
});

// ✅ Route for restaurant menu
app.get("/api/menu/:restaurantId", async (req, res) => {
  const { restaurantId } = req.params;
  try {
    const data = await fetchSwiggyMenu(restaurantId);
    res.json(data);
  } catch (error) {
    console.error("🔥 Error fetching Swiggy menu:", error);
    res.status(500).json({ error: "Failed to fetch Swiggy menu" });
  }
});

// ✅ Graceful fallback for missing routes
app.use((req, res) => {
  res.status(404).json({ error: "Route not found" });
});

app.listen(PORT, () => {
  console.log(`✅ Server running at http://localhost:${PORT}`);
});
