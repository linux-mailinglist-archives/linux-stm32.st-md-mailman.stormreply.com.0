Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAB8A44D71
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 21:33:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2856C78F9F;
	Tue, 25 Feb 2025 20:33:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CA80C78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 20:33:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43994ef3872so37495925e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740515594; x=1741120394;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mfzXyH7NZ0CXwUyIU7zqxa+qi2bPj6GEOWtmkR9Kazg=;
 b=PipGF4UjE5G5vPl0lrCj0FBliYZGZQ2MonqaG1V5r7S9oCaNxHN7ZgmjSIUp4z8pcB
 F2VRdN3ushh7H1kF+vzkQcMSoobaRfBNAnPKzb4taW7kyVAxY41rBSPnEq6bNq/hRQam
 L7Hv7/ir4QoJb7IXETWOT+MuGvL/PwUYNWQdJV+SA8KGBg7MEGqC8VJp13bE04r1gmhk
 jdIRYrtZa127EvgGN2PcL+PyE67F9Z6WY1QmvaX/Z7NLsfQaYP3biBYQHdgu5EXq/8iS
 W3oZjMegBBqpIJc1WLyzzwNd/POI1n/UFY8GzabTdx0srRCsq6+ZQa/vLB5lC6yejpZq
 Ofuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740515594; x=1741120394;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mfzXyH7NZ0CXwUyIU7zqxa+qi2bPj6GEOWtmkR9Kazg=;
 b=O1T2bzN9tteeOKQACvcGLWNlhXpNGHCHDIUCRA6UFmMUolvnRZrGkq2kLIj0BVdvhg
 BGzyFop00sgb9T9Q6lrPJ5zcL01obcEEe0Fh+yHCypdRdklmjrSl15NvUpAtwMAMDXt4
 G8wsn+B37gPNZQ1YAS6++Hydu7p5RSjxDrGINkXMGm2/SFPN9xBq+3DlpAV2bHbG6qo8
 CPhCMPsEfocSEkS3hWynabzQOt4S7uAek0N+guPq8ELqhClOdiQE1GmXyuTJauscomqM
 exGXD9VhJnEivpYy0xCjZlFa+yPYHr9GiRhzQRpkzJzMv9cahZAzxkggkkcJU/f+GRXS
 tgTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjSAic/UcGh7EP7O/M6ty/4z0KEbIgEtcs21/KvbNp1SrWol22ncHHlJy+UzlzjpHuZvSI6DZv0M2Rwg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3al75e1jCPFzmBXI8XY2oDPOKEarB8eq+HsdXR4awbQzIRSLs
 UJdONQMu4D6UXOBEIiR4YrkyL5F7AelvgqrEpscPTOAlzyE+MRnE
X-Gm-Gg: ASbGncsuj8iOfBEtuTISG/cyxh9JajE9fTgj1n6viNPFE5YPBnhlW4Lxmx2k/Z3Z1lY
 lI/lQoQNVXDNteufyFNO6IkhKdyhqL/nUfoETNCIMzojL6Drf9SY+CocHZhjrwSFSR53okwoFkB
 RtTQBhdVAKdfvNDJzuFXn8UzNDD+n2oD6obXPvhTq5K3rI0ldx/+mLS6Xx1u543V8ZezkwkZfNC
 Uk6tfSHjOgpkwqEC2XFNZBswmcUTMEoGAfFMJpGgaCRxOPDXzp/2Ltz5/Gg9EoGbLOID7OdY5lS
 v3watGg8HLWl1Di8dky9S/JkrcK6+uqfnMEBTOwcekn7hrdDb/5f0QU7rcQUxw8YXxLZZdqUwXD
 7D/ZRkaYhVVnO
