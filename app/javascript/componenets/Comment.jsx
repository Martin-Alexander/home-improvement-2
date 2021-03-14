import React from "react"

export const Comment = (props) => {
  return <li>
    <p>
      <span className="text-sm font-medium">{props.user.name}</span>
      <span className="ml-2 text-xs text-gray-400">{props.timeAgo}</span>
    </p>
    <p>{props.content}</p>
  </li>
}