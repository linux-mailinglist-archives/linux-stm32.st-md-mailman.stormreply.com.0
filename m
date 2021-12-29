Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FEC4810C6
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Dec 2021 08:48:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BC81C5F1F0;
	Wed, 29 Dec 2021 07:48:23 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33CB0C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Dec 2021 07:48:22 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so19217017pjq.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 23:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=60Mrnhs4zKvfi4PhPJEk/cjsSt90DKSAIOfk3k8YD0U=;
 b=DkLkCvyQg2u5LtzafnSnzOfTLv+TQzPw3s8NcChuYtXcAlrbzemm+WbSwVG2a2L2WJ
 HHxYv8YHHvDdZWUO1lYmkDY1oWmsKCOdJHybGBvApIx9Korscbk64xF6F47+WRSTY5oN
 NFy/zgvJg6bsAwH8npnsQM2nqYQMcoCuqBqFR1htpb3mqr0VjIv59vgtovde36bHO3FL
 XzEySZ7YIKW3LL9m9bOVWKlCQHK4vI18LJqbEGLLhqAFlDvdHNIecijoEqA1HVd05xhd
 UJGxXe8ZJ7V3usrq2TLbcGXck4bZK3qnNUt12cuDXsCjyx9kAXLOgkZrHg5gDrAVRhUV
 qucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=60Mrnhs4zKvfi4PhPJEk/cjsSt90DKSAIOfk3k8YD0U=;
 b=JPCQ+D46ixzuXbmXTTvv6tl0t5fKlXVMUagvpwkZ9qOzx9KW+kiv8vaHHhKaHJFc8S
 Zek7tlXLMWpDxUWduIY86AeyP+oyMcpEzYJlPyzm/XhFQT+HOXWKn8vxr2KejzHjSHLt
 5FPdm8mcKyFEdR7aK57ZkTt0UdkiFd7/u2v5PSe5N3AIFWuIwnHyZm3KjmWsGrtOeNCf
 p1VGlJH4/3u3fH5JfIE73BO4MM1kOSFlZUnJGz0btuYTwdF0QxekQVt1Fa6Ku420ZNJe
 iF5Owlw3S48PIGBZkXPGEGEcmi7EXYRpbinNKVWsmWifgmSMazDB/ssoDe28OsqKrT73
 x5NQ==
X-Gm-Message-State: AOAM530rfQDsYcFM6gqTZGY23CzeUjDTjTAZvVbK+ClRMllrsGoUTOn0
 e/dFe2H+TKPNYJLv9PLy7wA=
X-Google-Smtp-Source: ABdhPJwWlIdad0WemQFI47UK8W9kIA4f0axYeH0wlyePkZlpkjkkX+vSsgWz3WV6B8DTHcWQnKxUrg==
X-Received: by 2002:a17:90b:314e:: with SMTP id
 ip14mr11961363pjb.171.1640764100805; 
 Tue, 28 Dec 2021 23:48:20 -0800 (PST)
Received: from shinobu (113x37x72x24.ap113.ftth.ucom.ne.jp. [113.37.72.24])
 by smtp.gmail.com with ESMTPSA id q16sm19111257pfu.31.2021.12.28.23.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 23:48:20 -0800 (PST)
Date: Wed, 29 Dec 2021 16:48:07 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YcwSt4GVHcKML403@shinobu>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
 <20211227094526.698714-12-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20211227094526.698714-12-u.kleine-koenig@pengutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] [PATCH v2 11/23] counter: stm32-lptimer-cnt:
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
Content-Type: multipart/mixed; boundary="===============2100908405304168345=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2100908405304168345==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3sjde2VhNWvPWw0E"
Content-Disposition: inline


