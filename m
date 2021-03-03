Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F4A32BF3B
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 00:45:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A49DDC57B64;
	Wed,  3 Mar 2021 23:45:52 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 499C8C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 23:45:50 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id u11so14967791plg.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 15:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=viX38uAFosgjfxzIEwtp5/9ccsD8S6gdRKmkOGqC4ZM=;
 b=tFw0tarov1iJTLDTtNFsY2OxaIaZkTz7n2/ahcBHcHPiq9cvYu60bFUCM4aRbJGqlZ
 as3OtvGnOee5YgEPLwEkaHn1SKn1xzvecBx496QS5UY4NzAn2gWyhbF0RgJyPKxBxav+
 y43XeDofv7CRWcYyMPhmufgMMue8wz748Nqj7aQoTa4yFpY5i3Ub2SnesvOCHWuK354l
 PofuS4LjSPn0ExF/HAhym9QS0VNGjR1Vji4fSbQWFasw/0gfkEZiDdcxPh6nmOxBd4qp
 Jm6KmxgroFH/aUjq5D3q7j9N50r3xDphm12o5ViVf10BrexxBkEB9n0KC2x6isEpzxn7
 UJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=viX38uAFosgjfxzIEwtp5/9ccsD8S6gdRKmkOGqC4ZM=;
 b=oxCUg8iK72+4ky18kKZ4z8E3Kzbz08i8+HfK+NmPU2+NZT37woomh6B7DIhKl/1KEN
 Dv8ir4GVirpa5HEJu0PkxHDDiMW+Qnrj/jNxyBK6TgqtQtGD+QbQXf3iwarSrDKAWmoE
 Lrd0lIK2R25u7EBnQgmkc88R72RrxzWXco524hP+UyYq6zZGizPNPfp4pQ9QUhvKdyrn
 +e1/0KQrSe4aFhDiqVIW6C4shPw7LXb+e3Lo+55IpDD2ve1qK7feXpHSNelrcrv9H8db
 /025feQPFEyZlqMYs6PgPk9qqq+RPZviVzeozpTiJvQYtf3k9qNUqzax796KQmmDRhtd
 e+hg==
X-Gm-Message-State: AOAM5310wSRszPWQF/oqsmk4uOG1qygCOiWW99YbI/RqIcAOXdw/x760
 wHv7nO30NyQRT+XI3U7m4zk=
X-Google-Smtp-Source: ABdhPJxn3OSRLrQuZ4nBXaa8upf3S/fO9o5Z1S7dSoMRGMJjVVU9S7YOZ/bt29oVlETpRFTHHd/vBQ==
X-Received: by 2002:a17:902:b601:b029:e3:7aab:704d with SMTP id
 b1-20020a170902b601b02900e37aab704dmr1485394pls.58.1614815148698; 
 Wed, 03 Mar 2021 15:45:48 -0800 (PST)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id q15sm8823607pje.28.2021.03.03.15.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 15:45:48 -0800 (PST)
Date: Thu, 4 Mar 2021 08:45:43 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YEAfpzWhfkfh0xTs@shinobu>
References: <1614793895-10504-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1614793895-10504-1-git-send-email-fabrice.gasnier@foss.st.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stm32-timers: avoid clearing auto
	reload register
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
Content-Type: multipart/mixed; boundary="===============2241485805166802879=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2241485805166802879==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufg0QVK99FQVDHYN"
Content-Disposition: inline


--ufg0QVK99FQVDHYN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 06:51:35PM +0100, Fabrice Gasnier wrote:
> The ARR register is cleared unconditionally upon probing, after the maxim=
um
> value has been read. This initial condition is rather not intuitive, when
> considering the counter child driver. It rather expects the maximum value
> by default:
> - The counter interface shows a zero value by default for 'ceiling'
>   attribute.
> - Enabling the counter without any prior configuration makes it doesn't
>   count.
>=20
> The reset value of ARR register is the maximum. So Choice here
> is to backup it, and restore it then, instead of clearing its value.
> It also fixes the initial condition seen by the counter driver.
>=20
> Fixes: d0f949e220fd ("mfd: Add STM32 Timers driver")
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
>  drivers/mfd/stm32-timers.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
> index add6033..44ed2fc 100644
> --- a/drivers/mfd/stm32-timers.c
> +++ b/drivers/mfd/stm32-timers.c
> @@ -158,13 +158,18 @@ static const struct regmap_config stm32_timers_regm=
ap_cfg =3D {
> =20
>  static void stm32_timers_get_arr_size(struct stm32_timers *ddata)
>  {
> +	u32 arr;
> +
> +	/* Backup ARR to restore it after getting the maximum value */
> +	regmap_read(ddata->regmap, TIM_ARR, &arr);
> +
>  	/*
>  	 * Only the available bits will be written so when readback
>  	 * we get the maximum value of auto reload register
>  	 */
>  	regmap_write(ddata->regmap, TIM_ARR, ~0L);
>  	regmap_read(ddata->regmap, TIM_ARR, &ddata->max_arr);
> -	regmap_write(ddata->regmap, TIM_ARR, 0x0);
> +	regmap_write(ddata->regmap, TIM_ARR, arr);
>  }
> =20
>  static int stm32_timers_dma_probe(struct device *dev,
> --=20
> 2.7.4
>=20

--ufg0QVK99FQVDHYN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmBAH6cACgkQhvpINdm7
VJJxoxAAvmyLErbMqKfNrxP50BUUqWebF1D4DmGUYCIujUBwxU6POmqvwMt5QEV8
hlIOgqb2eDTONsRi5Dv7egYSwfkIInRUcNKGsfXxOUaDYl3/Z2mEnJSPd4d8pQen
Zd2+Cz7TFpT4Rtl10oVXR+LQJMGTHvcsmrF9yjobD3NHAqoOV0d4/3DUusm7BGdt
qUEF7BY7nCyiJYQkWChUhSFx/pyW1rtfl0Y5kAaF3+GOvLhCY+2qzo3yGNy3mMfz
tQEZ1BWs92cBdZMAjpzUM3dnMlTRWd1LwfWv5wzK/i9ATK+g5xoSqYwuWYP+5vqU
PxyfEfuLTTU+dfYJ5cqxGZk7Clwogw7OuauF/i9CLrAuV/ZWMkxUtBiTUnLkgcn3
IHiVYFmoKihOkobzi/uJf75KSBeDJnyFnf8tuV78i5ii1tGukeUU6gaj6mF2dUae
0l3ML9KTNSW5SXFNO9IalrlWp/5xQYZFkbArUZxVfuCDe+AEDfmiyI603DOHsDfi
4qY/3l1t6gOG3oqpnaUDTruDtCKbvQ00Q7rnoqBmlWrXGskxnwmhwPdqnArwQZLG
+7HJhkDV4u37OuEsGIoc1+lDAzZUgW1wMf0xhfgQ/qxet33WcQGbjyInq7OH0Vy/
N/tCPeqwcfEJaNOoqOxqUZ2HogY1m/d9QoZqCKja2gyhlKGRBXI=
=GfL2
-----END PGP SIGNATURE-----

--ufg0QVK99FQVDHYN--

--===============2241485805166802879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2241485805166802879==--
