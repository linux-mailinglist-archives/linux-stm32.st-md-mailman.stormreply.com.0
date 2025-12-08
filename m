Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF69CAC91F
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Dec 2025 09:57:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D97B3C58D77;
	Mon,  8 Dec 2025 08:57:52 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4344DC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Dec 2025 08:57:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 04B8EC10191;
 Mon,  8 Dec 2025 08:57:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A16AD6070C;
 Mon,  8 Dec 2025 08:57:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F238102F0A9B; Mon,  8 Dec 2025 09:57:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765184267; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=3fg1zW3LOXIPMYWNiGMqZlYLtPRdk9K2q2GNC8WmibM=;
 b=2T3KfPwNwUmq9Lt4oZRqOtwhda6Flnt0QwmI6YflOV7VPGQxgDkBWZm1p3eQ/328i7qyeT
 vHLZNvI6W9Ak5hYLXJXSXXc0CBXXjO270B+alVG9LDd2+bg0vChABDbMJnDLkQgk250BSW
 yETa/SIv6h41p8o1hAExIjtLVPVZ8RV5Bgg8+LV/GzKtTKyzW0yIMTclkHFszqC3bHv039
 X+wfJkbAvLGpj6OWpG1D1daow8IER2MeouFk0gESqQfoiPEYAoa5xH1Wkl2fWCRa8FpKv2
 BXH9ELHLTcGyZhCZ6+8r5UDmwKTwkGbxTWIG2Ke1rzoMYicClzlETWMJoL40mA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>
Date: Mon, 08 Dec 2025 09:57:24 +0100
Message-ID: <2024471.PYKUYFuaPT@fw-rgant>
In-Reply-To: <20251207184818.2ad7cef7@jic23-huawei>
References: <20251124-ltm8054-driver-v4-0-107a8a814abe@bootlin.com>
 <9b43da0b-61e1-49bb-acc2-392de3817db7@roeck-us.net>
 <20251207184818.2ad7cef7@jic23-huawei>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-hwmon@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-phy@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Dixit Parmar <dixitparmar19@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mips@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>,
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
Content-Type: multipart/mixed; boundary="===============2520334369474814230=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2520334369474814230==
Content-Type: multipart/signed; boundary="nextPart7885096.EvYhyI6sBW";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart7885096.EvYhyI6sBW
Content-Type: multipart/alternative; boundary="nextPart22929280.EfDdHjke4D";
 protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 08 Dec 2025 09:57:24 +0100
Message-ID: <2024471.PYKUYFuaPT@fw-rgant>
In-Reply-To: <20251207184818.2ad7cef7@jic23-huawei>
MIME-Version: 1.0

This is a multi-part message in MIME format.

--nextPart22929280.EfDdHjke4D
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Sunday, 7 December 2025 19:48:18 CET Jonathan Cameron wrote:
> On Tue, 25 Nov 2025 08:37:20 -0800
> 
> Guenter Roeck <linux@roeck-us.net> wrote:
> > On 11/25/25 02:25, H. Nikolaus Schaller wrote:
> > ...
> > 
> > > Another suggestion: what extending the "regulator-fixed",
> > > "regulator-gpio",
> > > "regulator-fixed-clock" pattern by some
> > > "regulator-gpio-iio-dac-current-limiter" driver to make it independent
> > > of your specific chip?
> > 
> > The name is terrible ;-), but that is what I would have suggested as well.
> > I don't see anything chip specific in this code. If there is a need for
> > a regulator driver which uses gpio to enable it and a DAC for current
> > limiting, it should be made generic.
> 
> Agreed - something generic is the ideal way to go.
> 
> However, before going too far it is worth exploring what are common circuits
> with these things to identify what parameters we need to describe how the
> DAC channel is used - e.g is linear scaling enough?  You'll need to that to
> define a DT binding. If it turns out to be too complex, then fallback to
> specific compatibles in a generic driver to cover the ones that don't fit
> with a common scheme.  A similar case we already have is discrete
> components as analog front ends for ADCs - mostly they fall into a few
> categories and we have drivers covering those, but some are very odd indeed
> and for those ones we do have a driver even though they don't have anything
> to control as such - most extreme case being when it's a non linear analog
> sensor.
> 

I actually did use a modified version of iio-rescale in my downstream code. My 
use case includes an OpAmp inverter circuit placed in front of a DAC, and it's 
useful for me to be able to describe this in a modular fashion, as two IIO 
device tree nodes representing respectively the DAC and the OpAmp circuit 
front-end.

Moreover, the LTM8054 takes a voltage on its CTL pin and infers a current 
limit from it. This is also something which could be represented as a sort of 
AFE node.

 LTM8054 output voltage control:           
+---+ +------------+ +--------------------+
|DAC+->Inverter AFE+->Feedback circuit AFE|
+---+ +------------+ +--------------------+
                                           
 LTM8054 output current limit control:     
