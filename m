Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD4481100
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Dec 2021 09:37:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92B70C5F1F0;
	Wed, 29 Dec 2021 08:37:50 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEB9BC5F1EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Dec 2021 08:37:48 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id 205so18281408pfu.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Dec 2021 00:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Tp9+ts4r4iSaag9XVPpRfX+PmWxIsRRvBCN5AJ9Jbp0=;
 b=E71yWLJgveFDrNB/h4TyPaq9V4bEQa34H7CfZUPtrmDsh0w4MGmJ0xk380p8y9xM4l
 8dkVp530toEoSSN/+qj8ECEQwx9b9+tU7ppcG8INT2ZS1brMpyLlIGV/ZBWfOEEMJdtx
 tz+o79TLsm/6JcbN0xMLnf/AaSp8+BSV6bJVjAt5bUTyzRVpuElHJX3UjNa9kKSdGs3e
 6KTMW+pdJ7ld126fgRIFUmLDYDOQInUnBYBh73HfDGxYhf6iaIK9w3jd3L7VgGjdPmrr
 FjMabUZ3UHOJfv0FnaodRvjxcXOuXQQbo6nLeDp3Wa4QJJFMAhSz7WGLIcym25pfYnVO
 R69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tp9+ts4r4iSaag9XVPpRfX+PmWxIsRRvBCN5AJ9Jbp0=;
 b=HOEIHDz66PwXvPrcvKelZB7A0xw6f/3baf0WbJNcLo99IJaJ+9DlJm0RdUSXFdRGWq
 k6MYtXP80ETmruXoyWHypcxGk+IZw8qQbillufgaoHv86RLMikP888Zz9l/zxaD/Z6tx
 04R2H8Fhmxtbs92qHUmuAjFKG6XqM/L0NGGOWsR1cSXv5SwMPrY2kV6ROnl4U462ZxCd
 VvoAAsQu+VBA7ZFDFiO6MhFNZTnMzzKpCB7p9gWEu5gTivgFEweYM1WfLNhmw3ZB+8Lw
 HB6SP1N2YheKDb9TfOMueqvTq1s8aiSh1o0v0BOO5fT4rcRtCQalwBrooD4H53rDIwri
 /0Ww==
X-Gm-Message-State: AOAM530618m4zUe5Z60bqhO33MdMuWR197SNd/rW2fyUIC4rphIp1ckq
 ija7GQDPpYIiot7NWhNSyRE=
X-Google-Smtp-Source: ABdhPJxbpL2ZJYwix7EvOYhO3g/40cJ/p+DflzW/feyAqcRbJgnZl2H7HlSKIjGvIf3RbxQvtgHGUw==
X-Received: by 2002:a63:f5e:: with SMTP id 30mr22764170pgp.487.1640767067433; 
 Wed, 29 Dec 2021 00:37:47 -0800 (PST)
Received: from shinobu (113x37x72x24.ap113.ftth.ucom.ne.jp. [113.37.72.24])
 by smtp.gmail.com with ESMTPSA id e12sm15562128pjs.35.2021.12.29.00.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 00:37:46 -0800 (PST)
Date: Wed, 29 Dec 2021 17:37:34 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YcweTgHPyTa8ARF5@shinobu>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
 <20211227094526.698714-21-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20211227094526.698714-21-u.kleine-koenig@pengutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] [PATCH v2 20/23] counter: stm32-timer-cnt:
 Convert to new counter registration
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
Content-Type: multipart/mixed; boundary="===============1677853537797092842=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1677853537797092842==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M61Nh2MdAynJs2z/"
Content-Disposition: inline


