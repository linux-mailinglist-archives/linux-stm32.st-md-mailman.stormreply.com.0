Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E54FAC815F8
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Nov 2025 16:36:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C8ACC32EB0;
	Mon, 24 Nov 2025 15:36:04 +0000 (UTC)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 447AAC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 15:36:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763998549; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=AxXhNaq2QSyA+TQ9sGyx3P1gVziPvOzC1mocipgLLabpjohSRkDqjI1cne9HVoSeh3
 EnrZNfSgjP1fkjDF02BI/GRQ+Dlt1UWmyCY0qQ2MyBtqFwIIJx7w8W3Hv9PI+vFItyN8
 lQJlxl2pC+nRrzjnJisQJprAOdJymmXgqo4lZVCF56TWUG1wrdzbOcBydhf5OjtDCqCc
 GKlA9q6otJ2L09VDsY1gMenvZ5+Z7YS++VHUZPHSwADBwX0nY6DZH1elLMkgIFSulBES
 aYSdlKDtU7dfJjQW6amzkhmjz9NEgevJ8Paccr89T+PUxgclv5gvcqOZABUIWm+b7PTb
 UUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1763998549;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=yPYGC7e0wXw9NN6inGU21PEF5T5OMUPZWftkiDy78vU=;
 b=RVybWi/SxEwGc/kwktk+ZNBGkZLxnSHUuQKrkvughpmcdO5PS7F0FfveC2RpmVLt8S
 gCR0u/iCYTUC1CiggbIAS4NRyprEfO6AjwcSU1DudI8/UrEa4XLaJgCW84cWcWUNdo5J
 cBhEiLi/W3LSA+q6vh0R+GojuDDDgivJ78pcpOtmsUjewwQsm7i72J6etvGtNQx0yJ7T
 ufVHuqCZMuEE5Cn40YOANqv51dmGjChS+88KLUHyXziSqzSFF6hI2SjwassLh1PrAaqw
 TPKrNSr45cm7mipuHPs4Qx4YnuOzOHK5qhXh+FGWXK/y0l3xYHF6+fYm2MGTB7mM+PuV
 2aQg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1763998549;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=yPYGC7e0wXw9NN6inGU21PEF5T5OMUPZWftkiDy78vU=;
 b=R6UBGPa9x9MkdRHjS/IuikyqOUXWv1KBdDySoPmgYx+4NTPgZ7/smXUpAL6Q2zb8ZY
 jAwqnurxeH0ajazUQ9Ivv1jYO+7IwhXEsrVy27OFuOSGnCGGWS7yqizHJJKh/EfscUM7
 5PsPhD8c361yNsXZpX1N5b1zPKrbVAyjmzoUZxzvRKdwaTCxgiwoezFo78QfANE61+W6
 v0wWNL7t0sHGhxvAvbyYVYDuR/kGlVXFWkG+Ojo2SwJ86YKMSKCVHkueqy8hw2TbEoqg
 omaZDp2y0x3ICYlaD+BB+gs7H7AofF9BpShEil2sYdfsWSgUy/CtaVYDhLeu0dcRHemo
 75nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1763998549;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=yPYGC7e0wXw9NN6inGU21PEF5T5OMUPZWftkiDy78vU=;
 b=HQSxeqBIVWTYHstF0sD6f0h9eEWFTR1YJ5u10+ub9jcIb6fZ+1a65aG5BegC1mk/ut
 xL4jvvIrjso43H/cy3Dg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeT0Z"
Received: from smtpclient.apple by smtp.strato.de (RZmta 54.0.0 DYNA|AUTH)
 with ESMTPSA id Qc14a81AOFZeEjB
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 24 Nov 2025 16:35:40 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <23111366.EfDdHjke4D@fw-rgant>
Date: Mon, 24 Nov 2025 16:35:28 +0100
Message-Id: <563331EB-2460-4CF5-87B3-5FE60B18BB70@goldelico.com>
References: <20251124-ltm8054-driver-v4-0-107a8a814abe@bootlin.com>
 <24527d76-4f6a-4008-a369-23510d492a94@roeck-us.net>
 <23111366.EfDdHjke4D@fw-rgant>
To: Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: Apple Mail (2.3826.700.81.1.3)
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
 Takashi Iwai <tiwai@suse.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
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
 =?utf-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi

> Am 24.11.2025 um 16:13 schrieb Romain Gantois <romain.gantois@bootlin.com>:
> 
> Hello Guenter,
> 
> On Monday, 24 November 2025 15:57:41 CET Guenter Roeck wrote:
> > On 11/24/25 06:48, Romain Gantois wrote:
> > > Hello everyone,
> > > 
> > > This is version four of my series which adds initial support of the Linear
> > > Technology LTM8054 voltage regulator. The driver supports a fixed voltage
> > > and a tunable output current limit using a DAC-controlled pin.
> > > 
> > > I'd say that the most unusual part of this series is the usage of the IIO
> > > consumer API in a regulator driver. I think this makes sense here, since
> > > the regulator driver has to access a DAC to read/set the output current
> > > limit.
> > 
> > I don't think that is a valid reason. Literally every driver measuring
> > voltages or current uses a DAC to do it. How else would one convert an
> > analog value into a digital value ?
> 
> Sorry, I don't quite understand your remark. To integrate this voltage 
> regulator component into the Linux regulator abstraction, I'm providing a 
> current limit control function. To provide such a function, the voltage level 
> on a pin has to be controlled. AFAIK, the kernel abstraction used to set 
> precise voltages on lines is an IO channel.

I was curious to learn about this topic and looked into the data sheet:

https://www.analog.com/media/en/technical-documentation/data-sheets/8054fa.pdf

As far as I see the LTM8054 does not even have a programming interface.
So is it reasonable to provide a dedicated driver at all?

The figure on page 20 seems to suggest that there is an external DAC
which drives the regulator. And the regulator drives for example a fan.

So I would think of a driver for the specific DAC and ignore the specific
LTM chip at all.

What could be necessary is if you really want to be able to "regulate"
the current going to Vout, some bridge between regulator API and some
IIO DAC.

And enabling/disabling the regulator by some GPIO can be described in
the DT already through a "regulator-fixed".

But this are just my first thoughts as I have not been following this
topic before. Hope it helps.

BR,
Nikolaus

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
