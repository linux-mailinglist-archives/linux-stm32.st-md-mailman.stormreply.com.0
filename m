Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F936BC6F
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Apr 2021 02:03:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43277C57182;
	Tue, 27 Apr 2021 00:03:37 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4967BC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Apr 2021 00:03:33 +0000 (UTC)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 13QNi8nL025548;
 Mon, 26 Apr 2021 18:44:08 -0500
Message-ID: <3677398ebb77f334abb4899770db633d9658fe82.camel@kernel.crashing.org>
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Apr 2021 09:44:07 +1000
In-Reply-To: <108f268a35843368466004f7fe5f9f88@walle.cc>
References: <20210412174718.17382-1-michael@walle.cc>
 <20210412174718.17382-3-michael@walle.cc>
 <730d603b12e590c56770309b4df2bd668f7afbe3.camel@kernel.crashing.org>
 <8157eba9317609294da80472622deb28@walle.cc>
 <CAL_JsqLrx6nFZrKiEtm2a1vDvQGG+FkpGtJCG2osM8hhGo3P=Q@mail.gmail.com>
 <108f268a35843368466004f7fe5f9f88@walle.cc>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Vadym Kochan <vkochan@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vladimir Oltean <olteanv@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Chris Snook <chris.snook@gmail.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Murali Karicheri <m-karicheri2@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Wingman Kwok <w-kwok2@ti.com>,
 Sean Wang <sean.wang@mediatek.com>, Maxime Ripard <mripard@kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, "open
 list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Kalle Valo <kvalo@codeaurora.org>, Mirko Lindner <mlindner@marvell.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 QCA ath9k Development <ath9k-devel@qca.qualcomm.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Taras Chornyi <tchornyi@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Fabio Estevam <festevam@gmail.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-staging@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Byungho An <bh74.an@samsung.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Vladimir Zapolskiy <vz@mleia.com>, John Crispin <john@phrozen.org>,
 Salil Mehta <salil.mehta@huawei.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>, "David
 S . Miller" <davem@davemloft.net>, Helmut Schaa <helmut.schaa@googlemail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "open list:MEDIA DRIVERS FOR RENESAS
 - FCP" <linux-renesas-soc@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Sunil Goutham <sgoutham@marvell.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, netdev <netdev@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>,
 Stephen Hemminger <stephen@networkplumber.org>, Vinod Koul <vkoul@kernel.org>,
 Joyce Ooi <joyce.ooi@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/2] of: net: fix
 of_get_mac_addr_nvmem() for non-platform devices
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

On Mon, 2021-04-26 at 12:54 +0200, Michael Walle wrote:
> Before I'll try to come up with a patch for this, I'd like to get
> your opinion on it.
> 
> (1) replacing of_get_mac_address(node) with eth_get_mac_address(dev)
>      might sometimes lead to confusing comments like in
>      drivers/net/ethernet/allwinner/sun4i-emac.c:
> 
>      /* Read MAC-address from DT */
>      ret = of_get_mac_address(np, ndev->dev_addr);

You could leave it or turn it into "from platform", doesn't matter...

> (2) What do you think of eth_get_mac_address(ndev). That is, the

Not sure what you mean, eth_platform_get_mac_address() takes the
address as an argument. I think what you want is a consolidated
nvmem_get_mac_address + eth_platform_get_mac_address that takes a
device, which would have no requirement of the bus_type at all.

Cheers,
Ben.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
