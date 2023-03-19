#!/bin/bash

npx create-react-app gui --template typescript &&
cd gui &&
npm install sass &&
npm install react-transition-group &&
npm install react-query @types/react-query &&
npm install react-router-dom &&
wait &&
rm -r src && mkdir src && cd src || exit &&
touch App.tsx index.tsx &&
mkdir components assets css && cd components || exit &&
touch Navbar.tsx Landing.tsx &&
cd ../assets || exit && mkdir images && cd ../css || exit &&
touch Template.scss Navbar.scss Reset.css Landing.scss Home.scss &&
wait &&
cd ../ || exit &&

APP="
import './css/Reset.css'
import './css/Template.scss'
import './css/Navbar.scss'
import './css/Landing.scss'
import './css/Login.scss'
import Navbar from './components/Navbar';
import Login from './components/Login';
import Home from './components/Home';
import React from 'react';
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';

function App() {
    return (
        <Router>
            <Navbar/>
            <Routes>
                <Route path={'/'} element={<Home/>}/>
                <Route path={'/login'} element={<Login/>}/>
            </Routes>
        </Router>
    );
}

export default App;
"

echo "$APP" > App.tsx

INDEX="
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

// @ts-ignore
ReactDOM.createRoot(document.getElementById('root')).render(<App />);
"

echo "$INDEX" > index.tsx

cd css || exit

CSS_RESET="
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font: inherit;
    font-size: 100%;
    vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
    display: block;
}
body {
    line-height: 1;
}
ol, ul {
    list-style: none;
}
blockquote, q {
    quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
    content: '';
    content: none;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
"

echo "$CSS_RESET" > Reset.css

LANDING_CSS="
.landing {
  height: calc(100vh - 4rem);

  @media screen and (max-width: 991px) {
    height: calc(100vh - 3rem);
  }
}

.landing-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 2rem;
  height: 100%;
  position: relative;
  cursor: pointer;
  background: linear-gradient(
        -45deg,
        rgba(var(--color-primary), 1) 0%,
        rgba(var(--color-secondary), 0.5) 100%
  );

  &:after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    /*background: url('../assets/images/pattern1.png') no-repeat center center fixed;*/
    background-size: cover;
    opacity: 0.5;
    mix-blend-mode: hard-light;

    @media screen and (min-width: 991px) {
      animation: landing-move 3s ease-in-out infinite alternate;
      background-size: 100%;
    }

    @keyframes landing-move {
      0% {
        filter: contrast(100%);
      }
      100% {
        filter: contrast(50%);
      }
    }
  }

  h2 {
    font-size: max(5rem, 10vw);
    text-align: center;
  }

  p {
    font-size: max(1.5rem, 3vw);
    text-align: center;
  }
}
"

echo "$LANDING_CSS" > Landing.scss

LOGIN_CSS="
#login-content {
  padding: 2rem;
  height: calc(100vh - 4rem);
  overflow-x: hidden;
  overflow-y: scroll;
}

#login-header {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;

  h1 {
    font-size: max(3rem, 5vw);

    span {
      font-size: max(1.5rem, 3vw);
    }
  }
}

#login-content-wrapper {
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 2rem;
}

#login-form {
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 2rem;
  padding: 1rem;
  height: 50vh;
  width: 50vw;
  font-weight: 300;
  position: relative;
}


// settings menu
#settings {
  display: flex;
  align-items: flex-end;
  justify-content: flex-end;
  width: 100%;
  height: 100%;
  transition: 0.3s all ease-in-out;


  // settings icon
  img {
    cursor: pointer;
    transform: scale(95%);
    z-index: 333;
    margin-right: 2rem;
    padding: 0.5rem;
    transition: 0.3s all ease-in-out;

    &:hover {
      transform: scale(80%);
      background: rgba(var(--color-dark), 0.3);
      border-radius: 50%;
    }

  }
}


// settings list
.settings-list {
  opacity: 0;
  position: absolute;
  transition: 0.3s all ease-in-out;
  width: 100%;
  height: 100%;
  background: #252834;
  padding: 1rem 2rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  border-radius: 10px;
  transform: scale(90%);
  top: 0;
  left: 0;
  font-size: 2rem;
  z-index: -1;
}

