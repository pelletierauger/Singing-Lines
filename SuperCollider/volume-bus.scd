
(
~sourceGroup = Group.new;
~fxGroup = Group.after(~sourceGroup);
// ~reverbBus = Bus.audio(s, 2);
~volumeBus = Bus.audio(s, 2);
)

(
SynthDef.new(\volumeSynth, {
	arg in, out = 0;
	var sig, amp, pitch;
	sig = In.ar(in, 2);
    amp = Amplitude.kr(sig);
    pitch = Pitch.kr(sig);
    SendReply.kr(Impulse.kr(10), '/amplitudeListener', amp, 1);
	// sig = FreeVerb.ar(sig, 0.5, 0.8, 0.001);
	Out.ar(out, sig);
}).add;
)

~volSynth.free;
~volSynth = Synth.new(\volumeSynth, [\in, ~volumeBus, \out, 0], ~fxGroup);

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