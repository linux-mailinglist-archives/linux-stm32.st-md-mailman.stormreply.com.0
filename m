Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8697863A2A0
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Nov 2022 09:19:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35C66C65E59;
	Mon, 28 Nov 2022 08:19:28 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD504C6506E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Nov 2022 21:53:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10F85B80953;
 Sat, 26 Nov 2022 21:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A697C433D6;
 Sat, 26 Nov 2022 21:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669499625;
 bh=OWkY+Q2AWHHXFpSYHf6WVJ2BPlgIehXKQ01/N2rvGaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W1v53UmAPr8Bf3PvMGy4A8+6b9BD+005Qgy3zdIdZmS55GXSn8lUT/WqsuR+yVoWh
 NPfZCiKmmh+Pmr2zOMAaYsfdhNCeAT5W0ydBKcMrIyutVjIQwteCc5KRevYDfDH9gO
 a9cIi9crJmND0aAgqH4BjwKlSE9SqeVOAqU3HYixofEsYxQ/2bHaxDvNh2SpJY6vRJ
 0Vy4RRawgdZJK5CT8SKTXEuavb/DBwM0ahJOhLw6eDy+6sZnz7xzadI9GhrTXYp/cX
 yn5TR+Trin/61/PPNWy7BgYWir4NukjFrkTErghEBZCKIKM1O50neo73BZxAQLKMV1
 mjkdslwV+3n8A==
Date: Sat, 26 Nov 2022 16:53:42 -0500
From: William Breathitt Gray <wbg@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <Y4KK5tck2aCdKWXF@ishi>
References: <20221123133609.465614-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20221123133609.465614-1-fabrice.gasnier@foss.st.com>
X-Mailman-Approved-At: Mon, 28 Nov 2022 08:19:27 +0000
Cc: linux-iio@vger.kernel.org, william.gray@linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-lptimer-cnt: fix the check
 on arr and cmp registers update
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
Content-Type: multipart/mixed; boundary="===============6783163361039961625=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6783163361039961625==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u770lf6WZ1x5I9rX"
Content-Disposition: inline


--u770lf6WZ1x5I9rX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 02:36:09PM +0100, Fabrice Gasnier wrote:
> The ARR (auto reload register) and CMP (compare) registers are
> successively written. The status bits to check the update of these
> registers are polled together with regmap_read_poll_timeout().
> The condition to end the loop may become true, even if one of the register
> isn't correctly updated.
> So ensure both status bits are set before clearing them.
>=20
> Fixes: d8958824cf07 ("iio: counter: Add support for STM32 LPTimer")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Applied to the counter-current branch of counter.git.

William Breathitt Gray

> ---
>  drivers/counter/stm32-lptimer-cnt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-=
lptimer-cnt.c
> index d6b80b6dfc28..8439755559b2 100644
> --- a/drivers/counter/stm32-lptimer-cnt.c
> +++ b/drivers/counter/stm32-lptimer-cnt.c
> @@ -69,7 +69,7 @@ static int stm32_lptim_set_enable_state(struct stm32_lp=
tim_cnt *priv,
> =20
>  	/* ensure CMP & ARR registers are properly written */
>  	ret =3D regmap_read_poll_timeout(priv->regmap, STM32_LPTIM_ISR, val,
> -				       (val & STM32_LPTIM_CMPOK_ARROK),
> +				       (val & STM32_LPTIM_CMPOK_ARROK) =3D=3D STM32_LPTIM_CMPOK_ARRO=
K,
>  				       100, 1000);
>  	if (ret)
>  		return ret;
> --=20
> 2.25.1
>=20

--u770lf6WZ1x5I9rX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY4KK5gAKCRC1SFbKvhIj
K+deAQC6ZXzAa3xdZuWBglzIaSy1YgvjYJNRFUV1M62hbScaawD8CRdlC/3xIFg2
fNtfcSsKjpct2CfSS9TwcuYUKf32ewI=
=xvBl
-----END PGP SIGNATURE-----

--u770lf6WZ1x5I9rX--

--===============6783163361039961625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6783163361039961625==--
