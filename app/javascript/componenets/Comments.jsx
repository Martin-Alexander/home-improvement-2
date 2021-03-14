import React from 'react'
import { Comment } from "./Comment";

export const Comments = (props) => {
  return <ul className="space-y-2">
    { props.comments.map(comment => <Comment key={comment.id} {...comment} />) }
  </ul>;
}
