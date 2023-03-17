Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4782D6BF4E5
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 23:10:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD4EDC69067;
	Fri, 17 Mar 2023 22:09:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8CE8C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 22:09:58 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E8C1B60006;
 Fri, 17 Mar 2023 22:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1679090998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydOYXHQbAQwRlDgBE8D09/DiUFJ7qXsxUL0PXkGETCE=;
 b=gxdMZ2BrYyWyx9kX77EBkYQV9fTzdP0QG4+apoaarC7ba2aSSw4QOUeotjWwZPrtCPd+Vp
 dR+z7o+0JFKbhXhzIOskw65hViO8jJseil7auBmA+VfYNzl9Ba869dUOHmGsAVOaiWFwd9
 SWzvCOIEnPr83VO/3bNKnj8G+cCab+fKdo97zjpkLn+nyDciYAAFDYFxOXiX2m6xOGOQbE
 f3J90EfvlrFKodrHbp3nLL3fhmXyWm2Ho3t2mwke+h12iD3ITeQ68F3lj85T6UASbZF974
 /a71oqxxOaKR9AOjZvrAJVd2etTV8ox8FXMG5XjRSkgj9hS2jftwNMP8kwn6Vg==
Date: Fri, 17 Mar 2023 23:09:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Benson Leung <bleung@chromium.org>, Joshua Kinard <kumba@gentoo.org>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <167909091159.113952.12576059020896222306.b4-ty@bootlin.com>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
X-Topics: 
Cc: linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
 patches@opensource.cirrus.com, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 kernel@pengutronix.de, Guenter Roeck <groeck@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH 00/41] rtc: Convert to platform remove
 callback returning void
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On Sat, 04 Mar 2023 14:29:47 +0100, Uwe Kleine-K=F6nig wrote:
> this patch series adapts the platform drivers below drivers/rtc to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver c=
ore
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warnin=
g. The
> device is removed anyhow and an early return from .remove() usually yield=
s a
> resource leak.
> =

> [...]

Applied, thanks!

[01/41] rtc: 88pm80x: Convert to platform remove callback returning void
        commit: 8ef70a5ef3ed41ce4d700794d45fd9e084460a00
[02/41] rtc: 88pm860x: Convert to platform remove callback returning void
        commit: 8fbff75e2b7582fc03dbcd13e67831fb75345dcb
[03/41] rtc: ab8500: Convert to platform remove callback returning void
        commit: 8a700af1babfc0e5d34bd95264d65ea6adb0b288
[04/41] rtc: ac100: Convert to platform remove callback returning void
        commit: 28015e799ad9ff04d68107b7392a4884accedb0e
[05/41] rtc: asm9260: Convert to platform remove callback returning void
        commit: ad01bf83bfc33c53079415f02e160bf72221d7e6
[06/41] rtc: at91sam9: Convert to platform remove callback returning void
        commit: 06e5e4a5a996aefb5d8e0c8db05b014e3bd91a28
[07/41] rtc: brcmstb-waketimer: Convert to platform remove callback returni=
ng void
        commit: d64906b320ce6fef446ea72c6043bbec19f0da60
[08/41] rtc: cadence: Convert to platform remove callback returning void
        commit: 0b9efd82a63b31c7c2ce17a3d8ad3aeb28b3a928
[09/41] rtc: cmos: Convert to platform remove callback returning void
        commit: 63c18a079bbb5f564b30e0fa7ec292eb123b1bf6
[10/41] rtc: cros-ec: Convert to platform remove callback returning void
        commit: 0d8742e61098b422b1ba1458a7ce80c4f1e299bb
[11/41] rtc: ds1685: Convert to platform remove callback returning void
        commit: de11783c9d2a4dec9e0e2c01b9a9897d72019d5f
[12/41] rtc: ftrtc010: Convert to platform remove callback returning void
        commit: 43eeb707afb00579a7bb611d14fc9a056bba849e
[13/41] rtc: hid-sensor-time: Convert to platform remove callback returning=
 void
        commit: 30d5365c8dda63e31fb1fbbec446d72d0f1e5ce6
[14/41] rtc: lpc24xx: Convert to platform remove callback returning void
        commit: 52fcb90d8cdf117ade871b01861b8a8defbf3b78
