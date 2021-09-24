import PropTypes from 'prop-types';
import React, { useState } from 'react';
import { HeartFill } from 'react-bootstrap-icons';
import axios from 'axios';

axios.defaults.headers['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

const Like = (props) => {
  const { replyId, likeId } = props;
  const [id, setId] = useState(likeId);

  const clicked = async () => {
    if (id == null) {
      const { data: { id = null } } = await axios.post('/likes', { reply_id: replyId })
      id && setId(id);
    } else {
      await axios.delete(`/likes/${id}`)
      setId(null);
    }
  }

  return (
    <>
      <HeartFill color={id ? 'red' : 'gray'} size={32} onClick={clicked}/>
    </>
  );
};

Like.propTypes = {};

export default props => <Like {...props} />;
