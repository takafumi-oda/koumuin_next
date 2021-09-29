import React, { useState } from "react";
import Menu from "./Menu";

const UserMenu = (props) => {
  const { userName, userId } = props;
  const [showMenu, setShowMenu] = useState(false);
  const ShowMenu = () => {
    if (showMenu) {
      setShowMenu(false);
    } else {
      setShowMenu(true);
    }
  };

  return (
    <>
      <p className="user-menu" onClick={ShowMenu}>{userName}</p>
      <Menu showFlag={showMenu} setShowMenu={setShowMenu} userId={userId} />
    </>
  );
};

export default UserMenu;
