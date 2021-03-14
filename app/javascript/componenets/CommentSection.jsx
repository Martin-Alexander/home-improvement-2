import React, { useEffect, useState } from 'react'
import { Comments } from './Comments'
import { fetchWithAuthentication } from "../utils/fetch_with_authentication";
import { NewCommentForm } from './NewCommentForm';

export const CommentSection = (props) => {
  const [comments, setComments] = useState([]);
  const projectId = props.projectId;

  useEffect(() => {
    refreshCommentsFromApi(projectId, setComments);

    setInterval(() => {
      refreshCommentsFromApi(projectId, setComments);
    }, 10 * 1000)
  }, []);

  const newCommentFormOnSubmitCallback = createNewCommentFormOnSubmitCallback(projectId, comments, setComments);

  return <div>
    <h1>Coments</h1>
    <Comments comments={comments} />
    <NewCommentForm onSubmit={newCommentFormOnSubmitCallback}/>
  </div>
}

const refreshCommentsFromApi = async (projectId, setComments) => {
  const response = await fetchWithAuthentication(`/api/projects/${projectId}/comments`);
  const commentsJson = await response.json();

  setComments(commentsJson);
}

const createNewCommentFormOnSubmitCallback = (projectId, comments, setComments) => {
  const postNewCommentAndUpdateState = async (commentContent) => {
    const response = await fetchWithAuthentication(`/api/projects/${projectId}/comments`, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ comment: { content: commentContent }})
    });

    const commentJson = await response.json();

    setComments([...comments, commentJson]);
  }

  return postNewCommentAndUpdateState;
}