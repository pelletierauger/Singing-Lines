s.boot;
s.plotTree;
(
~sourceGroup = Group.new;
~fxGroup = Group.after(~sourceGroup);
~reverbBus = Bus.audio(s, 2);
)

(
SynthDef.new(\ocean, {
	var sig, mod;
	sig = BrownNoise.ar(0.15!2);
	mod = SinOsc.kr(0.1, 3pi/2).exprange(0.001, 1);
	sig = sig * mod;
	sig = sig + (GVerb.ar(sig, 200, 5) * 0.2);
	Out.ar(0, sig);
}).add;
)

o = Synth(\ocean);
o.free;

(
SynthDef.new(\ringzocean, {
	arg out = 0, freq = 220, modFreq = 0.1;
	var sig, mod;
	sig = BrownNoise.ar(0.15!2);
	mod = SinOsc.kr(modFreq, 3pi/2).exprange(0.001, 1);
	sig = sig * mod * 0.1;
	sig = (sig * 0.2) + Ringz.ar(sig, freq, 0.1, 0.2);
    // SendReply.kr(Impulse.kr(10), '/oceanAmp', [mod, freq], 1);
	Out.ar(out, sig);
}).add;
)

(
SynthDef.new(\ringzoceanMod, {
	arg out = 0, freq = 220, modFreq = 0.1;
	var sig, mod, modmod;
	sig = BrownNoise.ar(0.15!2);
    modmod = SinOsc.kr(0.02, 3pi/2).exprange(0.01, 6);
	mod = SinOsc.kr(modmod, 3pi/2).exprange(0.001, 1);
	sig = sig * mod;
	sig = (sig * 0.2) + Ringz.ar(sig, freq, 0.1, 0.2);
	Out.ar(out, sig);
}).add;
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
y.free;


p = Synth(\ringzocean, [\out, ~reverbBus, \modFreq, (0.05.linrand + 0.1) * 0.5]);
p.free;
r = Synth(\ringzocean, [\out, ~reverbBus, \freq, 277.18, \modFreq, (0.05.linrand + 0.1)]);
r.free;
~r2 = Synth(\ringzocean, [\out, ~reverbBus, \freq, 220 * 1.75, \modFreq, (0.05.linrand + 0.1)]);
~r2.free;
~r3 = Synth(\ringzocean, [\out, ~reverbBus, \freq, 220 * 3, \modFreq, (0.05.linrand + 0.1)]);
~r3.free;
~r4 = Synth(\ringzocean, [\out, ~reverbBus, \freq, 277.18 * 4, \modFreq, (0.05.linrand + 0.1)]);
~r4.free;
~r5 = Synth(\ringzoceanMod, [\out, ~reverbBus, \freq, 220 * 5, \modFreq, 2]);
~r5.free;
~r6 = Synth(\ringzocean, [\out, ~reverbBus, \freq, 277.18 * 8, \modFreq, 1]);
~r6.free;
~r16 = Synth(\ringzocean, [\out, ~reverbBus, \freq, 277.18 * 16, \modFreq, 0.1]);
~r16.free;
rand
s.quit;
Rand(0.5, 1);
5.rand
(0.05.linrand + 0.1)

~getRandomModFreq = ({
    (0.05.linrand + 0.1);
});

~getRandomModFreq.value().postln;

(
~listen = OSCdef(\listener, {|msg|
        var data = msg[3..];
    // var data = msg;
    //     data.postln;
        ~toOSC.sendMsg("/oceanAmp", data[0], data[1]);
}, '/oceanAmp');
)
~listen.free;


~toOSC = NetAddr.new("127.0.0.1", 57121);    // create the NetAddr
~toOSC.sendMsg("/hello", "there");    // send the application the message "hello" with the parameter "there"