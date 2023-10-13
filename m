Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 413967C8EEF
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 23:22:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE57BC6B442;
	Fri, 13 Oct 2023 21:22:07 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA59FC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 21:22:05 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-7b64810aebdso566236241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 14:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697232124; x=1697836924;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R+mGCb1GSkk1Ef5TQGY3Gg3lLuwymx7Pt5o2k9FQ6c8=;
 b=qpe3qMONglf7NbMHFmvPUmTK0CFldlEsw+xGQqOun3vH4XlQ9KdkIx9SEcMr64wE5W
 +NKwXq/uaYjpqTxzBWih/7am/JTc2g/KhLiiUqQncAB6LPe+bTs9EHGLQxUgHDbBTNfI
 guYRsDhr8oZeIcWroM0dVfPS9x2TrxHBi3ts6C3WaRY6bkRsUS08lRmKUJXaCjEynoc9
 L/rdyICf4zzggHxaFkqZM1ZcsgMMKpfCaRux8W2eS9lYeA5GHEdGFQzhuGZ8Sr+l0+GH
 OvKcWi0uHcTmRSC4z+UAWBEiqAyoRD//aK/tNiHb4/2IHyTtcVR1/F+MUZMr+ojfR+Pt
 OOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697232124; x=1697836924;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+mGCb1GSkk1Ef5TQGY3Gg3lLuwymx7Pt5o2k9FQ6c8=;
 b=TdHWVk/UznB498NI0FNTGDg+fjKZXEIeWn2i4MMKFdutgR87O3Ox2yuQaWlfkFUIgh
 mFG5PZq2SDxEHOzSAkWaRCyDn4p8ThmT4cxWntyZn0guXsll+r7iBHi0Jb6O6da1aNGN
 uoWrEdHkbFHWcPV6Sh1p58KunuavY1UbQtwoyFi5diJRjFY13KGhC8Sjqq1fhfy337Q7
 NRbFrL5awylO4gxqMqaRnx5f1Ni2vfUb0M8RBSfzj9xCNPBzTs2LVUNqMq4+TBrXInvh
 Q8pfZOBSv9cvNT7LmSaCqh14cp3zNOOHorien7qXGzCmbUdBXpA5TLvDR0YyYH9k1cXR
 mvrQ==
X-Gm-Message-State: AOJu0YwJ9u5e8XEOwJ57RVZ2aWlBEaT8VvGWUYN2Oh3BAcYeUnZplGdU
 wVtk0OmAocshAgGaU3RFAdGhJw==
X-Google-Smtp-Source: AGHT+IEDG3uuEFHlb6qFT5yY62dBqu4rI5BjhHaq7CBLG1/YuI1ErPh3D3atVeOV1iBu350IVW/QGg==
X-Received: by 2002:a05:6102:a52:b0:457:adcf:2f9e with SMTP id
 i18-20020a0561020a5200b00457adcf2f9emr7988232vss.24.1697232124483; 
 Fri, 13 Oct 2023 14:22:04 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a67e459000000b0044d4e63aa03sm518904vsm.25.2023.10.13.14.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 14:22:03 -0700 (PDT)
Date: Fri, 13 Oct 2023 17:22:01 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZSm0+SgVwmT1M74M@fedora>
References: <20230922143920.3144249-1-fabrice.gasnier@foss.st.com>
 <20230922143920.3144249-5-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230922143920.3144249-5-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/6] counter: stm32-timer-cnt:
	introduce clock signal
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
Content-Type: multipart/mixed; boundary="===============5985543133887071012=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5985543133887071012==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nThdsgLAWTvUMCvU"
Content-Disposition: inline


--nThdsgLAWTvUMCvU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 04:39:18PM +0200, Fabrice Gasnier wrote:
> Introduce the internal clock signal, used to count when in simple rising
> function. Define signal ids, to improve readability. Also add the
> "frequency" attribute for the clock signal, and "prescaler" for the
> counter.

Hi Fabrice,

Split the addition of "frequency" and "prescaler" extensions each to
their own respective patches so we can keep the clock signal
introduction code separate (useful in case we need to git bisect an
issue in the future).

>=20
> Whit this patch, signal action reports consistent state when "increase"