+---+ +--------------------+               
|DAC+->Voltage-controller  |               
+---+ |current limiter AFE |               
      +--------------------+               

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart22929280.EfDdHjke4D
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="utf-8"

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">On Sunday, 7 December 2025 19:48:18 CET Jonathan Cameron wrote:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; On Tue, 25 Nov 2025 08:37:20 -0800</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Guenter Roeck &lt;linux@roeck-us.net&gt; wrote:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; On 11/25/25 02:25, H. Nikolaus Schaller wrote:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; ...</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; &gt; Another suggestion: what extending the &quot;regulator-fixed&quot;,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; &gt; &quot;regulator-gpio&quot;,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; &gt; &quot;regulator-fixed-clock&quot; pattern by some</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; &gt; &quot;regulator-gpio-iio-dac-current-limiter&quot; driver to make it independent</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; &gt; of your specific chip?</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; The name is terrible ;-), but that is what I would have suggested as well.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; I don't see anything chip specific in this code. If there is a need for</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; a regulator driver which uses gpio to enable it and a DAC for current</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; limiting, it should be made generic.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Agreed - something generic is the ideal way to go.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; However, before going too far it is worth exploring what are common circuits</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; with these things to identify what parameters we need to describe how the</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; DAC channel is used - e.g is linear scaling enough?&nbsp; You'll need to that to</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; define a DT binding. If it turns out to be too complex, then fallback to</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; specific compatibles in a generic driver to cover the ones that don't fit</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; with a common scheme.&nbsp; A similar case we already have is discrete</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; components as analog front ends for ADCs - mostly they fall into a few</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; categories and we have drivers covering those, but some are very odd indeed</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; and for those ones we do have a driver even though they don't have anything</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; to control as such - most extreme case being when it's a non linear analog</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; sensor.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">I actually did use a modified version of iio-rescale in my downstream code. My </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">use case includes an OpAmp inverter circuit placed in front of a DAC, and it's </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">useful for me to be able to describe this in a modular fashion, as two IIO </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">device tree nodes representing respectively the DAC and the OpAmp circuit </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">front-end.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Moreover, the LTM8054 takes a voltage on its CTL pin and infers a current </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">limit from it. This is also something which could be represented as a sort of </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">AFE node.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&nbsp;LTM8054 output voltage control:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">+---+ +------------+ +--------------------+</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">|DAC+-&gt;Inverter AFE+-&gt;Feedback circuit AFE|</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">+---+ +------------+ +--------------------+</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&nbsp;LTM8054 output current limit control:&nbsp;&nbsp;&nbsp;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">+---+ +--------------------+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">|DAC+-&gt;Voltage-controller&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">+---+ |current limiter AFE |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +--------------------+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Thanks,</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">-- </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Romain Gantois, Bootlin</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Embedded Linux and Kernel engineering</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">https://bootlin.com</p>
<br /></body>
</html>
--nextPart22929280.EfDdHjke4D--

--nextPart7885096.EvYhyI6sBW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmk2kvQACgkQKCYAIARz
eA7Dhw/9GfGpoHhSNiYoLEY8BU6ezNDIJRsccNjENK6KoL3UN7ypRE+gcLa0bNqe
WOOtbaVjjBeF7GFKMzJ+nR6jiMzUM+qwAc1Tv4ShuhXjG07gC/seUciBiywn+Bmg
QuEm40+vr+C5/U6sB5NGm78ns25z5Ek9xNsqGpugLstBb8gntze+VSH1d78aZA+w
ygVLP/T9s4nxR/0abtoiKwumEuw6gmo/4Qhp1WW5WD9w6O83DlBMlt+/kl5fDC31
sxpFYgNfqmqAppD6gzuvmpF058IihWRpjUTrD/NjcOnVkq7Vq371YAirJJsLFJoz
eyggKZkmrUPLJc6jhjqy5AMq5g+hN+gkppuDvMg7NRYAwSqu8j9J3x6+EiHjm6oN
NAFVOzw1KPrGAEfxLLRWWubm/61UD7i/S2nS6cr/r2AeN/wfIXA6W+dQIEWQEnOx
6KJm925Bs3jjBqPcyL2NQ04H02mhuUzIb5Q3aH56o/gRA8IR3yVuRgTgFkNoOogI
xoZeteDlq6fyune2SC1YlPsh1BOOn71qWvJg8kVjfhuEVzRvG5g7bXNUAoZ6fReY
lkPXNIHe9Tgp/76WA+D0sJCTWXtYR+mkrUKHig5TVEszW67+zyfH5l1cVdQY6Izo
ui99LBQWUI+OunYO2iIEevgn+n92e13HFNZmzIb89ZE/4VWcrvM=
=oqy9
-----END PGP SIGNATURE-----

--nextPart7885096.EvYhyI6sBW--




--===============2520334369474814230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2520334369474814230==--



