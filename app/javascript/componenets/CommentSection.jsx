import React, { useEffect, useState } from 'react'
import { Comments } from './Comments'
import { fetchWithAuthentication } from "../utils/fetch_with_authentication";
import { NewCommentForm } from './NewCommentForm';

export const CommentSection = (props) => {
  const [comments, setComments] = useState([]);

  useEffect(() => {
    const projectId = props.projectId;

    refreshCommentsFromApi(projectId, setComments);

    setInterval(() => {
      refreshCommentsFromApi(projectId, setComments);
    }, 10 * 1000)
  }, []);


  return <div>
    <h1>Coments</h1>
    <Comments comments={comments} />
    <NewCommentForm comments={comments} setComments={setComments}/>
  </div>
}

const refreshCommentsFromApi = async (projectId, setComments) => {
  const response = await fetchWithAuthentication(`/api/projects/${projectId}/comments`);
  const commentsJson = await response.json();

  setComments(commentsJson);
}
