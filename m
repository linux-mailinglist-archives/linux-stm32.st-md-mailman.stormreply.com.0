Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C194810CA
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Dec 2021 08:49:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9AAFC5F1F0;
	Wed, 29 Dec 2021 07:49:08 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE3B1C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Dec 2021 07:49:06 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id v25so17884073pge.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 23:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ySGrDwcfAoHKrcHz2RP9d9116MO2XUcrj9F6W+JdmuE=;
 b=PYDlKAMHbsleZ0YFDTS2lp2dhKUeMEYeP8mIK34yNzzt3jVqpkwZpisA6RJI6X+L2U
 hx2PhLmZ34nFoN3DuWoSRBLC9HEO3aATDHFtZA4b366eAJ+PUctjhapKmlEVduchQ0z4
 GKlOQhh3d6ju+9uamcmyYA1OkayTXPst4o6e9TXsdxd9VoCyohhNO+JJfjIVObzXSR+G
 RRTtO2npg/QY9mRc4z8a6D1EhCLtSI6Mp0LLdjafRTmkesxuGAluBQA4RGxoPkOOyUz4
 6vnpeZauNDe7yn7QXjxpd52oDxDyVocoKIgG6BcLNG5TR++A7MwAPaYD+HklPiM/KiLT
 9VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ySGrDwcfAoHKrcHz2RP9d9116MO2XUcrj9F6W+JdmuE=;
 b=ZNSvAu91sJK5/cEWJl0asCyKk/2y9eYG0hP9MgdfO0eaIq1cZW8dyoGzTTwjXot9H5
 FaOQZ2firNFJRuQyKh8qGYG+LwTn+jcBmSQ8acvxmxQf5mhqxojXXVhibHfuyPhBTpFc
 LVotDttPtLPc4QKOUbxJEMhhmMLUkiGeVWXK9JBkEyphs5oegvyy4BpnspIL+z3TnG1k
 Bp5ph0mfrUiLBi+sHQIxw3KKCaZSYKtad4tA8dBAu6eoRhdRW6Fn+Vz/UFM5Hz1J3Abb
 Cf+nhzU/94QFxIaH6J92XSHvLgV63geYXGTHXrMYW99FnjWjKLlpzcymziDM3m43hf6Y
 tscw==
X-Gm-Message-State: AOAM5337nR0EnVo8UzlQgYoIe0ypav8tQ4n/w+ZX4aAFnSUunojoVvyj
 yzFJh3vD6eVklH2zX1OOhPg=
X-Google-Smtp-Source: ABdhPJw/iUNmBjKeK0BjIZk/GpK3pd7105QLEssYSNrZYbk2YemKxVHsOMRZs/XRLRhE1d7u+fSVeA==
X-Received: by 2002:a63:8a4b:: with SMTP id y72mr22500409pgd.1.1640764145507; 
 Tue, 28 Dec 2021 23:49:05 -0800 (PST)
Received: from shinobu (113x37x72x24.ap113.ftth.ucom.ne.jp. [113.37.72.24])
 by smtp.gmail.com with ESMTPSA id e16sm21802560pfd.38.2021.12.28.23.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 23:49:04 -0800 (PST)
Date: Wed, 29 Dec 2021 16:48:47 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YcwS3yszjEd9KhdW@shinobu>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
 <20211227094526.698714-13-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20211227094526.698714-13-u.kleine-koenig@pengutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] [PATCH v2 12/23] counter: stm32-timer-cnt:
 Convert to counter_priv() wrapper
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
Content-Type: multipart/mixed; boundary="===============7152986222160629333=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7152986222160629333==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0hvMYwsk329X9REM"
Content-Disposition: inline


