#!/bin/bash

npx create-react-app gui --template typescript &&
npm install sass &&
npm install react-router-dom &&
npm install react-transition-group &&
npm install react-query @types/react-query &&
wait &&
cd gui || exit &&
wait &&
rm -r src && mkdir src && cd src || exit &&
touch App.tsx index.tsx &&
mkdir components assets css && cd components || exit &&
touch Navbar.tsx Landing.tsx &&
cd ../assets || exit && mkdir images && cd ../css || exit &&
touch Template.scss Navbar.scss Reset.css Landing.scss &&
wait &&
cd ../ || exit &&

APP="
import './css/Reset.css'
import './css/Template.scss'
import './css/Navbar.scss'
import './css/Landing.scss'
import Navbar from './components/Navbar';
import React from 'react';

function App() {
    return (
        <Navbar/>
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

NAVBAR_CSS="
#navbar {
  padding: 0.5rem 2rem;
  background: rgba(245, 245, 245, 0.025);
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

  @media screen and (max-width: 991px) {
    position: absolute;
    flex-direction: column;
    align-items: flex-start;
    gap: 1rem;
    top: 4rem;
    padding: 1rem 0;
    width: 100%;
  }

  li, a {
    text-decoration: none;
    color: rgba(var(--color-white));
    cursor: pointer;

    @media screen and (max-width: 991px) {
      padding-left: 1rem;
    }

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
function Navbar() {

    function HandleMobileMenu() {
        const active = 'navbar-list-active';
        const button = document.querySelector('.navbar-list');
        if (button!.classList.contains(active)) {
            button!.classList.remove(active);
        }
        else {
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
                        src='https://img.icons8.com/external-anggara-basic-outline-anggara-putra/32/E8D5B5/external-option-social-media-interface-anggara-basic-outline-anggara-putra-2.png' alt={'hamburger-menu'}/>
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
            {title: 'About', link: '/about'},
            {title: 'Contact', link: '/contact'}
        ]

        return (
            <div id={'navbar-list'}>
                <ul id={'navbar-list-wrapper'} className={'navbar-list'}>
                    {data.map((item: any, index: number) => {
                        return(
                            <li key={index} onClick={() => {
                                if (window.innerWidth < 992) HandleMobileMenu()
                            }}><a href={item.link}>{item.title}</a></li>
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

export default Navbar;"

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
cd ../ || exit && npm run start