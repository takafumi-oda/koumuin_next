import React, { useState } from "react";
import Modal from "./Modal";

const UserModal = (props) => {
  const { user } = props;
  const [showModal, setShowModal] = useState(false);
  const ShowModal = () => {
    setShowModal(true);
  };

  return (
    <>
      <p className="user-modal" onClick={ShowModal}>{user.name}</p>
      <Modal showFlag={showModal} setShowModal={setShowModal} user={user} />
    </>
  );
};

export default UserModal;
