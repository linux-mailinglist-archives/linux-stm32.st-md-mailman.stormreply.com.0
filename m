Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B098279D5
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 22:00:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E218C6DD73;
	Mon,  8 Jan 2024 21:00:45 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D89AEC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 21:00:43 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-467e4a04086so58002137.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 13:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704747642; x=1705352442;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jubS28CdqDpXEIN0KSIdOiEoCQYamsfax2OJPyFTjCs=;
 b=zdy94o6ksNK/qv+0HYKrWBKJbNF8YM3lSNmql72xd8KFCVEUZdWKr/PFfl9vysgc4P
 w4FPq2CRsBGpUeK4qZPHugae3jVZfLeQ62pWiwiloh96+01u6x6kVeArhQQZeqylNprd
 l0eEdG/Wlbgs4+z2vbvaNOxx2qmxFf1sEdpxCDudkO/NQmFh4PGIQ2wDSLb/Qys6f9l+
 DyPNSl9n8sCihAYs68SsaoH8tmJq4fcmRzxPsXjRS4S+9rr37ZlS0qaACJJ2ogmOilQI
 vJKIDO3xr5oe7SwmaEV8NOoEZ/d4OdtW2T6k9/v2o/L1VBbYeLV/oauBvoWCFF/BCrUZ
 S0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704747642; x=1705352442;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jubS28CdqDpXEIN0KSIdOiEoCQYamsfax2OJPyFTjCs=;
 b=mExAIGJj8m686eqPc/6rcxeucIHWdrg11OBSKS1o/L1ReEWcE97rB1vPNN6eE9KUVU
 BJ+TLD+zSnnyFJfb1KI+jTpGHqc/DR+NhJzi0oeVaGFZJBq9RJlnCGGXgpEdAAuWVPn3
 Ux+bzbOwz3aFYRvKfwDprFGvJZfyzYrb9N7zFT4eNFZZy9SFTp2fTCEh4RC5hjpT5qvH
 9iJbe3nsyv4AEcu1dlAA7BUoz79UQo6EV8MY9p8glrPit5bpzdfA69adJYxJ8faEat34
 bVBCrssYMQjYKIs9/Zu84RUOsQWJy3QzxCwyy61sAN5gkIF/wgfviw6tg12rvi50vJuy
 CVwQ==
X-Gm-Message-State: AOJu0Yw3LlJWo7VEj5LYM19+kN8mQJ7vG6RkkWRq/5QGOe3eeQKRPhTR
 a3SBNNCNRVXgnN63kByzJtsNIgEE5SR0nA==
X-Google-Smtp-Source: AGHT+IH40dToo2nxI7FwTwedlD2daT9m4ugP9EnbpbNyHmOKPfxnIIPTzx8QU3W0REgYujqbeqGoMw==
X-Received: by 2002:a05:6102:c89:b0:467:dfed:7c59 with SMTP id
 f9-20020a0561020c8900b00467dfed7c59mr805426vst.34.1704747642195; 
 Mon, 08 Jan 2024 13:00:42 -0800 (PST)
Received: from ubuntu-server-vm-macos (072-189-067-006.res.spectrum.com.
 [72.189.67.6]) by smtp.gmail.com with ESMTPSA id
 j12-20020a0561023e0c00b0046705f8336esm83178vsv.21.2024.01.08.13.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 13:00:41 -0800 (PST)
Date: Mon, 8 Jan 2024 21:00:37 +0000
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZZxidRueG8H/O7pw@ubuntu-server-vm-macos>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-10-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231220145726.640627-10-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 09/10] counter: stm32-timer-cnt: add
 support for overflow events
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
Content-Type: multipart/mixed; boundary="===============5350976591978742417=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5350976591978742417==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y2Szsr92fW5ygJV2"
Content-Disposition: inline


--y2Szsr92fW5ygJV2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 03:57:25PM +0100, Fabrice Gasnier wrote:
> Add support overflow events. Also add the related validation and
> configuration routine. Register and enable interrupts to push events.
> STM32 Timers can have either 1 global interrupt, or 4 dedicated interrupt
> lines. Request only the necessary interrupt, e.g. either global interrupt
> that can report all event types, or update interrupt only for overflow
> event.
>=20
> Acked-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Hi Fabrice,

