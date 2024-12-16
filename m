Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B66CD9F2BB0
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2024 09:23:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 762DAC71292;
	Mon, 16 Dec 2024 08:23:14 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BE8FC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 08:23:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5F3CBA40D0B;
 Mon, 16 Dec 2024 08:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885F9C4CED0;
 Mon, 16 Dec 2024 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734337385;
 bh=vOCQPuexICPOQSuilzYyp/1Ex7qhBODA8YKKaZigSgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e12vIT85AtBLi/+MH997JfBhodHyWT+2POvUj+hV7NhjX5rp47oVnm+TTojt52OxH
 pDLesVc/gN+RyMtGqQmSryHKsT6vSlC0qsLoSPp6aUVLc3w6OBU5EhYPfdMqlalrU6
 /Kf49hNAhfDrI74hj4VeYQzJjnbLHJXBrdTKHoOWVZzEECYbFbjimcvnoaKzqUDrMZ
 YAi00a/CZzkrCyFSNXSTkjZP5LFloECGG+ZpeyHDAQnKqmGlAeGDdvN27/AVpcpjPL
 39ExDgxY8OYlfVrDW+9tW6rzAHKXi1WyyIwPQ6mIPJ5b78nZNiBrDcZMFlopJF/s74
 sYZTnhiVbrsXw==
Date: Mon, 16 Dec 2024 09:23:03 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Message-ID: <24zcihiin4lkfhahxmn4nx4t7v5hlvxhlcjzeyrz2kizcqkaop@b5yq44j4vozj>
References: <20241215224752.220318-1-zmw12306@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241215224752.220318-1-zmw12306@gmail.com>
Cc: linux-pwm@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com, p.zabel@pengutronix.de,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Add check for clk_enable()
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
Content-Type: multipart/mixed; boundary="===============3156407314924119485=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3156407314924119485==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nx6agqcxa3ihyuxg"
Content-Disposition: inline


--nx6agqcxa3ihyuxg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stm32: Add check for clk_enable()
MIME-Version: 1.0

Hello,

On Sun, Dec 15, 2024 at 05:47:52PM -0500, Mingwei Zheng wrote:
> Add check for the return value of clk_enable() to catch the potential
> error.
>=20
> Fixes: 19f1016ea960 ("pwm: stm32: Fix enable count for clk in .probe()")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>  drivers/pwm/pwm-stm32.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index b889e64522c3..b94d186e3c0c 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -858,8 +858,11 @@ static int stm32_pwm_probe(struct platform_device *p=
dev)
>  	chip->ops =3D &stm32pwm_ops;
> =20
>  	/* Initialize clock refcount to number of enabled PWM channels. */
> -	for (i =3D 0; i < num_enabled; i++)
> -		clk_enable(priv->clk);
> +	for (i =3D 0; i < num_enabled; i++) {
> +		ret =3D clk_enable(priv->clk);
> +		if (ret)
> +			return ret;
> +	}

I wondered for some time if we could still improve more here. If the
(say) second clk_enable() or devm_pwmchip_add() fails, the clk_enable()
calls are leaked. However disabling the clk also might have downsides
(as it might stop a running PWM). OTOH the only expected failure point
is the first clk_enable() as the following are just software operations
and devm_pwmchip_add() only fails on memory pressure. So proper cleanup
doesn't really matter.

So I think the patch is fine as is and I will apply it.

Best regards
Uwe

--nx6agqcxa3ihyuxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdf41wACgkQj4D7WH0S
/k7llwf/UiLvKJ4m+BX9uZ9YkHIcbQ5Y9akNESa58tdAXToIePTuElL94I9wcLtr
jyU3+IZmgT0FaQ6kfIlkt87oM/owomEUiXSmE9KCZdoNJVb8cx1rPHGocbE3xB6d
2YSpQyi1yoybKbSl/32eFuKREaZC1K2kd0PA1lu7S4rpMhfUVBF5fa1z+gfV9XYQ
0l8KoryMUslshBYLYK4Jt8fcWm62JTCC9kHmpmAhUQOYHP7kRu2HTwyBtLwqIL+1
rGTpleh6Y1MNAeWx9oCFhaL5Cb+T1JFJWbaQpX+hFaIGghLacIh41JhCzDwPiqjs
Sc298uJWaEPzq1vJv/Oo7qr94cDNZA==
=NnDg
-----END PGP SIGNATURE-----

--nx6agqcxa3ihyuxg--

--===============3156407314924119485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3156407314924119485==--
