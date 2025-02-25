Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC40A44D5F
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 21:30:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A1FEC78F9F;
	Tue, 25 Feb 2025 20:30:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E49FC78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 20:30:58 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43948021a45so53042675e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740515458; x=1741120258;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YV7wOBCDxZKolRjf9GF1nGz4gKy85D71AXPs47WKJWg=;
 b=UhbplfEVj1jLbJP3PXl62wIDR0kd2E+PysZ+l/ZAFvGYdGirsaV+NwgahBxb24nQzk
 bNO9sG8OIxcCop3au3I2XlDfZHO9aFNYAgc2bXueXZb0i03rgH2hdyXL6p1fELfSnJzi
 1+9XbjNADgiO8noogBRhYJMAp7UgR/sddguzp80meEUxtPDf8Dn5p0sWgO5saxRCUxQn
 qCQJ2uZfpmxffu49Fzd3guZR6DoesXSsCeURhfWl5MxyqkqhU1EZStMP55yg2PL69L9c
 Dc1rIXYiwiQE0JuEH+B6CuSeaSETQzozlCummwlNXFjbn9lwEbDZR+3ErbTcWvFRwXV0
 fNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740515458; x=1741120258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YV7wOBCDxZKolRjf9GF1nGz4gKy85D71AXPs47WKJWg=;
 b=JIy1Tjsf4+apLB8RcD/Jr+j26nFLJmGuSL7+4fx+6LJN/7WS2UBSfPgvmgzps2gAg5
 x9pYqzue25b8xtSmgITMaN0N/8lxSumiwMgEQUuGFEcAZH8oYDicY6ZksImxlR4nVhlT
 M+bmzrmie+Gvl8AvRZxcUY8eUFEJCG0T5F5s7CPpkTui8CovnAu15dC5RNTTF6gVrmj9
 5OnmxcAA0HNUlI1EhBqFyNuqWXxJBe9sxNi55BEOPFAb46uRipvyMaOgzBL1Ko2UpibO
 gXuZVjKWKmGHAkGAKqAoGv1OpfUoQrA5pdhiaHTJbxSx8OsFfDmkiR5vKS147rMQKoBW
 wloA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIEcchPafa7SICd1TYLuHriXWGae77IVmnPpj0W4YSGyIwaH3R1jqewjq8KVIYUID2chAORq9L+gwLhQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzjdRACn30EyqdZnVHQltzoW4qjVX8VtZDFs7mRIXeyzkxjdvYE
 Ou9Y0N2f9zu1SYlw2vliM67IErqrOg//iq0n3FHsE/N1qHPa3Bmn
X-Gm-Gg: ASbGnctS4u5YQ6WXdsjGzZb9x/vKeKakQ59Ysc/1mWfZGx1oMV6cudHR66QrrCYVAKQ
 2nI7yshryi9bTPi1DQpq6ZBQ5NkiJ3ZJF1v+rWAMZPiZYUni4Xq8LubZN3IF6Z6V9g3o45hjKbI
 8VQrfJP9hqtiEuiGLWlzUaRNrMltXBaVWD+vPthywDbIdeE2wfm9RJ+DH4zrjk91s1/0sESpbFa
 YI5XwRRgMxZqi7rX499D1K7txGh6CijuxtZRGuyX0GWQKVxjVbXWF3+I5txu+e/8IDDBbZmvt0L
 EmDHedQiA5ftTc4Ih8SAjlMJkRhq/I0a78xmtSQUC2KSbjSbH3spbf/lq6f2k8J2cnKCB04Hfs9
 BX7ePmREwVsVS
X-Google-Smtp-Source: AGHT+IGMx5pU7RRODJDtq0qCQl84I8Udv96NunCF2+SS/JZM7mWzu9hAPxehyg/ka5oYvjP72VnZ3Q==
X-Received: by 2002:a05:600c:4688:b0:439:63de:3611 with SMTP id
 5b1f17b1804b1-43ab901d6b4mr6206895e9.24.1740515457376; 
 Tue, 25 Feb 2025 12:30:57 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab156a136sm38626675e9.35.2025.02.25.12.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 12:30:55 -0800 (PST)
Date: Tue, 25 Feb 2025 21:30:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <deshe54mqty6ozlcbncliwxfxtszubrn44onswjlmo62lltcvx@42piilxcqwba>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next 0/7] net: stmmac: cleanup
 transmit clock setting
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
Content-Type: multipart/mixed; boundary="===============4600109143049112114=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4600109143049112114==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4erhebjcgk6jk4go"
Content-Disposition: inline


--4erhebjcgk6jk4go
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 0/7] net: stmmac: cleanup transmit clock
 setting
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:39AM +0000, Russell King (Oracle) wrote:
> Hi,
>=20
> A lot of stmmac platform code which sets the transmit clock is very
> similar - they decode the speed to the clock rate (125, 25 or 2.5 MHz)
> and then set a clock to that rate.
>=20
> The DWMAC core appears to have a clock input for the transmit section
> called clk_tx_i which requires this rate.
>=20
> This series moves the code which sets this clock into the core stmmac
> code.
>=20
> Patch 1 adds a hook that platforms can use to configure the clock rate.
> Patch 2 adds a generic implementation.
> Patches 3 through 7 convert the easy-to-convert platforms to use this
> new infrastructure.
>=20
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 10 +----
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  5 ++-
>  .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 24 ++----------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 22 ++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   | 26 ++-----------
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 43 ++++++++++++++++=
++++++
>  include/linux/stmmac.h                             |  4 ++
>  8 files changed, 65 insertions(+), 71 deletions(-)

Seems to work fine on Jetson TX2, so patches 1-3 are:

Tested-by: Thierry Reding <treding@nvidia.com>

--4erhebjcgk6jk4go
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KHgACgkQ3SOs138+
s6FT4w/9GoN6QrYW3VP35tGhx3VaNaXACzYRu4GB5krW+p4Ixhq8LfnSKek6/MHu
SkB1lalSpNyFg9ZHeBHeLUMG0bulJzaqUNj38OnTv2YFI+hGXs4rkoLWKf1L+T9k
5Ci+UCoA5wGzrt+eKHixzKsu9V9oVexQOq0gp8AW+4dO8SQxqRgkTL5meN+ArqLr
O1F9jGuCNvJSIOeI4wFQ97s18GRHYTIJeq832LftTqIcJlGGT0dn59tcbLBLm+2f
2vbEqND6mv4cSADvXn1VbUqvCPFO+8p/U75Edy2D9hkl7ZjEjLv31bNQusqiPLFX
gq+JtMbP82gkdQEUDM/K1Ld5CVG5tioTgxWkBBLgU6Ly9TJZBLhN8V+FKJwUhswr
bpBS+gia4bBuu+04aiqgt4Klwb3o4opietJt5ZtJy7r1THx3kGXC/xfl6LVPyLEK
Rbtfv8c61+QmD75lC4Ydatoam55Gu1wjcct4SeqDWO/OiyJRRduoJWvOfCl7h4AI
bDjKuBvoOOTaTOMV70s65FghmyDlNLSyuOGpTMGlTqXgSNYMMehxHPsdo46S2N/5
SYZPImYOXvYaja3UcCYl8mqZn2/yFYPaI0Y8B6v08nof4iYiKdlL+sS7cK1XAkeF
emLTs/BQbziyTrK2sMmeZsY/Yiyr2y53PIxFvgAfnxNEIyl9+ZQ=
=A0bt
-----END PGP SIGNATURE-----

--4erhebjcgk6jk4go--

--===============4600109143049112114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4600109143049112114==--
