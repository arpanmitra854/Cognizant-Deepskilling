import { useState } from 'react';
import './App.css';

import BookDetails from './components/BookDetails';
import BlogDetails from './components/BlogDetails';
import CourseDetails from './components/CourseDetails';

import { books } from './data/books';
import { blogs } from './data/blogs';
import { courses } from './data/courses';

function App() {
  const [view, setView] = useState('book');

  // Conditional Rendering with if-else
  const renderView = () => {
    if (view === 'book') return <BookDetails books={books} />;
    else if (view === 'blog') return <BlogDetails blogs={blogs} />;
    else if (view === 'course') return <CourseDetails courses={courses} />;
    else return <p>Invalid View</p>;
  };

  return (
    <div style={{ textAlign: 'center' }}>
      <h1>Blogger App</h1>

      <div>
        <button onClick={() => setView('book')}>Book Details</button>
        <button onClick={() => setView('blog')}>Blog Details</button>
        <button onClick={() => setView('course')}>Course Details</button>
      </div>

      <div className="container">
        {renderView()}
      </div>
    </div>
  );
}

export default App;
