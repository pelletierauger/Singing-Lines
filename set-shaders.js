function setShaders() {
    /*======================= Shaders =======================*/

    // vertex shader source code
    var vertCode = `
        attribute vec3 coordinates;
        attribute vec4 color;
        varying vec4 vColor;
        void main(void) {
            gl_Position = vec4(coordinates, 1.0);
            gl_Position.x = gl_Position.x * (1600.0 / 2560.0);
        vColor = color;
    }`;

    // Create a vertex shader object
    var vertShader = gl.createShader(gl.VERTEX_SHADER);

    // Attach vertex shader source code
    gl.shaderSource(vertShader, vertCode);

    // Compile the vertex shader
    gl.compileShader(vertShader);


    // fragment shader source code
    var fragCode = `
    precision mediump float;
    varying vec4 vColor;
    float rand(vec2 co){
        return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(co.x)));
    }
    void main(void) {
        vec2 pos = gl_PointCoord;
        float rando = rand(pos);
        gl_FragColor = vec4(vColor.x, vColor.y, vColor.z + (rando * 0.3), vColor.w - (rando * 0.3));
        // gl_FragColor = vColor;
    }`;

    // Create fragment shader object
    var fragShader = gl.createShader(gl.FRAGMENT_SHADER);

    // Attach fragment shader source code
    gl.shaderSource(fragShader, fragCode);

    // Compile the fragmentt shader
    gl.compileShader(fragShader);

    // Create a shader program object to
    // store the combined shader program
    shaderProgram = gl.createProgram();

    // Attach a vertex shader
    gl.attachShader(shaderProgram, vertShader);

    // Attach a fragment shader
    gl.attachShader(shaderProgram, fragShader);

    // Link both the programs
    gl.linkProgram(shaderProgram);

    // Use the combined shader program object
    gl.useProgram(shaderProgram);

}