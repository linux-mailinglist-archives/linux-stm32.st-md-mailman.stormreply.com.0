Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BC396C4DB
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 19:05:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 007AEC78011;
	Wed,  4 Sep 2024 17:05:32 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 119F7C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 17:05:25 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so767121066b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 10:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725469524; x=1726074324;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JxXuLysi6zz+I5M8mPOGoQ0hAmAHwgPJncxxEP7nPHk=;
 b=AR/GudBo93o4Ug2PeLUDBVS5q6fucWV++peKJNGEzEV+p2MFqg8LtE0jkmuox0IYhs
 fdrHCyXOdsEiplVYSZoLs3a/pZtsABqAiqaQCUnn1PNjg6Jpt2mey+QIDNZrR6GWBp2E
 hHTZoXIjljClseuqo3+tH4RFZQNCZfoloDzMpO2Rryg6oMt4bYtAJqeGiL/n29tnTrDy
 lsa849IMM9LTy17YMusQnMeOXI7wpa3nBEQ5Fa5UmriBAW5VNo3tfbqIl1Gqo874kZqf
 0pWHWddDeFmYLJMgSzScn5f3lc5NZgGaY0YfySN7BRMLhbbSNo05JxraiRByUbU80ZPR
 bZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725469524; x=1726074324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JxXuLysi6zz+I5M8mPOGoQ0hAmAHwgPJncxxEP7nPHk=;
 b=IeO56ITcPHxNZRJDTvqwfAJ59rOtT/NRbEl1dvl1elnlaTzY1QevETFwVz04uvDJ38
 TYwwYRclTJbv9/BAOJMtvzP1khR5+SCDF/r8T2hQLU2TVMQqbD7e7dpynVp0TEOfcaHy
 QIZKL7NUwZDLmZ1qd+jqHYlvNXP50Jr80HbmQ4EJyNaGD2d/vAhjCB4MbctTgopKBzk0
 5MgW5XRVZz/hma6s8ygBjLLPietnB+vcSSNw4HkPZnc9tiqLah9H4wXXp1V8B04Quql8
 kiH9gRybVuWv4DQHacrziDeev9gy1KrC7Qo5mjwgSl0m14Dv/0EazEo7ijlngEV6XzWP
 Qh8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtv+AwARLmf6KurkoG2jT22POkMNbmd7uAQ07wchDxDILa5+8wu1eD5v2G3yj5GpGL8eEeqlKFxGdp7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwEuItvXs12EQ/EXmK5Kw1BWCdMWhxQs2ComDWFVJzbGeb4xX8B
 2baFjsI3R88B+8Vo5Sgc+wazElHg2j4FMDF4RviSmDRC9PZ0xh4SE3p5gbdW8IM=
X-Google-Smtp-Source: AGHT+IFMseDQF5UPnOh8PA4y/y8Nr9TRKquBerSHczMHl+FVUsVLaE/xMknCLEcoQh9UincHEuOf7A==
X-Received: by 2002:a17:907:7290:b0:a86:ac86:1e17 with SMTP id
 a640c23a62f3a-a8a1d4c3496mr575073066b.54.1725469524287; 
 Wed, 04 Sep 2024 10:05:24 -0700 (PDT)
Received: from localhost
 (p200300f65f0046006ae56225a49a5edb.dip0.t-ipconnect.de.
 [2003:f6:5f00:4600:6ae5:6225:a49a:5edb])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a620840b6sm15222866b.92.2024.09.04.10.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 10:05:23 -0700 (PDT)
Date: Wed, 4 Sep 2024 19:05:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <yg654oehmaqjx5fbnoungvrbbx3pnnvhyo7mct2tk334tgadpk@4qz5n6wkrwgy>
References: <cover.1722261050.git.u.kleine-koenig@baylibre.com>
 <b193c8d4bc8e188ad6b4b4ddb6f730308d7f1099.1722261050.git.u.kleine-koenig@baylibre.com>
 <3515a8f3-436e-4d14-9bac-dfe6aa869819@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <3515a8f3-436e-4d14-9bac-dfe6aa869819@foss.st.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, linux-pwm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 8/8] pwm: stm32: Implementation of the
 waveform callbacks
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
Content-Type: multipart/mixed; boundary="===============4445499971794480128=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4445499971794480128==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w2wbk3r2n5m3efs5"
Content-Disposition: inline


--w2wbk3r2n5m3efs5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Fabrice,

On Tue, Aug 20, 2024 at 06:09:59PM +0200, Fabrice Gasnier wrote:
> On 7/29/24 16:34, Uwe Kleine-K=F6nig wrote:
> > Convert the stm32 pwm driver to use the new callbacks for hardware
> > programming.
>=20
> Sorry it took me some time to start to have a look. I only had an
> overview on the series, and this patch. I'd have some overall question
> on the waveform support (on the delay offset).

