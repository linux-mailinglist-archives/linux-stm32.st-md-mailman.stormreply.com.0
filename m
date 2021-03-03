Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84F32BF38
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 00:42:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09FC3C57B64;
	Wed,  3 Mar 2021 23:42:12 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 639FFC56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 23:42:10 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id jx13so5226529pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 15:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hjgPPmywlf1QSYNfKJW5SMSSqegjS9TRhykusa53eQA=;
 b=dN8ygrrTTwV4ktjEHcHhP03Z9wjYOZjF/ycGhN3zk86kSOtDSrEdVSNc41fhWog3nl
 Akf+Jf7wsMpO711LTcYpfssJjZSkJlYLFoQYRoDG4R7pIZLNveQL3dyhYi1De2wcyqAr
 HbO+Ar1A2au11Fv4Ge8mvwaTOEmv9cmu81fpuFcmGFITNIHUhLzSSTF8Gkmp8L6vC+4s
 faHJMm2eP/PSRQzvOHWMQ2T1cYqR8N+isV3kWv4ZT1kzbpKJRXNjj/DQb1PokclVp0OU
 hG7LQ5lnc81fZfncULV5+aLf8jP8dI4RcvItz6GEsNDXWr2BxW6fo80bNMzxTRAYY97+
 d9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hjgPPmywlf1QSYNfKJW5SMSSqegjS9TRhykusa53eQA=;
 b=JDiZn/d328xzB4EQcpirtGqHHmOZsShnsX+jquNpcVQMVvu95zCcIf8Rb2JhHBhzZo
 LZKrd0J9bUNlcz4nG1xlsjYM45ZqiJchJsGCljFyyqgdLruYhDy0HuwToyEm8KTVvUZ3
 yG9wcTUxZouN7O3ebmsw0kh9DKzMSPphh8tc8hvhxI9Ybw8wSYjhQX/VCk2ebTu5D05c
 cqS7cIRtlz5zy2G7Wa0IqXWBrpftAl+hWjBMMQln/PnGJvDVise+9084fljWzD4b8tv9
 cFKrN6CMzSxHq8NOPKyixqiGWTeUs1lG6P4yT/2yqiBhhRk4XzsirIFdtXjpnHDI8Mv2
 3DRQ==
X-Gm-Message-State: AOAM533GwIIxjPvZNISiX0PKIhSbKYeVavUrV0dmVPRkK1FjCY8BYO+L
 0Geefe8TjL9lFdRI/7Zp23A=
X-Google-Smtp-Source: ABdhPJxaFhX6y72z2rrx4+W3Hx9RpBqhn1GmJBKZd55ZtXtJoGXyOZDcokuYHn2nQp54M8CAl6d5Qg==
X-Received: by 2002:a17:903:2082:b029:e3:df7c:f30 with SMTP id
 d2-20020a1709032082b02900e3df7c0f30mr1396147plc.71.1614814928804; 
 Wed, 03 Mar 2021 15:42:08 -0800 (PST)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id h8sm24219343pfv.154.2021.03.03.15.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 15:42:08 -0800 (PST)
Date: Thu, 4 Mar 2021 08:42:03 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YEAeyyJ+GH10ep7S@shinobu>
References: <1614793789-10346-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1614793789-10346-1-git-send-email-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix ceiling
 miss-alignment with reload register
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
Content-Type: multipart/mixed; boundary="===============7933340983579465228=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7933340983579465228==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="raztPjiYvdctBTkF"
Content-Disposition: inline


--raztPjiYvdctBTkF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 06:49:49PM +0100, Fabrice Gasnier wrote:
> Ceiling value may be miss-aligned with what's actually configured into the
> ARR register. This is seen after probe as currently the ARR value is zero,
> whereas ceiling value is set to the maximum. So:
> - reading ceiling reports zero
> - in case the counter gets enabled without any prior configuration,
>   it won't count.
> - in case the function gets set by the user 1st, (priv->ceiling) is used.
>=20
> Fix it by getting rid of the cached "priv->ceiling" variable. Rather use
> the ARR register value directly by using regmap read or write when needed.
> There should be no drawback on performance as priv->ceiling isn't used in
> performance critical path.
> There's also no point in writing ARR while setting function (sms), so
> it can be safely removed.
>=20
> Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
>=20
> Suggested-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
> Note: this applies on top of:
> - "counter: stm32-timer-cnt: fix ceiling write max value"

