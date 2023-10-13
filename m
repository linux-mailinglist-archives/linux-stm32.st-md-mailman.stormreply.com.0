Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9771F7C9080
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Oct 2023 00:48:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37A36C6B442;
	Fri, 13 Oct 2023 22:48:45 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B3D5C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 22:48:43 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-7ab9f1efecfso939423241.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 15:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697237322; x=1697842122;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M7+2V0YlS8ZDKtKvIbNHqNSalMBU1GrhT1IpSjeCQTw=;
 b=v3g/ucw4F3ERHeeKK/KbCzMnlxZIe/lb1pwBy5P8y7FJUuS5WF2DQw6I7zaoU7OnDf
 64eHyjirGKTNR9BMrMdi8L962hvEnRlPuFIf16eAFFEfmP5+b5PdoMyFIK1Jhhi/+WQ/
 v5+G7euAjyGGLtsSxXW/ZdZRJlF1yDnj2FMiQc0TSSQsYihbXmLKYc9RLoJd72NwBVd+
 Ay7Oh9hjE3JsFzeD2n/Z3jC4xWIPYCzNeIi0AYgo8cgoEULcICnAAsC2EFvuGuj14Pvk
 GMakmzlxyvx4brA2YvRz8jY1MJiadue0KsI2lsgslQ+AmEFyFILX96msiZ4rt6wX/X/B
 0cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237322; x=1697842122;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7+2V0YlS8ZDKtKvIbNHqNSalMBU1GrhT1IpSjeCQTw=;
 b=PGPegrRdCSIjeS7zZ5yVEFpXi4KPQFk68F5BxayUpX2lBanDKofH2y/ayhAQ+mmi0e
 qMXxvoaviiyWpK5lwmjvJTLLLBI+hS3lnesvDo2MZacgiWoNwhqoPfuNbkFoif4UOBfK
 RgSCzlHO8bC+14yEycZ+kXCS6hhoJ/hpb/xJUfcqLKPaSqxoGCBhO9bEd7zVQkZseUnk
 rFBeqEVFxlu/nXKtYXQ87+fdmIcO/q43Xv0txfK6twmUESTHxrXY2afqfIpUIi+hEU7p
 Z4JHuCUYqX/0tdIlX6xzUs1wA17W9wKuNcLABKrRcpSf4CdrXgSNPGogky0aWl+jHqFb
 oBKg==
X-Gm-Message-State: AOJu0YyxbLtkeBXu9wYxsRbWaUprw0Loyp0MvkIaCLbT+8zCLvI+oPEQ
 HHgLv2PcgagQEVJKQV3Dun23fmv/kuQAypfu1q8=
X-Google-Smtp-Source: AGHT+IF7jx2I05oes/GMbZo7J3cDYSck7gV+oLZiWc5TQCd+sjI62q0d0Zzk234dBluUdpibqgZoIA==
X-Received: by 2002:a67:f4d3:0:b0:452:66a7:1ac with SMTP id
 s19-20020a67f4d3000000b0045266a701acmr27391344vsn.6.1697237322128; 
 Fri, 13 Oct 2023 15:48:42 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
 by smtp.gmail.com with ESMTPSA id
 bi6-20020a05610234e600b0045255981807sm551389vsb.0.2023.10.13.15.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:41 -0700 (PDT)
Date: Fri, 13 Oct 2023 18:48:39 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZSnJR2yfYsBNHu/4@fedora>
References: <20230922143920.3144249-1-fabrice.gasnier@foss.st.com>
 <20230922143920.3144249-6-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230922143920.3144249-6-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/6] counter: stm32-timer-cnt: populate
 capture channels and check encoder
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
Content-Type: multipart/mixed; boundary="===============6415586190480662736=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6415586190480662736==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DOR58DHOIf3n8XuL"
Content-Disposition: inline


--DOR58DHOIf3n8XuL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 04:39:19PM +0200, Fabrice Gasnier wrote:
> This is a precursor patch to support capture channels on all possible
> channels and stm32 timer types. Original driver was intended to be used
> only as quadrature encoder and simple counter on internal clock.
>=20
> So, add ch3 and ch4 definition. Also add a check on encoder capability,
> so the driver may be probed for timer instances without encoder feature.
> This way, all timers may be used as simple counter on internal clock,
> starting from here.

