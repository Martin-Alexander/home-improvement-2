import React, { useEffect, useState } from 'react'
import { Comments } from './Comments'
import { NewCommentForm } from './NewCommentForm';
import * as CommentsConsumer from '../consumers/comments_consumer';

import TimeAgo from "javascript-time-ago";
import en from "javascript-time-ago/locale/en";

TimeAgo.addDefaultLocale(en);
const timeAgo = new TimeAgo('en-US');

export const CommentSection = (props) => {
  const [comments, setComments] = useState([]);
  const projectId = props.projectId;

  useEffect(() => {
    // Fetch existing comments on page load
    refreshCommentsFromApi(projectId, setComments);

    // Every ten seconds, load new comments
    setInterval(() => {
      refreshCommentsFromApi(projectId, setComments, comments);
    }, 10 * 1000);
  }, []);

  const onSubmitCallback = async (commentContent) => {
    const commentJson = await CommentsConsumer.Create(projectId, commentContent)
    setComments(perpareComments([...comments, commentJson]));
  }

  return <div>
    <h1 className="text-lg font-bold mb-4">Comments ({ comments.length })</h1>
    { props.userSignedIn && <NewCommentForm onSubmit={onSubmitCallback}/> }
    <Comments comments={comments} />
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

  setComments(perpareComments(commentsJson));
}

const perpareComments = (comments) => {
  return comments
    .sort((a, b) => Date.parse(b.createdAt) - Date.parse(a.createdAt))
    .map((comment) => {
      comment.timeAgo = timeAgo.format(Date.parse(comment.createdAt));
      return comment;
    })
};