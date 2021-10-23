import React from "react";
import axios from 'axios';

axios.defaults.headers['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

const UserWithdrawlModalBox = (props) => {
  const closeModal = () =>{
    props.setShowModal(false);
  };
  const withdrawl = async () => {
    await axios.patch(`/users/${props.user.id}/withdrawl`);
    location.href= `/`;
  };

  return (
    <>
      {props.showFlag ? (
        <div className = "overlay">
          <div className = "modal-window withdrawl-modal-window">
            <div className = "withdrawl-message">
              <p>本当に退会しますか？</p>
              <p>退会する場合は、『退会する』をクリックしてください。</p>
            </div>
            <div className = "btn-position">
              <button className = "btn btn-danger btn-sm" onClick={withdrawl}>退会する</button>
              <button className = "btn btn-light btn-sm" onClick={closeModal}>退会しない</button>
            </div>
          </div>
        </div>
      ) : (
        <></>
      )}
    </>
  );
};

export default UserWithdrawlModalBox;