Looks like a typo there for the first word.

> function is used, and the counting frequency:
> $ echo increase > function
> $ grep -H "" signal*_action
> signal0_action:rising edge
> signal1_action:none
> signal2_action:none
> $ echo 1 > enable
> $ cat count
> 25425
> $ cat count
> 44439
> $ cat ../signal0/frequency
> 208877930

Since you're fixing this description anyway, indent the shell example by
four spaces to make it stand-out and look nice.

>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/counter/stm32-timer-cnt.c | 84 ++++++++++++++++++++++++++++---
>  1 file changed, 76 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-ti=
mer-cnt.c
> index 668e9d1061d3..11c66876b213 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -21,6 +21,10 @@
>  #define TIM_CCER_MASK	(TIM_CCER_CC1P | TIM_CCER_CC1NP | \
>  			 TIM_CCER_CC2P | TIM_CCER_CC2NP)
> =20
> +#define STM32_CLOCK_SIG		0
> +#define STM32_CH1_SIG		1
> +#define STM32_CH2_SIG		2
> +
>  struct stm32_timer_regs {
>  	u32 cr1;
>  	u32 cnt;
> @@ -216,11 +220,44 @@ static int stm32_count_enable_write(struct counter_=
device *counter,
>  	return 0;
>  }
> =20
> +static int stm32_count_prescaler_read(struct counter_device *counter,
> +				      struct counter_count *count, u64 *prescaler)
> +{
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
> +	u32 psc;
> +
> +	regmap_read(priv->regmap, TIM_PSC, &psc);
> +
> +	*prescaler =3D psc + 1;
> +
> +	return 0;
> +}
> +
> +static int stm32_count_prescaler_write(struct counter_device *counter,
> +				       struct counter_count *count, u64 prescaler)
> +{
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
> +	u32 psc;
> +
> +	if (!prescaler || prescaler > MAX_TIM_PSC + 1)
> +		return -ERANGE;
> +
> +	psc =3D prescaler - 1;
> +
> +	return regmap_write(priv->regmap, TIM_PSC, psc);
> +}
> +
>  static struct counter_comp stm32_count_ext[] =3D {
>  	COUNTER_COMP_DIRECTION(stm32_count_direction_read),
>  	COUNTER_COMP_ENABLE(stm32_count_enable_read, stm32_count_enable_write),
>  	COUNTER_COMP_CEILING(stm32_count_ceiling_read,
>  			     stm32_count_ceiling_write),
> +	COUNTER_COMP_COUNT_U64("prescaler", stm32_count_prescaler_read,
> +			       stm32_count_prescaler_write),
> +};
> +
> +static const enum counter_synapse_action stm32_clock_synapse_actions[] =
=3D {
> +	COUNTER_SYNAPSE_ACTION_RISING_EDGE,
>  };
> =20
>  static const enum counter_synapse_action stm32_synapse_actions[] =3D {
> @@ -243,25 +280,31 @@ static int stm32_action_read(struct counter_device =
*counter,
>  	switch (function) {
>  	case COUNTER_FUNCTION_INCREASE:
>  		/* counts on internal clock when CEN=3D1 */
> -		*action =3D COUNTER_SYNAPSE_ACTION_NONE;
> +		if (synapse->signal->id =3D=3D STM32_CLOCK_SIG)
> +			*action =3D COUNTER_SYNAPSE_ACTION_RISING_EDGE;
> +		else
> +			*action =3D COUNTER_SYNAPSE_ACTION_NONE;
>  		return 0;
>  	case COUNTER_FUNCTION_QUADRATURE_X2_A:
>  		/* counts up/down on TI1FP1 edge depending on TI2FP2 level */
> -		if (synapse->signal->id =3D=3D count->synapses[0].signal->id)
> +		if (synapse->signal->id =3D=3D STM32_CH1_SIG)
>  			*action =3D COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
>  		else
>  			*action =3D COUNTER_SYNAPSE_ACTION_NONE;
>  		return 0;
>  	case COUNTER_FUNCTION_QUADRATURE_X2_B:
>  		/* counts up/down on TI2FP2 edge depending on TI1FP1 level */
> -		if (synapse->signal->id =3D=3D count->synapses[1].signal->id)
> +		if (synapse->signal->id =3D=3D STM32_CH2_SIG)
>  			*action =3D COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
>  		else
>  			*action =3D COUNTER_SYNAPSE_ACTION_NONE;
>  		return 0;
>  	case COUNTER_FUNCTION_QUADRATURE_X4:
>  		/* counts up/down on both TI1FP1 and TI2FP2 edges */
> -		*action =3D COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
> +		if (synapse->signal->id =3D=3D STM32_CH1_SIG || synapse->signal->id =
=3D=3D STM32_CH2_SIG)
> +			*action =3D COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
> +		else
> +			*action =3D COUNTER_SYNAPSE_ACTION_NONE;
>  		return 0;
>  	default:
>  		return -EINVAL;
> @@ -276,27 +319,52 @@ static const struct counter_ops stm32_timer_cnt_ops=
 =3D {
>  	.action_read =3D stm32_action_read,
>  };
> =20
> +static int stm32_count_clk_get_freq(struct counter_device *counter,
> +				    struct counter_signal *signal, u64 *freq)
> +{
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
> +
> +	*freq =3D clk_get_rate(priv->clk);
> +
> +	return 0;
> +}
> +
> +static struct counter_comp stm32_count_clock_ext[] =3D {
> +	COUNTER_COMP_SIGNAL_U64("frequency", stm32_count_clk_get_freq, NULL),
> +};
> +
>  static struct counter_signal stm32_signals[] =3D {
>  	{
> -		.id =3D 0,
> +		.id =3D STM32_CLOCK_SIG,

This will break userspace programs that expect signal0 to represent the
"Channel 1" Signal. Instead, add the clock Signal to the end of the
stm32_signals array so that the existing Signals are not reordered.
Although the clock signal may be represented by an id of 0 on the
device, the Counter API Signal id is a more abstract concept so it does
not necessarily need to match the device's numbering scheme.

Side note: you can keep the "id" member value the same if you want. The
Counter subsystem uses the array position to index the Signals; the "id"
value is ignored by the subsystem in that regard, and is rather provided
for the driver's internal use so it can differentiate between the
Signals.

> +		.name =3D "Clock Signal",
> +		.ext =3D stm32_count_clock_ext,
> +		.num_ext =3D ARRAY_SIZE(stm32_count_clock_ext),
> +	},
> +	{
> +		.id =3D STM32_CH1_SIG,
>  		.name =3D "Channel 1"
>  	},
>  	{
> -		.id =3D 1,
> +		.id =3D STM32_CH2_SIG,
>  		.name =3D "Channel 2"
>  	}
>  };
> =20
>  static struct counter_synapse stm32_count_synapses[] =3D {
> +	{
> +		.actions_list =3D stm32_clock_synapse_actions,
> +		.num_actions =3D ARRAY_SIZE(stm32_clock_synapse_actions),
> +		.signal =3D &stm32_signals[STM32_CLOCK_SIG]
> +	},

Same reordering issue here as the previous comment.

William Breathitt Gray

>  	{
>  		.actions_list =3D stm32_synapse_actions,
>  		.num_actions =3D ARRAY_SIZE(stm32_synapse_actions),
> -		.signal =3D &stm32_signals[0]
> +		.signal =3D &stm32_signals[STM32_CH1_SIG]
>  	},
>  	{
>  		.actions_list =3D stm32_synapse_actions,
>  		.num_actions =3D ARRAY_SIZE(stm32_synapse_actions),
> -		.signal =3D &stm32_signals[1]
> +		.signal =3D &stm32_signals[STM32_CH2_SIG]
>  	}
>  };
> =20
> --=20
> 2.25.1
>=20

--nThdsgLAWTvUMCvU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZSm0+QAKCRC1SFbKvhIj
K14mAQCsrkk0dopWfu2DIM32HZjaXkMVreIXmMbKQUCNm/CGHAD8DgYtTUX1wt0d
hXp3+ANc8PzIAH3BiKBDg7a/K4n97Ao=
=BVjf
-----END PGP SIGNATURE-----

--nThdsgLAWTvUMCvU--

--===============5985543133887071012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5985543133887071012==--
