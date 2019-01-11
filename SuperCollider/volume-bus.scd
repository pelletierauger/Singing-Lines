s.boot;
s.quit;


(
~sourceGroup = Group.new;
~fxGroup = Group.after(~sourceGroup);
~volumeBus = Bus.audio(s, 2);
~reverbBus = Bus.audio(s, 2);
)

(
SynthDef.new(\volumeSynth, {
    arg in, out = 0;
    var sig, amp, pitch;
    sig = In.ar(in, 2);
    amp = Amplitude.kr(sig);
//     pitch = Pitch.kr(sig);
    SendReply.kr(Impulse.kr(30), '/amplitudeListener', amp, 1);
    // sig = FreeVerb.ar(sig, 0.5, 0.8, 0.001);
//     sig = sig * 0.9;
//     Out.ar(out, sig);
}).add;
)

(
// ~volSynth.free;
~volSynth = Synth.new(\volumeSynth, [\in, ~volumeBus, \out, 0], ~fxGroup);
)



(
SynthDef.new(\reverb, {
    arg in, out = 0;
    var sig, del;
    sig = In.ar(in, 2);
    del = CombC.ar(in: sig,
    maxdelaytime: 0.1,
    delaytime: [0.25, 0.26],
    decaytime: 20,
    mul: 1, add: 0);
	sig = sig + (del * 0.125);
    Out.ar(out, sig);
    Out.ar(0, sig);
}).add;
)

(
~reverbSynth.free;
~reverbSynth = Synth.new(\reverb, [\in, ~reverbBus, \out, ~volumeBus], ~fxGroup);
)


~reverbSynth;


(
~toOSC = NetAddr.new("127.0.0.1", 57121);    // create the NetAddr
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



(
~mic = {
    var sig;
    sig = In.ar(2!2);
    sig = sig * 0.1;
	Out.ar(~volumeBus, sig);
}.play;
)
~mic.free;

s.record;
s.stopRecording;