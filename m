Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B27E846F97
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 12:56:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCC07C6DD9F;
	Fri,  2 Feb 2024 11:56:45 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCC43C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 11:56:44 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a30e445602cso665040466b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Feb 2024 03:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706875004; x=1707479804;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GG+S5GHLjupx6ER5keZYLTe4IHoqCrNyuoTCVzg0jo0=;
 b=BV/ApYNYDTeOJXuXX9bn/IC0Y4n9iBeD6aaiZWlqqc1X8cBLrGFvCLCD10bIWkzkZA
 34rO4Fj087wrqnV/NjYgveSTeL+piaf/jCIlCuw/kAKJOQ0uH/uJ5IiGVno3kTh1Otpf
 UnACmRV13VStyQ+6Z5xPk0ZvaYdkX2uHk9rALTiHMGR7hMNNgrE5W45wKtdgcroDHnWW
 UWG1bLmc2jUg8SINqOxxzK8gHD/iSACtbxakf/eanJksmW5S2lMf54ACuc8g5wZmWRxt
 PWaDg1LcIuxv+j7GaavQpTFom8JXNsQT06Gw3frMVhkwQjHqpyDdXgUGQykAbqttL+wJ
 JFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706875004; x=1707479804;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GG+S5GHLjupx6ER5keZYLTe4IHoqCrNyuoTCVzg0jo0=;
 b=CR9gRQzXtNLJeVriWzfP1th64TusLcVHmWMeFosFPzYHxod/xnUV4aSLbqMOJZ3ubC
 xB8l8TT7ozNSSAUtUayv3tbN4mgVow4JXbaW90QmzTcLRoirNvVe3NSa/gxZ+mwRK7Au
 NiqqhdCDHYTkyd/b43uZYGystQi37bgxbnyK11ye9BNt7h22OLBBX6KS6NzVp3wz2nrh
 xYAuGEo2eG6PUbBcHalp4Yl/Ny/Ov0gTNL5J87SvV7gedMouo5JYUl7REJax+jzXADV6
 qbZY2+wU+P8mJW8JQ1c/3O+raNqWI+uXXgqlDcmtcF563UrQ6EeKPD5fgJi/uDxBy7OH
 388w==
X-Gm-Message-State: AOJu0YzUJr1x8PV9ySPjldkWxGh4KEtN4+4zEuY2SUc+Sve11E7R3tUD
 sYTsvF5WA8Onn203pID5KtqFXoWa/B1E9SC3RWE1dj+yvW2WOFj6
X-Google-Smtp-Source: AGHT+IFVhaTCP6oR6YqmOW2BRG8uTZ9wmXSTxUarlqKneiLmehcQMO5JzmUscfkCox5rMbEmuO50EA==
X-Received: by 2002:a17:906:5789:b0:a36:6c98:a506 with SMTP id
 k9-20020a170906578900b00a366c98a506mr1625202ejq.18.1706875003912; 
 Fri, 02 Feb 2024 03:56:43 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW5dI5nuJyVEmffMPO+6v4Jj4YjyRyStV61K5coisKkUpFZwVttW+iKe9Vpaqf6dAA3OP3sKD55cFsjMNfame5Bt1LkIO29kFRRRDzowvWVJEQtFBNiCN43aQr4xkLtBSQGH58iei2pLm3Tt28mnhp7PIjLtPfG5oJjyHoME4QuWDCU7y0y6t9bm7jown07s8XNBc7zz0yuCCEbkFY3S23TcPwjIFP0TX0JBanMMkObXjRUqNw5vc0B38HhFyt04RlKtrFBYV8n4B6/VdJq4aZYFE4Vn8fq3D47UtJwUaZlq3Wf/nV3Zw055a7eyNclkKp8uZxOHc8vTVEtO5mzGhs43e6Dli7LdJZMJahSQ742V23J4V5s1rIMphueZTDty+1Y7ytB1S44anJY8ufcvcOGg7JcU2zzogWS9PASM2BcJiPd8DkvCYojLhsJVGZ67w==
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a17090611c800b00a36efbc8a0csm810284eja.142.2024.02.02.03.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 03:56:43 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 02 Feb 2024 12:56:42 +0100
Message-Id: <CYUKOVAO5YVL.3TA1O4LH0488B@gmail.com>
To: "Thierry Reding" <thierry.reding@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Jose Abreu" <joabreu@synopsys.com>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240201-stmmac-axi-config-v1-0-822e97b2d26e@nvidia.com>
 <20240201-stmmac-axi-config-v1-1-822e97b2d26e@nvidia.com>
