Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4775490E742
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 11:49:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF15AC78002;
	Wed, 19 Jun 2024 09:49:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91E50C5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 09:49:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-424798859dfso1728345e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 02:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718790554; x=1719395354;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8TSslaBW9swbYHR/R7X2K6LeF5Zl/TzLPzcnhcrOxsA=;
 b=JXb6ROoUsS301t1gfabye2oBTUCzNiktaGssEV7wOog83N8DIRr/T7zti38U22G1Zc
 dA7YGqFQmM9eaV4toJzXeaILF/AZsyXHs9mPyi1T0g3eRQDQJbD/Py7PoIrDQoF+OT1o
 jKSTbuHWsm8A2MRitj+tGlsoCj9g/Gyu9q/wUG1uqh/t3CeJuFHCZU//OaP1re/W3DHa
 kJzO6TYgev1KdkN/ME/ardkHGNJuIydiz60MJemIPQ63IkAKQhNvyRX+t0wMN9KaGfjc
 sZ70LDpEQD9/peS99j2poMqXxBbLBDDTluVAx76ap+OlUC2EcOep+/vvOL2Ben2TdXRN
 su0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718790554; x=1719395354;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8TSslaBW9swbYHR/R7X2K6LeF5Zl/TzLPzcnhcrOxsA=;
 b=WJl02+cqcZFaLAqjXI0z0QWlRc51B25ivfrwXGqC60qZCWvVWkeu3ZYrUHO91923DO
 4aRxonTM8/DsphcUfuhycbn1Urmitl41CyP3dUixR6xGzWqt/NXnEdx1ENWA02NA2/OX
 WN6kh5SREJAIzC+p3JPax8AQ76d/5BTSDac3Z3DFybUTSYwuB6oPXbvW490eN14DKc54
 /5ReIf8Gjws7bK9fuFIP+ZI5JerA5LGuKGVLNezD43zBCc9vhP9xvopfSHnBAk7d4kL1
 mWgx7MVfQlzF0shc8cUvQbaeyYSfjW+TgJfAL3eKKg1dUUXb350KwUcoYeyZgp6TDfuK
 9WVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6uUJzaoeGLOwzXUwSVvBQAd6HXf58LyiMLQPxbtqICTw2MPVmIq88Equi/yjRZULB4hT+Kh8lrYhzHj3gY9SI7bsFSDAxCbN65BceQzvcW9JrWNTkY+7n
X-Gm-Message-State: AOJu0YzAGl7RRuv35H/g5S2dg5h3jhRaFna+4LQZCGAL1ZJ2hFINNGqO
 3AqC1KqM0Rnt66ribex7f+pVB/5AKH5aV2DVsKU+G8jWTzmkW4ZtxhONyWqq3s8=
X-Google-Smtp-Source: AGHT+IEdWvf9kIMjYeDjsKaVTkueLP/zcQiKA6cIoiZff9FxDP8/MBI48uP1QLBTcO2jDuCAaZqN3Q==
X-Received: by 2002:a05:600c:434a:b0:421:7407:d778 with SMTP id
 5b1f17b1804b1-424751765c8mr13663175e9.14.1718790553957; 
 Wed, 19 Jun 2024 02:49:13 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874e73c7sm255639985e9.42.2024.06.19.02.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:49:13 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:49:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Lee Jones <lee@kernel.org>, Thierry Reding <treding@nvidia.com>
Message-ID: <5phr5jpquz4f6yomuytsj3kfqavvg4auqk3np5nrjmauleenyj@hc6stosribdt>
References: <cover.1718788826.git.u.kleine-koenig@baylibre.com>
 <e6a1aa8343971c0b8f77d9e4d88c08b26279bf09.1718788826.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <e6a1aa8343971c0b8f77d9e4d88c08b26279bf09.1718788826.git.u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] pwm: stm32: Fix calculation of
	prescaler
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
Content-Type: multipart/mixed; boundary="===============7353174401563151254=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7353174401563151254==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2azgwpn276d45sa"
Content-Disposition: inline


--j2azgwpn276d45sa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 11:26:25AM +0200, Uwe Kleine-K=F6nig wrote:
> A small prescaler is beneficial, as this improves the resolution of the
> duty_cycle configuration. However if the prescaler is too small, the
> maximal possible period becomes considerably smaller than the requested
> value.
>=20
> One situation where this goes wrong is the following: With a parent
> clock rate of 208877930 Hz and max_arr =3D 0xffff =3D 65535, a request for
> period =3D 941243 ns currently results in PSC =3D 1. The value for ARR is
> then calculated to
>=20
> 	PSC =3D 941243 * 208877930 / (1000000000 * 2) - 1 =3D 98301
         ^
This ----' must be ARR of course.
=20
> This value is bigger than 65535 however and so doesn't fit into the
> respective register. In this particular case the PWM was configured for

While improving the commit log, I'll do s/register/register field/, too.

> a period of 313733.4806027616 ns (with ARR =3D 98301 & 0xffff). Even if
> ARR was configured to its maximal value, only period =3D 627495.6861167669
> ns would be achievable.

Best regards
Uwe

--j2azgwpn276d45sa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZyqZQACgkQj4D7WH0S
/k5Qcgf/XEWmvg4Z36NEvcSG5pJZFFDlOS9COPMZoXclFGt758vYqb9EKsxAWIB8
p253UcidAQcM0lEE/oPWxGGg4zFTGhupsULnus5V0w2iYTupnXDeiWxCpW4SkjZ6
n2pdxIUZJQ+LsDy+1lsCMuA4d1WKy/BXk3bkSYF4ssN96+wsES87q+UqU3t8h3iK
3+OkznlkR6IfZNJ/fTLybLeQByLH+nXKQV2Ifb67EL+A3uIk/vH+YpyqJxftEFv4
F18ZU/zl0FltTabYT2qXoXJE9jH0ZhHfynlNXtP5Q2g5NZd2qCCNQ3Vb0cQP9hI8
PxlwWBVzSsJL5EMqjQcKVllQ7EQrCg==
=fLP+
-----END PGP SIGNATURE-----

--j2azgwpn276d45sa--

--===============7353174401563151254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7353174401563151254==--
