Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A5E857AD1
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 12:00:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 368C2C65E42;
	Fri, 16 Feb 2024 11:00:22 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19A0DC6410C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 11:00:21 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a3d159220c7so83908466b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 03:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708081220; x=1708686020;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PLhCxXeXfTy0oKV1PZq76pGTpwbsrb7RXVp5Ag35IfA=;
 b=mYNsMFXlNFAWyJBzrnbH8RaKzhvRkw/5JW6QyGgmtZ2DeMAZDqFjC3mAtEMnhABprm
 pkksLF84LfE/Q81NZugq1JsopNRzWM0xkQ8Kbhzzl3mvwBB0qPMeVgAnx8qGyeoy8GOU
 YkkGTteH2VROFH6zDYwrdTIUy377fnpkZ87YrVt23n51XzvCv1JM2hSuGw7lLfDL7lZo
 ICpQ4smWePVTKFpDwTjIDb+8bztQXjw1uEic482ia2yqBB8vS40dPwyX03LYoK5m8vHS
 2FcdV32qgBJc/EuNMEwA2DyZbN0R93GjP1Wx6KdsWmHZRmU2Ko1r5dgYjYqMC69PZ/kt
 sx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081220; x=1708686020;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PLhCxXeXfTy0oKV1PZq76pGTpwbsrb7RXVp5Ag35IfA=;
 b=jGVRMVsVR+rjynpKCPk032k/EtLhbk2XQ4Og1wakd7Poo83geVh1adMZ8eYGkdyKTw
 rQNPl1NUjbHXkXyI5a9asBx6uzUg6MnPLDiGt+RMC4yBqwc5drfMiMQUhSHpQZXzRDXz
 R6WESrcBFcC3KP/R+JejQ4Diai9/EeshFokGGNVbeYFoZbIsUUHzjEsWaYRimyh/2pow
 a1R8om8lQ7uHsM1okgZRt8TKpIP5dccdR1EvMp5E/4DoOKfOYNsBXewLRbjmbwXo+dSQ
 dQ8J4AvBzC/dh1OErvMTnBSPFdWOoPF8uzM+6PyCIK37zCKwx6FPxnp0Zk93+Tn3387a
 9myw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo4xq84KFy5zzH33PIpPDayGMtYDm8d5OIWT1AsRyCZJznjMwhjJMoM4mM2ebSlQTpFtSCkGdsorQ2+K8mch6yVPmtfwO5v4JEND0JMMGNrkDKUa8F/lUg
X-Gm-Message-State: AOJu0YxwoI92FOXcmCE/usxUhRX4qS8zXdALadERqwLBWRwbPngjyHmu
 04Wk++jjDiDGLFR6086ogDL68fE/gCAC9bSTrGzthw7CO5hiE31c
X-Google-Smtp-Source: AGHT+IGJg1U3l1s0cZ7SNrJJLULfB++IrJsj8RGS0gGWbyw09mvwxmMXattq7dTy3fEu4mQVbz3vaQ==
X-Received: by 2002:a17:906:46da:b0:a3c:f6dc:ea46 with SMTP id
 k26-20020a17090646da00b00a3cf6dcea46mr3038631ejs.49.1708081220098; 
 Fri, 16 Feb 2024 03:00:20 -0800 (PST)
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ts4-20020a170907c5c400b00a3df003b6a9sm219235ejc.119.2024.02.16.03.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 03:00:19 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 12:00:18 +0100
Message-Id: <CZ6G9AYXMMHZ.3ABQKCJUHPSLU@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Rob Herring" <robh@kernel.org>, <soc@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "NXP Linux Team" <linux-imx@nxp.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Tsahee Zidenberg" <tsahee@annapurnalabs.com>, "Antoine Tenart"
 <atenart@kernel.org>, "Joel Stanley" <joel@jms.id.au>, "Andrew Jeffery"
 <andrew@codeconstruct.com.au>, "Ray Jui" <rjui@broadcom.com>, "Scott
 Branden" <sbranden@broadcom.com>, "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>, "Sebastian Hesselbarth"
 <sebastian.hesselbarth@gmail.com>, =?utf-8?q?Jonathan_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Stefan
 Agner" <stefan@agner.ch>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 =?utf-8?q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, "Tony Lindgren"
 <tony@atomide.com>, "Chanho Min" <chanho.min@lge.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, "Imre Kaloz" <kaloz@openwrt.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nicolas@fjasle.eu>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
 <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] arm: dts: Fix dtc interrupt_provider
	warnings
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
Content-Type: multipart/mixed; boundary="===============1605616400421742747=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1605616400421742747==
Content-Type: multipart/signed;
 boundary=3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Feb 13, 2024 at 8:34 PM CET, Rob Herring wrote:
[...]
>  arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi      |  1 -
>  arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi           |  1 -
>  arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi          |  1 -
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPQEMACgkQ3SOs138+
s6F44g/+KPT4RF0vNadKSFIV9/iihK84gvvjHc/8S/+Ks+sJw7//4Zws8JtsGdab
UvvmQ8R5uIrvLpONlnmdl8cjWpnA3OV1VMJRgXeYIR/kKZxuoiZF03R8COiGQvfJ
Cf4mq2od1sc4OOIFxTV0KJfp6XbmI09stW6zm5wk1F5CjbnMD0TTgxQhEAsOLfum
aDJefFKp6T8QOlCQhCeYYnXwUIBdoYs7z+SRXBuJWJvgwdPMnyc4M7/5PtW57UXZ
Vn2Hri2+u9imbcIzSUkrPLev1Kg5sWTF7CSICzmA+jTvHQUAZFQQMyjrGFkFTeI/
g/J4ljpwRqBlhXRx5ioNbGqYmptZvuljjH6bT8hDzTRNPdfvZfKJSX2+wWb5+kM7
/CdKfwORAUgMMqqABa4mSxHys/mmyeLJ2idQj/buql4pC7EpgD7SZRadqnaAkD/S
3zxA6VBVq4Jt+6X3kjgGySa0tUyBMSWydLjH/TTkcZtwu8iEEggp7MxiYA2wJhne
Pf5VjnhX5nLnPJuJn/Av5GHF1jvsrt9lENJTmpLFZIzxhxWrPntynrvfbpAV50e3
eWqEDRu7eWFatZNZTrnRhmOHcGO197HIErp20X4PVISOY0uolzuiHFpjQBCUGQdV
1xaTRZPbjaTB4pcqWNxi+mI4M6jIyDJc6COrC2G9t5GYMcbE6W4=
=HY7z
-----END PGP SIGNATURE-----

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b--

--===============1605616400421742747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1605616400421742747==--
