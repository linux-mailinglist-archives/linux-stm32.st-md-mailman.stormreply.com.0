Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 419BEA44D90
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 21:35:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09331C78F9F;
	Tue, 25 Feb 2025 20:35:58 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8E17C78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 20:35:56 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so3460490f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740515756; x=1741120556;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yRTAn8EMHBd2hfR7Y/FJYkcHDF1vc5TPWd5vqlVAC6A=;
 b=BrDfdEyoA7WKC0HckseZaEzDfAXBaW+Y6qr6Hf2IuYLlVlRvV0VrdOVGKkKvW07iZt
 yBp5kghbMWx1PQAy3Eat5pYXXOY/tTtZBkdXD2wUZFXkm5TEb/ChVIrg6bFs+c2kttr2
 n9QDo4LptruxvhTfZ+5wf+WYeJDmfYUHI/EdNZX7IByA+nVBMyeBAY/lpejUuCL/9sZr
 SdmPJym9jU80E3a4Nvn3LbZzorgjSGQ0ZfV6BIWJVqft4ta7y+THM2vUu/YTpamz4bZk
 DJyTrU3tjtHXHVS5Wzk7lzsYHN93eI0uSTGwPFF90di/w7ZLQ20mWkSvMIdeKPuariox
 oY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740515756; x=1741120556;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRTAn8EMHBd2hfR7Y/FJYkcHDF1vc5TPWd5vqlVAC6A=;
 b=LhUOLV5+OhnpdJyq3Sdq3IKKcJOtABxoVMw34Q/yMCcPFZ2GG4yn80nvnLgjRvfB2p
 hm4B9D+6p2EWpdC3feA0qkz3ulxTiAXkwT1DPEzF9Rt0DwkO0oI6LYczburMtTNBkjZE
 Q4UF+4kcLaQh/wAwSEaeTRvJK5x+hZIsUUy+joJ3LYCeoAmBS3n0xfZSEzWN4nhf6ZOd
 Vv1xXiVPr/LsHWaSFn7+6Xl9pHqSm21s3F8Jw77JfXE4sZRn+ynnsjqA6pqWpWreFDdq
 XmF6OXKbAdyVBliT6wQZQl3Q367Yd1YkQIVqoQFr8oAtx6of1V8nce/yosAVc8ZldsNK
 L36A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdHBHhz88yJU3AqJgfqfvv+MA/T50pUxrE89fDmBbb463zPJ3KiJXzWX/xRsq2ViW5a7K3+fok2wiKbQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxNHT7iWWu6sZjWQzKGVOlsfuOUdNqzvIOxMYEAOW8iFEDG0wtp
 DtLPx6liE5UY1MDxYuSAos1BLeTP0hnpGK2x3yPqVHuZGCsTRsHF
X-Gm-Gg: ASbGncu4Sctj4+4cw6k3BF3MGqRTbxobH5NqSDKRP/VXcKmT2axkKWAGMYC+x6LPDf2
 RwfoNOZhqF/sJuvM4tspysXXer+8R2cEZn9YCCGI37RiTAOWgNJTuBRoc0pIzW0qwUEhFAtoxxm
 HhtMvjyiKbC2zObUvIefWd/DWFsLMMLFQ1RSFXQ7CkKFs7Mj1IkZv1PMvYXfgZteMDYMUR+RR8U
 LSbZMsWjdzaRwNZSKdJNm8sUATLBVuIie1aHcwejNR4t0G78mcS5N14Yj5QFp/d+MNpx3Jt/TMA
 vrMGdD0gywq2uEv1AhLCjw6DZexAEzdnplFkGo6IyrfavZRiZP61/OwhzZUzttaCTcrW7+zMVG5
 Glke2TIz2SBJN
X-Google-Smtp-Source: AGHT+IHo6pk8C69B1kkZHL451iXWYmac+j4FDXKYrUt1Xc82AEnjWCz9kj00St6aZ3ajRNdoQCt+Tg==
X-Received: by 2002:a05:6000:1563:b0:38f:3b41:c952 with SMTP id
 ffacd0b85a97d-390d4f36811mr510967f8f.4.1740515756017; 
 Tue, 25 Feb 2025 12:35:56 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fcfc6sm3466016f8f.94.2025.02.25.12.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 12:35:54 -0800 (PST)
Date: Tue, 25 Feb 2025 21:35:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <qcarhmsd6u33ij4kupaiyxvyr7jxxv2uxvr6jsnhxjd3o3axkt@z4m3zvdpxogb>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLYv-004RZ7-Ot@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1tkLYv-004RZ7-Ot@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next 3/7] net: stmmac:
 dwc-qos-eth: use generic stmmac_set_clk_tx_rate()
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
Content-Type: multipart/mixed; boundary="===============4740455089896658697=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4740455089896658697==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vvcz2h4v3lcdr4gs"
Content-Disposition: inline


--vvcz2h4v3lcdr4gs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 3/7] net: stmmac: dwc-qos-eth: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:49AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--vvcz2h4v3lcdr4gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KagACgkQ3SOs138+
s6GtyhAAwRIkaF1uLIs1z5IXu/G9vXd74IqnK4JNtzGrGKi7NS+cgEqC7yfhY27w
G7nD6STOdAxZbhcGZfvkiSmrRNBmcmrs2nUBr+dM0BVtgpe/vfwOPbFRWd8Xpqt4
6LYaRSYNIsaY3nAXP4+oa3LXly0Fe4axipwapPJGjl9vCnHE30kMULHJ9MhLlbAu
VZzMketr5oN/usTXWFs1gsYk1Xw1wTabBQGENezBr0+H6Pq7BLDcuWPeEV5ie46r
xTlPD/E1rNepOCxmN6uvJSnz/1ei791h7OAK9n/OMZXKSI0XsgkMresehTC2jIFG
CwG03bepYX+Y64iJejVhCgxU2g8Ji8sv0tmTY7vsCFSa98ngzKWAQK/R6H/V6xMK
vNL83T8No6JOneia+ylM4i2ESXII8LmguwJGY9mbRqqS9dmP52HZig7eww/80MFB
g6yx6n6q4Us/vFJuLgnULe8gLcTMCMiCfAtk+MMdJUqb+eQGLPqXwxsIH5106zmF
ZyRVftW1WAa3Yc8cNF43w7IBR4RDIHm8MBUI9ESyL34P7gobx/5Z0C/DudsmnuV9
4ZJO+x5JUTs/P2yCg5VfB4ERHwfPUSf8LrYEJaVY5f4M+kchTApRjyf6v8oF9add
zMdor2E+S+g69+tn77HhPDvuJzTrOnbaIxQsoIwGEIJ1IpnOBUQ=
=aWdb
-----END PGP SIGNATURE-----

--vvcz2h4v3lcdr4gs--

--===============4740455089896658697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4740455089896658697==--