No need to be sorry, I very appreciate you looking into my patch set.

> > +	wfhw->ccer =3D TIM_CCER_CCxE(ch + 1);
> > +	if (priv->have_complementary_output)
> > +		wfhw->ccer =3D TIM_CCER_CCxNE(ch);
>=20
> Need to use (ch + 1 here), and avoid overriding ccer when
> have_complementary_output is true, e.g.
>=20
> 	if (priv->have_complementary_output)
> 		wfhw->ccer |=3D TIM_CCER_CCxNE(ch + 1);

Huh, indeed. Thanks.

> > +	rate =3D clk_get_rate(priv->clk);
> > +
> > +	if (active_channels(priv) & ~(1 << ch * 4)) {
> > +		u64 arr;
> > +
> > +		/*
> > +		 * Other channels are already enabled, so the configured PSC and
> > +		 * ARR must be used for this channel, too.
> > +		 */
> > +		ret =3D regmap_read(priv->regmap, TIM_PSC, &wfhw->psc);
> > +		if (ret)
> > +			goto out;
> > +
> > +		ret =3D regmap_read(priv->regmap, TIM_ARR, &wfhw->arr);
> > +		if (ret)
> > +			goto out;
> > +
> > +		/*
> > +		 * calculate the best value for ARR for the given PSC, refuse if
> > +		 * the resulting period gets bigger than the requested one.
> > +		 */
> > +		arr =3D mul_u64_u64_div_u64(wf->period_length_ns, rate,
> > +					  (u64)NSEC_PER_SEC * (wfhw->psc + 1));
> > +		if (arr <=3D wfhw->arr) {
> > +			/*
> > +			 * requested period is small than the currently
> > +			 * configured and unchangable period, report back the smallest
> > +			 * possible period, i.e. the current state; Initialize
> > +			 * ccr to anything valid.
> > +			 */
> > +			wfhw->ccr =3D 0;
> > +			ret =3D 1;
>=20
> I'm suprised, I'm more used to return negative error codes. This may
> cascade up to the sysfs interface. Is there some possible side effect ?

I'm not entirely happy with that 1, too, but I didn't want to use an
existing error code, because I wanted to catch exactly the condition
that no valid rounding exists and so having a dedicated value for it
looks right to me. Then I didn't want to use a negative value to be sure
to not interpret it as an errno value.

This shouldn't propagate to the sysfs interface (or even __pwm_apply()).
I need to fix that.

> I could see in your commit message in "pwm: New abstraction for PWM
> waveforms" that "... this fact is signaled by a return value of 1".
>=20
> Perhaps some define could be used, to better point that ?

I shortly considered that while implementing, but decided against it
because I didn't wanted to clobber the fact, that it's a positive value.
Reading your suggestion I'll think about it again.

> > +	if (wf->duty_length_ns && wf->duty_offset_ns &&
> > +	    wf->duty_length_ns + wf->duty_offset_ns >=3D wf->period_length_ns=
) {
>=20
> The condition here (mixing && + >=3D) is rather hard to read, could it be
> more readable ?
>=20
> It's more clear when reading pwm_wf2state() and pwm_state2wf() the
> condition for normal/inversed polarity rather looks like:
>=20
> if (wf->period_length_ns) {
> 	if (wf->duty_length_ns + wf->duty_offset_ns < wf->period_length_ns)
> 	/* normal */
> 	else
> 	/* inversed */
>=20
> BTW I notice small difference here: (wf->duty_length_ns &&
> wf->duty_offset_ns)
>=20
> Suggestion: could use some (new) helper function or macro from the pwm
> core ? e.g. rather than implementing in the driver ?

Hmm, this will indeed be useful for all drivers that have no way to
configure the offset in a more flexible way than inverting the polarity
(which I'd guess are most of them). I'll try an implementation to judge
if I like it.
=20
> > +		wfhw->ccer |=3D TIM_CCER_CCxP(ch + 1);
> > +		if (priv->have_complementary_output)
> > +			wfhw->ccer |=3D TIM_CCER_CCxNP(ch + 1);
> > +
> > +		ccr =3D wfhw->arr + 1 - duty;
> > +	} else {
> > +		ccr =3D duty;
> > +	}
> > +
> > +	wfhw->ccr =3D min_t(u64, ccr, wfhw->arr + 1);
> > +
> > +	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld [+%lld] @%lu -> CCER: %08x, PS=
C: %08x, ARR: %08x, CCR: %08x\n",
> > +		pwm->hwpwm, wf->duty_length_ns, wf->period_length_ns, wf->duty_offse=
t_ns,
> > +		rate, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr);
> > +
> > +out:
> > +	clk_disable(priv->clk);
> > +
> > +	return ret;
> > +}
> > +
> > +/*
> > + * This should be moved to lib/math/div64.c. Currently there are some =
changes
> > + * pending to mul_u64_u64_div_u64. Uwe will care for that when the dus=
t settles.
> > + */
> > +static u64 stm32_pwm_mul_u64_u64_div_u64_roundup(u64 a, u64 b, u64 c)
> > +{
> > +	u64 res =3D mul_u64_u64_div_u64(a, b, c);
> > +	/* Those multiplications might overflow but it doesn't matter */
> > +	u64 rem =3D a * b - c * res;
> > +
> > +	if (rem)
> > +		res +=3D 1;
> > +
> > +	return res;
> > +}
> > +
> > +static int stm32_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> > +					   struct pwm_device *pwm,
> > +					   const void *_wfhw,
> > +					   struct pwm_waveform *wf)
> > +{
> > +	const struct stm32_pwm_waveform *wfhw =3D _wfhw;
> > +	struct stm32_pwm *priv =3D to_stm32_pwm_dev(chip);
> > +	unsigned int ch =3D pwm->hwpwm;
> > +
> > +	if (wfhw->ccer & TIM_CCER_CCxE(ch + 1)) {
> > +		unsigned long rate =3D clk_get_rate(priv->clk);
> > +		u64 ccr_ns;
> > +
> > +		/* The result doesn't overflow for rate >=3D 15259 */
> > +		wf->period_length_ns =3D stm32_pwm_mul_u64_u64_div_u64_roundup(((u64=
)wfhw->psc + 1) * (wfhw->arr + 1),
> > +									     NSEC_PER_SEC, rate);
> > +
> > +		ccr_ns =3D stm32_pwm_mul_u64_u64_div_u64_roundup(((u64)wfhw->psc + 1=
) * wfhw->ccr,
> > +							       NSEC_PER_SEC, rate);
> > +
> > +		if (wfhw->ccer & TIM_CCER_CCxP(ch + 1)) {
> > +			wf->duty_length_ns =3D
> > +				stm32_pwm_mul_u64_u64_div_u64_roundup(((u64)wfhw->psc + 1) * (wfhw=
->arr + 1 - wfhw->ccr),
> > +								      NSEC_PER_SEC, rate);
> > +
> > +			wf->duty_offset_ns =3D ccr_ns;
> > +		} else {
> > +			wf->duty_length_ns =3D ccr_ns;
> > +			wf->duty_offset_ns =3D 0;
> > +		}
>=20
> Well, my main confusion is around duty_offset_ns. Indeed, it's right
> here, that with PWM mode 1 (CCMR bit 5 and 6 set later on), only
> possibilty is to have either 0, or the period - duty cycle as delay when
> polarity is inversed.
>=20
> I gave it a try (basic testing), but user doesn't get information when
> setting a waveform (with a valid duty_offset_ns), but the hardware
> doesn't necessarily apply it when writing the waveform ? What's your
> advise / opinion ?

The intended behaviour is that if you pass a duty_offset_ns >=3D period -
duty_cycle_ns (together with duty_offset > 0), you get inversed polarity.
This isn't signaled indeed. But the same holds true for other hardware
specific adaptions (e.g. when you pass period =3D 12345 and that's rounded
down to 12300 because of input clock constraints). If a consumer cares
about that, there is the possiblity to use .round_waveform_tohw() +
=2Eround_waveform_fromhw() to know beforehand.

> > +	} else {
> > +		*wf =3D (struct pwm_waveform){
> > +			.period_length_ns =3D 0,
> > +		};
> > +	}
>=20
> Would be nice to add similar dev_dbg() as in
> stm32_pwm_round_waveform_tohw().

Ack.

Thanks for your two good catches and your opion on my design,
Uwe

--w2wbk3r2n5m3efs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbYk08ACgkQj4D7WH0S
/k55qwf9EgN+NhhEi+Yq9bVFPXawoBgYgXhtz15b9/HdHx//aXePBZbaePmT0mL6
tk2ffKE45l/RVEWmLv4Ju3egAyi0FEB8Nib28BqRHHx6ogLAGYlYSXLKF1pPpIGG
MS5Xs/V6VQ/QHqgOgGiDHsr5vO05QsYX3/8xG3if4V28kV/5UIdtu8bzI8Zez/RY
BB9RLIqGTKqzzC1OVqNQXkKFlbuU2eFTgLnwACPrUCwKsa4agF60ERmgVmic5Z8l
fzzCE1cNmgWCkfMfNMqic+OunA4X9hKBsFRtwiqEZFc31BovQBkKnitlGmXGbM35
X2kQr2UTr/RKXZTsZqTfoMhwxYO06Q==
=x3Fw
-----END PGP SIGNATURE-----

--w2wbk3r2n5m3efs5--

--===============4445499971794480128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4445499971794480128==--
