s.boot;
s.plotTree;
(
~sourceGroup = Group.new;
~fxGroup = Group.after(~sourceGroup);
~reverbBus = Bus.audio(s, 2);
)
(
SynthDef.new(\reverb, {
    arg in, out = 0;
    var sig, del;
    sig = In.ar(in, 2);
    // sig = sig + (GVerb.ar(sig, 200, 10) * 0.1);
    Out.ar(out, sig);
}).add;
)
y = Synth.new(\reverb, [\in, ~reverbBus], ~fxGroup);


(
~mic = {
    var sig, lfo, amp, pitch;
    lfo = SinOsc.ar(15, mul: 0.5, add: 1);
    sig = In.ar(2!2);
    // sig = sig * 25
    // sig = FreeVerb.ar(sig, mix: 0.33, room: 0.9, damp: 0.15);
    // sig = sig * lfo;
    amp = Amplitude.kr(sig);
    pitch = Pitch.kr(sig);
    SendReply.kr(Impulse.kr(10), '/amplitudeListener', amp, 1);
    Out.ar(0, sig);
}.play;
)


(
SynthDef.new(\ringzocean, {
    arg out = 0, freq = 220, modFreq = 0.1;
    var sig, mod;
    sig = BrownNoise.ar(0.15!2);
    mod = SinOsc.kr(modFreq, 3pi/2).exprange(0.001, 1);
    sig = sig * mod;
    sig = (sig * 0.2) + Ringz.ar(sig, freq, 0.1, 0.2);
    SendReply.kr(Impulse.kr(10), '/oceanAmp', [mod, freq], 1);
    Out.ar(out, sig);
}).add;
)

p = Synth(\ringzocean, [\out, ~reverbBus, \modFreq, (0.05.linrand + 0.1) * 0.5]);
p.free;

~getRandomModFreq = ({
    (0.05.linrand + 0.1);
});

~getRandomModFreq.value().postln;

(
~listen = OSCdef(\listener, {|msg|
        var data = msg[3..];
    // var data = msg;
    //     data.postln;
        ~toOSC.sendMsg("/amplitude", data[0]);
}, '/amplitudeListener');
)
~listen.free;


~toOSC = NetAddr.new("127.0.0.1", 57121);    // create the NetAddr
~toOSC.sendMsg("/hello", "there");    // send the application the message "hello" with the parameter "there"