.settings-list-active {
  opacity: 1;
  transform: scale(100%);
  z-index: 222;

  li {
    transition: 0.3s all ease-in-out;
    cursor: pointer;
  }

  li:hover{
    color: #E63946;
  }
}


.login-fields {
  height: 3rem;
  width: 90%;
  padding: 0.5rem 1rem;
  font-size: 2rem;
  border-radius: 10px;
  outline: none;
  border: none;
  background: rgba(var(--color-dark), 0.3);
  transition: 0.3s all ease-in-out;
  color: rgba(var(--color-light));
  text-align: center;

  &::placeholder {
    color: rgba(var(--color-light));
    text-align: center;
  }

  &:focus {
    background: #252834;
  }
}

#submit-button {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 90%;
  height: 3rem;
  padding: 0.5rem 1rem;
  border-radius: 10px;
  outline: none;
  border: none;
  background: linear-gradient(
                  90deg,
                  #E63946,
                  #f4a261
  );
  font-size: 2rem;
  color: rgba(var(--color-dark));
  font-weight: 700;
  position: relative;
  transition: 0.3s all ease-in-out;
  cursor: pointer;

  &:hover {
    transform: scale(95%);
  }
}
"

echo "$LOGIN_CSS" > Login.scss

NAVBAR_CSS="

#navbar {
  padding: 0.5rem 2rem;
  z-index: 333;

  @media screen and (max-width: 991px) {
    padding: 0;
  }
}

#navbar-wrapper {
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: relative;

  @media screen and (max-width: 991px) {
    flex-direction: column;
    align-items: flex-start;
  }
}

#navbar-logo {
  //todo
}

#navbar-logo-wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1rem;

  @media screen and (max-width: 991px) {
    padding: 0.5rem 2rem;
  }

  h1, a {
    font-size: 2rem;
    font-weight: 700;
    text-decoration: none;
    color: rgba(var(--color-white));
    cursor: pointer;

    &:hover {
      background: linear-gradient(
                      30deg,
                      rgba(var(--color-primary), 1) 0%,
                      rgba(var(--color-secondary), 1) 100%
      );
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
  }

  button {
    outline: none;
    background: none;
    border: none;
    padding: 0;
    margin: 0;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;

    &:active {
      transform: scale(0.90);
    }

    @media screen and (min-width: 992px) {
      display: none;
    }
  }
}

#navbar-list-wrapper {
  display: flex;
  align-items: center;
  gap: 2rem;
  font-size: 1.5rem;
  transition: 0.3s all ease-in-out;

  li, a {
    text-decoration: none;
    cursor: pointer;
    color: rgba(var(--color-light), 0.3);

    @media screen and (max-width: 991px) {
      padding-left: 1rem;
    }

    .nav-link-active {
      color: rgba(var(--color-light), 1);
    }
  }

  @media screen and (max-width: 991px) {
    position: absolute;
    flex-direction: column;
    align-items: flex-start;
    gap: 1rem;
    top: 4rem;
    padding: 1rem 0;
    width: 100%;
  }
}

.navbar-list {

  @media screen and (max-width: 991px) {
    opacity: 0;
    transform: translateX(-100%);
  }
}

.navbar-list-active {
  z-index: 333;
  opacity: 1;
  transform: translateX(0);
  background: #252834;
}
"

echo "$NAVBAR_CSS" > Navbar.scss

TEMPLATE_CSS="
@import url('https://fonts.googleapis.com/css2?family=Oxygen:wght@300;400;700&display=swap');

* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;

  ::-webkit-scrollbar {
    display: none;
  }
}

:root {
  --color-primary: 105, 91, 128;
  --color-secondary: 115, 66, 73;
  --color-light: 232, 213, 181;
  --color-dark: 54, 57, 70;

}

body {
  font-family: 'Oxygen', sans-serif;
  line-height: 1.5;
  font-size: 1.2rem;
  color: rgba(var(--color-light));
  background: #363946;
}

#root {
  background: linear-gradient(
                  0deg,
                  #252834,
                  #363946
  );
  //height: 100vh;
  min-height: 100vh;
}
"

