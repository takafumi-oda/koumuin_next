import React, { useState } from "react";
import UserModalBox from "./UserModalBox";

const UserModal = (props) => {
  const { user } = props;
  const [showModal, setShowModal] = useState(false);
  const ShowModal = () => {
    setShowModal(true);
  };

  return (
    <>
      <p className="user-modal" onClick={ShowModal}>{user.active ? user.name : "退会したユーザー"}</p>
      <UserModalBox showFlag={showModal} setShowModal={setShowModal} user={user} />
    </>
  );
};

export default UserModal;