I've CC'd Will and Peter in case they can provide some suggestions
regarding my atomic_t comment inline below.

> @@ -44,6 +45,9 @@ struct stm32_timer_cnt {
>  	bool has_encoder;
>  	u32 idx;
>  	unsigned int nchannels;
> +	unsigned int nr_irqs;
> +	u32 *irq;

Looks like we only need this 'irq' array for registering the ISR in
stm32_timer_cnt_probe(). Since we won't need it anymore after that,
let's use ddata->irq directly instead of defining priv->irq.

> +	atomic_t nb_ovf;
>  };
> =20
>  static const enum counter_function stm32_count_functions[] =3D {
> @@ -259,6 +263,29 @@ static int stm32_count_prescaler_write(struct counte=
r_device *counter,
>  	return regmap_write(priv->regmap, TIM_PSC, psc);
>  }
> =20
> +static int stm32_count_nb_ovf_read(struct counter_device *counter,
> +				   struct counter_count *count, u64 *val)
> +{
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
> +
> +	*val =3D atomic_read(&priv->nb_ovf);
> +
> +	return 0;
> +}
> +
> +static int stm32_count_nb_ovf_write(struct counter_device *counter,
> +				    struct counter_count *count, u64 val)
> +{
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
> +
> +	if (val !=3D (typeof(priv->nb_ovf.counter))val)
> +		return -ERANGE;
> +
> +	atomic_set(&priv->nb_ovf, val);

So you want to check that the atomic_t 'nb_ovf' is able hold the value
provided by the u64 'val'. My understanding is that atomic_t should be
treated as an opaque type, so I don't think we should be accessing the
'counter' member directly for this test (interrupt-cnt does this but I
believe it's wrong to do so).

I don't know if we have any existing way to check for the value range of
an atomic_t (I don't see anything under include/linux/limits.h
specifically for it). However, you do use atomic_set() which takes an
int parameter, so perhaps we should compare against INT_MAX instead.

> +static int stm32_count_events_configure(struct counter_device *counter)
> +{
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
> +	struct counter_event_node *event_node;
> +	u32 val, dier =3D 0;
> +
> +	list_for_each_entry(event_node, &counter->events_list, l) {
> +		switch (event_node->event) {
> +		case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
> +			/* first clear possibly latched UIF before enabling */
> +			regmap_read(priv->regmap, TIM_DIER, &val);
> +			if (!(val & TIM_DIER_UIE))

You can eliminate 'val' and the regmap_read() line like this:

    if (!regmap_test_bits(priv->regmap, TIM_DIER, TIM_DIER_UIE))

> +				regmap_write(priv->regmap, TIM_SR, (u32)~TIM_SR_UIF);
> +			dier |=3D TIM_DIER_UIE;
> +			break;
> +		default:
> +			/* should never reach this path */
> +			return -EINVAL;
> +		}
> +	}
> +
> +	regmap_write(priv->regmap, TIM_DIER, dier);

Do you want to overwrite TIM_DIER completely, or did you mean to set
only TIM_DIER_UIE and preserve the rest of the register? If the latter,
you could redefine 'dier' as a bool and do:

    regmap_update_bits(priv->regmap, TIM_DIER, TIM_DIER_UIE, dier);

There is also a regmap_update_bits_check() available if you want to
combine the UIF latch check with the update; but I don't know if that
will work in this case because it looks like you want to clear the UIF
latch before enabling.

>  static int stm32_count_clk_get_freq(struct counter_device *counter,
> @@ -418,6 +491,35 @@ static struct counter_count stm32_counts =3D {
>  	.num_ext =3D ARRAY_SIZE(stm32_count_ext)
>  };
> =20
> +static irqreturn_t stm32_timer_cnt_isr(int irq, void *ptr)
> +{
> +	struct counter_device *counter =3D ptr;
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
> +	u32 clr =3D GENMASK(31, 0); /* SR flags can be cleared by writing 0 (wr=
 1 has no effect) */
> +	u32 sr, dier;
> +
> +	regmap_read(priv->regmap, TIM_SR, &sr);
> +	regmap_read(priv->regmap, TIM_DIER, &dier);
> +	/*
> +	 * Some status bits in SR don't match with the enable bits in DIER. Onl=
y take care of
> +	 * the possibly enabled bits in DIER (that matches in between SR and DI=
ER).
> +	 */
> +	dier &=3D TIM_DIER_UIE;
> +	sr &=3D dier;
> +
> +	if (sr & TIM_SR_UIF) {

Am I understanding this logic correctly? ANDing TIM_DIER_UIE with 'dier'
will result in just the state of the TIM_DIER_UIE bit. Next, we AND that
state with 'sr'; so sr is 0 when TIM_DIER_UIE state is low, but we get
the respective SR bit when TIM_DIER_UIE state is high. Finally, we check
the TIM_SR_UIF bit state in 'sr'.

If TIM_SR_UIF bit position is expected to match the TIM_DIER_UIE bit
position, then (sr & TIM_SR_UIF) will only be true when the state of
both the TIM_DIER_UIE bit and TIM_SR_UIF bit are high. That means you
can eliminate 'sr', 'dier', and the two regmap_read() operations with
this instead:

    if (regmap_test_bits(priv->regmap, TIM_SR, TIM_SR_UIF) &&
        regmap_test_bits(priv->regmap, TIM_DIER, TIM_DIER_UIE) {

> +		atomic_inc(&priv->nb_ovf);

I wonder what happens when atomic_inc() increments past the atomic_t max
value. Does atomic_read() report back a negative value? Do we need to
guard against that scenario somehow?

> +		counter_push_event(counter, COUNTER_EVENT_OVERFLOW_UNDERFLOW, 0);
> +		dev_dbg(counter->parent, "COUNTER_EVENT_OVERFLOW_UNDERFLOW\n");
> +		/* SR flags can be cleared by writing 0, only clear relevant flag */
> +		clr &=3D ~TIM_SR_UIF;

You can use u32p_replace_bits(&clr, 0, TIM_SR_UIF) instead after
including the include/linux/bitfield.h header.

> @@ -511,6 +615,32 @@ static int stm32_timer_cnt_probe(struct platform_dev=
ice *pdev)
> =20
>  	platform_set_drvdata(pdev, priv);
> =20
> +	/* STM32 Timers can have either 1 global, or 4 dedicated interrupts (op=
tional) */
> +	if (priv->nr_irqs =3D=3D 1) {
> +		/* All events reported through the global interrupt */
> +		ret =3D devm_request_irq(&pdev->dev, priv->irq[0], stm32_timer_cnt_isr,
> +				       0, dev_name(dev), counter);
> +		if (ret) {
> +			dev_err(dev, "Failed to request irq %d (err %d)\n",
> +				priv->irq[i], ret);

This should be irq[0], right?

I would also recommend using ddata->irq instead so we can get rid of
priv->irq outside of this probe function.

> +			return ret;
> +		}
> +	} else {
> +		for (i =3D 0; i < priv->nr_irqs; i++) {
> +			/* Only take care of update IRQ for overflow events */
> +			if (i !=3D STM32_TIMERS_IRQ_UP)
> +				continue;
> +
> +			ret =3D devm_request_irq(&pdev->dev, priv->irq[i], stm32_timer_cnt_is=
r,
> +					       0, dev_name(dev), counter);
> +			if (ret) {
> +				dev_err(dev, "Failed to request irq %d (err %d)\n",
> +					priv->irq[i], ret);
> +				return ret;
> +			}
> +		}

So we only execute the loop body once for this particular
STM32_TIMERS_IRQ_UP iteration? Why have the loop at all rather than
hardcode irq[STM32_TIMERS_IRQ_UP] for devm_request_irq()?

William Breathitt Gray

--y2Szsr92fW5ygJV2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZZxidQAKCRC1SFbKvhIj
K9DfAP9PSngix81Cc5vJimGdV8ajgN0Cw9FphpH3wV59yvvt7gEA2YNr5+TM93PH
jaNQaey6hNnMEHxefK6M/LZqFLNAzw0=
=oNUg
-----END PGP SIGNATURE-----

--y2Szsr92fW5ygJV2--

--===============5350976591978742417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5350976591978742417==--
