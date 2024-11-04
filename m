Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 981989BB7A4
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 15:25:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4753AC6DD94;
	Mon,  4 Nov 2024 14:25:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8792C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2024 14:25:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 51FB25C5619;
 Mon,  4 Nov 2024 14:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A29C4CECE;
 Mon,  4 Nov 2024 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730730302;
 bh=aCdsocZNwSc0LaEHFPOtq6uw+UtTQbPbYCLT6rdIiSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R89pu2SkbTOdSoRFVO+RZw5wfgA4U27LfJeYYH88bCe+nfxHdadx02d8l9jhs8zid
 VrhbYNlRXhCr0Q59Q9+5nKXv8H2c1BwKOpmeMl+iNfLAGzPE0TH0kXY5h82VjvBbuK
 PVu3y1owBEg93MLEfo812PRB9qr+j1BwMNkIt7ke+Cjars0M+tMypPYeLcBc7rBZx5
 Y9cTGR7QhoXaXhGcUbDJuLJtxMEABrinBwwWZVTLBs+DBFxogiMaitSSm4sNHLb9w1
 PzuV8Rd94Va0gkGfpz2mNKhvLiScchTKZeAOUiGVs1SOr45IOTZePGcQYR7v98RXrt
 Oah2MOc+r3XXg==
Date: Mon, 4 Nov 2024 23:24:58 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Message-ID: <ZyjZOt4LXL6vVrEC@ishi>
References: <20241103182502.8384-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241103182502.8384-1-jiashengjiangcool@gmail.com>
Cc: benjamin.gaignard@st.com, linux-iio@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@outlook.com>, mcoquelin.stm32@gmail.com,
 Jonathan.Cameron@huawei.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: Add check for
	clk_enable()
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
Content-Type: multipart/mixed; boundary="===============4779502555957862564=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4779502555957862564==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A18abvT+dU0C7JZH"
Content-Disposition: inline


--A18abvT+dU0C7JZH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 03, 2024 at 06:25:02PM +0000, Jiasheng Jiang wrote:
> From: Jiasheng Jiang <jiashengjiangcool@outlook.com>
>=20
> Add check for the return value of clk_enable() in order to catch the
> potential exception.
>=20
> Fixes: c5b8425514da ("counter: stm32-timer-cnt: add power management supp=
ort")
> Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@outlook.com>
> ---
>  drivers/counter/stm32-timer-cnt.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-ti=
mer-cnt.c
> index 186e73d6ccb4..0593c9b73992 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -214,11 +214,15 @@ static int stm32_count_enable_write(struct counter_=
device *counter,
>  {
>  	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
>  	u32 cr1;
> +	int ret;
> =20
>  	if (enable) {
>  		regmap_read(priv->regmap, TIM_CR1, &cr1);
> -		if (!(cr1 & TIM_CR1_CEN))
> -			clk_enable(priv->clk);
> +		if (!(cr1 & TIM_CR1_CEN)) {
> +			ret =3D clk_enable(priv->clk);
> +			if (ret)
> +				return ret;
> +		}
> =20
>  		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
>  				   TIM_CR1_CEN);
> @@ -816,7 +820,9 @@ static int __maybe_unused stm32_timer_cnt_resume(stru=
ct device *dev)
>  		return ret;
> =20
>  	if (priv->enabled) {
> -		clk_enable(priv->clk);
> +		ret =3D clk_enable(priv->clk);
> +		if (ret)
> +			return ret;
> =20
>  		/* Restore registers that may have been lost */
>  		regmap_write(priv->regmap, TIM_SMCR, priv->bak.smcr);
> --=20
> 2.25.1

It's not necessarily clear that an error in the count_enable_write()
callback or cnt_resume() callback is due to a clk_enable() failure. You
should call dev_err before returning to indicate the reason for the
error code.

William Breathitt Gray

--A18abvT+dU0C7JZH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZyjZOgAKCRC1SFbKvhIj
K91QAQClpsDPi83ln4ZTMU9XMQcBPRklZisDe1L9SMCTzqjm3gEAq1L5KoqpNOaf
YPPuPhpOYxmyb3wS6y/mZ8IWf4PZ9QQ=
=zJcy
-----END PGP SIGNATURE-----

--A18abvT+dU0C7JZH--

--===============4779502555957862564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4779502555957862564==--
