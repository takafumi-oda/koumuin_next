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
            <p>{props.userName}</p>
            <p>{props.userAge}</p>
            <p>{props.userOrganization}</p>
            <p>{props.userJob}</p>
            <p>{props.userStatus}</p>
            <p>{props.userIntroduction}</p>
            <button onClick={closeModal}>Close</button>
          </div>
        </div>
      ) : (
        <></>
      )}
    </>
  );
};

export default Modal;
