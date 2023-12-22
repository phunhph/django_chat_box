const searchBar = document.querySelector(".search input");
const searchIcon = document.querySelector(".search button");
const usersList = document.querySelector(".users-list");

// searchIcon.onclick = function () {
//   searchBar.classList.toggle("show");
//   searchIcon.classList.toggle("active");
//   searchBar.focus();

//   if (searchBar.classList.contains("active")) {
//     searchBar.value = "";
//     searchBar.classList.remove("active");
//   }
// };

// setInterval(() => {
//   let xhr = new XMLHttpRequest();
//   xhr.open("POST", "api/users.php", true);
//   xhr.onload = () => {
//     if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
//       if (!searchBar.classList.contains("active")) {
//         usersList.innerHTML = xhr.response;
//       }
//     }
//   };
//   xhr.send();
// }, 500);
