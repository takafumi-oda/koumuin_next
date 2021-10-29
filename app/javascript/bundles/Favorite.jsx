import React, { useState } from 'react';
import { StarFill } from 'react-bootstrap-icons';
import axios from 'axios';

axios.defaults.headers['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

const Favorite = (props) => {
  const { postId, favoriteId, user } = props;
  const [id, setId] = useState(favoriteId);

  const clicked = async () => {
    if (user == null) {
      alert('お気に入り機能はログイン後のみ使用可能です');
    } else {
      if (id == null) {
        const { data: { id = null } } = await axios.post('/favorites', { post_id: postId })
        id && setId(id);
      } else {
        await axios.delete(`/favorites/${id}`)
        setId(null);
      }
    }
  }

  return (
    <button className = "favorite-box" onClick={clicked}>
      <StarFill color={id? 'gold' : 'gray'} size={24}/>
      <span>お気に入り</span>
    </button>
  );
};

export default props => <Favorite {...props} />;
