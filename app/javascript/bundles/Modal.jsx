import React from "react";

const Modal = (props) => {
  const closeModal = () =>{
    props.setShowModal(false);
  };

  return (
    <>
      {props.showFlag ? (
        <div className = "overlay">
          <div className = "modal-window">
            <p className = "card-header">ユーザー情報</p>
            <div className = "card-body">
              <div className = "card-box">
                <p className = "card-name">ユーザー名</p>
                <p className = "card-text">{props.user.name}</p>
              </div>
              <div className = "card-box">
                <p className = "card-name">年代</p>
                <p>{props.user.age}</p>
              </div>
              <div className = "card-box">
                <p className = "card-name">組織</p>
                <p>{props.user.organization}</p>
              </div>
              <div className = "card-box">
                <p className = "card-name">職種</p>
                <p>{props.user.job}</p>
              </div>
              <div className = "card-box">
                <p className = "card-name">現在の状況</p>
                <p>{props.user.status}</p>
              </div>
              <div className = "card-box">
                <p className = "card-name">自己紹介</p>
                <p>{props.user.introduction}</p>
              </div>
              <div className = "btn-position">
                <button className = "close-button" onClick={closeModal}>Close</button>
              </div>
            </div>
          </div>
        </div>
      ) : (
        <></>
      )}
    </>
  );
};

export default Modal;
