Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA4A44D62
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 21:31:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A46E9C78F9F;
	Tue, 25 Feb 2025 20:31:53 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7352EC78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 20:31:52 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-abb79af88afso41099466b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740515512; x=1741120312;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LqTyJfrpmh9OoHhGhSLNFtCY+nJglgvLIHJFw60aWtk=;
 b=DEt87QyGHPYy2jFcIXvr7Pp7KJD2OShXjxJryxtN2gVViofJqtuPLd9gm7KbUqrXX3
 u2yaqB2yIM8t+IRb3z6brZ8Fd4215VjmHxx0WREYHXE0vU/Uf/YdurS0kpkfqjd3YI0z
 qUVs3V+U4kTflP/RkUM7rkmTJJ8Lz9aUlniEqAWewMScjnRvrsENtMVsGNx7wGEX0eT5
 16f0IBKL/ZnrMKJiRLS0sZB2fDHluqhYKWdQuuzChJ4EUx0nfeg//PSu1UnwM5URKFC4
 A1fdoRqEzzuDeD2/zLgIL4sUXd/XK1ZMoc4B+FGTiU/5C15w/iCUp5Al3RTkMs7oXxz3
 xGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740515512; x=1741120312;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LqTyJfrpmh9OoHhGhSLNFtCY+nJglgvLIHJFw60aWtk=;
 b=MHGkMU9hGEvKBpqE1mQy1MEnbhbkkbuMxwzsgDwfOIA3GSOqop1Qm+hnrG8czePMrE
 jihzztaEkIi9Jq2RDc5Q3+vFKmLoJamnNYbvw7yv7r/FIA2A2FmJc+AgGHYTeWuLZdvV
 EGFo0dh3E1RE6mdFupB8X/JV/GhR9hxe6PMA0GKMtvyosaoHhWqLNVdxCwRQVZjIH/vT
 FkX7qamzSFZp/52b630Re/PGRKZJIVYWzDM2jh8sL4hnDvO1HvREgA5AUMru+muNlDkR
 CtmIsG+gfbnZJW516cCA7NuLG4WHuDKEBWnvrFmf2ITGbgUhKcczcfi/2Aa3KZyXNgdY
 C7Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHwP6G0PCrUF7d4hBTTfeE73/HmnM1d0EkfOWK+DBrTGQVzpAQ7kkd1Vvy2iYugEWDNRMjuJZDHRGCYQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxap1wujlGnHU1a972oMQ8Ia8nm2qM+EhrOnlm698EyQ8Wsa3GI
 8hyImxR5ZJLlHaTkAuP6I7IZAEZ8TAFslrQCP7JqYzVW9pf1Dx9P1MRLJQ==
X-Gm-Gg: ASbGncve9tHcXzgicyQBlucA1dpC+IXSdbMOvf/uLqdfQE7mhG0pRNNUbq3FmCBHMgc
 Brs/ZNGN5QifGAvO2KiCNLtusMw6vGAfnUaWh4bCMMeC3507W3U3toXGgAsp+spuIGs7SFO08ub
 3Wa+9g9e13JN95Ijrav17pfZxXKEqz5pnqnYoG/s4+EMTYWwIlLgebwWpJz4Xw+Xn+cYtgosmMl
 jAMQC+nPMCInfO4gWnEbeZW4QYH9qkgXFe5kP9iju9bXjFHSzN24SvcDVeq89lR42wl61+tjECc
 ts9P1b0CqBqz9JGYzkPC6xp2dExhG9YYI7ufcrwocdBVYYuhEmFmhSQHA9de/QNEq43qwrOJUrx
 IggHagFDJRZWA
X-Google-Smtp-Source: AGHT+IEJuXnWIMGDBSBMqOav7bVwcobNvyp7gvPMLJMccBBO8pTepVY+1CQtODf0snXMlUdT+6giVQ==
X-Received: by 2002:a17:907:72d1:b0:abb:e7de:f2a6 with SMTP id
 a640c23a62f3a-abc09e35401mr2167544866b.53.1740515511788; 
 Tue, 25 Feb 2025 12:31:51 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1cdc46bsm197935666b.20.2025.02.25.12.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 12:31:50 -0800 (PST)