Note, if your patch requires prerequisite patches, please provide the
`git patch-id --stable` patch ID for it; this helps make sure the
patches are applied in the correct order. You can have `git
format-patch` generate this automatically for you by using the `--base`
option:
https://git-scm.com/docs/git-format-patch#_base_tree_information

William Breathitt Gray

> ---
>  drivers/counter/stm32-timer-cnt.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-ti=
mer-cnt.c
> index 2295be3..75bc401 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -31,7 +31,6 @@ struct stm32_timer_cnt {
>  	struct counter_device counter;
>  	struct regmap *regmap;
>  	struct clk *clk;
> -	u32 ceiling;
>  	u32 max_arr;
>  	bool enabled;
>  	struct stm32_timer_regs bak;
> @@ -75,8 +74,10 @@ static int stm32_count_write(struct counter_device *co=
unter,
>  			     const unsigned long val)
>  {
>  	struct stm32_timer_cnt *const priv =3D counter->priv;
> +	u32 ceiling;
> =20
> -	if (val > priv->ceiling)
> +	regmap_read(priv->regmap, TIM_ARR, &ceiling);
> +	if (val > ceiling)
>  		return -EINVAL;
> =20
>  	return regmap_write(priv->regmap, TIM_CNT, val);
> @@ -138,10 +139,6 @@ static int stm32_count_function_set(struct counter_d=
evice *counter,
> =20
>  	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN, 0);
> =20
> -	/* TIMx_ARR register shouldn't be buffered (ARPE=3D0) */
> -	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_ARPE, 0);
> -	regmap_write(priv->regmap, TIM_ARR, priv->ceiling);
> -
>  	regmap_update_bits(priv->regmap, TIM_SMCR, TIM_SMCR_SMS, sms);
> =20
>  	/* Make sure that registers are updated */
> @@ -199,7 +196,6 @@ static ssize_t stm32_count_ceiling_write(struct count=
er_device *counter,
>  	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_ARPE, 0);
>  	regmap_write(priv->regmap, TIM_ARR, ceiling);
> =20
> -	priv->ceiling =3D ceiling;
>  	return len;
>  }
> =20
> @@ -374,7 +370,6 @@ static int stm32_timer_cnt_probe(struct platform_devi=
ce *pdev)
> =20
>  	priv->regmap =3D ddata->regmap;
>  	priv->clk =3D ddata->clk;
> -	priv->ceiling =3D ddata->max_arr;
>  	priv->max_arr =3D ddata->max_arr;
> =20
>  	priv->counter.name =3D dev_name(dev);
> --=20
> 2.7.4
>=20

--raztPjiYvdctBTkF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmBAHsEACgkQhvpINdm7
VJI4JRAAg2Y+kgxmuZE/9tSHqFDyqpU5z9TnfxJDAHoWYVt8MfIys2u8zR3ZkbXj
ipa30R9WdJYB4btIdhNKKalhJGO47qYhPE7jw0f4WhRgyVkSIfuYRaXFHbQ7a4+P
OwqKTLDsrSDz6RL17JKkLb7Ks5ROrVHnl9OYAjhRupTY2WMAEza2gcPhcKOwsSo6
9eL6p0rB9/NMUhBi+DRLe/tkwxZH33nm0Re8wI27Ujx59R3rP3ZPzk0vgBpX1upd
JXRKbnsIjxj47waBbDAQx2DQp14NgHNEdPxNgJlzmQMB6bRdSw1xVhR93Z0w9rVK
TGLFiMe2RBvwHB0MuOm75dsOwvlSbg/eLiK3LUS7DDzg8GPmpkPOX387ONmj6EOw
QiI0JaMTLYodBXiD2gwQf0h8m1k3/tlXcnL8/4+8nMNt8TDvxuP1XdGajhEOhMOE
mNeb+SHFZ3D5NPh9/Ce3coLWJrNYcE+UwIhp/BGyfm+gQPuUbDG1lh3a7voQsa9I
jGgzo5tBFWSrUfLzGrV+kqTNMM987H9/ykMkydimcqFTWcj0z7Xy3XEEEarPOg5r
Cu0UvU4+CbIvccsXtLYWs6kjJQuaemL5eX7Oqh9qQunN07o5xbVFLCwH7+g/0AcH
BgC31bYF6EdEBeknuEtMugdRXnKvQYfJVfX8xmNdtDv2+dDVKWo=
=IqtO
-----END PGP SIGNATURE-----

--raztPjiYvdctBTkF--

--===============7933340983579465228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7933340983579465228==--
