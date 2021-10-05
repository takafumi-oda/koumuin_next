import React, { useState } from "react";
import Menu from "./Menu";

const UserMenu = (props) => {
  const { user } = props;
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
      <p className="user-menu" onClick={ShowMenu}>{user.name}</p>
      <Menu showFlag={showMenu} setShowMenu={setShowMenu} user={user} />
    </>
  );
};

export default UserMenu;