[15/41] rtc: max77686: Convert to platform remove callback returning void
        commit: bf05de01160d493d53cc289be1b1092c26b378b4
[16/41] rtc: mc13xxx: Convert to platform remove callback returning void
        commit: 99c3a1367db02b6b57be54bf61da051a93e0615f
[17/41] rtc: mpc5121: Convert to platform remove callback returning void
        commit: 22edbc10a514a8cf56d9c8da5cc1a2d43e6832a5
[18/41] rtc: mpfs: Convert to platform remove callback returning void
        commit: fa147083acf61de306e2881d91401d817de11093
[19/41] rtc: mt7622: Convert to platform remove callback returning void
        commit: ae0ac71651c726c2f1d5af752d38bf40526b7026
[20/41] rtc: mxc_v2: Convert to platform remove callback returning void
        commit: 153f56f9ce99495ca4cb6d7f2047c29940aef9f5
[21/41] rtc: omap: Convert to platform remove callback returning void
        commit: 578afdb9084ed0446060d627e7f3ecd1c4100c3d
[22/41] rtc: palmas: Convert to platform remove callback returning void
        commit: a7f9864e4362e07e113517d647c5bc355cdee970
[23/41] rtc: pcf50633: Convert to platform remove callback returning void
        commit: d25f0ba97692b4a8ac63bbd2c562741525c5f5ca
[24/41] rtc: pic32: Convert to platform remove callback returning void
        commit: c3d12a10922dcf32a97d3c71f6a574529b061caf
[25/41] rtc: pm8xxx: Convert to platform remove callback returning void
        commit: 3fc5029a8f7d0d3c039c3649e82cc2e4eeeb46a6
[26/41] rtc: rc5t583: Convert to platform remove callback returning void
        commit: ade527dd2192ddabbd4926338c31ca281098c34c
[27/41] rtc: rtd119x: Convert to platform remove callback returning void
        commit: 0824a15b6863a19c7c8e1c16abf6090fd8ac615f
[28/41] rtc: rzn1: Convert to platform remove callback returning void
        commit: e55fbc80e9d2bf3ec0ec77551baa683f30e85b74
[29/41] rtc: s3c: Convert to platform remove callback returning void
        commit: 9e6a2ad120fa3f785f013e70ae7d872abafb8318
[30/41] rtc: sa1100: Convert to platform remove callback returning void
        commit: cf407e9f1a9dc290e2088c11bd0e5542334e7ab4
[31/41] rtc: spear: Convert to platform remove callback returning void
        commit: 25ffc856b3cb1bd08a8645839aa38505469a6edd
[32/41] rtc: stm32: Convert to platform remove callback returning void
        commit: 54c2cb2797cd76465dae08cd9b81676ffad36b27
[33/41] rtc: stmp3xxx: Convert to platform remove callback returning void
        commit: 16324165ab1f90fa06294679e3de58cb53c0423f
[34/41] rtc: sunplus: Convert to platform remove callback returning void
        commit: d6f525040eef1562327fccc4412acdb4f173e01b
[35/41] rtc: tegra: Convert to platform remove callback returning void
        commit: 31c94505f44b47493d62c0fd43d30838326d345f
[36/41] rtc: tps6586x: Convert to platform remove callback returning void
        commit: adebcc1c1916188c1c9ac8e8f54123b07431baf7
[37/41] rtc: twl: Convert to platform remove callback returning void
        commit: fff118c9e8331b9b08b69841498fbea34693a28c
[38/41] rtc: vt8500: Convert to platform remove callback returning void
        commit: 5b1064441f20fc3f397239599b1193fecb7a90e4
[39/41] rtc: wm8350: Convert to platform remove callback returning void
        commit: 631aa2d919f542373892d5ef6baf13e2969a10fd
[40/41] rtc: xgene: Convert to platform remove callback returning void
        commit: 257062d2679f4db5b6ebc9f4e6a77d0a45977278
[41/41] rtc: zynqmp: Convert to platform remove callback returning void
        commit: f45e5cfa73f445fa3cfbb7ebac3a7e2c66a9281c

Best regards,

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
