import React, { useState } from "react";
import Modal from "./Modal";

const UserModal = (props) => {
  const { userName, userAge, userOrganization, userJob, userStatus, userIntroduction } = props;
  const [showModal, setShowModal] = useState(false);
  const ShowModal = () => {
    setShowModal(true);
  };

  return (
    <>
      <p className="user-modal" onClick={ShowModal}>{userName}</p>
      <Modal showFlag={showModal} setShowModal={setShowModal} userName={userName} userAge={userAge} userOrganization={userOrganization} userJob={userJob} userStatus={userStatus} userIntroduction={userIntroduction} />
    </>
  );
};

export default UserModal;
