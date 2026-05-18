const Shimmer = () => {
  return (
    <div className="shimmer-container">
      {[...Array(10)].map((_, i) => (
        <div key={i} className="shimmer-card"></div>
      ))}
    </div>
  );
};

export default Shimmer;
