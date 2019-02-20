let palette, inversePalette;
inversePalette = false;


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
    for (let i = 0; i < this.lines.length; i += 1) {
        let x = this.lines[i].x + Math.random() * this.lines[i].blurFactor * 1;
        // let xx = cos(i * 0.1 + frameCount * 0.1) * 0.05;
        // xx = 0;
        lineOptions.blurFactor = this.lines[i].blurFactor * blurScalar;
        let color = getColor(i + frameCount * 1);
        color.b -= 0.2;
        lineOptions.r = color.r;
        lineOptions.g = color.g;
        lineOptions.b = color.b;
        lineOptions.a = this.lines[i].color.a;
        if (inversePalette) {
            lineOptions.r *= 0.25;
            lineOptions.g *= 0.25;
            lineOptions.b *= 0.25;
            lineOptions.b -= 0.2;
        }
        // let f = frameCount * 0.01;
        //         x = cos(i + f * 0.25) * cos(f * 0.125) * 0.75;
        // let f2 = frameCount * 0.125 * 0.5;
        // x2 = cos(i + f2 * 0.25) * cos(f2 * 0.125) * 0.75;
        // let f3 = (frameCount + 1) * 0.25;
        // x3 = cos(i + f3 * 0.25) * cos(f3 * 0.125) * 0.75;
        //         if (x3 > x) {
        makeOrthoLine(x, 1 + Math.random() * 0.001, x, -1);
        //         }
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

seedPalette = function() {
    return {
        name: "randomlyGenerated",
        data: {
            redOsc: Math.floor(Math.random() * 10),
            redMin: Math.floor(Math.random() * 255),
            redMax: Math.floor(Math.random() * 255),
            greenOsc: Math.floor(Math.random() * 10),
            greenMin: Math.floor(Math.random() * 255),
            greenMax: Math.floor(Math.random() * 255),
            blueOsc: Math.floor(Math.random() * 10),
            blueMin: Math.floor(Math.random() * 255),
            blueMax: Math.floor(Math.random() * 255)
        }
    }
}

getColor = function(c) {
    //     let inversePalette = true;
    let p = palette.data;
    let red = map(sin(c / p.redOsc), -1, 1, p.redMin, p.redMax);
    let green = map(sin(c / p.greenOsc), -1, 1, p.greenMin, p.greenMax);
    let blue = map(sin(c / p.blueOsc), 1, -1, p.blueMin, p.blueMax);
    if (inversePalette) {
        red = 255 - red;
        green = 255 - red;
        blue = 255 - blue;
    }
    return {
        r: red /  255,
        g: green /  255,
        b: blue /  255
    }
};

// choosePalette();
// inversePalette = !inversePalette;
palette = seedPalette();

function choosePalette() {
    palette = random(palettes);
}

function blurrier() {
    Ribbon.prototype.show = function() {
        for (let i = 0; i < 10; i += 1) {
            let x = this.lines[i].x + Math.random() * this.lines[i].blurFactor * 1;
            x = -1 + i * width/9 * 0.02 + Math.random() * this.lines[i].blurFactor * 1;
            // let xx = cos(i * 0.1 + frameCount * 0.1) * 0.05;
            // xx = 0;
            lineOptions.blurFactor = blurScalar * 0.5;
            let color = getColor(i + frameCount * 1);
            color.b -= 0.2;
            lineOptions.r = color.r;
            lineOptions.g = color.g;
            lineOptions.b = color.b;
            lineOptions.a = this.lines[i].color.a;
            if (inversePalette) {
                lineOptions.r *= 0.25;
                lineOptions.g *= 0.25;
                lineOptions.b *= 0.25;
                lineOptions.b -= 0.2;
            }
    //         let f = frameCount * 0.01;
    //                 x = cos(i + f * 0.25) * cos(f * 0.125) * 0.75;
            // let f2 = frameCount * 0.125 * 0.5;
            // x2 = cos(i + f2 * 0.25) * cos(f2 * 0.125) * 0.75;
            // let f3 = (frameCount + 1) * 0.25;
            // x3 = cos(i + f3 * 0.25) * cos(f3 * 0.125) * 0.75;
            //         if (x3 > x) {
            makeOrthoLine(x, 1 + Math.random() * 0.001, x, -1);
            //         }
        }
    };
}