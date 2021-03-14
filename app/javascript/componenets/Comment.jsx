import React from "react"

export const Comment = (props) => {
  return <div className="mb-4">
    <p>
      <span className="inline-block text-sm font-medium">{props.user.name}</span>
      <span className="inline-block ml-2 text-xs text-gray-400">{props.timeAgo}</span>
    </p>
    <p>{props.content}</p>
  </div>
}