Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76977A44DA3
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 21:36:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25BC0C7A824;
	Tue, 25 Feb 2025 20:36:48 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14189C7A822
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 20:36:47 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-abb999658fbso751363366b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740515806; x=1741120606;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e4QFWKkvK1MfnhL/90Bgctff+RTyO4G/8PgMsyHu6Bc=;
 b=XtPXglvEJlJ4R9Ku21LQtSZVDc0kseZ04k9bSzBj849Z6nijZk3N9nWtXguoX2W+2p
 u8EDb8N+I+zPZvfLH/oOA+FoZqkLHtjyu2t+uYlFFEOBM1WAtzCmQrYLZeTrMAHT81YP
 RnqWaB4uu3bC5VqHxlNeCgYUM9ZJP3an9GAw1XXTtCcEbIJRiqPRS07IKzWRXD6EZNHT
 vuhvNteS4V6OdAGh5fzkmLX5sHNnL3VNtR4JhS4/0aLal+VO6yAFZSWMUQ3IJ3vH+01X
 QwKLkQoSkDd4DsdDIGJ+uY2uqjo61AV9XOHuOW6cVefmxcFY7A/KX91exAf2XJfmq649
 17Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740515806; x=1741120606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e4QFWKkvK1MfnhL/90Bgctff+RTyO4G/8PgMsyHu6Bc=;
 b=gx0kHcgUrlhkJtKm3eirHURn8jbPKbfiAVEOk4qOnz4/1A+1hz7Uv8W1cKjMd3Cvtp
 nzk3ft6rcFI4Tl3dAJoN6NEVDC4XRRfdOSkm5vrQX+HtRUvHxK9pNX62IvceTiEDOrTA
 hOkc3Td9OIc/EvQSpSNXXEJNq9/B+P/d5Yk05IXzSmJ09kvlzpkFiZJOkfvG9xbF/TSF
 0CXJUPy8Gidlq8n+9YtW0udHQ/UGdvj3mRJ+MlHusgzgV+f5WZKm4+7aYO/kjbwJOCfj
 6xzXSowi7Yzod2cyvVzn1hYAOwPgj9p+/gp7qKcGmKm7HJug9/OMgyIrNzSbM04fV8g5
 wwVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1BJ+QdWBCwlALmh17zkwM5gjnQlNHsv/tm8JCC1lr8VL23FlOPB7+r/qWXfHgIiv/8DkSLQnAl8LuxA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzi9dEvhzRUZVhWRjJLCD7lrCz9Du6VNBRKdUcnI10TCoRoOPMV
 1w+ZCi6eaUEGc7paEG6KS/+zkI0e+mO8/DyzbBZ1IUZF5knmAcMg
X-Gm-Gg: ASbGncvh8zjsjrAEbp2WemeCtY0Fy2tHqyHYkpCS1EUXdyLCCxXYT0efBd8DUfkVPZu
 u/8W+wyURvEqTDyreWsZuANQMWxoFQDtNNsyZjkNSfvo4K8IiHKgrz+Mkq+/Jc2zvgcJ5fHLSIG
 SHeXodZjYU8AOuxoMLmdhHLWSvUZdHPAqCznTzMk/TWBrrwqJWTEbRon3BUG0vK6OGUbs2hykC6
 poFOHcQeQ1IZ4Zko8NcxZ07aUIhvcvdD1NTCjinBPinaIfE4gUCvYZ5fquDsi2ZsU5eQLJffWJV
 1AlidRor7InjDCovbDLVBhLp0nS5NqbD5XDeBs3V5ClNp0+tANEJ7P12sZUlB0zP22H5F1JTqtU
 dSdbWtYGx8adJ
X-Google-Smtp-Source: AGHT+IFncxJntu78FR7b4qYIZj+yv/K48D2ocZTvPMdxZVQ+iCvW4E3ccfSm9iifNVJPhsHG3qsgrQ==
X-Received: by 2002:a05:6402:3512:b0:5dc:ea7e:8c56 with SMTP id
 4fb4d7f45d1cf-5e44a256cc9mr9383487a12.22.1740515806327; 
 Tue, 25 Feb 2025 12:36:46 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed205c7efsm199478066b.149.2025.02.25.12.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 12:36:45 -0800 (PST)
Date: Tue, 25 Feb 2025 21:36:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <auqbgnqka3hdrwbxoaa3so6caju6jzzpsbr5yufaqgbqmhjmap@nbawhyq3nz6q>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZ0-004RZH-SL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1tkLZ0-004RZH-SL@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-kernel@lists.infradead.org,
 Thierry Reding <treding@nvidia.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 4/7] net: stmmac: starfive:
 use generic stmmac_set_clk_tx_rate()
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
Content-Type: multipart/mixed; boundary="===============8575313041807000173=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8575313041807000173==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="npnnru3ejcetrulh"
Content-Disposition: inline


--npnnru3ejcetrulh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 4/7] net: stmmac: starfive: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:54AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 26 +++----------------
>  1 file changed, 4 insertions(+), 22 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--npnnru3ejcetrulh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KdoACgkQ3SOs138+
s6E3eA//VXPPJ389lkM7hL4gCsrCvhxDMVKpYPMFI55f6tZgLN36yUUjjp/67nLz
TWhWj74unoSnThtfJlOzxs/l/n6/XM23PEtj+TVrBk507ao3hEWLWY0KPW7fHU0/
kb7Jfe85CfqmkzrtLINfqpxvbb7bgSxP5yALfculXlykp61GY0aPIHUAXXWWUn2u
SdgqTvYdA3oTDBJ2Cc+unBpVTSuH84RpMvnPLvtLu2+0t0ppjAf4MYJG09t3f/jr
Ku7m1c9zlNWDrv1fSsIJ4kd8YakZsB9aDGxcP4rQhr/73uBetaUFfz92tTvMPAvn
/vTqP75LzOPXu88BGK7ZV6SvdOBstrxxMOTM2/7/DSyCHv2V1Yt3xvplbP5YCble
ORxVJNlzH0JweLWggg9xcvDlwas+jagLOYYp5If3cqsae9CFLxJr7zywxu+UaVT1
DIpGMI0dnVaJcwOc01nlEWCzeOy0oe0lG9UZkUPKWbxoBB9Eit4ZibSmoTCf3l3q
fjPgZBKRJa1hHMBEecD7gQja1zqMg0ZOcdXowP67ZIF9AkfCQHZNorMqQwicvA69
w8x2PvFSXgexu6zDEAZ/5SMc7+iLQQ8gTR1SZHpna+9pl5S2X/CiYK4Ihvzs4EPY
uXWe3lJzBecVr9TdDq5tgbk7cTqduZOS4Yvc1XkGEGgKA/JT4c8=
=slen
-----END PGP SIGNATURE-----

--npnnru3ejcetrulh--

--===============8575313041807000173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8575313041807000173==--
