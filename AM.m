%% Communication systems I, Spring 2020
% FFT in Matlab, Part I.
% Mehmet Karaca

clc;
close all;
clear all

file = 'Whale_sound1.mp3'; % this our voice signal
[signal,Fs] = audioread(file);% Fs is already given. We do not need to touch it.
Ts=1/Fs; % sampling interval in time domain
signal=signal(:,1)';

N0 = length(signal);

sound(signal,Fs)

%Plot Sound File in Time Domain
t=0:Ts:Ts*(N0-1);   %length of signal in seconds
T0=N0*Ts; % duration of the signal. we add no zero padding

figure();
subplot(3,3,1)
plot(t,signal)
xlabel('Time (s)');
ylabel('Amplitude');
title('Signal in Time Domain');


% Fourier Transform (One-Sided Spectrum)

n = 2^nextpow2(N0); %FFT point is power of 2 to easier implementation
nfft=n;

signalScaled = Ts.*signal; % this is energy signal so we need to multiply with Ts. For power signal the scaling factor will be the number of samples.

S=fft(signalScaled,nfft);      % Take FFT (you can take the fft number with a power of 2)
SignalShifFFT = fftshift(S); % two side spectrum both negative and positive frequencies
mx=abs(SignalShifFFT);      % Take the absulte spectrum of the signal
freqm = (-nfft/2:nfft/2-1)/(nfft*Ts);
%Plot Sound File in Frequency Domain
subplot(3,3,2)
plot(freqm ,mx);  %plot the absolute spectrum
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Two-Sided Spectrum of Signal')

%k=0:length(S)-1;    % In frequency spectrum, there will be N0 points
%w=k/(length(S)*Ts);     % frequency seperation


%% AM Modulation

A=0.5; %carrier amplitude;
fc= 10*10^3; %carrier frequency 10 KHz
CarrierSignal= cos(2*pi*fc*t);
ModulatedSignal = [A + signal].*CarrierSignal;
subplot(3,3,3)
plot(t,ModulatedSignal);  %plot the absolute spectrum
xlabel('Time(s)')
ylabel('Amplitude')
title('AM Modulated Signal in Time')

% Find the spectrum Modulated Signal by taking FFT
ModulatedSignalFFT=fft(ModulatedSignal,nfft);
ShifFFT = fftshift(ModulatedSignalFFT);

ABSModulatedSignalFFT=abs(ShifFFT)/N0;
freqm = (-nfft/2:nfft/2-1)/(nfft*Ts);
subplot(3,3,4)
%PlotSpectrum  of the Modulated Signal
plot(freqm,ABSModulatedSignalFFT);  %plot the absolute spectrum
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Two-Sided Spectrum of AM Modulated Signal')


%Demodulation part by Eralp 

% We do not need to A.CarrierSignal component, because if we take this signal,we will encounter with impulse signal in zero frequency during working on getting the original message signal.
DemodulatedSignal= ModulatedSignal.*CarrierSignal; %coherent detection
demodulatedsignalfft=fft(DemodulatedSignal,nfft);
demodShifFFT = fftshift(demodulatedsignalfft);
 
ABSDeModulatedSignalFFT=abs(demodShifFFT)/N0;
 
subplot(3,3,5);
plot(freqm,ABSDeModulatedSignalFFT)
title('Demodulation Stage Before Applying LPF (low-pass filter)')
xlabel('Time(s)')
ylabel('Amplitude')
%Applying Low-Pass filter
[k,l] = butter(5,(fc).*2/Fs); 
filtered_signal = filtfilt(k,l,2.*DemodulatedSignal-A) ; %convolution and multiplication by 2 because we got message signal devided by 2 after multiplying by the carrier
subplot(3,3,6)
plot(t,filtered_signal); %Plotting Demodulated Signal 
title('Filtered Signal in Time Domain')
xlabel('Time(s)')
ylabel('Amplitude')