Hi Fabrice,

Let's split the encoder capability probing code, detect number of
channels code, and channel introduction code to their own patches in
order to simplify things.

> Encoder capability is retrieved by using the timer index (originally in
> stm32-timer-trigger driver and dt-bindings). The need to keep backward
> compatibility with existing device tree lead to parse aside trigger node.
> Add diversity as STM32 timers with capture feature may have either 4, 2,
> 1 or no cc (capture/compare) channels.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

I think this patch is more complicated than it needs to be.

> @@ -400,13 +558,47 @@ static int stm32_timer_cnt_probe(struct platform_de=
vice *pdev)
>  	priv->clk =3D ddata->clk;
>  	priv->max_arr =3D ddata->max_arr;
> =20
> +	ret =3D stm32_timer_cnt_probe_encoder(pdev, priv);
> +	if (ret)
> +		return ret;
> +
> +	stm32_timer_cnt_detect_channels(pdev, priv);
> +
>  	counter->name =3D dev_name(dev);
>  	counter->parent =3D dev;
>  	counter->ops =3D &stm32_timer_cnt_ops;
> -	counter->counts =3D &stm32_counts;
>  	counter->num_counts =3D 1;
> -	counter->signals =3D stm32_signals;
> -	counter->num_signals =3D ARRAY_SIZE(stm32_signals);

Keep this the same.

> +
> +	/*
> +	 * Handle diversity for stm32 timers features. For now encoder is found=
 with
> +	 * advanced timers or gp timers with 4 channels. Timers with less chann=
els
> +	 * doesn't support encoder.
> +	 */
> +	switch (priv->nchannels) {
> +	case 4:
> +		if (priv->has_encoder)
> +			counter->counts =3D &stm32_counts_enc_4ch;
> +		else
> +			counter->counts =3D &stm32_counts_4ch;
> +		counter->signals =3D stm32_signals;
> +		counter->num_signals =3D ARRAY_SIZE(stm32_signals);
> +		break;
> +	case 2:
> +		counter->counts =3D &stm32_counts_2ch;
> +		counter->signals =3D stm32_signals;
> +		counter->num_signals =3D 3; /* clock, ch1 and ch2 */
> +		break;
> +	case 1:
> +		counter->counts =3D &stm32_counts_1ch;
> +		counter->signals =3D stm32_signals;
> +		counter->num_signals =3D 2; /* clock, ch1 */
> +		break;
> +	default:
> +		counter->counts =3D &stm32_counts;
> +		counter->signals =3D stm32_signals;
> +		counter->num_signals =3D 1; /* clock */
> +		break;
> +	}

Rather than adjusting the number of counts and signals, keep the
configuration static and use a single stm32_counts array. The reason is
that in the Counter subsystem paradigm Signals do not necessary
correlate to specific hardware signals but are rather an abstract
representation of the device behavior at a high level. In other words, a
Synapse with an action mode set to COUNTER_SYNAPSE_ACTION_NONE can be
viewed as representing a Signal that does not affect the Count (i.e. in
this case equivalent to an unconnected line).

What you'll need to do instead is check priv->nchannels during
stm32_action_read and stm32_count_function_read calls in order to return
the correct synapse action and count function for the particular
channels configuration you have. In stm32_count_function_write you would
return an -EINVAL (maybe -EOPNOTSUPP would be better?) when the channels
configuration does not support a particular count function.

William Breathitt Gray

--DOR58DHOIf3n8XuL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZSnJRwAKCRC1SFbKvhIj
K0moAQD7wGvZVP3oXlqW7ObHpexVDKnM0MGwBchWQQSXSCVj9QEApHtanCqbJLLZ
mWbFf52y1xmscsdAdL7XhWiNLieTCQM=
=2nuH
-----END PGP SIGNATURE-----

--DOR58DHOIf3n8XuL--

--===============6415586190480662736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6415586190480662736==--
