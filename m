Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C673932A2B0
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Mar 2021 15:56:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C901C56638;
	Tue,  2 Mar 2021 14:56:57 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A7AEC36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 14:56:55 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id w18so13987100pfu.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Mar 2021 06:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=U6T9PbU/F4qKp+N/YQtkVMfFVe3qnYSRW1k8rGsnvnk=;
 b=BBmSnXXr+94I6o1ekJr9V+ADvzDVATCFa7BccMr9FAJhc0gsyNi5pLeemmgdQhFhfL
 G9Mso1M/4bzUIVzexYT4ggJhMej38VIoGil1Z4SnggW/LKRm3OKV88h9RKKOh5p5XA5O
 15quSskjfkQTAlyI23i8U7rTHirlIoRTfyHu7ICnbuk7HM83LI1wZX/A7EB0E2imd2iz
 xF1BKS8jaXgWQyxjgf6YgnoiNuZP93gDZhF0xpDURqMZulbVP9RkSeV+hYme0zfuYbLo
 qAF5kB1a3JMgNlJyYknLMlLknaZZX9TduHtqiGBBNyn8KNgdpoQ/dmniWSptZtW5/VNM
 am6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U6T9PbU/F4qKp+N/YQtkVMfFVe3qnYSRW1k8rGsnvnk=;
 b=RKjgbQiz9AtZ51N1lbMoOQYfhRdye5DyUVdvqAieFQIx2swMUeQaJaURVNmUE63uNJ
 iz9g2gpkqllk2qWP0dFruXIPSfVU+AifV4MCKHxBnzyW56heCPCo9DOprhjFMtt5QyBK
 yyXsHPAV/WcvCKo81dNajVbDFZQFbuKHB9vmu/4p6jCIgk0B5hY36sw0hDvaI5eS92f6
 bziOeaxPfXfbJo8F3jobDbbOBrqpaOLxuRZmmSEY4jhHb5aEau9uAxR1rb6fuPyONFb2
 G21xpnkG+tS4F2XQt7QiHDhEUPfJyzrDgg2thZq3ErO0dfU5Vf0SjEe10l+2gdtUe6X3
 EEXQ==
X-Gm-Message-State: AOAM532NbC+mmV9Gumifn9w9Gbwst0P9nwM6SfhPiJf2uUzTB8cV2Rss
 sEMinz6LLwylw9U96y9lDcI=
X-Google-Smtp-Source: ABdhPJzkOHuxJPX9u8w6hzM1eTHou32whD5fTEDPdbRDsHCAUdvnl3kj6FbvUtuDUvEvuW3HZpIemQ==
X-Received: by 2002:a63:e747:: with SMTP id j7mr18301486pgk.235.1614697013985; 
 Tue, 02 Mar 2021 06:56:53 -0800 (PST)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id s138sm22917284pfc.135.2021.03.02.06.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:56:53 -0800 (PST)
Date: Tue, 2 Mar 2021 23:56:46 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YD5SLrdttn+95M7N@shinobu>
References: <1614696235-24088-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1614696235-24088-1-git-send-email-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, david@lechnology.com
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix ceiling
	write max value
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
Content-Type: multipart/mixed; boundary="===============4591800631040642652=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4591800631040642652==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wvX72FUvr+D6FcPx"
Content-Disposition: inline


--wvX72FUvr+D6FcPx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 03:43:55PM +0100, Fabrice Gasnier wrote:
> The ceiling value isn't checked before writing it into registers. The user
> could write a value higher than the counter resolution (e.g. 16 or 32 bits
> indicated by max_arr). This makes most significant bits to be truncated.
> Fix it by checking the max_arr to report a range error [1] to the user.
>=20
> Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
>=20
> [1] https://lkml.org/lkml/2021/2/12/358
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Side question: if priv->ceiling is tracking the current ceiling
configuration, would it make sense to change stm32_count_ceiling_read()
to print the value of priv->ceiling instead of doing a regmap_read()
call?

> ---
>  drivers/counter/stm32-timer-cnt.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-ti=
mer-cnt.c
> index ef2a974..2cf0c05 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -32,6 +32,7 @@ struct stm32_timer_cnt {
>  	struct regmap *regmap;
>  	struct clk *clk;
>  	u32 ceiling;
> +	u32 max_arr;
>  	bool enabled;
>  	struct stm32_timer_regs bak;
>  };
> @@ -185,6 +186,9 @@ static ssize_t stm32_count_ceiling_write(struct count=
er_device *counter,
>  	if (ret)
>  		return ret;
> =20
> +	if (ceiling > priv->max_arr)
> +		return -ERANGE;
> +
>  	/* TIMx_ARR register shouldn't be buffered (ARPE=3D0) */
>  	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_ARPE, 0);
>  	regmap_write(priv->regmap, TIM_ARR, ceiling);
> @@ -360,6 +364,7 @@ static int stm32_timer_cnt_probe(struct platform_devi=
ce *pdev)
>  	priv->regmap =3D ddata->regmap;
>  	priv->clk =3D ddata->clk;
>  	priv->ceiling =3D ddata->max_arr;
> +	priv->max_arr =3D ddata->max_arr;
> =20
>  	priv->counter.name =3D dev_name(dev);
>  	priv->counter.parent =3D dev;
> --=20
> 2.7.4
>=20

--wvX72FUvr+D6FcPx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmA+UggACgkQhvpINdm7
VJJt3g/+OVZcvByeL/DXkUu5tzYQxQ5xzzfViSO16w54567c2tGJuB8gBEFaK9eG
Q5EzOeM9YaL982A/9OtqQup3CAJVkLizpy65aH1jDlPasA8JKKoelTfd+mAo58Vu
hiwG3DXxwOCZNB7b2/+RaKcYyayviVsKgrl8mHUQ1SY81kM3/cdzSLSnAoxkfD8o
7w1CdXnOxDvvTD6rwcbc4izhSSxgHzvaGHFpKwwYa3gDpmCY44rDKsgXc0CL6F2B
1JRDgvIePdqIStdC8VXcGkUwmlrEVwfSqFgbAtadWuwMSR293AR1PCayvsA4yWyo
49fMudR81RlG5aFyYoOWbAvoKpiq81LlGQspGWFcND4mdbDR7qvEeuZO//0wbTxk
5bNTj/VrQeSyNb7HmDFzOaKwF3waAnYpwZyOcUKVwzVNyAJkRq4nCPn29OKHE3mC
/Pbun8nAcbF0BP5R6QzX++aELtXzuArqJHOCDudTDQas0i7BNH0/+1KNKvisLTbk
6ftDbo0p3M90RUks08LLVpDzrAUGpyWeq7+VmWj1jHj22759PtbkEd/dxXKMkcQk
OwD4+2zRN4yq4J2U8oiofAprHHgidhAXPB+Qvy4GXP1SewZl3q+cXCNn20Se39Xw
uEDiJrNEX2zfbyRHx1V1zjqBlXFvCKIt62uqb8FBMmexuC5fmbc=
=M2Bd
-----END PGP SIGNATURE-----

--wvX72FUvr+D6FcPx--

--===============4591800631040642652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4591800631040642652==--
