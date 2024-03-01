Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E87BF86E4C5
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Mar 2024 16:55:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EDDEC6C841;
	Fri,  1 Mar 2024 15:55:47 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2A2BC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Mar 2024 15:55:45 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40fd72f7125so16082675e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Mar 2024 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709308545; x=1709913345;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dEf+rbXNQvLvB9iPkH1P+r9uBHTvmiiyJwMOWWoELNo=;
 b=epoGQQGWOaF/g0A3vAkFPOutIEUqFHr8ypVniV+8xWQ5JlMLjv5UcqOoh7aGGnt9Lr
 NX5BeTxGvHmMgCk8wEoxqx357iLgqltTJrWBkoZfN1/0W9XvvoEZfYgBfkejOLRSxn8z
 dkbd/zTuMvOS4DBLsXEAEpyNAHv9NHPl9lt1gGF2J/THvUBjuwQ32iZAI/jBL4Z33/LD
 PxaKjgh/GxpXe7qw5KucyiSo0t3TXKPMaBNqugj9Vj6jp6awW2prQztO3RDw0MA7UO0i
 IY3BFe2qzLWE7BwQ0RYErUvRl8IcCOSjc/JwsCF99Iw4NZrePZ+21COI10Yxll9F5MED
 Jk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709308545; x=1709913345;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEf+rbXNQvLvB9iPkH1P+r9uBHTvmiiyJwMOWWoELNo=;
 b=YbnZSV327cD9rK+cVVa+Yc+BY++VbpWGoiNlUlrYOoXOqg9eYNnDmT9jlFY0+TRT0h
 UCsn7U1BF8in5TJ0zT0OZ4eW7Jhzm+lox17Qk4JbqQoamgSe7Lt1wErypSCz849wiDpe
 ow+mWGyrEcI8b8ewTqtSWCFvFl3UjWvnbZADig47m/A/Wk88gdwWtK2NpZzUKK46yqnF
 +QRag8Vn1grF05wLUE8sF5NlMq91LFyQMai0nFmgIXZ/ilshDh0g05EwOmE01xUO00pI
 9jhf2mc8qO8qfKBpfUfkN283dD3RRVk2AB99ViLVgt9HhPF7bIDWv1hD9BlNSMPmYkvX
 F2wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJIuqxA+K1AMsPUA6T96+DYTE1fNGiSyoRxdhsk3DVZMm2Wr7g0axwh7hcM0dbj8x6bVP9c23qvTiv1SQyiFF0wmpvioKiycy492gm1KMOlT3T3AA/9+ta
X-Gm-Message-State: AOJu0YyYM7TYgmUBn9nfPGMDRb6Dx61whNg8EMDdRj8m1cwc/lTA0CwK
 iPR+W2s4LS4RYL9YKKrElZ3H0j550IXeliANmhpH8inYuVmv85CcgNfI/r4D/Pg=
X-Google-Smtp-Source: AGHT+IHXfsf1QVNUUheaEgcb1fKDrYSnpwanX1F3NHauzqf3xzyG0GvJEj7Pf7CKoluJk/kSHAeU6Q==
X-Received: by 2002:a05:600c:1986:b0:412:8fe7:4e06 with SMTP id
 t6-20020a05600c198600b004128fe74e06mr1813507wmq.38.1709308545005; 
 Fri, 01 Mar 2024 07:55:45 -0800 (PST)
Received: from ishi ([185.243.57.254]) by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b004129a1097e7sm8774972wmc.12.2024.03.01.07.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 07:55:44 -0800 (PST)
Date: Fri, 1 Mar 2024 10:55:39 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZeH6e02zzfAjw-sd@ishi>
References: <20240301102505.591918-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240301102505.591918-1-fabrice.gasnier@foss.st.com>
Cc: vigneshr@ti.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jpanis@baylibre.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] counter: Introduce the
	COUNTER_COMP_FREQUENCY() macro
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
Content-Type: multipart/mixed; boundary="===============5709959483950521893=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5709959483950521893==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NVfMO94wBSa46KPR"
Content-Disposition: inline


--NVfMO94wBSa46KPR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2024 at 11:25:05AM +0100, Fabrice Gasnier wrote:
> Now that there are two users for the "frequency" extension, introduce a
> new COUNTER_COMP_FREQUENCY() macro.
> This extension is intended to be a read-only signal attribute.
>=20
> Suggested-by: William Breathitt Gray <william.gray@linaro.org>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v5
> - "frequency" extension is read-only, so there's no need to provide
>   a write parameter.
> - patch sent separately from "counter: Add stm32 timer events support" [1]
> [1] https://lore.kernel.org/lkml/20240227173803.53906-2-fabrice.gasnier@f=
oss.st.com/
> ---
>  include/linux/counter.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/include/linux/counter.h b/include/linux/counter.h
> index 702e9108bbb4..0ac36f815b7d 100644
> --- a/include/linux/counter.h
> +++ b/include/linux/counter.h
> @@ -602,6 +602,13 @@ struct counter_array {
>  #define COUNTER_COMP_FLOOR(_read, _write) \
>  	COUNTER_COMP_COUNT_U64("floor", _read, _write)
> =20
> +#define COUNTER_COMP_FREQUENCY(_read) \
> +{ \
> +	.type =3D COUNTER_COMP_U64, \
> +	.name =3D "frequency", \
> +	.signal_u64_read =3D (_read), \
> +}
> +
>  #define COUNTER_COMP_POLARITY(_read, _write, _available) \
>  { \
>  	.type =3D COUNTER_COMP_SIGNAL_POLARITY, \
> --=20
> 2.25.1

Hi Fabrice,

Setting the structure members directly works, but why not use
COUNTER_COMP_SIGNAL_U64("frequency", _read, NULL) instead to keep the
code more succinct?

William Breathitt Gray

--NVfMO94wBSa46KPR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZeH6ewAKCRC1SFbKvhIj
K217AP9hJmpnlwQnUsdqaZn6twmR5QyJBT3lfeSMtz4eusnWowEA7uP/8rZ0WZLf
TDqIuD3w+89Mcs0vrikcijgkauAOigs=
=Zn8v
-----END PGP SIGNATURE-----

--NVfMO94wBSa46KPR--

--===============5709959483950521893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5709959483950521893==--
