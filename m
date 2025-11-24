Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 863FDC8171E
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Nov 2025 16:57:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 350DBC32EB0;
	Mon, 24 Nov 2025 15:57:43 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 182F2C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 15:57:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D4FDDC139B0;
 Mon, 24 Nov 2025 15:57:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 71C74606FC;
 Mon, 24 Nov 2025 15:57:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0297B10371A40; Mon, 24 Nov 2025 16:57:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763999858; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=UX028RVBrtav4WisvLm2dO1F8K5+rUIM4Xp+GTn4l88=;
 b=VarxPDuEXoNSmVvJFI8GatO2RP9trnXzaYCfsYMM6RiiQJ2m93PBXrieFqWdi7u6Z2RoZg
 GAGA01Dg63AWsSjF79FfLxVFlCWOLC7nb+Zva16AiZR4LFaDIOkwTjS+1qvXT6UkmCc4TH
 yzjFgzaGeZFlS18DchOYD0zIe6ixo0ZO9D4JFiPQlx//8nY7IyIYwgA24Z48+/kegy6SN7
 r9KW3P+aPv0ig9jzpcYgX+xbOwsPSqiPsLbiFMkGf/rdRqa9+vF2g0o12LRVP64iuC5S5t
 QWlRuX+uUfAmODHQDKv6cyMvrBcyY/vc3NIbj+57IejdauvBbh+DRTxNEjxg7Q==
From: Romain Gantois <romain.gantois@bootlin.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Date: Mon, 24 Nov 2025 16:57:16 +0100
Message-ID: <4053840.MHq7AAxBmi@fw-rgant>
In-Reply-To: <563331EB-2460-4CF5-87B3-5FE60B18BB70@goldelico.com>
References: <20251124-ltm8054-driver-v4-0-107a8a814abe@bootlin.com>
 <23111366.EfDdHjke4D@fw-rgant>
 <563331EB-2460-4CF5-87B3-5FE60B18BB70@goldelico.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-hwmon@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-phy@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Dixit Parmar <dixitparmar19@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 Jaroslav Kysela <perex@perex.cz>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mips@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============2314931675229744266=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2314931675229744266==
Content-Type: multipart/signed; boundary="nextPart2111402.atdPhlSkOF";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2111402.atdPhlSkOF
Content-Type: multipart/alternative; boundary="nextPart2186563.taCxCBeP46";
 protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Romain Gantois <romain.gantois@bootlin.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Date: Mon, 24 Nov 2025 16:57:16 +0100
Message-ID: <4053840.MHq7AAxBmi@fw-rgant>
In-Reply-To: <563331EB-2460-4CF5-87B3-5FE60B18BB70@goldelico.com>
MIME-Version: 1.0

This is a multi-part message in MIME format.

--nextPart2186563.taCxCBeP46
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Nikolaus,

On Monday, 24 November 2025 16:35:28 CET H. Nikolaus Schaller wrote:
...
> > Sorry, I don't quite understand your remark. To integrate this voltage
> > regulator component into the Linux regulator abstraction, I'm providing a
> > current limit control function. To provide such a function, the voltage
> > level on a pin has to be controlled. AFAIK, the kernel abstraction used
> > to set precise voltages on lines is an IO channel.
> 
> I was curious to learn about this topic and looked into the data sheet:
> 
> https://www.analog.com/media/en/technical-documentation/data-sheets/8054fa.p
> df
> 
> As far as I see the LTM8054 does not even have a programming interface.
> So is it reasonable to provide a dedicated driver at all?
> 
> The figure on page 20 seems to suggest that there is an external DAC
> which drives the regulator. And the regulator drives for example a fan.
> 
> So I would think of a driver for the specific DAC and ignore the specific
> LTM chip at all.
> 

In my use case, the LTM8054 feeds a DC output port on which various devices 
may be plugged. Dynamic output current limitation and output voltage level 
control for these devices is a requirement, as well as stepped voltage 
transitions, thus the need for a proper regulator device.

The LTM8054's feedback pin can be driven by a different DAC, which allows for 
dynamic output voltage control. This is a more complex upstreaming topic 
however, so I've left it out of this initial series. There are other component 
functions which fit in squarely into the regulator framework, such as 
input current limit control and soft-start. But I understand that the current 
driver might look a bit "bare".

> What could be necessary is if you really want to be able to "regulate"
> the current going to Vout, some bridge between regulator API and some
> IIO DAC.
> 
> And enabling/disabling the regulator by some GPIO can be described in
> the DT already through a "regulator-fixed".
> 

This is a possibility, but when you bring in all of these other hardware 
functions that I mentionned e.g. output voltage control and stepping, you'll 
end up with several different devices which look unrelated from userspace, but 
actually control the same chip.

