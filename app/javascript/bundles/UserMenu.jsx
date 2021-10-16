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
      <button className="user-menu nav-link dropdown-toggle" onClick={ShowMenu}>メニュー</button>
      <Menu showFlag={showMenu} setShowMenu={setShowMenu} user={user} />
    </>
  );
};

export default UserMenu;
