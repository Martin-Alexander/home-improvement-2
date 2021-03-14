import React from 'react'
import { Comment } from "./Comment";

export const Comments = (props) => {
  return <div>
    { props.comments.map(comment => <Comment key={comment.id} {...comment} />) }
  </div>;
}