Userspace will also have to know about some hardware details to properly 
control the DACs, such as the values of the sense and feedback resistors. In 
my opinion, this bypasses the kernel's abstraction of hardware.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--nextPart2186563.taCxCBeP46
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="utf-8"

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Hi Nikolaus,</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">On Monday, 24 November 2025 16:35:28 CET H. Nikolaus Schaller wrote:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">...</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; Sorry, I don't quite understand your remark. To integrate this voltage</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; regulator component into the Linux regulator abstraction, I'm providing a</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; current limit control function. To provide such a function, the voltage</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; level on a pin has to be controlled. AFAIK, the kernel abstraction used</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; to set precise voltages on lines is an IO channel.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; I was curious to learn about this topic and looked into the data sheet:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; https://www.analog.com/media/en/technical-documentation/data-sheets/8054fa.p</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; df</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; As far as I see the LTM8054 does not even have a programming interface.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; So is it reasonable to provide a dedicated driver at all?</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; The figure on page 20 seems to suggest that there is an external DAC</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; which drives the regulator. And the regulator drives for example a fan.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; So I would think of a driver for the specific DAC and ignore the specific</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; LTM chip at all.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">In my use case, the LTM8054 feeds a DC output port on which various devices </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">may be plugged. Dynamic output current limitation and output voltage level </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">control for these devices is a requirement, as well as stepped voltage </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">transitions, thus the need for a proper regulator device.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">The LTM8054's feedback pin can be driven by a different DAC, which allows for </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">dynamic output voltage control. This is a more complex upstreaming topic </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">however, so I've left it out of this initial series. There are other component </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">functions which fit in squarely into the regulator framework, such as </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">input current limit control and soft-start. But I understand that the current </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">driver might look a bit &quot;bare&quot;.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; What could be necessary is if you really want to be able to &quot;regulate&quot;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; the current going to Vout, some bridge between regulator API and some</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; IIO DAC.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; And enabling/disabling the regulator by some GPIO can be described in</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; the DT already through a &quot;regulator-fixed&quot;.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">This is a possibility, but when you bring in all of these other hardware </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">functions that I mentionned e.g. output voltage control and stepping, you'll </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">end up with several different devices which look unrelated from userspace, but </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">actually control the same chip.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Userspace will also have to know about some hardware details to properly </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">control the DACs, such as the values of the sense and feedback resistors. In </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">my opinion, this bypasses the kernel's abstraction of hardware.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Thanks,</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">-- </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Romain Gantois, Bootlin</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Embedded Linux and Kernel engineering</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">https://bootlin.com</p>
<br /></body>
</html>
--nextPart2186563.taCxCBeP46--

--nextPart2111402.atdPhlSkOF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmkkgFwACgkQKCYAIARz
eA6Alg/8COym+7pL1LpZ1EUBzLeuPJJMpNXAoKBsdBPOyD3NnxUoT3dqx1KV6Qxl
qgm6tINDewDnwWGblDKog18X7I3G9JZVLM4/LwN//KMnkzo+GcECfLyFvnNrzKhg
X1ZpkaamjbifIadbFXhOy1HQ/A6tO90ICk4ae2Dgye9PCZAqsL/GUGtcwiJzbWTk
mNNqqvmwxf7KGS/63peSY0oGREjOfo95tZPllfLxP5lgvdVP/kiTot7ErGsaFh5y
zzUIaEYjpiE86eQ+0/gKRs+Xkn4sAOyPzzRwoycI9JsYuJOPLEkIdChhAKNkKUD9
MmGR4aMVjgLxKxu2dfNwsJmVQJ8mkVor+3jqyP77XSyM7E71ZesHrujCRodKaicr
hiTtUMGt5qkalsMDHQLJ8MR3R/hMJWK2u1uKitIC0NhXCNQfR2yGlEothJDFcdQL
K0cOhaJGpDnxfaopsfnN9ianNPZ5MhUYJj6qvQPAjTtARK8E+uL2ysXgZ9bQ1xKx
g+URjMLJ49zdR8rHCJw0PLPE7Cb8GcsPFlad9yWPzjhJxk5y8JTMNWAnzZTRH96b
I/PLDFBC9fy13WU6sj9591J0oxcpRC/k6ctEDZzN5sQZ8J+2rwc9moNFpGRpuLGc
sefn100uth/gnbi+8IJjmTB564t5KIY0Xpnk7+3vfqFC2a88B+o=
=Wv+m
-----END PGP SIGNATURE-----

--nextPart2111402.atdPhlSkOF--




--===============2314931675229744266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2314931675229744266==--



