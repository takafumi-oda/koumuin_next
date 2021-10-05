import React from "react";

const Menu = (props) => {
  return (
    <>
      {props.showFlag ? (
        <div className = "menu-window">
          <ul>
            <li>
              <a href = {'/users/'+props.user.id}>アカウント情報</a>
            </li>
            <li>
              <a href = {'/favorites'}>お気に入り一覧</a>
            </li>
            <li>
              <a href = {'/users/'+props.user.id+'/edit'}>設定</a>
            </li>
            <li>
              <a href = {'/password/'+props.user.id+'/edit'}>パスワードの変更</a>
            </li>
            <li>
              <a href = {'/logout'} data-method='delete' confirm='本当に削除しますか？'>ログアウト</a>
            </li>
          </ul>
        </div>
      ) : (
        <></>
      )}
    </>
  );
};

export default Menu;