X-Google-Smtp-Source: AGHT+IEOGawFqhgpNgYj/SR8/F9v9KrOsztMk0p6RFVqMJcMCZS2I8sfJ+MqQCPoKPwyjrwTYZAFuw==
X-Received: by 2002:a05:600c:4446:b0:439:9bed:9cfd with SMTP id
 5b1f17b1804b1-43ab0f311f9mr49606745e9.11.1740515593421; 
 Tue, 25 Feb 2025 12:33:13 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd882602sm3388780f8f.41.2025.02.25.12.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 12:33:12 -0800 (PST)
Date: Tue, 25 Feb 2025 21:33:10 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <qtxnw63qgwt4zbcwktooytp3uwg746gjqdhzqmszz6t2oma4ah@kzlytutixoky>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLYl-004RYv-Gz@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1tkLYl-004RYv-Gz@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next 1/7] net: stmmac: provide
 generic transmit clock configuration hook
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
Content-Type: multipart/mixed; boundary="===============2457548327490045632=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2457548327490045632==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3tllvznwlcmcp5xs"
Content-Disposition: inline


--3tllvznwlcmcp5xs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 1/7] net: stmmac: provide generic transmit
 clock configuration hook
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:39AM +0000, Russell King (Oracle) wrote:
> Several stmmac sub-drivers which support RGMII follow the same pattern.
> They calculate the transmit clock, and then call the clk API to set a
> clock to that rate.
>=20
> Analysis of documentation suggests that the platform is responsible for
> providing the transmit clock to the DWMAC core (clk_tx_i). The expected
> rates are:
>=20
> 	10Mbps	100Mbps	1Gbps
> MII	2.5MHz	25MHz
> GMII			125MHz
> RGMI	2.5MHz	25MHz	125MHz
> RMII	2.5MHz	25MHz
>=20
> It seems some platforms require this clock to be manually configured,
> but there are outputs from the MAC core that indicate the speed, so a
> platform may use these to automatically configure the clock. Thus, we
> can't just provide one solution to configuring the clock.
>=20
> Moreover, the clock may need to be derived from one of several sources
> depending on the interface mode.
>=20
> Provide a platform hook that is passed the interface mode, speed, and
> transmit clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++++
>  include/linux/stmmac.h                            |  4 ++++
>  2 files changed, 15 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--3tllvznwlcmcp5xs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KQYACgkQ3SOs138+
s6EOmw/+NeeoaUSqMoO7BHZUWvxr8/OKrzqzdp0HpmensxnadCO/WqOLakmT5co9
XTRZQVmvq+ZQC1nWfstqK4ND3ulPNRma9zkyTk++49QMi40BznccIGX/YcME3zlM
nGdEC5u9vH3xq1GBvsi0blaAouIy/8uqSnI0RXVj1RcJxWO+y99hBSKJnE0QpYzy
T19f4RuwyuQAXFkhjBoBrl8sOJ7mZObyvvZV7/DobMmmFcvWCc1ieompVEWCV9st
CJmAxheTHrPJ96/cWBPfaTLmntsZNV//h7tMjIV+vkBB1a4uVzcRELW5x5JDuC5O
XHtyvCV7Ve02iTxfPVAeK/glqo7CK6XkhK32Uhl+yKp3alu5sP50w9AMlB5LVw7o
zo3fyBvdK5+0L18tdb8fJdr36LQnYnq2Wnb3cT6DkjG/8CKMVocXMfQgfytk1FEp
sIsFNpEj72fQ7xFikWevv6FWfX+5+x3IkiWKGWc62rUBTLUeCbXV8YawYcco2Du2
RLw49bsH7J9GgTNL6ZrD0Q0owRqa0FibL3zMd+C3cl85qRq4jBmhXeluUoPi6Dkc
DI8RPv9C0noqkFN5QcoVeE8n/mTCKvzONdUL4irltre6N/iMSDMfbbxOsdnWHsGE
TWQbPh7S0dUQAbeKa1i8Y/9vALxV3CF6vOtAKvGkqhmgf18Ge3Y=
=BaLA
-----END PGP SIGNATURE-----

--3tllvznwlcmcp5xs--

--===============2457548327490045632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2457548327490045632==--
