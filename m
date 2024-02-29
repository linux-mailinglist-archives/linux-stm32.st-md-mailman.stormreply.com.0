Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6086D2CC
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Feb 2024 20:06:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B13CCC6C83D;
	Thu, 29 Feb 2024 19:06:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A45AC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Feb 2024 19:06:50 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33d61e39912so637223f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Feb 2024 11:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709233610; x=1709838410;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6C2bXPH86iM1wIE2+OdewUkS7BtP29sQZelrAG7pDTU=;
 b=KLe3R/XPBRyv53M2UjVyz6/PPx/0EZa4MGwKIAnY4VEoJj3RKgOnpgVEPhAp7brLqj
 rRIvppGyZ4Q1FonX641R/omc2lvSP4djCdZ9RZupoffLxi1n2V2JuChNCLwOhedvi8P9
 waeU9sNrH/D330G6Jiita/Fq0hMRNE5nbUru9WXi/1rUdsHxqnqjNMnyFg9+3pDzsu9c
 BM2uO56QaeasXWPV5CzOTY4G5rIsIGVKuS9QRzBes8BiXp/nkTK9+lwV6N19fCj0n567
 NgLAkT2sAEyDU+45JKlHv5395SPD6loiUVYFH7Oz/zNBzPFJOv6ywdyApcamxX6bRdgN
 h2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709233610; x=1709838410;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6C2bXPH86iM1wIE2+OdewUkS7BtP29sQZelrAG7pDTU=;
 b=j3O8/5xiiJenRBuWWv+GiNNJm1+tCRT+It9H1djlaBdasmU4wfIhSh1uIES+yruHtz
 1ztvFiHtuDJ/YDR7WXbRLrE24NODpGjJq7oKoI0PGndSebRecZ2WRNnJwUPu7xluZvSI
 fCPqJ1HczQxsch1GBgFgjRV9jDKno/L4Q3E85lQfBFQqngOkkxhbJNuo9ZhALKFEhPQp
 BKud+Jd7eGzHxj3/yAf4ta+gcRKJAVabUuRYoZWvKY/AgITnB/TadgEnWBfxdOSCafRA
 aLa2YsQTVmCXSNYVqESy/nU7+k48PJyhk54IwGkZEPK0KyzFqg5hj3VC6y0D70qNGmLz
 cP+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXao90aCm6EQlYxPLKO5j9JKzvsvCXeoUa9WG1/GYvxfJVI0hxMDBCapX2QQBSFuhYazXMfeIIldVUYUj+U/tC2mSjRFF69wbbDmNSWEyJOTwVeDs5NwaTv
X-Gm-Message-State: AOJu0YzIoGpVyw+BjKOYnxLzqCASxL7JWn7nLb4p9Xy9D0Day+RuA6Il
 pt6ES93ijIc9KncjoRvao0ApcZxNeV34Ge78LyNKkuNwJV4cjiGB6bnSGwzWFlU=
X-Google-Smtp-Source: AGHT+IEfyXff5Z/Catutq/9H1tJ1Tcp6NVWBS0uS4QEHmqL14qct73+IMdbYhpAanS6tRs2B0CzIBQ==
X-Received: by 2002:a5d:58f2:0:b0:33d:29c1:c28c with SMTP id
 f18-20020a5d58f2000000b0033d29c1c28cmr2219550wrd.66.1709233609591; 
 Thu, 29 Feb 2024 11:06:49 -0800 (PST)
Received: from ishi ([185.243.57.250]) by smtp.gmail.com with ESMTPSA id
 t1-20020a5d5341000000b0033e11acf84asm1996039wrv.15.2024.02.29.11.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 11:06:49 -0800 (PST)
Date: Thu, 29 Feb 2024 14:06:43 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZeDVwzOKEpV48cXx@ishi>
References: <20240227173803.53906-1-fabrice.gasnier@foss.st.com>
 <20240227173803.53906-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240227173803.53906-2-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 Syed Nayyar Waris <syednwaris@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 01/11] counter: Introduce the
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
Content-Type: multipart/mixed; boundary="===============6152543132922010186=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6152543132922010186==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m8RbYN6cnf/6A/iU"
Content-Disposition: inline


--m8RbYN6cnf/6A/iU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 06:37:53PM +0100, Fabrice Gasnier wrote:
> Now that there are two users for the "frequency" extension, introduce a
> new COUNTER_COMP_FREQUENCY() macro.
>=20
> Suggested-by: William Breathitt Gray <william.gray@linaro.org>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  include/linux/counter.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/include/linux/counter.h b/include/linux/counter.h
> index 702e9108bbb4..03472d7407de 100644
> --- a/include/linux/counter.h
> +++ b/include/linux/counter.h
> @@ -602,6 +602,9 @@ struct counter_array {
>  #define COUNTER_COMP_FLOOR(_read, _write) \
>  	COUNTER_COMP_COUNT_U64("floor", _read, _write)
> =20
> +#define COUNTER_COMP_FREQUENCY(_read, _write) \
> +	COUNTER_COMP_SIGNAL_U64("frequency", _read, _write)
> +
>  #define COUNTER_COMP_POLARITY(_read, _write, _available) \
>  { \
>  	.type =3D COUNTER_COMP_SIGNAL_POLARITY, \
> --=20
> 2.25.1

Sorry, would you make one minor change? The "frequency" extension is
read-only so there is no need for a _write parameter (it'll always be
NULL).

You don't need to rebase and submit the entire patchset again just yet
because I will likely have more comments when I review. Just submit the
next version of this particular patch separately and I'll pick it up so
we can get it merged into counter-next.

Thanks,

William Breathitt Gray

--m8RbYN6cnf/6A/iU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZeDVwwAKCRC1SFbKvhIj
K5a/AP9ESChk0LtM25VBIa/YG3unlk+bBAuqQsCttKitBbei5AEAnS35RlwlEo91
tAqqQcOWaRtMdGXsFtre4ov5nr6/HQY=
=Az87
-----END PGP SIGNATURE-----

--m8RbYN6cnf/6A/iU--

--===============6152543132922010186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6152543132922010186==--
