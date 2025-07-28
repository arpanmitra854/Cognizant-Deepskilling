const BlogDetails = ({ blogs }) => (
  <div className="v1">
    <h1>Blog Details</h1>
    {blogs.map((blog, index) => (
      <div key={index}>
        <h2>{blog.title}</h2>
        <h4>{blog.author}</h4>
        <p>{blog.content}</p>
      </div>
    ))}
  </div>
);
export default BlogDetails;
