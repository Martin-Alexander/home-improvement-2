import React, { useEffect, useState } from 'react'
import { Comments } from './Comments'
import { NewCommentForm } from './NewCommentForm';
import * as CommentsConsumer from '../consumers/comments_consumer';

export const CommentSection = (props) => {
  const [comments, setComments] = useState([]);
  const projectId = props.projectId;

  useEffect(() => {
    // Fetch existing comments on page load
    refreshCommentsFromApi(projectId, setComments);

    // Every ten seconds, load new comments
    setTimeout(() => {
      refreshCommentsFromApi(projectId, setComments, comments);
    }, 10 * 1000);
  }, []);

  const onSubmitCallback = async (commentContent) => {
    const commentJson = await CommentsConsumer.Create(projectId, commentContent)
    setComments([...comments, commentJson]);
  }

  return <div>
    <Comments comments={comments} />
    { props.userSignedIn && <NewCommentForm onSubmit={onSubmitCallback}/> }
  </div>
}


const refreshCommentsFromApi = async (projectId, setComments, existingComments) => {
  const commentsJson = await CommentsConsumer.Index(projectId);

  // If 'existingComments' was passed in, then mark any new comments as 'new'
  if (existingComments) {
    const existingCommentIds = existingComments.map(comment => comment.id);

    commentsJson.forEach((comment) => {
      if (!existingCommentIds.includes(comment.id)) {
        comment.new = true;
      }
    });
  }

  setComments(commentsJson);
}