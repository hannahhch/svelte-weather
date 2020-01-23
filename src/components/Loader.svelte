<div class="group">
  <div class="cloud"></div>
  <div class="bolt"></div>
</div>

<style type="text/scss">
  $white: #fff;
  $blue: #0984e3;
  $yellow: yellow;

  .group {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;
    animation-name: slide;
    animation-duration: 40s;
    animation-iteration-count: infinite;
    width: 100%;
  }

  .bolt {
    background-color: $yellow;
    height: 65px;
    width: 30px;
    margin-left: 40px;
    animation-name: strike;
    animation-duration: 6s;
    animation-iteration-count: infinite;
    position: relative;
    z-index: -1;
    box-shadow: 0 10px 8px rgba(0, 0, 0, .2);
    transform: skew(-20deg) translateY(-100px);
    opacity: 0;
    
    &:after {
      content: '';
      position: absolute;
      right: -15px;
      width: 0;
      height: 0;
      top: 50px;
      border-left: 15px solid transparent;
      border-right: 20px solid transparent;
      border-top: 90px solid $yellow;
      transform: skew(-10deg);
    }
  }

  .cloud {
    background-color: $white;
    box-shadow: 0 10px 8px rgba(0, 0, 0, .2);
    width: 200px;
    height: 70px;
    border-radius: 100px;
    position: relative;
    
    &:before {
      content: '';
      height: 100px;
      width: 100px;
      right: 15%;
      background-color: white;
      position: absolute;
      top: -50px;
      border-radius: 50%;
    }
    
    &:after {
      content: '';
      height: 60px;
      width: 60px;
      right: 55%;
      background-color: white;
      position: absolute;
      top: -25px;
      border-radius: 50%;
    }
  }

  @keyframes strike {
    1% {
      opacity: 1;
      transform: skew(-20deg) translateY(0);
    }
    15% {
      opacity: 0;
      transform: skew(-20deg) translateY(-80px);
    }

  }

  @keyframes slide {
    50% {
      transform: translateX(100%);
    }
    100% {
      transform: translateX(0);
    }
  }
</style>