--M61Nh2MdAynJs2z/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 27, 2021 at 10:45:23AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> This fixes device lifetime issues where it was possible to free a live
> struct device.
>=20
> Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
>  drivers/counter/stm32-timer-cnt.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-ti=
mer-cnt.c
> index 4b05b198a8d8..5779ae7c73cf 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -29,7 +29,6 @@ struct stm32_timer_regs {
>  };
> =20
>  struct stm32_timer_cnt {
> -	struct counter_device counter;
>  	struct regmap *regmap;
>  	struct clk *clk;
>  	u32 max_arr;
> @@ -317,31 +316,38 @@ static int stm32_timer_cnt_probe(struct platform_de=
vice *pdev)
>  	struct stm32_timers *ddata =3D dev_get_drvdata(pdev->dev.parent);
>  	struct device *dev =3D &pdev->dev;
>  	struct stm32_timer_cnt *priv;
> +	struct counter_device *counter;
> +	int ret;
> =20
>  	if (IS_ERR_OR_NULL(ddata))
>  		return -EINVAL;
> =20
> -	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> +	counter =3D devm_counter_alloc(dev, sizeof(*priv));
> +	if (!counter)
>  		return -ENOMEM;
> =20
> +	priv =3D counter_priv(counter);
> +
>  	priv->regmap =3D ddata->regmap;
>  	priv->clk =3D ddata->clk;
>  	priv->max_arr =3D ddata->max_arr;
> =20
> -	priv->counter.name =3D dev_name(dev);
> -	priv->counter.parent =3D dev;
> -	priv->counter.ops =3D &stm32_timer_cnt_ops;
> -	priv->counter.counts =3D &stm32_counts;
> -	priv->counter.num_counts =3D 1;
> -	priv->counter.signals =3D stm32_signals;
> -	priv->counter.num_signals =3D ARRAY_SIZE(stm32_signals);
> -	priv->counter.priv =3D priv;
> +	counter->name =3D dev_name(dev);
> +	counter->parent =3D dev;
> +	counter->ops =3D &stm32_timer_cnt_ops;
> +	counter->counts =3D &stm32_counts;
> +	counter->num_counts =3D 1;
> +	counter->signals =3D stm32_signals;
> +	counter->num_signals =3D ARRAY_SIZE(stm32_signals);
> =20
>  	platform_set_drvdata(pdev, priv);
> =20
>  	/* Register Counter device */
> -	return devm_counter_register(dev, &priv->counter);
> +	ret =3D devm_counter_add(dev, counter);
> +	if (ret < 0)
> +		dev_err_probe(dev, ret, "Failed to add counter\n");
> +
> +	return ret;
>  }
> =20
>  static int __maybe_unused stm32_timer_cnt_suspend(struct device *dev)
> --=20
> 2.33.0
>=20

--M61Nh2MdAynJs2z/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmHMHk0ACgkQhvpINdm7
VJKtvA//eCpZQDQfpyoCqlfr7K3oDTL+eoMaDC4q3bECuJzsTfXVq6QfyyOaKWW0
Wqp/zk0lBu2DWC7nK7Fk9S03F4Eu0VEpEd02RPIstYt9vuIq/NBCbp4BkePREEox
G24XpTA3rC7I5KKua8OTPmiSxF1OZF72L8ah0wTi8TzB4ovB0Uq9WGoghr2CpJ66
4yWZh5F1NJ3hw8lmjnw+PV/rwrWYntZonuc5OcLIPquB7Zze+8THrE548AgWynaK
NVXLpYnjI7UqwwRjj+wV5mX/KqPZdXi5ForsNcHNo0St74t/af3hiIJPDXAH/mwq
8WDoSEZQHY822BdS7dc1umkQhucNZLnhLm6hXFWywC9JjgplWvKT8U81G2nFKyy3
lcDDNuXMPfG6u0h11wvQi5zRAveGxWeXZkysC7NiBXP75pvjq2Be19wPg2UoqlJj
XQzmdJuvlwWcj/hl8iw5/FMxfbE6VAjCVOcE4n7vJ9fWEsoR/F1mX/BqbYV4Umwa
jdCNVde4m6eca6/YR0178IR+wBUCfBBARpzN+iB06ZEDcVpsTtCB3Yy3U9S5QSem
KgGJmUWSaEKxnW8Ox9WOBtbBSRdiCpuFn7xtz/QOUSUDYSwH1XGb325/SsNzD7bv
1EJJNcNwR5B8XVX/8EKrJIInhMQBZFnXHzSGzn8VbMKX2LmSpm8=
=3OIs
-----END PGP SIGNATURE-----

--M61Nh2MdAynJs2z/--

--===============1677853537797092842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1677853537797092842==--
