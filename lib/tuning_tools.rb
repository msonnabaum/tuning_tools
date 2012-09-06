
module TuningTools

  def midi_to_et_frequency(pitch)
    pitch_class = pitch % 12
    440 * (2**((pitch - 69) / 12.0))
  end

  def ratio_to_cents_offset (pitch, ratio, base = 0)
    pitch = pitch.to_i
    pitch_class = pitch % 12

    f = ratio[0].to_f / ratio[1].to_f
    et_freq = midi_to_et_frequency pitch
    ji_freq = f * et_freq
    pitch_cents_offset = (3986.3 * ((Math.log(ji_freq) / Math.log(10)) - (Math.log(et_freq) / Math.log(10))))

    if pitch_cents_offset != 0
      pitch_cents_offset = pitch_cents_offset - (((pitch_class - base) % 12) * 100)
    end

    pitch_cents_offset
  end
end