Date: Tue, 25 Feb 2025 21:31:48 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <o5ww56n7e5sfck737uwasx7o4zlhog47abfvfptcegikyheegu@6gapje5hr56b>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next 5/7] net: stmmac: s32: use
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
Content-Type: multipart/mixed; boundary="===============6897174060499525550=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6897174060499525550==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o3ccr5lq2mt5twat"
Content-Disposition: inline


--o3ccr5lq2mt5twat
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:15:00AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 22 +++----------------
>  1 file changed, 3 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-s32.c
> index 6a498833b8ed..b76bfa41af82 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -100,24 +100,6 @@ static void s32_gmac_exit(struct platform_device *pd=
ev, void *priv)
>  	clk_disable_unprepare(gmac->rx_clk);
>  }
> =20
> -static void s32_fix_mac_speed(void *priv, int speed, unsigned int mode)
> -{
> -	struct s32_priv_data *gmac =3D priv;
> -	long tx_clk_rate;
> -	int ret;
> -
> -	tx_clk_rate =3D rgmii_clock(speed);
> -	if (tx_clk_rate < 0) {
> -		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
> -		return;
> -	}
> -
> -	dev_dbg(gmac->dev, "Set tx clock to %ld Hz\n", tx_clk_rate);
> -	ret =3D clk_set_rate(gmac->tx_clk, tx_clk_rate);
> -	if (ret)
> -		dev_err(gmac->dev, "Can't set tx clock\n");
> -}
> -
>  static int s32_dwmac_probe(struct platform_device *pdev)
>  {
>  	struct plat_stmmacenet_data *plat;
> @@ -172,7 +154,9 @@ static int s32_dwmac_probe(struct platform_device *pd=
ev)
> =20
>  	plat->init =3D s32_gmac_init;
>  	plat->exit =3D s32_gmac_exit;
> -	plat->fix_mac_speed =3D s32_fix_mac_speed;
> +
> +	plat->clk_tx_i =3D dmac->tx_clk;

I noticed this while building, the "dmac" above should be "gmac".

Thierry

--o3ccr5lq2mt5twat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KLQACgkQ3SOs138+
s6G2dg//XEAP/SNRmlbm/Whtc1ed1XDDGWzN1eqPHb22h85AkhBzo3dyiGlai3KM
acTcFFS5ngfi1FO+bSmjLeGRcAiGJimDRpNSomDWy7XFwDaA8oWg4bkWSk29PGom
kWOv51f5QlkqJYvK5iYCr37vIThe9KQwQXurR7TbcMZjXggL/paw0o8fbU23+I5A
KF0Y2OLjg4OGfAISzc3SN7B4DKa1uomft05iVkSWcougkQH7N6wmfLTQwfMvXG11
yfIZYOPVd99SiSYR7CT6HLO4JCFDdVYQdJS58v61VvRgyOZlPEG9hCPNNHT+uTeF
Ld4SXrtSywR5WuoJC+B5tJwZ28HNAleCf/5iBxCmxj6AMfftiTaA9LR9K1Myhn9P
4WEXnvBIhw44yyVy6lVbARgSycNXbXey1zdzsCHoOC7vDyxRAsY6eZqcU0Gsaxhp
ARAEdhyVHL8C22q1FsgLUa7pvqavet9mLUz/tKBhM1s7ryQdeS9qzqx3D7VhEY5o
kVJ0ivva6sHgzLK5DkXKN/Tr34R4iBclkR2GAIK4KCFJbnJBMPMf3zeMAJA7v3rD
u8KwPspfNZnP2P1+D26kVX+6oBTXpLFjtKc4vHs3fZcMQ4SrATeeBPD7hOxZOOfL
n20+ZxoKnMcnqlukoxG157V1kl9eNk4ROaDJ8dljbEctRWfbUJU=
=QnMs
-----END PGP SIGNATURE-----

--o3ccr5lq2mt5twat--

--===============6897174060499525550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6897174060499525550==--
