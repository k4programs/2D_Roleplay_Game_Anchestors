const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

canvas.width = 800;
canvas.height = 600;

ctx.fillStyle = 'white';
ctx.font = '30px Arial';
ctx.textAlign = 'center';
ctx.fillText('Welcome to the 2D Roleplay Game!', canvas.width / 2, canvas.height / 2);