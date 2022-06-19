This report is called ‘’ Term Project Part ’’. Basically, it is the summation and the explanation of what is done
during the MATLAB Sessions, and as an extra, it includes AM Coherent Demodulation with its implementation using
the MATLAB software. Therefore, the paper contains Fast Fourier Transform (FFT), Amplitude Modulation (AM), and
AM Coherent Demodulation topics with their theoretical meanings and their figures (plots) from the MATLAB. 

FFT (Fast-Fourier Transform) and FFT Using MATLAB
FFT is the type transform by using the Fourier Transform. The main aim of using FFT is to transmit a signal in
the time domain to the frequency domain. In MATLAB, there is an audio signal called ‘’ Whale_sound1.mp3’’ which
is defined as the message signal, and we get the audio from the mp3 file. For this signal, there are some essential
variables used such as Fs (sampling frequency), Ts (sampling interval in the time domain), 𝑁0(length of the signal)
etc. By defining these variables, we could listen to this message signal and access the mp3 file. To get the figure, the
first step is determining time vector (t) and the duration (T0), and using necessary commands for the plot; there will
be a figure for the audio signal in the time domain.

![image](https://user-images.githubusercontent.com/54504173/174497551-5c1bade8-4490-4f7d-8fcf-4b49bec384c4.png)


The figure on the left above shows us the signal in the time domain with signal durations approximately 3
seconds. And then, applying FFT (using fft command) of the signal, we get the figure on the right above, and this
figure is simply called the two-sided spectrum of the signal. The amplitude of the spectrum signal with respect to the
origin is symmetric the figure, and it is possible to say the bandwidth is a bit higher than 2000 Hz. Since we use
MATLAB, we need to take the Discrete-Time Fourier Transform of the signal; then, we use fft command, then get the
two-sided spectrum of signal basically; hence the spectrum of the signal is in the frequency domain.

In MATLAB, we tried to plot the spectrum up to 140.000 samples, then we observed that increasing
the number of samples, we get the signal closer to the original voice signal. In conclusion, FFT is a quick way as DFT,
and it is easy to apply FFT with using fft(command. Note that these figures are not including any modulation, just the
voice signal, and its two-sided spectrum included. 
