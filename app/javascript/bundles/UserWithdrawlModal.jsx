import React, { useState } from "react";
import UserWithdrawlModalBox from "./UserWithdrawlModalBox";

const UserWithdrawlModal = (props) => {
  const { user } = props;
  const [showModal, setShowModal] = useState(false);
  const ShowModal = () => {
    setShowModal(true);
  };

  return (
    <>
      <button className="btn btn-outline-danger withdrawl-btn" onClick={ShowModal}>ιδΌγγ</button>
      <UserWithdrawlModalBox showFlag={showModal} setShowModal={setShowModal} user={user} />
    </>
  );
};

export default UserWithdrawlModal;
