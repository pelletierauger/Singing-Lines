(
~chirps4.stop;
~chirps4 = Pbind(
    \instrument, \pulse,
    \dur, Pseq([Pseq([0.125 * 0.5 * 8], 6), Pseq([0.125 * 0.5 * 4], 6)], inf),
    \freq, Pseq([Pseq([
        1396.91 * ~har * 0.midiratio * 0.125,
        1396.91 * ~har * 5.midiratio * 0.125,
        1396.91 * ~har * 7.midiratio * 0.125,
        1108.73 * ~invHar * 0.midiratio * 0.125,
          
        1108.73 * ~invHar * 5.midiratio * 0.125,
                        
        1108.73 * ~invHar * 7.midiratio * 0.125
    ], 2), Pseq([
        1396.91 * ~har * -2.midiratio * 0.125,
        1396.91 * ~har * 5.midiratio * 0.125,
        1396.91 * ~har * 10.midiratio * 0.125,
        1108.73 * ~invHar * -2.midiratio * 0.125,
          
        1108.73 * ~invHar * 5.midiratio * 0.125,
                        
        1108.73 * ~invHar * 10.midiratio * 0.125
    ], 2)
    
    
    ], inf),
    // \freq, [330, 220],
    // \amp, Pseq([1], inf),
    // \out, ~wahwahBus,
    // \spos, Pwhite(0, 592896, inf).round,
    // \rate, Pseq([1 * -11.midiratio, 1 * -4.midiratio, 1 * -16.midiratio], inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \amp, 0.5,
    \out, [~volumeBus, 0],
    \lon, 2,
    \atk, 0.02
).play(quant: 0.125 * 3);
// ~toOSC.sendMsg("/invertPalette", 0);
)