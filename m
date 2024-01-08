Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3BF8275E6
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 17:59:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B7EBC6DD66;
	Mon,  8 Jan 2024 16:59:11 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54AA4C6DD65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 16:59:09 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-7cc0f5bcb4fso360170241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 08:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704733148; x=1705337948;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9K38x+VLezLj6/jNgYnVJ1nMGYFk9RbvwFtSlmgAh8I=;
 b=ktS1PuZjLYaendZ3lYQtmJBvYAOKMpk+KSXEcvPQEsdlM54hVCodXpW7mzfXMEas5Y
 5h+8AH8NEiNKJ4QsT5MBGPn8PDW54/xH2ln9WIRAVL4B7hs13zb8O5k2oGuOOIbsYAks
 qWNiLiDnkU955l8AL9k9rfXz2uPWfxCHr9290ApJGUTwmcG/nZMbYLHTPLwgI3lMuo6m
 Kt+ZZVZYPtD8Vw9zSXCyRmhs/2C7nFb1P6i55wzH5IfjeznvUIWsL1075HIKFIa8QuDj
 8BjYBlrByRD45CjSCj/bPNuctEUjOgee9Jp0kGXXX4mqMXPVho1K+dHdCKwIat6HuUMY
 aSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704733148; x=1705337948;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9K38x+VLezLj6/jNgYnVJ1nMGYFk9RbvwFtSlmgAh8I=;
 b=HmSCm7lPbW5NjFTAGkkl6UOuRcMSNjk8/kcG/SPDxvb1u4yYqpFOPx0v4HSVBOxyY8
 RU/IFupBnDw4QltZQWbvzpDD3eftLNNs1HSREvHEofewsjmTjmqaCv3WNEpkn0RBxkuE
 HRd8lwdBZTAJCKadTQHUGeNZteIRz7yxWYhlcCjPEc77RVvoxsTyBMMsKkCJxPlKT1ao
 2GhmfTDKKuMvYhrHd6CnX1CjIBSVIbfdbr/hiUfb7aQbzi0fKssGuaAGuOncmC2VWL6f
 1kclt3SAZri43LDzTh6fCa9GSD1JFwBibXS5Lv68VaSOZafsCqB2P4A0WwXDLuLSkuwi
 mI5w==
X-Gm-Message-State: AOJu0YzbWvquwLuG7+lWYNeh16NEkYUECuOvWoagW9UQno2iUV16DK86
 uMrfCrTLtCHcE9pG8UAOXN4qwy5e/+nwZQ==
X-Google-Smtp-Source: AGHT+IE/Qv668Ztj0QeHPWgPiCUb8oh1aEW8N4ltPdUoThdREI08DKfFatV4tJeLg/DwRn8524cBIg==
X-Received: by 2002:a05:6102:3e90:b0:467:cd80:2608 with SMTP id
 m16-20020a0561023e9000b00467cd802608mr1476669vsv.11.1704733148039; 
 Mon, 08 Jan 2024 08:59:08 -0800 (PST)
Received: from ubuntu-server-vm-macos (072-189-067-006.res.spectrum.com.
 [72.189.67.6]) by smtp.gmail.com with ESMTPSA id
 hv14-20020a67e68e000000b004662865945asm30618vsb.7.2024.01.08.08.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 08:59:07 -0800 (PST)
Date: Mon, 8 Jan 2024 16:59:05 +0000
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZZwp2Tq23FtRsHhq@ubuntu-server-vm-macos>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-7-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231220145726.640627-7-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 06/10] counter: stm32-timer-cnt: add
 checks on quadrature encoder capability
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
Content-Type: multipart/mixed; boundary="===============1053008414159633521=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1053008414159633521==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wjNWh2SLmyHjR/FO"
Content-Disposition: inline


--wjNWh2SLmyHjR/FO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 03:57:22PM +0100, Fabrice Gasnier wrote:
> This is a precursor patch to support capture channels on all possible
> channels and stm32 timer types. Original driver was intended to be used
> only as quadrature encoder and simple counter on internal clock.
>=20
> So, add a check on encoder capability, so the driver may be probed for
> timer instances without encoder feature. This way, all timers may be used
> as simple counter on internal clock, starting from here.
>=20
> Encoder capability is retrieved by using the timer index (originally in
> stm32-timer-trigger driver and dt-bindings). The need to keep backward
> compatibility with existing device tree lead to parse aside trigger node.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v3:
> - New patch split from:
>   "counter: stm32-timer-cnt: populate capture channels and check encoder"
> - return -EOPNOTSUPP when encoder function isn't supported by the timer
>   instance.
> ---
>  drivers/counter/stm32-timer-cnt.c | 55 +++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>=20
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-ti=
mer-cnt.c
> index bf2726dd7f12..6933d42b16bf 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -11,6 +11,7 @@
>  #include <linux/mfd/stm32-timers.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/types.h>
> @@ -38,6 +39,8 @@ struct stm32_timer_cnt {
>  	u32 max_arr;
>  	bool enabled;
>  	struct stm32_timer_regs bak;
> +	bool has_encoder;
> +	u32 idx;

This idx value is only used temporarily to determine whether the device has
support for encoder mode. Do we really need to store it indefinitely
here?

> +static int stm32_timer_cnt_probe_encoder(struct platform_device *pdev,

This function uses 'pdev' only to access 'dev'. It'll be better to pass
a reference to 'dev' directly instead.

William Breathitt Gray

--wjNWh2SLmyHjR/FO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZZwp2QAKCRC1SFbKvhIj
K7S+AQCQM0asZnc8G7bJKzKJwkk/Jggj2YNluI1xFmJNzzWqQgD+I9Gx0gcX1sk5
8Cm4QXQFUMIu5YPYOyZsy0Yj0qaIKw4=
=FdQj
-----END PGP SIGNATURE-----

--wjNWh2SLmyHjR/FO--

--===============1053008414159633521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1053008414159633521==--
