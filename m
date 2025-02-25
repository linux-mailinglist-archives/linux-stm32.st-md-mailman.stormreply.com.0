Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAF6A44DFF
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 21:47:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB26FC78F9F;
	Tue, 25 Feb 2025 20:47:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D990AC78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 20:47:00 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38f325ddbc2so4396505f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740516420; x=1741121220;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E918OTHi2yvVgDkqR2WK0eqY1K7lmB4Humnmkm0YU/k=;
 b=eVRrqkrjJRh+023Cc4lk/7I/nZcAxMGiV+UZKhWUc9FzYBnqnAYuH+ngCxHxEV+VUk
 FC+rfNT1Foo/kJ1uKgDnG/kXmnAVBC93OzNRzIFwKfnKbbfgD+VLXGDurZAMZ3m+N6xQ
 VGLSWxBDwwns17D28RPYx7bfg2FXUEVZMI7qpLGAifYr8mWBcLdiuNVokMGiGzjMOgdV
 ZVIA/l7ZydeOGXUkS+oQDMuz3qgTVr3ygtOCgwIr6/l8V1MYPeMCep7XBQxnffXxAzq3
 J/xLoyMpO4HwfK7vxYZvwgutgRerpBQCLg0FCvdBLwqwkqdTpVtn6gSiTdyJx1e3rXML
 Qjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740516420; x=1741121220;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E918OTHi2yvVgDkqR2WK0eqY1K7lmB4Humnmkm0YU/k=;
 b=GiVCNCQDbv2Hu1vtiu6v6Qe1itPsI/lU3xQj8kA/XtFiYIyHFnr8gu4P+yQi5c7fPc
 TjeahnArcNZFUl0kvYC/kQPl3TQ+rIlrwWKo9D/m96hZI1eM2Vy62ByZrEjq3MZuPF6N
 S6JLH7vhJHIGt5oJYnRJFhrA0hoF8OzRg65q2PRHvo22Zv2J5fGIEJPOTVRlD2oTWwpZ
 KdhkvVv8UsacNR0NucJt2Jb35k1OIqYO0NcIqv0nvnn3txd0Z2sTPCTXG0wWRHJ994fS
 vbfbV1TLnJ7UcoAxMjCxyR2EQ8gzwkOj/xXX8h7EUlD6vryPrF8EkyjGjhkIkGjsBSkX
 fR2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3nEczlTYj7mTM53At5x1OI/+h2eZeZpWJRiiOPAs3+uovY08X4qQ+u43kRzHQD7jEFjUD75Ry8FOqhA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YysRXBG1/zT9flDyid31qboxjyl2PVIkKYFIq+U5GR1bBRoHuUR
 ecQazWi+WQvYjApMAJKorBL/ArYDj/qt9xbOZRBPzVd6B4VZfY4i
X-Gm-Gg: ASbGncsYCCKoUTeyCbNRPw55qJLKglWrKegJ1Tc8I6iEDN3qG34vLr65Q84n9A9YJve
 jlPryOM0LQAJGLzcnl5t1wi80be5+zWoricLuh29fKR4BGen/jLTU1YLLRidy4f1OYjMK5ZCfWM
 tdPG9gWBbGuIP6d8yS9Yq4UN6yqP5hO9SfMyab38D2ZPlNG0R2b4ety4dUIXbWh8HqJgL0Jf7FN
 S3aoAN79+zPDD4hiPjjjgmQp9GjW0MedUhGGtM+XMYJ2WZk5agYR5CxS3GwSfFibxdw3nPj4kGV
 KKmY6i63nFogJvTGJod0cHz1r+lHXK1sIA0klttO9gUn4bI4NTS4wn0Ady6nC6y22CYRZxFEqZU
 Xedxc7alue3VH
X-Google-Smtp-Source: AGHT+IEmw7lSBpfSNj3LhieZeCNYI4bj4PCJf7zwnwb1ygbIuUippUUYOdeYMqmm611SGM3iLvGYVw==
X-Received: by 2002:a05:6000:4010:b0:38f:6697:af6e with SMTP id
 ffacd0b85a97d-38f7077dc73mr14301433f8f.1.1740516419999; 
 Tue, 25 Feb 2025 12:46:59 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab156a11bsm38026395e9.36.2025.02.25.12.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 12:46:58 -0800 (PST)
Date: Tue, 25 Feb 2025 21:46:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <n67c4bq7n7ejakmqmglve3os6vqvm57umysjjzexxkygvusnoo@ndee4gfnmsst>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZB-004RZU-4A@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1tkLZB-004RZU-4A@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: intel: use
 generic stmmac_set_clk_tx_rate()
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
Content-Type: multipart/mixed; boundary="===============3107533425471326426=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3107533425471326426==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4kydm3gogek2i4nx"
Content-Disposition: inline


--4kydm3gogek2i4nx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 6/7] net: stmmac: intel: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:15:05AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 24 +++----------------
>  1 file changed, 3 insertions(+), 21 deletions(-)

This isn't quite the same code, but the result should be the same since
clk_set_rate() will be ignored if the clock is NULL, which would be the
case for !dwmac->data->tx_clk_en.

Reviewed-by: Thierry Reding <treding@nvidia.com>

--4kydm3gogek2i4nx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+LEAACgkQ3SOs138+
s6FCDhAAscpV7eVp/AZQnvvZ4nw0Ad/YhFSj9yZtfDGHgapuDwrpMtuoI8uo9AXY
D8+01yo35J7QfixSJ8u9vwrs2sZQLQsWQ1a90UudQueW5LuaW+Mjp7ErJgrh4B4C
lsm3cUuv+/GblfCX4FgnceY9YHJGqoZNDzYAb+e6xmZCgFzRpT4emSCYCyVHnyS8
sELpHrLTdgJlso7x8hWn3GsSgG6te0ToqLcru4HZ+gl4zRjh8ljfx+5tUkiCSdIf
53t4tdRo/qhu/4EurhryxxJEsXSju1iYV57knOQp0QsplHARC7c4D10xVHFiYi4j
M3mTMnRYGY/d9MMsd0pr193DktSogHur2k7zUdccpE7X34CPZcmfg5wLPO/qYK0S
rJvto6QcJqqB4XagVfuoXoANvAOzlMXUviQBUHFFSumHmnwerkU0ntPzQdk5oQqt
7I+TFMNlEiKA1VpLGbTWw8cEbvj7ZPGHnVd3EQIQp24lYqK/6IZiNB5ZOC0Q9ayk
ydkm9PWQzIdlL3MFh/nho8iZ43nJF3rkTsML1leqt1/CdjHPHi+csCYATi2TqGEp
GhcrScX9mxWkBZ7xWzFfETX610z1DwlzZDuZSlLtc1ZbyxLacU8EDIqY8bha661b
8Irrrgzw/UAFApkCGAQxQ3NsIsc87T+t10FfEW8cdTCjolZd+hU=
=eyD5
-----END PGP SIGNATURE-----

--4kydm3gogek2i4nx--

--===============3107533425471326426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3107533425471326426==--