echo "$TEMPLATE_CSS" > Template.scss

cd ../components || exit
NAVBAR_CONTENT="
import {Link} from 'react-router-dom';
import {useLocation} from 'react-router-dom';


function Navbar() {

    const location = useLocation();

    function HandleMobileMenu() {
        const active = 'navbar-list-active';
        const button = document.querySelector('.navbar-list');
        if (button!.classList.contains(active)) {
            button!.classList.remove(active);
        } else {
            button!.classList.add(active);
        }
    }

    function Logo() {

        function Button() {
            return (
                <button
                    className={'mobile-menu'}
                    onClick={HandleMobileMenu}
                >
                    <img
                        src='https://img.icons8.com/external-anggara-basic-outline-anggara-putra/32/E8D5B5/external-option-social-media-interface-anggara-basic-outline-anggara-putra-2.png'
                        alt={'hamburger-menu'}/>
                </button>
            );
        }

        return (
            <div id={'navbar-logo'}>
                <div id={'navbar-logo-wrapper'}>
                    <Button/>
                    <a href={'/'}>App</a>
                </div>
            </div>
        );
    }

    function List() {

        const data = [
            {title: 'Home', link: '/'},
            {title: 'Login', link: '/login'}
        ]

        return (
            <div id={'navbar-list'}>
                <ul id={'navbar-list-wrapper'} className={'navbar-list'}>
                    {data.map((item: any, index: number) => {
                        return (
                            <li key={index} onClick={() => {
                                if (window.innerWidth < 992) HandleMobileMenu()
                            }}>
                                <Link
                                    to={item.link}
                                    className={location.pathname === item.link ? 'nav-link-active' : 'nav-link'}
                                >{item.title}
                                </Link>
                            </li>
                        )
                    })}
                </ul>
            </div>
        );
    }

    return (
        <div id={'navbar'}>
            <div id={'navbar-wrapper'}>
                <Logo/>
                <List/>
            </div>
        </div>
    );
}

export default Navbar;
"

echo "$NAVBAR_CONTENT" > Navbar.tsx

LANDING_CONTENT="
function Landing(props: any) {

    return (
        <div className={'landing'}>
            <div className={'landing-wrapper'} onClick={props.jump}>
                <h2>{props.page}</h2>
                {props.content ? <p>{props.content}</p> : null}
            </div>
        </div>
    );
}

export default Landing;
"

echo "$LANDING_CONTENT" > Landing.tsx

LOGIN_CONTENT="
function Login() {

    function HideOrShow() {
        const list = document.querySelector('.settings-list') as HTMLUListElement;
        const active = 'settings-list-active';
        if (list!.classList.contains(active)) {
            list!.classList.remove(active);
        } else {
            list!.classList.add(active)
        }
    }

    function SettingsList() {

        return (
            <ul id={'settings-list'} className={'settings-list'}>
                <li>Forgot Password</li>
                <li>Sign Up</li>
            </ul>
        )
    }

    return (
        <div id={'login-content'}>
            <div id={'login-content-wrapper'}>
                <header id={'login-header'}>
                    <h1>Welcome Back, <span>Shepherd</span>.</h1>
                    <p>Please login to continue.</p>
                </header>
                <form id={'login-form'}>
                    <div id={'settings'}>
                        <img
                            src='https://img.icons8.com/ios-glyphs/30/E8D5B5/more.png' alt={'more'}
                            onClick={HideOrShow}
                        />
                        <SettingsList/>
                    </div>
                    <input
                        id={'username-input'}
                        className={'login-fields'}
                        placeholder={'Username'}
                    />
                    <input
                        id={'password-input'}
                        className={'login-fields'}
                        placeholder={'Password'}
                    />
                    <button
                        id={'submit-button'}
                        type={'submit'}
                    >Login
                    </button>
                </form>
            </div>
        </div>
    );
}

export default Login;
"
echo "$LOGIN_CONTENT" > Login.tsx

HOME_CONTENT="
function Home() {
    return <h1>Hello World</h1>
}

export default Home;
"
echo "$HOME_CONTENT" > Home.tsx


cd ../ || exit && npm run start