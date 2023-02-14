# Physical Modeling of a Plucked and Bowed String

## Playing the Introduction from Steven Universe

This repository defines two SynthDefs, "pluck" and "bow", which are physical modelings of a plucked and bowed string. Both use the Pluck.ar UGen to generate a sound.

The "pluck" SynthDef uses a WhiteNoise.ar UGen as the sound source, and an Impulse.kr Ugen as the trigger.

The "bow" SynthDef is simalar, but uses a slower trigger rate from Impulse.kr to generate a longer, bowed sound. 

Both SynthDefs define an additional argument, "freq", that allows the user to specify the frequency of the sound.

The code then defines several Pdefs, "melody," "harmony," and "accompaniment," which use Pbind to sequence notes. Pbind is a Psuedo Ugen that maps a set of parameter values to a set of Synth parameters at a specific point in time. The parameters specified in the Pbind control things like the instrument to use, the duration of each note, and the pitch of each note (specified as a scale degree relative to the root note).

Finally, the Pdefs are played using the default TempoClock with a quantization of 4 beats per measure.

Here's a [link](https://www.youtube.com/watch?v=BzT3xrtJRpA) to the original Steven Universe Introduction.



