const camelcaseObject = require('camelcase-object');

import { fetchWithAuthentication } from "../utils/fetch_with_authentication";

export const Index = async (projectId) => {
  const response = await fetchWithAuthentication(`/api/projects/${projectId}/comments`);

  if (!response.ok) { throw new Error(response.statusText) }

  const comments = await response.json()
  return comments.map(comment => camelcaseObject(comment));
}

export const Create = async (projectId, content) => {
  const response = await fetchWithAuthentication(`/api/projects/${projectId}/comments`, {
    method: "POST",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ comment: { content: content }})
  });

  if (!response.ok) { throw new Error(response.statusText) }

  return camelcaseObject(await response.json());
}