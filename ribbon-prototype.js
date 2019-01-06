let Ribbon = function(width, amountOfLines, speed, direction) {
    this.width = width;
    this.amountOfLines = amountOfLines;
    this.speed = speed;
    this.direction = direction;
    this.lines = [];
    let increment = 2 / this.amountOfLines;
    for (let i = -1; i <= 1; i += increment) {
        this.lines.push(new Line(i, map(Math.sin(i * 10), -1, 1, 0, 1)));
    }
    this.currentNumber = 0;
};

Ribbon.prototype.upgrade = function() {
    this.currentNumber++;
    if (this.currentNumber >= this.amountOfLines) {
        this.currentNumber = 0;
    }
    this.lines[this.currentNumber].blurFactor = 0.1;
    this.lines[this.currentNumber].color.a = amplitude * 32;
    for (let i = 0; i < this.lines.length; i++) {
        this.lines[i].upgrade();
    }
};

Ribbon.prototype.show = function() {
    for (let i = 0; i < this.lines.length; i+= 1) {
        let x = this.lines[i].x + Math.random() * this.lines[i].blurFactor * 1;
        let xx = cos(i * 0.1 + frameCount * 0.1) * 0.05;
        xx = 0;
        lineOptions.blurFactor = this.lines[i].blurFactor * 1;
        lineOptions.r = this.lines[i].color.r;
        lineOptions.g = this.lines[i].color.g;
        lineOptions.b = this.lines[i].color.b;
        lineOptions.a = this.lines[i].color.a;
        let f = frameCount * 0.25;
        x = cos(i + f * 0.25) * cos(f * 0.125) * 0.75;
        let f2 = frameCount * 0.125 * 0.5;
        x2 = cos(i + f2 * 0.25) * cos(f2 * 0.125) * 0.75;
        let f3 = (frameCount + 1) * 0.25;
        x3 = cos(i + f3 * 0.25) * cos(f3 * 0.125) * 0.75;
        if (x3 > x) {
            makeLine(x + xx, 1, x, -1);
        }
        
    }
};

let Line = function(x, g) {
    this.x = x;
    this.blurFactor = 0.01;
    this.color = {
        r: 1,
        g: g,
        b: 0,
        a: 0
    };
};

Line.prototype.upgrade = function() {
    if (this.blurFactor > 0.01) {
        this.blurFactor -= 0.005;
    }
    if (this.color.a > 0.0) {
        this.color.a -= 0.0125;
    }
}