In-Reply-To: <20240201-stmmac-axi-config-v1-1-822e97b2d26e@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: Pass resources
 to DT parsing code
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
Content-Type: multipart/mixed; boundary="===============6361178075069018679=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6361178075069018679==
Content-Type: multipart/signed;
 boundary=e24b41a4f26a8b9a10d9406ab403ef394b90d058a9a15d50ac8b9824a485;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--e24b41a4f26a8b9a10d9406ab403ef394b90d058a9a15d50ac8b9824a485
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 1, 2024 at 7:49 PM CET, Thierry Reding wrote:
[...]
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/driv=
ers/net/ethernet/stmicro/stmmac/stmmac_platform.c
[...]
> @@ -605,7 +606,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, =
u8 *mac)
> =20
>  	of_property_read_u32(np, "snps,ps-speed", &plat->mac_port_sel_speed);
> =20
> -	plat->axi =3D stmmac_axi_setup(pdev);
> +	plat->axi =3D stmmac_axi_setup(pdev, res);

Looks like I messed up splitting these changes, so this will actually
fail to build before patch 2. I've sent out an updated v2 that I've
explicitly tested for bisectability.

Sorry for not catching this earlier.

Thierry

--e24b41a4f26a8b9a10d9406ab403ef394b90d058a9a15d50ac8b9824a485
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmW82HsACgkQ3SOs138+
s6HByA//T7KnD4H8sVbYiDUKxEteI4BxxUWpTFvQCch43SAhItvc5yB+OqDK13y9
ZlxwjJOht8LZZPUHMNP3u0sZSP8A+SzkOdMaFayTTWi0rep+SxwroYkbftIyXc+1
+h7nUVp6YitkAFl7wYWpx4G9aDawDc5+qH0WPgxA+g877bE5iyY8RdssTVqj+2BK
OSomWN5F6tjK7ZzEVPa1d7otssjzmrsRWOq+e0EAkFShWELfPnbFaDpUtwNPfrmM
tRLzbuuvqxVDhUvS+ciFYFEq11mG7fp3FiiNFgFKlr2S4Iup5Tv+fyETk9W+rJ7T
7diy09G2yzxDFYbFdlA+2gUYZONuK+S1G1qbEHefgT5ea2iBUnSxk+xeiEkawQU6
1hetSvJYKgPZcS7H9ulZi1igX9+3gGSg/O6OnIq19Ka02/dOHbu6/XVHMQ4jftmK
f4TSeZJOEQ+X2MWRMyXz2jbdNIrC4l/21A+J/7uetVbEc+PC2LyAbuAzNIvwsmt0
wG+FFS4KyN6vNvsOsIy0si/e7WVgxdEughzkerOgXk83ha0XYC5/J41nN02qGxg6
//P16mJOVi/LBpwFiSEkndRJxw+YsTgl32NRCAdoSv49IB6aWlz3FPHENKBx8fBc
3govTWDRwfkaF14qTuzuCpNZzyRomHDie1T7Uc4g0AsbxYXjLRY=
=pstN
-----END PGP SIGNATURE-----

--e24b41a4f26a8b9a10d9406ab403ef394b90d058a9a15d50ac8b9824a485--

--===============6361178075069018679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6361178075069018679==--
