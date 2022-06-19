This report includes AM Coherent Demodulation with its implementation using
the MATLAB software. Therefore, the paper contains Fast Fourier Transform (FFT), Amplitude Modulation (AM), and
AM Coherent Demodulation topics with their theoretical meanings and their figures (plots) from the MATLAB. 

# FFT (Fast-Fourier Transform) and FFT Using MATLAB

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

# Amplitude Modulation (AM)

Amplitude Modulation (AM) is a kind of modulation for the electronic communication systems, especially for
radio broadcasting, it is commonly used. In early stages for the radio, this type of modulation was trendy before the
design of the radio receiver of ICs. For the communication systems, AM can still be useful sometimes, such as for the
two-way radios.

![image](https://user-images.githubusercontent.com/54504173/174497680-b686468c-4ba5-47b7-b867-62ffe56bc269.png)

The formula above (entered via equation function of MS Word) is the definition of the amplitude modulation where
𝒄𝒐𝒔(𝒘𝑪𝒕) is DSB-SC. 

Since AM modulation is simple to use, with a carrier, it is possible to modulate a signal and send it to the
receiver, and we still use AM. On the other hand, the demodulation of the AM signals is affordable and quite
smooth, which will be explained other parts of the report in detail. Besides this, there are some disadvantages of the
AM, for example, power efficiency and occupation of a huge bandwidth. Also, AM has a high level of noise weakness,
and it distorts the original signal. Because of external factors, there exists no wrong data for the transmission of AM
modulated signal in ideal form. On the other hand, adding noise to the original signal in the time domain would
result in some unexpected values for the FFT plot. 

# Amplitude Modulation Using MATLAB

With this AM modulation implementation on MATLAB simply, we modulate the carrier. With AM modulation
basically, we take m(t) (message of the voice signal) and sum with amplitude (A) then multiply with the carrier
𝒄𝒐𝒔(𝒘𝒄𝒕 or 𝟐𝝅𝒇𝑪𝒕 ) as shown on the above equation. For the performing AM modulation, we need to give
importance when we select A, especially when checking the envelope detection. In MATLAB code, it is properly
selected as 0.5, and the carrier frequency is chosen as 10 kHz, which is higher than the bandwidth of the message
signal since bandwidth was a bit higher than 3 Khz. Then the modulated signal is computed by using the formula,
[𝐴 + 𝑚(𝑡)] 𝑐𝑜𝑠(2𝜋𝑓𝐶𝑡). Between two envelopes, there is a sinusoidal carrier cos signal due to multiplication. The
envelope of the modulated signal in time is clearly seen from the plot, that means the envelope of the modulated
signal is actually is the message signal m(t), when we track the envelope shown right below, the message signal m(t)
is clearly seen (shown with the brush). Hence, we can say that envelope of the modulated signal in the time domain
equals the envelope of the message signal. 

![image](https://user-images.githubusercontent.com/54504173/174497718-9160ec5d-4785-4404-a544-ba2a91f983d0.png)

So as step by step explanation; we take the modulated signal AM, and then take fft of it, then applying fftshift to plot
two-sided spectrum, then plot the absolute spectrum of the signal. It is possible to see that the two-sided spectrum
(shown right above) is shifted to both left and right side by 𝒇𝑪 which is 10 kHz. So, the point is we need to the shifted
version of the original message in the spectrum which is shifted by 𝒇𝑪 to -10 kHz and +10 kHz by modulation, then
we obtained Two-Sided Spectrum of AM Modulated Signal in the frequency domain as shown plot right bottom
below (4th. Figure)

![image](https://user-images.githubusercontent.com/54504173/174497727-38e57174-f291-4981-a837-41d104504a1f.png)

In the progressing time of MATLAB Session II (AM), we tried to change the value of amplitude A (like 0.01, 1,
2, etc.) to see what happens. I considered the maximum value that the original signal might take, and the possible
envelope detection. For example, when we change the value of amplitude as 0.01, signal dominate the carrier this
time, and it makes the modulated signal similar as usual, if we pick A is larger such as 2, actually there was no decent
change at some point because the envelope of the modulated signal might be the message signal itself. It was
possible to see that when I enlarged the figure. Below, figures shown respectively for A=0.01 and A=2 shows how the
view of modulated signal changes.

![image](https://user-images.githubusercontent.com/54504173/174497735-a6e29d46-4d7c-445a-870f-1e6c3ecba4e1.png)

So, when taking the value of A is larger, there are no decent changes, however taking the value of A unnecessarily
large, may cause excessive power consumption since when the amplitude is the larger value, for the transmission,
more power is needed. So, when deciding the value of the amplitude, we should care about both power
consumption and making envelope detection properly.

On the other hand, we tried to change the value of 𝒇𝑪 as 10*10^5, and we saw that there is a more shift for
the Two-Sided Spectrum of AM Modulated Signal as shown plot below. 

![image](https://user-images.githubusercontent.com/54504173/174497768-89a82658-b863-4060-ad02-0f9b397037b9.png)

# Amplitude Demodulation and its Implementation with Coherent Detection Using MATLAB

```Matlab
DemodulatedSignal= ModulatedSignal.*CarrierSignal; %applying coherent detection
demodulatedsignalfft=fft(DemodulatedSignal,nfft);
demodShifFFT = fftshift(demodulatedsignalfft);
ABSDeModulatedSignalFFT=abs(demodShifFFT)/N0; %taking the absolute spectrum
subplot(3,3,5);
plot(freqm,ABSDeModulatedSignalFFT)
title('Demodulation Stage Before Applying LPF (low-pass filter)')
xlabel('Time(s)')
ylabel('Amplitude')
%Applying Low-Pass filter
[k,l] = butter(5,(10000).*2/Fs);
filtered_signal = filtfilt(k,l,2.*DemodulatedSignal-A) ; %Convolution and
Multiplication by 2 because we got message signal m(t) divided by 2 after
multiplying by the carrier
subplot(3,3,6)
plot(t,filtered_signal); %Plotting Demodulated Signal
title('Filtered Signal in Time Domain')
xlabel('Time(s)')
ylabel('Amplitude')
```

By using ‘’Evaluate, Selection (F9)’’ function here are the plots observed: 

![image](https://user-images.githubusercontent.com/54504173/174497898-8086a13d-197b-4a29-94c1-12d6ac29fc3f.png)


In this part, I used coherent detection to demodulate the signal. I used the same carrier frequency with the
modulation part. To perform AM Demodulation using coherent detection, the modulated signal should be
multiplied with the carrier signal. I defined cutoff frequency as 10000, so basically, I used the same value with the
carrier. For the demodulation again, I used fftshift to plot Two-Sided Spectrum of Demodulated Signal which is called
‘’Demodulation Stage Before Applying LPF’’ for the figure left above. To perform demodulation, I used low-pass
filter called ‘Butterworth filter.’ I decided on the order of the filter ‘’5’’. Then I used ‘’filtfilt’’ command, which
performs digital filtered by processing the input data. Then I plotted the demodulated signal. Before doing that, I
noticed the amplitude A is an excess since the signal that obtained was a bit different from the message signal.
Hence, I decided to subtract A. This excess was the result of the carrier signal. Yet, subtracting it with filtering gave
me the final plot called ’Filtered Signal in Time Domain.’’ Since there is a getting twice of the carrier, from the plot
(left above), I saw that the bandwidth also expands twice. So, I noticed that the demodulated signal (shown right
above) is exactly the same as the message signal in the time domain. It is meaning the recovered signal is the same
as the original signal.

Below figures are the output of the entire project part I, which already justified in the previous sections.

![image](https://user-images.githubusercontent.com/54504173/174497913-89ea5286-7b21-4485-95df-5bc9b0261458.png)

# Amplitude Demodulation Explanation Theoretically

![image](https://user-images.githubusercontent.com/54504173/174497944-8e10556f-4907-4013-9e39-cb408ef44f37.png)

Where A is the carrier amplitude, m(t) is the message signal.

![image](https://user-images.githubusercontent.com/54504173/174497950-ec54fe32-6866-4ad1-8f10-af91e490a4c7.png)


Putting this signal into the filter, we get:
𝑨/𝟐 + 𝒎(𝒕)/𝟐 = (𝑨+𝒎(𝒕))/2

which can be defined as the signal after
passing the low-pass filter. By taking twice of this signal (multiplying by 2), we get 𝑨 + 𝒎(𝒕), then to get 𝒎(𝒕), we
subtract A. Hence, we obtained the message signal. So, this could be a suitable proof for the demodulation
implementation.

