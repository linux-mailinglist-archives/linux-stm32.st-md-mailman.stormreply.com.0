Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2BA7C15E
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 18:15:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ABBBC78F85;
	Fri,  4 Apr 2025 16:15:25 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD0D9C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 16:15:23 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-60400013960so473570eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Apr 2025 09:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743783322; x=1744388122;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G2j3x93HYeHwY5tSNUGE91ADq/ThMEsShqde0z89gCY=;
 b=Tuqw1X42kx2nBp6rXb8dQ98z+heRL00PR1AqHs39myJBhaJHcpPrMuD4INL6jq4XY+
 wC3bOvgii+5nAhmRnvRY9CwHu5hIm+Qi+oBjGeW6bDa9BJJm9fbO6k/xqR3Bev0yhgcT
 qB6tFZN8FpCC3ksnjMDUKkL4+Pbs5b+1Vebbw4PV4IMfJ3bQUhsipBN67N5PcaZdtA7b
 f+bMVUxDEqQsOfUlYBR2xAFwuRPE6TS2MvS8BDSszKVZoicYftQ88Byy2opuAEF1SSUF
 fEBZuh3JqLT1+pSxZ0QRZ0XIFMilYHWz1BFktUefXHdixzpc4BmRnskj2374y4Vv0HYP
 0FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743783322; x=1744388122;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G2j3x93HYeHwY5tSNUGE91ADq/ThMEsShqde0z89gCY=;
 b=nYfXOxUL+N6rb5iHmF4GZXRYlPCGQUR2wyzzE4dzTeryky5F69JShyAflB+zGMxew+
 nPLFGdLLt0kw580XPoN9AxQZPYwividfXWCI2GzBXDwfVhEoec1yveaYA6eLFLuO6WKO
 tICC27LDjdjKmtkj99gs72OV1ZfYi+UOH58SbuA89Ve5EoOPbnCHebMcJb3BN90gHJMC
 N20t+TduuGbIE1IEIEBmzg8k/FMQmNzIx8CUaBbsIhxhAQkCRc3mLzUPW+tfDw0D4jcP
 KJcm5Ha/ak2B+T07KUFwRkK01AI88BHm9I46VzVJtz6lb8+Tr1Xenb+4F6vNyOFXyt60
 b0YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLID4zTjrHVEAYtOBHX4no0/l+1YuGIXeBBYW9hS/+JgeGWaG1MdRdYTpmP4++NfxPoam939474le9yw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjpKa+lv+fgqJ76wM1qdonTHPBx9rhi9xOLYM+COV93fLr0GVK
 Sf4yMFCbzQImG++z51cGd+PS+mdYpbrTQm4R2/ORCYSXUXmf48nnEzBq87Bfo5U=
X-Gm-Gg: ASbGnctp8xmlbamSru9tGTigFZfIovfXVnavqrZB50yMijI0lGBEpUZW3g38Zmcrgci
 UOon4NGUH2u39ohe86X398/rVmB+LGrrPU1UidEaKfUZq7p5naJj6QTC1Mw93uvXPoGBKTulffq
 opmQ81C7VE/oiwEUnyodKsEmGmRXfWiFsTaGhT83L+k4QzGU2RRDvp3m/1zdMKVHJf4966DfRUA
 BiuGmfKNvCwLLj9+1ZQFcV9xxQVFwHnMhjDzkZrU+m0QeVHw02xp1rYBgYXipMXmwIgQnEWST1w
 8MaOhCG6gznydIBfmRm1AlU2lPbvkj0NzirKqxs0p0rc/B1a1b1zdlIbYrEdwOZUXxri7k1Ftn8
 QzTulGw==
X-Google-Smtp-Source: AGHT+IGeD0DN5s5NpX38+vrcEe8pmX0dglCUeK/9Wn3VmmDArglW7QUf9t5hzJw6MmeVoRIoUy9CaA==
X-Received: by 2002:a05:6808:2444:b0:3f8:30c1:cca7 with SMTP id
 5614622812f47-4004557f18fmr2465378b6e.8.1743783322149; 
 Fri, 04 Apr 2025 09:15:22 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4003ff9be6dsm662896b6e.25.2025.04.04.09.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 09:15:20 -0700 (PDT)
Message-ID: <25b34e60-5392-4bfb-b994-49212dfbdb22@baylibre.com>
Date: Fri, 4 Apr 2025 11:15:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250403162358.1257370-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250403162358.1257370-1-olivier.moysan@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32: add oversampling
	support
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 4/3/25 11:23 AM, Olivier Moysan wrote:
> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing
> the data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution,
> a right shift is applied to keep initial resolution.

Why do we not want the extra bits too? I guess if we wanted the extra bits
in the future we could make the in_voltage_scale attribute writable to
select the resolution.

> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2exp(n) ratio <=> n right shift)
> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
> 
> Oversampling can be configured using IIO ABI:
> - in_voltage_oversampling_ratio_available
> - in_voltage_oversampling_ratio

This would require info_mask_shared_by_type but the patch uses
info_mask_shared_by_all, so the attributes will be:

- oversampling_ratio
- oversampling_ratio_available

I guess currently it doesn't matter which one gets used if there are only
voltage channels, but it could make a difference, e.g. if a temperature
channel was ever added.

In any case, the description should match what is actually implemented.

> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> ---
> Changes in v2:
> - Remove useless header files
> - Use FIELD_PREP macro
> - Reorder stm32_adc_write_raw() function

Link to v1? (for the lazy reviewer :-p)

