import { fetchWithAuthentication } from "../utils/fetch_with_authentication";

export const Index = async (projectId) => {
  const response = await fetchWithAuthentication(`/api/projects/${projectId}/comments`);
  return await response.json();
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

  return await response.json();
}