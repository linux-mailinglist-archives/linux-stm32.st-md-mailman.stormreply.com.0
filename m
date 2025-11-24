Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D20CFC8176C
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Nov 2025 17:02:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 931F0C32EB0;
	Mon, 24 Nov 2025 16:02:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13068C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 16:02:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 37A521A1D1F;
 Mon, 24 Nov 2025 16:02:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0CFEF60705;
 Mon, 24 Nov 2025 16:02:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8569410371A40; Mon, 24 Nov 2025 17:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764000156; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=fSwjEBFFDA7v4bZHV1Jm9ubAIPIsgOhP8uG9o5XCi3w=;
 b=23udfwRHWY7LPrwckXXVkKWtIY8/eTNFCxCxQWXtjDVTJ3DRPxhsKBikUYSYQORgje6CfI
 Uj0uzPLpyPefkgYCQVeW/eBaaXFS4BJr8RNGi+1iy91XiIL3CsJhIcwHld7ZhcrnTzLsos
 /KrNNrVd+eZVVCHWi/UzDkWw6jo5WJ7c50lLUi8UwiyiOAm7ArWsJL86sYoxm1eLHptku9
 S4iBPNHAB7Hlw7ubbePM5/A97LXQv8Cg5Naj0CNOC1a+vVOiqALNKbPLhffpETcy5bQb7W
 bJlpVwC81gpwBBgLKILszMA6tPpRo1nN9vMHFgx+mFx2CsYzS4BkK9jesRKLmA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Date: Mon, 24 Nov 2025 17:02:21 +0100
Message-ID: <5820146.Sb9uPGUboI@fw-rgant>
In-Reply-To: <da5457ea-c1ed-4c90-8743-fc982a02ed88@roeck-us.net>
References: <20251124-ltm8054-driver-v4-0-107a8a814abe@bootlin.com>
 <23111366.EfDdHjke4D@fw-rgant>
 <da5457ea-c1ed-4c90-8743-fc982a02ed88@roeck-us.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-phy@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Dixit Parmar <dixitparmar19@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-hwmon@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH v4 0/6] Add support for the LTM8054
	voltage regulator
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
Content-Type: multipart/mixed; boundary="===============1314528595197716418=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1314528595197716418==
Content-Type: multipart/signed; boundary="nextPart2407312.OBFZWjSADL";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2407312.OBFZWjSADL
Content-Type: multipart/alternative; boundary="nextPart2232231.yKVeVyVuyW";
 protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 24 Nov 2025 17:02:21 +0100
Message-ID: <5820146.Sb9uPGUboI@fw-rgant>
In-Reply-To: <da5457ea-c1ed-4c90-8743-fc982a02ed88@roeck-us.net>
MIME-Version: 1.0

This is a multi-part message in MIME format.

--nextPart2232231.yKVeVyVuyW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 24 November 2025 16:40:37 CET Guenter Roeck wrote:
...
> > 
> > Do you think that using the IIO consumer API is not correct here? What
> > other
> > 
> > method do you think I should use?
> 
> Ok, I had a look into the datasheet. Unless I am missing something, the chip
> doesn't have a digital control or monitoring interface such as I2C or SPI.
> 
> At the same time, you copied the hardware monitoring mailing list on this
> summary and on (at least) one of the patches, but apparently not on all of
> them. This lead to my apparently wrong assumption that iio is used to
> monitor (not [just] control) something on the chip. I wrongly assumed that
> IIO is used to report chip status (voltage, current, temperature) using an
> internal DAC. Obviously that was a wrong assumption. Sorry for that.
> 
> Apparently you copied the hwmon mailing list for the introduction of an IIO
> namespace and its use in a couple of hwmon drivers in one of the patches.
> My personal opinion is that this should not be part of this series but a
> series of its own. That is just my personal opinion, though.

I understand. I can split it out.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--nextPart2232231.yKVeVyVuyW
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="utf-8"

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">On Monday, 24 November 2025 16:40:37 CET Guenter Roeck wrote:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">...</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; Do you think that using the IIO consumer API is not correct here? What</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; other</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; method do you think I should use?</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Ok, I had a look into the datasheet. Unless I am missing something, the chip</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; doesn't have a digital control or monitoring interface such as I2C or SPI.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; At the same time, you copied the hardware monitoring mailing list on this</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; summary and on (at least) one of the patches, but apparently not on all of</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; them. This lead to my apparently wrong assumption that iio is used to</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; monitor (not [just] control) something on the chip. I wrongly assumed that</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; IIO is used to report chip status (voltage, current, temperature) using an</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; internal DAC. Obviously that was a wrong assumption. Sorry for that.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Apparently you copied the hwmon mailing list for the introduction of an IIO</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; namespace and its use in a couple of hwmon drivers in one of the patches.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; My personal opinion is that this should not be part of this series but a</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; series of its own. That is just my personal opinion, though.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">I understand. I can split it out.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Thanks,</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">-- </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Romain Gantois, Bootlin</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Embedded Linux and Kernel engineering</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">https://bootlin.com</p>
<br /></body>
</html>
--nextPart2232231.yKVeVyVuyW--

--nextPart2407312.OBFZWjSADL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmkkgY0ACgkQKCYAIARz
eA7Sbw/+IYj1nxQCZiCtv+dhusxsoeEnMc+7km6Tdiz5j2SjZJRD/edgkVP7TjRx
wVQcHHDUrVzdLDYyWfvYZ0F1/gPV3ucv6nxkzKsluOW/atgPproy8w1sbLq+ISP+
uLXFWne5Rdt+OhRG8kGDHcP5XKa98L1b/IFCoTdTe/jINYXwYDR2CxyFURJQrNSL
naSNbJjMu1adFjsOKsemwKKQOI4lVy6xd7zVfKRAlquVAP3NW1LV71QrEhVfnKFg
XY+Q0KMQp+EVd5BKw2C0PNkrrjC3kJ1YWEBV861/Cs/eK207rHf0vNPiaDCLntfz
csXkzjesTqOs7KlwU6MTPAE9yDRA6bzJjWr/GHfBxkYoNoSmEml90yeFLaPSJg/L
pMhv+nUSVazSCwI5ALEd/lNu/JXEn4j/Ec1WJVcTIiL4iRDZxJkokTXim2oV6lY6
F8f834u+ZEhjk/0qFRPTOCBbPD94TMRL+0rd6pnm/+uqOeK5mJicMQzEjx9JRsh/
ksjQoJ68S+fLTpNLKGZ2JWb/e7TgVnyJmenjVT3sAO/VAPxvBr3KqaWi9w9bjY+1
2Y6b49RMZ3BVqxwfKe8Za3xO2q6W1Uznm8M7yOUJ31tf7pcxVLYgB8Vbeb3Ackkv
IJbePktWu8NRDvwSQ1495EHaLKPtXsC1mT0yoAd41nvKbvte21U=
=W/xS
-----END PGP SIGNATURE-----

--nextPart2407312.OBFZWjSADL--




--===============1314528595197716418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1314528595197716418==--