--3sjde2VhNWvPWw0E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 27, 2021 at 10:45:14AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> This is a straight forward conversion to the new counter_priv() wrapper.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
>  drivers/counter/stm32-lptimer-cnt.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-=
lptimer-cnt.c
> index 5168833b1fdf..9cf00e929cc0 100644
> --- a/drivers/counter/stm32-lptimer-cnt.c
> +++ b/drivers/counter/stm32-lptimer-cnt.c
> @@ -141,7 +141,7 @@ static const enum counter_synapse_action stm32_lptim_=
cnt_synapse_actions[] =3D {
>  static int stm32_lptim_cnt_read(struct counter_device *counter,
>  				struct counter_count *count, u64 *val)
>  {
> -	struct stm32_lptim_cnt *const priv =3D counter->priv;
> +	struct stm32_lptim_cnt *const priv =3D counter_priv(counter);
>  	u32 cnt;
>  	int ret;
> =20
> @@ -158,7 +158,7 @@ static int stm32_lptim_cnt_function_read(struct count=
er_device *counter,
>  					 struct counter_count *count,
>  					 enum counter_function *function)
>  {
> -	struct stm32_lptim_cnt *const priv =3D counter->priv;
> +	struct stm32_lptim_cnt *const priv =3D counter_priv(counter);
> =20
>  	if (!priv->quadrature_mode) {
>  		*function =3D COUNTER_FUNCTION_INCREASE;
> @@ -177,7 +177,7 @@ static int stm32_lptim_cnt_function_write(struct coun=
ter_device *counter,
>  					  struct counter_count *count,
>  					  enum counter_function function)
>  {
> -	struct stm32_lptim_cnt *const priv =3D counter->priv;
> +	struct stm32_lptim_cnt *const priv =3D counter_priv(counter);
> =20
>  	if (stm32_lptim_is_enabled(priv))
>  		return -EBUSY;
> @@ -200,7 +200,7 @@ static int stm32_lptim_cnt_enable_read(struct counter=
_device *counter,
>  				       struct counter_count *count,
>  				       u8 *enable)
>  {
> -	struct stm32_lptim_cnt *const priv =3D counter->priv;
> +	struct stm32_lptim_cnt *const priv =3D counter_priv(counter);
>  	int ret;
> =20
>  	ret =3D stm32_lptim_is_enabled(priv);
> @@ -216,7 +216,7 @@ static int stm32_lptim_cnt_enable_write(struct counte=
r_device *counter,
>  					struct counter_count *count,
>  					u8 enable)
>  {
> -	struct stm32_lptim_cnt *const priv =3D counter->priv;
> +	struct stm32_lptim_cnt *const priv =3D counter_priv(counter);
>  	int ret;
> =20
>  	/* Check nobody uses the timer, or already disabled/enabled */
> @@ -241,7 +241,7 @@ static int stm32_lptim_cnt_ceiling_read(struct counte=
r_device *counter,
>  					struct counter_count *count,
>  					u64 *ceiling)
>  {
> -	struct stm32_lptim_cnt *const priv =3D counter->priv;
> +	struct stm32_lptim_cnt *const priv =3D counter_priv(counter);
> =20
>  	*ceiling =3D priv->ceiling;
> =20
> @@ -252,7 +252,7 @@ static int stm32_lptim_cnt_ceiling_write(struct count=
er_device *counter,
>  					 struct counter_count *count,
>  					 u64 ceiling)
>  {
> -	struct stm32_lptim_cnt *const priv =3D counter->priv;
> +	struct stm32_lptim_cnt *const priv =3D counter_priv(counter);
> =20
>  	if (stm32_lptim_is_enabled(priv))
>  		return -EBUSY;
> @@ -277,7 +277,7 @@ static int stm32_lptim_cnt_action_read(struct counter=
_device *counter,
>  				       struct counter_synapse *synapse,
>  				       enum counter_synapse_action *action)
>  {
> -	struct stm32_lptim_cnt *const priv =3D counter->priv;
> +	struct stm32_lptim_cnt *const priv =3D counter_priv(counter);
>  	enum counter_function function;
>  	int err;
> =20
> @@ -321,7 +321,7 @@ static int stm32_lptim_cnt_action_write(struct counte=
r_device *counter,
>  					struct counter_synapse *synapse,
>  					enum counter_synapse_action action)
>  {
> -	struct stm32_lptim_cnt *const priv =3D counter->priv;
> +	struct stm32_lptim_cnt *const priv =3D counter_priv(counter);
>  	enum counter_function function;
>  	int err;
> =20
> --=20
> 2.33.0
>=20

--3sjde2VhNWvPWw0E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmHMErcACgkQhvpINdm7
VJJPShAAnSc7Y6Dl+F+1U3J9qVAIBj7yeJ1+M0pNs9JPybcNGXfVUDMbLGDaW4b6
bEht207yT7lx+V0MmQG3ITMLOFAK9Ozjn0Ky00vGxJFDDATwe4nzUUtmXfNU2iOG
7i93C/FfJcDb0z0rIUYRbI3g/S1c8BwrTm9FoB/waLGJxnr9oRk/e1HO31mMxzp5
UVY6fyR2RIfHfm0/cZrLDNCMy+WuWyOhbELzGIPkYL94fb1j0Y77Pqae5RWRane7
LnGefg/FWSsnbS51IgR7dH3Fxnw2hl9X9GH2QtD5PgWyzoNKLWgsRqEr6ag6rmrf
4expPSyM3j+CwgEKm5bBiW8Y46FGDmk0eRWXdW0xT4VbCzVdsWaBqUQVqB+KUqwh
10jT4TAnwMPI9FI5+mFvbg5tlUbRAi8WIvu89i8TLyKD9x7Za9fsgdhkV8LBcX2Z
P23Zx89AAAZEAxAEx83/5IxSVwQLW8gejLYkEQ7AX1nxVxRRh5mRGeQY5Ntynqbm
92LbkQ0DT5RhSq/pKpHS+1Kd7EVRKbIG5utx6W82h8dkHbWTtEK9C9NcZVo8VJk2
ofk9PDtdEng6DSvtX/GaCvWazK18OUjwa6LxMQw/lOl0zWWvCcsxkx3a9vx7r+7P
xpuR6Jt9zI+RlxNIO12QwjMvF7DQK5s5mOP9AWpA8eFf7G/P03M=
=EB2O
-----END PGP SIGNATURE-----

--3sjde2VhNWvPWw0E--

--===============2100908405304168345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2100908405304168345==--
