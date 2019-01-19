const _ctx = document.getElementById('canvas').getContext('2d');
const _sprites = new Set();
let _lastMoveTime = 0;
let _lastSpawnTime = 0;

class Sprite {
  constructor(draw, move, speed, x, y) {
    this._draw = draw;
    this._move = move;
    this.speed = speed;
    this.tick = 0;
    this.x = x;
    this.y = y;
  }
  draw() {
    this._draw(this);
  }
  move() {
    this._move(this);
    this.tick += 1;
  }
  inBounds() {
    return this.y <= _ctx.canvas.height + 10;
  }
}

function animate(time) {
  const dead = [];

  function _animate(f) {
    _ctx.clearRect(0, 0, _ctx.canvas.width, _ctx.canvas.height);
    _ctx.beginPath();
    for (const sprite of _sprites) {
      f(sprite);
      if (!sprite.inBounds()) {
        dead.push(sprite);
      }
    }
    _ctx.closePath();
  }

  if (time-_lastSpawnTime >= 800) {
    _sprites.add(spawn());
    _lastSpawnTime = time;
  }

  if (time-_lastMoveTime >= 10) {
    _animate(function(sprite) {
      sprite.draw();
      sprite.move();
    });
    _lastMoveTime = time;
  } else {
    _animate(function(sprite) {
      sprite.draw();
    });
  }

  for (const sprite of dead) {
    _sprites.delete(sprite);
  }
  requestAnimationFrame(animate);
}

function drawPinwheel(sprite) {
  const cos = Math.cos(sprite.tick/20);
  const sin = Math.sin(sprite.tick/20);
  _ctx.moveTo(-sin*-11+sprite.x, cos*-11+sprite.y);
  _ctx.lineTo(-sin*11+sprite.x, cos*11+sprite.y);
  _ctx.moveTo(cos*9.5-sin*5.5+sprite.x, sin*9.5+cos*5.5+sprite.y);
  _ctx.lineTo(cos*-9.5-sin*-5.5+sprite.x, sin*-9.5+cos*-5.5+sprite.y);
  _ctx.moveTo(cos*9.5-sin*-5.5+sprite.x, sin*9.5+cos*-5.5+sprite.y);
  _ctx.lineTo(cos*-9.5-sin*5.5+sprite.x, sin*-9.5+cos*5.5+sprite.y);
  _ctx.stroke();
}

function drawStar(sprite) {
  const cos = Math.cos(sprite.tick/20);
  const sin = Math.sin(sprite.tick/20);

  function _c(i) {
    const r = 7*(i%2+1);
    const omega = Math.PI/5*i;
    const dx = r*Math.sin(omega);
    const dy = r*Math.cos(omega);
    return { x: cos*dx-sin*dy+sprite.x, y: sin*dx+cos*dy+sprite.y };
  }

  const c = _c(0);
  _ctx.moveTo(c.x, c.y);
  for (let i = 1; i < 11; i++) {
    const c = _c(i);
    _ctx.lineTo(c.x, c.y);
  }
  _ctx.stroke();
}

function moveStraight(sprite) {
  sprite.y += sprite.speed;
}

function moveWavy(sprite) {
  sprite.x += Math.cos(sprite.tick/20);
  sprite.y += sprite.speed;
}

function onresize() {
  _ctx.canvas.width = document.body.clientWidth;
  _ctx.canvas.height = document.body.clientHeight;
  _ctx.strokeStyle = "#545454";
}

function spawn() {
  const seed = Math.random();
  const opts = Math.floor(seed*8);
  const draw = opts & 1 ? drawPinwheel : drawStar;
  const move = opts & 2 ? moveStraight : moveWavy;
  const speed = opts & 4 ? 0.8 : 1.6;
  const x = seed * _ctx.canvas.width;
  return new Sprite(draw, move, speed, x, -10);
}

onresize();
animate();