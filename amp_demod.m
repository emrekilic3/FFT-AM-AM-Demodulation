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