> ---
>  drivers/iio/adc/stm32-adc-core.h |  14 ++++
>  drivers/iio/adc/stm32-adc.c      | 137 +++++++++++++++++++++++++++++++
>  2 files changed, 151 insertions(+)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.h b/drivers/iio/adc/stm32-adc-core.h
> index 73b2c2e91c08..bfd42c5456bf 100644
> --- a/drivers/iio/adc/stm32-adc-core.h
> +++ b/drivers/iio/adc/stm32-adc-core.h
> @@ -91,6 +91,7 @@
>  #define STM32H7_ADC_IER			0x04
>  #define STM32H7_ADC_CR			0x08
>  #define STM32H7_ADC_CFGR		0x0C
> +#define STM32H7_ADC_CFGR2		0x10
>  #define STM32H7_ADC_SMPR1		0x14
>  #define STM32H7_ADC_SMPR2		0x18
>  #define STM32H7_ADC_PCSEL		0x1C
> @@ -160,6 +161,13 @@
>  #define STM32H7_DMNGT_SHIFT		0
>  #define STM32H7_DMNGT_MASK		GENMASK(1, 0)
>  
> +/* STM32H7_ADC_CFGR2 bit fields */
> +#define STM32H7_OVSR_MASK		GENMASK(25, 16) /* Correspond to OSVR field in datasheet */

nit: Comment seems obvious and can be left out.

> +#define STM32H7_OVSR(v)			FIELD_PREP(STM32H7_OVSR_MASK, v)
> +#define STM32H7_OVSS_MASK		GENMASK(8, 5)
> +#define STM32H7_OVSS(v)			FIELD_PREP(STM32H7_OVSS_MASK, v)
> +#define STM32H7_ROVSE			BIT(0)
> +

...

> +static const unsigned int stm32h7_adc_oversampling_avail[] = {
> +1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024

Normal style is to have 1 tab indent here.

> +};
> +
> +static const unsigned int stm32mp13_adc_oversampling_avail[] = {
> +1, 2, 4, 8, 16, 32, 64, 128, 256

And here.

>  };
>  

...

> @@ -889,6 +912,41 @@ static void stm32mp13_adc_start_conv(struct iio_dev *indio_dev, bool dma)
>  	stm32_adc_set_bits(adc, STM32H7_ADC_CR, STM32H7_ADSTART);
>  }
>  
> +static void stm32h7_adc_set_ovs(struct iio_dev *indio_dev, u32 ovs_idx)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +	u32 ovsr_bits, bits, msk;
> +
> +	msk = STM32H7_ROVSE | STM32H7_OVSR_MASK | STM32H7_OVSS_MASK;
> +	stm32_adc_clr_bits(adc, STM32H7_ADC_CFGR2, msk);
> +
> +	if (!ovs_idx)
> +		return;
> +
> +	ovsr_bits = (1 << ovs_idx) - 1;
> +	bits = STM32H7_ROVSE | STM32H7_OVSS(ovs_idx) | STM32H7_OVSR(ovsr_bits);
> +
> +	stm32_adc_set_bits(adc, STM32H7_ADC_CFGR2, bits & msk);
> +}
> +
> +static void stm32mp13_adc_set_ovs(struct iio_dev *indio_dev, u32 ovs_idx)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +	u32 bits, msk;
> +
> +	msk = STM32H7_ROVSE | STM32MP13_OVSR_MASK | STM32MP13_OVSS_MASK;
> +	stm32_adc_clr_bits(adc, STM32H7_ADC_CFGR2, msk);
> +
> +	if (!ovs_idx)
> +		return;
> +
> +	bits = STM32H7_ROVSE | STM32MP13_OVSS(ovs_idx);
> +	if (ovs_idx - 1)
> +		bits |= STM32MP13_OVSR(ovs_idx - 1);
> +
> +	stm32_adc_set_bits(adc, STM32H7_ADC_CFGR2, bits & msk);
> +}


Some comments in these functions could be useful to avoid needing the
datasheet to understand all the different things that are happening here
and more importantly, why it was decided to do it this way when there are
many other possibilities (i.e. repeat the bit from commit message about
always using 12-bit output).

> @@ -1461,6 +1519,69 @@ static int stm32_adc_single_conv(struct iio_dev *indio_dev,
>  	return ret;
>  }
>  
> +static int stm32_adc_write_raw(struct iio_dev *indio_dev,
> +			       struct iio_chan_spec const *chan,
> +			       int val, int val2, long mask)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +	struct device *dev = indio_dev->dev.parent;
> +	int nb = adc->cfg->adc_info->num_ovs;
> +	u32 idx;
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> +		if (val2)
> +			return -EINVAL;
> +
> +		for (idx = 0; idx < nb; idx++)
> +			if (adc->cfg->adc_info->oversampling[idx] == val)
> +				break;
> +
> +		if (idx >= nb)
> +			return -EINVAL;
> +
> +		ret = iio_device_claim_direct_mode(indio_dev);
> +		if (ret)
> +			return ret;

We've been replacing this everywhere with:

		if (!iio_device_claim_direct(indio_dev))
			return -EBUSY;

See: https://lore.kernel.org/linux-iio/20250331121317.1694135-1-jic23@kernel.org/

> +
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret < 0)
> +			goto err;
> +
> +		adc->cfg->set_ovs(indio_dev, idx);
> +
> +		pm_runtime_mark_last_busy(dev);
> +		pm_runtime_put_autosuspend(dev);
> +
> +		adc->ovs_idx = idx;
> +
> +err:
> +		iio_device_release_direct_mode(indio_dev);

		iio_device_release_direct(indio_dev);

> +
> +		return ret;
> +	default:
> +		return -EINVAL;
> +	}
> +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
