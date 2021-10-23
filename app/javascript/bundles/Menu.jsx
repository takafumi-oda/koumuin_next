import React from "react";

const Menu = (props) => {
  return (
    <>
      {props.showFlag ? (
        <div className = "menu-window">
          <a href = {'/users/'+props.user.id} className = "dropdown-item">ユーザー情報</a>
          <div className = "dropdown-divider"></div>
          <a href = {'/users/'+props.user.id+'/edit'} className = "dropdown-item">設定</a>
          <div className = "dropdown-divider"></div>
          <a href = {'/password/'+props.user.id+'/edit'} className = "dropdown-item">パスワードの変更</a>
          <div className = "dropdown-divider"></div>
          <a href = {'/users/'+props.user.id+'/posts'} className = "dropdown-item">これまでした相談</a>
          <div className = "dropdown-divider"></div>
          <a href = {'/favorites'} className = "dropdown-item">お気に入り</a>
          <div className = "dropdown-divider"></div>
          <a href = {'/logout'} data-method='delete' className = "dropdown-item">ログアウト</a>
        </div>
      ) : (
        <></>
      )}
    </>
  );
};

export default Menu;
