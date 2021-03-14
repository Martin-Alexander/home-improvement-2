import React from 'react'
import { Comment } from "./Comment";

export const Comments = (props) => {
  return <div className="space-y-4">
    { props.comments.map(comment => <Comment key={comment.id} {...comment} />) }
  </div>;
}
