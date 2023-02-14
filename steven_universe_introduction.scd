SynthDef("pluck", {arg pan=0, freq = 440;
    var pluck, env;
    pluck = Pluck.ar(WhiteNoise.ar(0.1), Impulse.kr(0), freq.reciprocal, freq.reciprocal, 2, coef:0.02);
	env = Line.kr(1, 0, 1, doneAction: 2);
    Out.ar(0, Pan2.ar(pluck, pan));
}).add;

Synth("pluck");

SynthDef("bow", {arg pan=0, freq = 440;
    var pluck, env;
    pluck = Pluck.ar(WhiteNoise.ar(0.1), Impulse.kr(90), freq.reciprocal, freq.reciprocal, 200, coef:0.1);
	env = Line.kr(2, 0, 0.38, doneAction: 2);
    Out.ar(0, Pan2.ar(pluck, pan));
}).add;

Synth("bow");

// =============================================================================================
// SCALE DEGREE REFERENCES
// C:-24 C#/Db:-23 D:-22 D#/Eb:-21 E:-20 F:-19 F#/Gb:-18 G:-17 G#/Ab:-16 A:-15 A#:Bb:-14 B:-13
// C:-12 C#/Db:-11 D:-10 D#/Eb:-9 E:-8 F:-7 F#/Gb:-6 G:-5 G#/Ab:-4 A:-3 A#:Bb:-2 B:-1
// C:0 C#/Db:1 D:2 D#/Eb:3 E:4 F:5 F#/Gb:6 G:7 G#/Ab:8 A:9 A#:Bb:10 B:11
// C:12 C#/Db:13 D:14 D#/Eb:15 E:16 F:17 F#/Gb:18 G:19 G#/Ab:20 A:21 A#:Bb:22 B:23
// =============================================================================================

// melody line
Pdef(\melody,
	Pbind(
		\instrument, "bow",
		\dur, Pseq([2, 0.5, 0.25, 0.5, 0.75,
			1.5, 0.5, 0.5, 0.5, 0.5, 0.25, 2,
			0.25, 0.25, 0.5, 0.5, 0.5, 1.25,
			1, 0.5, 0.5, 0.5, 0.25, 1.75,
			0.5, 0.75, 0.25, 0.25, 0.75,
			1, 1, 1.5, 0.25, 0.5,
			1.75, 0.5, 0.5, 0.25, 0.50, 1.25,
			1, 1.5, 0.25, 0.5, 3.75]/1.5, inf),

		\degree, Pseq([2, 11, 9, 7, 9,
			6, -1, 11, 9, 7, 6, 7,
			4, 11, 9, 7, 6, 7,
			3, 14, 12, 11, 9, 11,
			2, 11, 9, 7, 9,
			11, 9, 6, -3, -3,
			-5, 11, 9, 7, 9, 7,
			3, 11, 9, 9, 7], inf),
		\scale, Scale.chromatic
	)
).play(TempoClock.default, quant: 4);

// top-most harmony to melody line
Pdef(\harmony,
	Pbind(
		\instrument, "bow",
		\dur,  Pseq([2, 0.5, 0.25, 0.5, 0.75,
			2, 0.5, 0.5, 0.5, 0.25, 6.25,
			0.5, 0.5, 0.5, 0.25, 4.25,
			1, 1, 14]/1.5, inf),

		\degree, Pseq([2, 2, 2, 2, 2,
			3, 3, 3, 3, 3, 4,
			11, 9, 7, 6, 7,
			9, 6, 3], inf),
		\scale, Scale.chromatic,
	)
).play(TempoClock.default, quant: 4);

// bottom-most harmony to melody line
Pdef(\harmony2,
	Pbind(
		\instrument, "bow",
		\dur,  Pseq([20, 1, 1, 14]/1.5, inf),

		\degree, Pseq([2, 6, 3, -1], inf),
		\scale, Scale.chromatic,
	)
).play(TempoClock.default, quant: 4);

// top-most accompaniment line
Pdef(\accompaniment,
	Pbind(
		\instrument, "pluck",
		\dur,  Pseq([4, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25,
			0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25,
			0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25,
			0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25,
			0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 4]/1.5, inf),

		\degree, Pseq([-5, -6, -6, -6, -6, -5, -5, -5, -5, -5, -5, -5, -5,
			-17, -13, -10, -5, -17, -13, -10, -5, -17, -13, -10, -5, -17, -13, -10, -5,
			-18, -13, -9, -6, -18, -13, -9, -6, -18, -13, -9, -6, -18, -13, -9, -6,
			-17, -12, -8, -5, -17, -12, -8, -5, -17, -12, -8, -5, -17, -12, -8, -5,
			-17, -12, -9, -5, -17, -12, -9, -5, -17, -12, -9, -5, -17, -12, -9, -5, -5], inf),
		\scale, Scale.chromatic,
	)
).play(TempoClock.default, quant: 4);

// second-to-top-most accompaniment line
Pdef(\accompaniment2,
	Pbind(
		\instrument, "pluck",
		\dur,  Pseq([4, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 17.25, 4]/1.5, inf),

		\degree, Pseq([-10, -9, -9, -9, -9, -8, -8, -8, -8, -9, -9, -9, -9, -10], inf),
		\scale, Scale.chromatic,
	)
).play(TempoClock.default, quant: 4);

// third-to-top-most accompaniment line
Pdef(\accompaniment3,
	Pbind(
		\instrument, "pluck",
		\dur,  Pseq([4, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 17.25, 4]/1.5, inf),

		\degree, Pseq([-13, -13, -13, -13, -13, -12, -12, -12, -12, -13, -13, -13, -13, -13], inf),
		\scale, Scale.chromatic,
	)
).play(TempoClock.default, quant: 4);

// bottom-most accompaniment line
Pdef(\accompaniment4,
	Pbind(
		\instrument, "pluck",
		\dur,  Pseq([4, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 1.25, 0.75, 17.25, 4]/1.5, inf),

		\degree, Pseq([-17, -18, -18, -18, -18, -17, -17, -17, -17, -17, -17, -17, -17, -17], inf),
		\scale, Scale.chromatic,
	)
).play(TempoClock.default, quant: 4);