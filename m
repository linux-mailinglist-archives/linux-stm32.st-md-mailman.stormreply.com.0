Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFF2755BFA
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jul 2023 08:43:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F8A4C6A613;
	Mon, 17 Jul 2023 06:43:39 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A2F4C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 06:43:38 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1689576217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uboJEUKSahjdAVYpA+pF5+aSJ07v5EaQ349H/nsSHfw=;
 b=JtWPLPlrsuM3RupOo5UUWtyEXwtzvhKqw/HW1UHwDOMmbBRQ/QmJZgZBjar4KOos/ATHBN
 FVeRzyNa7e5MqS/vQpfZt+vcENuhhxsj2My8mYiL4fphLiPMtlOU6HdcMsxDqnQ1sEhNQz
 NJjlbA026w0upxHlxBwNcBU5hgbd2qeeHGi0nDLJoGJyPHOkWNXGPfPEXK/lOb2QseiD0a
 MRWYBkNWwkdz+j+H/qEC6XJscdi2JmQUkd9yvuFLKjPWqIzPFXtt0KNjzN/rZhI15vxlNH
 DEVIwUHuNrU6jwJkdOWTM6D4LtFyGxEwGD5Hy8NKo36a44VqsUYSFgXDPqbH+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1689576217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uboJEUKSahjdAVYpA+pF5+aSJ07v5EaQ349H/nsSHfw=;
 b=SWiZ2ZAWDV2WrTFAOBDomuHgk89Qm6iY5G2ULlukqd9M8oXoTTZbgD1XRFh7LF0KLB/zVm
 e5qJVtMqyKfxhiAQ==
To: Rob Herring <robh@kernel.org>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>, Wolfgang Grandegger
 <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chandrasekar
 Ramakrishnan <rcsekar@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn
 <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, =?utf-8?B?QXI=?=
 =?utf-8?B?xLFuw6cgw5xOQUw=?=
 <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Cla
 udiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, George McCollister
 <george.mccollister@gmail.com>, Andreas Larsson <andreas@gaisler.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, Keyur Chudgar
 <keyur@os.amperecomputing.com>, Chris Snook <chris.snook@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Madalin Bucur <madalin.bucur@nxp.com>, Wei
 Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Sean Anderson
 <sean.anderson@seco.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Li Yang <leoyang.li@nxp.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, Douglas Miller
 <dougmill@linux.ibm.com>, Marcin Wojtas <mw@semihalf.com>, Russell King
 <linux@armlinux.org.uk>, Tara s Chornyi <taras.chornyi@plvision.eu>, Mirko
 Lindner <mlindner@marvell.com>, Stephen Hemminger
 <stephen@networkplumber.org>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>, Timur
 Tabi <timur@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Steve
 Glendinning <steve.glendinning@shawell.net>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Vinod Ko ul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Emil Renner Berthing
 <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Grygorii Strashko
 <grygorii.strashko@ti.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Francois Romieu <romieu@fr.zoreil.com>, Michal Simek
 <michal.simek@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt
 <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Alex Elder <elder@kernel.org>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Loic Poulain
 <loic.poulain@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, =?utf-8?B?SsOpcsO0bWU=?= Pouille r
 <jerome.pouiller@silabs.com>, Richard Cochran <richardcochran@gmail.com>
In-Reply-To: <20230714174809.4060885-1-robh@kernel.org>
References: <20230714174809.4060885-1-robh@kernel.org>
Date: Mon, 17 Jul 2023 08:43:32 +0200
Message-ID: <87r0p7597v.fsf@kurt>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, linux-can@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-wpan@vger.kernel.org,
 linux-mediatek@lists.infradead.org, ath11k@lists.infradead.org,
 wcn36xx@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: Explicitly include correct DT
	includes
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
Content-Type: multipart/mixed; boundary="===============4235660446012895919=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4235660446012895919==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Fri Jul 14 2023, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  drivers/net/dsa/hirschmann/hellcreek.c                  | 1 -
>  drivers/net/dsa/hirschmann/hellcreek_ptp.c              | 1 +

Acked-by: Kurt Kanzenbach <kurt@linutronix.de> # hellcreek

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmS04xQTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgtQ+D/4rxLrP90HZoMklo1bSDPz4shsBjqNI
WnulP+nkfb+Qtwn8rBKcJezrFK9O6lJpYTq33kAJwEX/SE8b961KoY/V9s6ssagq
UBdww2O31sKDjd4MbmNjsULZi1BpRmVBJLaxkTQRy/i1JQlHN3rNZtQBT9ZPLcus
oYN4pegQ+WymkHI/KQtmFpPpTMNZjPn6ItB8g5uh6LFWgVIOZi5L13KC4mus7SFP
ujD3Fe0Y2ya/EOyjT4NpcS2IQjTacbYk/z/hB3fuFp0mW5l1X8TKVKz2zquZ01ef
armvD+bjs+3emvjNDs4/9yBd6kJ/4RHP6BkYJMWIHuYxxM62qOJvr3O6JV2FRKug
CKGvmYJBedVkf4RAEc1nQrMH8U4H8ktjYYUKsMp2JdQ5mrDI0xS5Mrfzf4vsonpe
OZXf5Z0CrehMlal4X5Y330gU0iVuZmUARGWKSGFmzWDV5A7vn3jubM8FqCJtiB0X
wD9w4pdsJ+jRp+35GluO4anayr9lDPU3w8Y+4KDmwafuzG2VUajeUSWmBxiDgGh9
6WB5lWsI0Oa+Llb6DzrALRkwXzJPDzZ7YULwb2v37sOq9xma8cce3W9N967on0bX
YcnqpBdEg3tncRq58oK9uDJtdggXzTSO7C78b09WvIa2l5G2JkaM77I/VXhGgvGt
BXSqDM8imlVRFg==
=8lun
-----END PGP SIGNATURE-----
--=-=-=--

--===============4235660446012895919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4235660446012895919==--
