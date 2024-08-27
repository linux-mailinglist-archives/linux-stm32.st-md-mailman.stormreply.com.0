Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24522960528
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 11:11:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C41D1C6DD9A;
	Tue, 27 Aug 2024 09:10:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3397FC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 09:10:52 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-371b098e699so4172514f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724749851; x=1725354651;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fUDMwSOVzCwin1tEwK4cDn6YsjG1LnqHU+GKwmkIe50=;
 b=B+nJvdeGkqLJaP81yOyHvPKAEnkmeZ6VHA2ZVdWS/IcP9EFiRYtTP8ZY38n2RItAv6
 06FeLDD2R4H8sMi5n2zYom++UbxReci5CumIkubDpAKaeEKVhoa1nXw01v/xmzq4gRuv
 fz/KjNa0/YegDk18NOHFm4XSuLYZC016hTzVZ/xT5V0MHBiMyUkqJOeg8GqXv1MOK7rd
 QlxT5Hwpr9jUWfEI+diBBtwOl53TdKRA6syLlDGVsaKfWgM8yJuBV1uVi/mK2jRBzpvG
 JElC9ZqrauBPNFBdTrbw3haA/a+Be38vznJDP/lyw1zgLd/FRi30u3q0fKKmo++KyOVR
 fNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724749851; x=1725354651;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUDMwSOVzCwin1tEwK4cDn6YsjG1LnqHU+GKwmkIe50=;
 b=SRmNL/nq3cgKKQdsM96WdyxN0QeGf9iqglKbE+7/hooHQMoRUcqlXMOnSFmzqDOz93
 fJlZhEAaS/r93OWcOL0uR3lk/sMa4KE2P6lFPXnc6yZHWMIsqQRV1ZIREDcfaXAfSZo2
 Ngjv/Y8u3cxdOVE5i8MFwXVQfZqs8VKxyuTHle2t3QH2zV5uCRFq4XUmtyUl/1GRsQ2K
 Xz9yoJVA2LG9xA2jgdkTjTupyF1KtD9+F/2320Er3PL+VsT38kcQpjjE3R28I8xMif7i
 3WxQCUDemvb8PKHiS1BjwOGmj49iCCG3ymzYnLB8wFtkvdDJLDEu1CARKvHqH99gr+dD
 2ojg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9h/R5l9GsXg4eQs05dWnBrjyeDex71LKQuEiuAcencyd/2s38gB5TOtolbTDh+T+cTYhySWueH7ijEQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx/8aTMVDda7sIeca5dpETJqDwjpSzOFMbXN32dT/boS5tDNiWF
 LbHfv1nX+WOjTxhrLqJqRFFuQuwXzPz/ggwpS9M+YlZ35U5mZNB/
X-Google-Smtp-Source: AGHT+IGYtoHYOJ2PcFSTafy/B2ZibGnK7dhVczhUYYtN+TBGrut3NSlAXIamQEahFjD3bsCWtNx5fQ==
X-Received: by 2002:adf:ed4a:0:b0:36d:3421:5a23 with SMTP id
 ffacd0b85a97d-37311862d8amr10260081f8f.26.1724749850865; 
 Tue, 27 Aug 2024 02:10:50 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730811001fsm12590489f8f.20.2024.08.27.02.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 02:10:50 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:10:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <lyuvpbh2zx4hhqrcwnc2xearyekttfcyn7jdt2eatkpew5dgwk@jp6sopvdng3c>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
 <20240816-cleanup-h-of-node-put-memory-v2-7-9eed0ee16b78@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240816-cleanup-h-of-node-put-memory-v2-7-9eed0ee16b78@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH v2 07/13] memory: tegra-mc: simplify with
 scoped for each OF child loop
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
Content-Type: multipart/mixed; boundary="===============9132507234164656386=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============9132507234164656386==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="abklfs4xggqotwky"
Content-Disposition: inline


--abklfs4xggqotwky
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 12:54:31PM GMT, Krzysztof Kozlowski wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/memory/tegra/mc.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--abklfs4xggqotwky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbNmBgACgkQ3SOs138+
s6HLAhAAi/EQlm5bG5bcOINffasOb6M7H/oNaZ63dq8ZIqrgswqUPp2xC9nGDqM4
Q1OHj25oegvp1694wFJl4yi9qAS2ECKwd1p8Z0fwTos6qnwb/ld2+RQWWN248uXy
/On6/enVLCGowDmeF6246lFqPsw8beIbLc548MwImyHKnOjkoPcmkDhhH0rIcfBN
t/Bhvct5nwgkvl/+7QDMm6b6/hUsLzD7t67S+Ht5gI8ZsdDqqLpNGSwePcKtVwOL
JjZOBAcQni6LV8ksFGjih6SHY9qfXilN65haVGLkgGsscCgeYMBIc3Jd6joKjVGD
YgXTHTYbrqrGJPFntZnT5TX+3x5uUx+qwedKQGtv1mAvZaLqv6HtoAsuXtirs9pT
Ra9v0l9R7P0wdZ2kya2Ddjpq2FAEA4F2jsf4vu/wrYZUIYND8BkzUPu1VjWmrSEi
YS6efssv5Q1A+3lCoFhtPACUe5S7e4SboZr0maW+GR8mCCn41qwfKgmaPZqoVYEm
NIyvB56K6p6ojafQJkj0fro2+t87NWOlfA7hIC1buWyoeIfOxJIhT4pU3ZWux8yM
STj3cF83Rl/dEg0I+/SJCqPDWOTFIunGyLYjVQZBnq5LS4HPsfRXYZkm+okx/6LA
fkBTbYyNPRjUuI5jGJnNlmn9r9nrZDxe1EvaN6EKJRWY8X7CTqI=
=WUPZ
-----END PGP SIGNATURE-----

--abklfs4xggqotwky--

--===============9132507234164656386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9132507234164656386==--
