#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Aug 24 21:58:53 2020

@author: lclarfel
"""

import numpy as np
from matplotlib import pyplot as plt
from scipy.io import wavfile
from scipy import signal

file = '/Users/richard/Desktop/XC791969 - Identity unknown.wav' # specify file to make spectrogram of

fs, data = wavfile.read(file)

# Clip the audio between specified time bounds (optional)
start_time = 6.05
end_time = 6.25
data = data[int(fs*start_time):int(fs*end_time)]

# Spectrogram Hyperparameters
nfft = int(fs*0.005)
nperseg = nfft
ff = 1.4
noverlap = int(fs*0.0025*ff) # nperseg//8

dur = len(data)/fs # length (in seconds) of the clip

# Create the spectrogram image
f, t, Sxx = signal.stft(data, fs, window='hann', nfft=nfft, nperseg=nperseg,noverlap=noverlap,padded=True)
Sxx = np.abs(Sxx)**(4/7)

# Do the plotting
dpi = 85 # Adjust as desired for image quality
fig, ax = plt.subplots(figsize=(len(data)/fs*44,4.25),dpi=dpi) # Note figure size (adjustable)
aspect = 5 # Controls length x width ratio for spectrogram
plt.imshow(Sxx,interpolation='mitchell',cmap='Greys',origin='lower',vmax=np.max(Sxx)*0.3, aspect=aspect)
plt.ylabel('Frequency [kHz]')
plt.xlabel('Time [ms]')

# Set ticks and tick labels
step = 0.1
t_ticks = np.arange(0,dur+step,step)
plt.xticks(t_ticks/dur*len(t),(t_ticks*1).astype(float))
f_max = f[np.where(f>10000)[0][0]] # Max frequency in visualized portion of spect
f_ticks = [1000*i for i in range(11)]
plt.yticks(f_ticks/f_max*np.where(f>10000)[0][0],[f_tick//1000 for f_tick in f_ticks])

# Set axis limits
plt.xlim(0,len(t))
plt.ylim((0,f_ticks[-1]/f_max*np.where(f>10000)[0][0]))

plt.show()