Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 491809A05AF
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 11:37:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3220C78031;
	Wed, 16 Oct 2024 09:37:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F650C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 09:37:29 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43120f65540so36715195e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 02:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729071449; x=1729676249;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WuNBRxUMporUa0FNsiiNZn9Rv9n9DRUgpvNg4YbFQvM=;
 b=TmoBnYWVoE/jKObwJwLfDT27znB0HSi1PzHOiinVPLPCdOlgqG1uZgwEt+I6g+fNWb
 nTRcueO8vg1MsjiWzmQq6kerbrHx12dqNzTg+v6PJBWJX4Yz0M6fKeAa8zJvO96qendT
 TsFPOijSpMODI9/7pbv00Xm7c3aKJ/JYIEp361udGrE9A9CkHNqyESU/vH5KNjL4puBs
 mSQC8BNok5siVV0drt8rdx3Up2m2A5Pi1FVUSLTHdsjMSxlwqKsAu7xOn6hD0MQZfZ+Y
 36VBRYiqVCp88FjQMcZ4c9po55Bk0AAgcrh3X6Mc+OsuBhtegSHTro6CiTIXajp0oVnS
 k6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729071449; x=1729676249;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuNBRxUMporUa0FNsiiNZn9Rv9n9DRUgpvNg4YbFQvM=;
 b=WHoxDw4RZEL6xv/LLWAoCrFbsQQETn41Ae8RgXvszPLWqWM8lYWM3eogJ16O9IY6m6
 fKsdOKXY5Z5ZjELGf6pmMFiaS/Nv/1kQE1AtbhOBRU5B3ajtzVR+ZOtizz+CDi/rxoYQ
 MjKcp1k/3NFv1fJvZYMdkDRnh+hxkPcYciiilxmDgg6CslbOdhpoVVHGqDQ5P9KbmHqz
 CzO2scbhNXts9e4i/V172c0+3pLTu0ax7yKwDq032f2F1yY8VYPECWDI7KB2CA13OcSx
 pRalCJVHM2uQE867zeSMOTdaCLXtRKVs0o7I//SRKMpdHUQpAkuXWaUWybjMmKk/Tn2c
 CbJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ8D7FwnqZIBSdpMFk4Eug8Xush5+yIMl0jzpWz35fyCbp5u88W63zmu58uVP96gFl8xuMXjf+X2o5Ew==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YynJOkZT//YgDQOqmg3uLd507V+w2cNSJcRbR1mJ6TpNRfEXvF/
 EuHNd2uQfOyfYmLi3HBjmdMRsVocE+IBokqFwNaLneOcQgw89fq/6xQvlHQAmnQ=
X-Google-Smtp-Source: AGHT+IFl01Hs8Y2oPgUjtWeCz06Ma1XKh0Ko3SybFFsK9UgNIKR54kvBgw8mfSI2xW39eatk07bhcw==
X-Received: by 2002:a05:600c:3b07:b0:431:537d:b3b4 with SMTP id
 5b1f17b1804b1-431537db5d4mr7539275e9.11.1729071448643; 
 Wed, 16 Oct 2024 02:37:28 -0700 (PDT)
Received: from localhost
 (p200300f65f19e3002f38cf427133ca7b.dip0.t-ipconnect.de.
 [2003:f6:5f19:e300:2f38:cf42:7133:ca7b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f6c606esm43580235e9.44.2024.10.16.02.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:37:28 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:37:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: jan.petrous@oss.nxp.com
Message-ID: <urxfash5qmvahjubhk5knrt53j2tw7hje35qyst3x3ltg4mpgo@dw73m73o36b3>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
 <20241013-upstream_s32cc_gmac-v3-14-d84b5a67b930@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20241013-upstream_s32cc_gmac-v3-14-d84b5a67b930@oss.nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 14/16] net: stmmac: dwmac-s32: add
 basic NXP S32G/S32R glue driver
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
Content-Type: multipart/mixed; boundary="===============3482124535485753131=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3482124535485753131==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3rgewbnae3w46mrf"
Content-Disposition: inline


--3rgewbnae3w46mrf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 14/16] net: stmmac: dwmac-s32: add basic NXP S32G/S32R
 glue driver
MIME-Version: 1.0

Hello,

On Sun, Oct 13, 2024 at 11:27:49PM +0200, Jan Petrous via B4 Relay wrote:
> +static struct platform_driver s32_dwmac_driver = {
> +	.probe		= s32_dwmac_probe,
> +	.remove_new	= stmmac_pltfr_remove,
> +	.driver		= {
> +			    .name		= "s32-dwmac",
> +			    .pm		= &stmmac_pltfr_pm_ops,
> +			    .of_match_table = s32_dwmac_match,
> +	},
> +};
> +module_platform_driver(s32_dwmac_driver);

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers. Please just drop "_new".

Best regards
Uwe

--3rgewbnae3w46mrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcPiVMACgkQj4D7WH0S
/k5nvwgAuwyNlZ0+t4WBDYiT5Gz/XG+UlD8Gxq09jGYiM7ZQuaUMVhaZX2EGtw4j
d+a7PY7H1Q8CSSzlRd8slK6qfFH3k/wg11NO0xOi/lW7uY+2Mou/nKFAa8HitBw3
ciZmWaiBmTaeer34RvNqwit6OIs16tHjlcWE4Ls+BqHzjXLKRw4ME0G5CHih3NeH
dG9mrc9d8yY9ufokGwyutKBMwgesxuK9Rm6q2/BFS9l3jkQwB95bfnuc7EY6Z/lt
Yg0td4KQmT3hHNnQ/NBIyp59RUoPddmazMhl3BvN3BkQa/0VKeoXlEfIO2Y6QsB4
czW2X/X5vQl1CM4TOIf7BSHZyRkOMg==
=npHo
-----END PGP SIGNATURE-----

--3rgewbnae3w46mrf--

--===============3482124535485753131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3482124535485753131==--
