import React, { useState } from 'react';
import { HeartFill } from 'react-bootstrap-icons';
import axios from 'axios';

axios.defaults.headers['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

const Like = (props) => {
  const { replyId, likeId, likeCount, user } = props;
  const [id, setId] = useState(likeId);
  const [count, setCount] = useState(likeCount);

  const clicked = async () => {
    if (user == null) {
      alert('いいね機能はログイン後のみ使用可能です');
    } else {
      if (id == null) {
        const { data: { id = null } } = await axios.post('/likes', { reply_id: replyId })
        id && setId(id);
        setCount(count+1);
      } else {
        await axios.delete(`/likes/${id}`)
        setId(null);
        setCount(count-1);
      }
    }
  }

  return (
    <div className = "like-box" onClick={clicked}>
      <HeartFill color={id? 'red' : 'gray'} size={24}/>
      <span style={id? { color: 'red' } : { color: 'gray'}}>{count}</span>
    </div>
  );
};

export default props => <Like {...props} />;
