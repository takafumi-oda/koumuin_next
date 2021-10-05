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
            <p>{props.user.name}</p>
            <p>{props.user.age}</p>
            <p>{props.user.organization}</p>
            <p>{props.user.job}</p>
            <p>{props.user.status}</p>
            <p>{props.user.introduction}</p>
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
