import React from 'react'

export const Comment = (props) => {
  return <li>
    <strong>{props.user.email}:</strong> <span>{props.content}</span>
  </li>
}