--0hvMYwsk329X9REM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 27, 2021 at 10:45:15AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> This is a straight forward conversion to the new counter_priv() wrapper.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
>  drivers/counter/stm32-timer-cnt.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-ti=
mer-cnt.c
> index 0546e932db0c..4b05b198a8d8 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -47,7 +47,7 @@ static const enum counter_function stm32_count_function=
s[] =3D {
>  static int stm32_count_read(struct counter_device *counter,
>  			    struct counter_count *count, u64 *val)
>  {
> -	struct stm32_timer_cnt *const priv =3D counter->priv;
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
>  	u32 cnt;
> =20
>  	regmap_read(priv->regmap, TIM_CNT, &cnt);
> @@ -59,7 +59,7 @@ static int stm32_count_read(struct counter_device *coun=
ter,
>  static int stm32_count_write(struct counter_device *counter,
>  			     struct counter_count *count, const u64 val)
>  {
> -	struct stm32_timer_cnt *const priv =3D counter->priv;
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
>  	u32 ceiling;
> =20
>  	regmap_read(priv->regmap, TIM_ARR, &ceiling);
> @@ -73,7 +73,7 @@ static int stm32_count_function_read(struct counter_dev=
ice *counter,
>  				     struct counter_count *count,
>  				     enum counter_function *function)
>  {
> -	struct stm32_timer_cnt *const priv =3D counter->priv;
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
>  	u32 smcr;
> =20
>  	regmap_read(priv->regmap, TIM_SMCR, &smcr);
> @@ -100,7 +100,7 @@ static int stm32_count_function_write(struct counter_=
device *counter,
>  				      struct counter_count *count,
>  				      enum counter_function function)
>  {
> -	struct stm32_timer_cnt *const priv =3D counter->priv;
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
>  	u32 cr1, sms;
> =20
>  	switch (function) {
> @@ -140,7 +140,7 @@ static int stm32_count_direction_read(struct counter_=
device *counter,
>  				      struct counter_count *count,
>  				      enum counter_count_direction *direction)
>  {
> -	struct stm32_timer_cnt *const priv =3D counter->priv;
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
>  	u32 cr1;
> =20
>  	regmap_read(priv->regmap, TIM_CR1, &cr1);
> @@ -153,7 +153,7 @@ static int stm32_count_direction_read(struct counter_=
device *counter,
>  static int stm32_count_ceiling_read(struct counter_device *counter,
>  				    struct counter_count *count, u64 *ceiling)
>  {
> -	struct stm32_timer_cnt *const priv =3D counter->priv;
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
>  	u32 arr;
> =20
>  	regmap_read(priv->regmap, TIM_ARR, &arr);
> @@ -166,7 +166,7 @@ static int stm32_count_ceiling_read(struct counter_de=
vice *counter,
>  static int stm32_count_ceiling_write(struct counter_device *counter,
>  				     struct counter_count *count, u64 ceiling)
>  {
> -	struct stm32_timer_cnt *const priv =3D counter->priv;
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
> =20
>  	if (ceiling > priv->max_arr)
>  		return -ERANGE;
> @@ -181,7 +181,7 @@ static int stm32_count_ceiling_write(struct counter_d=
evice *counter,
>  static int stm32_count_enable_read(struct counter_device *counter,
>  				   struct counter_count *count, u8 *enable)
>  {
> -	struct stm32_timer_cnt *const priv =3D counter->priv;
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
>  	u32 cr1;
> =20
>  	regmap_read(priv->regmap, TIM_CR1, &cr1);
> @@ -194,7 +194,7 @@ static int stm32_count_enable_read(struct counter_dev=
ice *counter,
>  static int stm32_count_enable_write(struct counter_device *counter,
>  				    struct counter_count *count, u8 enable)
>  {
> -	struct stm32_timer_cnt *const priv =3D counter->priv;
> +	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
>  	u32 cr1;
> =20
>  	if (enable) {
> --=20
> 2.33.0
>=20

--0hvMYwsk329X9REM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmHMEt8ACgkQhvpINdm7
VJKc3Q//e00ottRDe0JDSIqYtZ73xj5VtyGoSP4JIX1AegUNR3k1Vr6E4GXAm1M1
0JV8JmTevetmeFosjXYI1tI2ojZjAh+TNfpdw+o661KMqxqJ25jcWPHNmCgi3W8K
yGSxf49EQf5oIpoUJlAPM1Ged4s4ZgGd3UiaGrdJrAlA/Hyb2tCCrbMJ1ESOy2wt
vgXvgN4YOWyptlo6zkvsQLLit1Ydh+862idWGnFOxxBsouXR07iN166VTv9P8oxb
NMGIbKlFuKliFzHnJkhqJDY3iIdomyrYMvQz/sVPk8f1ApkcSXW6rH5k7S8Yf8db
Y94F4g7Elg5UiwPcGd5feobaZ5gRO09XhQ+gOXDw+E4WKRR0dX+Z6SprA8xupRoB
C1wDsLP9m6uH4VxSB1uhd3PubPYO+TAH3eR1pI/gUivWhSA19fttH+q2XyBQUbOt
sj3saJeE9JtWJ4k+arXozFA9CTVF7WtD1ilvrefQgDl64kSSMxwMVQflD/xtPWV8
Wbl2oXjeGTilK8EKAWJ2NXPF614i4Z08dkhOgfigk3yh7UasKSCHpvgNDkbSplYp
3AMbhi5lIWqqKRibDVh2RAgyjKHRk6+pf7mQo2FzeFRIrn2JzcLvtp2nL1430A6V
sbrmf1bCVGCGHqZZWdMjpsn93GmZ6vobDqZbsp2pjJGuDlce4BU=
=LvJT
-----END PGP SIGNATURE-----

--0hvMYwsk329X9REM--

--===============7152986222160629333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7152986222160629333==--
