Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28219A44D7A
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 21:34:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF20EC78F9F;
	Tue, 25 Feb 2025 20:34:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BA36C78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 20:34:21 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43994ef3872so37500655e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740515661; x=1741120461;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4Ervwt0Iiaz8TlPYAI0hebTCzxJKg0dTs5t3Xq8VOzk=;
 b=cQFmaLBCXgJ0vuksQlVjGa8Z/hWGAC9aVyOgMNSjNmbRdTveY9h+GC8/gYGuwBFGme
 kXf5+9ZRnUuHjh3uEgTyMDEct94fyPkXuUOs9/85MpS1Sp7bbrRDH4ZAg/bT2ls4kptO
 iHfQLmHgHdEMb/f6+bKQKJTEMBOnYDcXnA8gjZQ8MvD7jVUGz71zcAaoUpNH5wehkyys
 NK6U0urYzQnYZh8u1R0q1VD5ot524hSxJTMZnFvIUibHnm/WbXW5o/i8P7/TjX4qmQtQ
 ZVDdt+5/Du5JUJleMz4EdxMmw5HLGqXFpWUzOZeTQtGY7HAD4rC2mexgRU/23n46GavB
 9FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740515661; x=1741120461;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Ervwt0Iiaz8TlPYAI0hebTCzxJKg0dTs5t3Xq8VOzk=;
 b=shPMHunCFtXmL7gKLgM2+g5owX6Z9/BoN1adA/jsbUspBIBT3yiOpfEfXEokRfmArG
 JLYLeARly9on0tG9Pw5HUuvNEJ16t0xfwGdBcxz9R+IUGTqINyhFNY4TleFWtZfZdr7/
 96hQRiED0TftLh44aNHbsiinUhRfOuJ0MpcDfWte4qBmkaik7DRIu+wFXnaQVIdvqzyb
 wHttojX1+iLg5e0AmJDxAXGzz170KTgj9fYJMXLVY286nMQoZe80BN04pJzHA3U7+R3f
 mbXjo3BVQV3aro0ittj92zu7DyLJufr5Kt6drfGiZ3uNEOCQwrcRa++rE3mbxRG43S+C
 d41g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi4Rt6I0Xg6l6BRF8+WRXvz0KpgFdVHaCAy79vF9bRduryZbApAF7tYT4HLqcIW+OQ7bj9J9BZLDQ6hg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy7Gni8QsO9Ts5dpTZ/iyg7NY7LbSt97TzBfPt3M3wFTjkA0mET
 ox7AoaeSMuIiIGEkYlASnYqy6B1QDaXkWVNx+QjDqdfp/YQwIftu
X-Gm-Gg: ASbGncvPs46FGvM0gvnXyqLSe/KtvHAyOaKRwHc/5CjbYF626iP7tJC4SKuDS4fo4xv
 izh9Mv7vrewryUFGX225wirBMqtmYl+rBDamYuJySY5ccGQnSlc6xK6FeySs0Q7yS5Upj2jM4ei
 7WSCVuvPyUrBeOl4INaraAUR+OEpc66Mvd/BnNYbLkVtRYNJzBkk6lOPlSCXjbdQP+oxssE94tX
 Xy9XOrjSczDmKmVwvmMHBT4KuZRYbMFTSIqrkBgsb1zaKgNL1oixks6ekGxPG8BZfgfHRxNzeFq
 TW91fpi5lRUaaDJ6p6f2kB9m6/aSP8jReC419iOmQQeItyxcougk52GLT0UOo8iDwsVxOrwN8qj
 1MJFfoOzInDBP
X-Google-Smtp-Source: AGHT+IH4PaS/thx0o4a7besZweYaotUTeodWY36gLy1s0OvXS5nmZXjt97njg+FlwYzzfUDwC/lzFg==
X-Received: by 2002:a05:600c:468e:b0:439:9828:c44b with SMTP id
 5b1f17b1804b1-43ab0f3ccddmr50953145e9.14.1740515660513; 
 Tue, 25 Feb 2025 12:34:20 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab156a10fsm37694025e9.37.2025.02.25.12.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 12:34:19 -0800 (PST)
Date: Tue, 25 Feb 2025 21:34:16 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <qnxvliijwsx7p7xht5mklsbpywgsx5kchsv4gagjmiuphwgoqa@tr2gidpfktxp>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLYq-004RZ1-Kw@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1tkLYq-004RZ1-Kw@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next 2/7] net: stmmac: provide
 generic implementation for set_clk_tx_rate method
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
Content-Type: multipart/mixed; boundary="===============2822117606544415335=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2822117606544415335==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ub7wq6jvawxv6zt3"
Content-Disposition: inline


--ub7wq6jvawxv6zt3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 2/7] net: stmmac: provide generic
 implementation for set_clk_tx_rate method
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:44AM +0000, Russell King (Oracle) wrote:
> Provide a generic implementation for the set_clk_tx_rate method
> introduced by the previous patch, which is capable of configuring the
> MAC transmit clock for 10M, 100M and 1000M speeds for at least MII,
> GMII, RGMII and RMII interface modes.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 +++++++++++++++++++
>  2 files changed, 34 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ub7wq6jvawxv6zt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KUgACgkQ3SOs138+
s6G1TxAAi/NDxcQZKCI10VHrxMsf1JqDQf5d16ugQYy/sfomsGLksVt7u4qo01eJ
56Nwsp31cLXit8KO6fh7kBhXbkKaozzFKpgvAeTCQyHM7KOmEKrIfrs7oo1fyFdR
brnyzTSp5r301ED3wgPNAwg1lbSOFDX0JhSHF4lrQwkIu7TB7FC0gMlrNVuX4ll1
6Jsi4x3YBtz+7zJh5KWFXlYnaGy2LCaYeR1JJsO5RxHtoL1QriSwcn0v8Z4GuaKN
euINPJQL8ERPhMWzGY9KhUbUyR8CY3q87LBq1+cWzCZ4G5oO7zCKe1nuWuaUMZUR
6eSfVvvpoa1DYRU7hlkllxD8WFE6adoOv9MR+5KUpMxDUN+fpGB+9kFfInnHJeOH
QagK5nVlC+2WiXyfdATHT4Kef8m++YGZPuDeEtBgzHnOZ4IK+zvlsyf69cONycCU
7oOrEmojJxKMK0A3o4/kFNccQNaPB3ZVdoRXJkZvdBjTuRZ2uvpKvYpoRb4bhAmE
CF0avGa67oZSPuTTSizHZinbOmwpUsl6RhBS6rnqsWBohLzE0gGLAtWHs7lkyI4+
wyEduelKoxYTYtcniJXK9RPPT59d5AajwDvEoA3uu3PLLfSY6FKP3Yg1eELMZS4u
0XC+px/bSRP76lDB7td0YPQFcgCAmpRW4bJgB1oK8/OGDNh1V1Q=
=85N8
-----END PGP SIGNATURE-----

--ub7wq6jvawxv6zt3--

--===============2822117606544415335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2822117606544415335==--
