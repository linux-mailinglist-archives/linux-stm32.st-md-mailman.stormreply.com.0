Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B433571DD
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Apr 2021 18:10:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7791C57A41;
	Wed,  7 Apr 2021 16:10:38 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAA4DC5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 16:10:37 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 18A9F22236;
 Wed,  7 Apr 2021 18:10:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1617811836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjuAN9QqCnWD77UCettma95Ojaeyk86+8J2wmtLYYZo=;
 b=i99BezLwmPOE6w4/hGL0FvjE3br7uwuw9VGO9aRg8uJTlzeGu8Ac4FIxGX9vOQ8oMVP/r/
 vE3I00R508lGU6R1pfNebHfFNtH5wO92z1+kMGfRRoMcmLezfBux9iSvegup2fWrGU4qza
 5flIWUW4ulzNHWTXNBqNWa8WPLM3Izs=
MIME-Version: 1.0
Date: Wed, 07 Apr 2021 18:10:30 +0200
From: Michael Walle <michael@walle.cc>
To: ath9k-devel@qca.qualcomm.com, UNGLinuxDriver@microchip.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-oxnas@groups.io, linux-omap@vger.kernel.org,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev
In-Reply-To: <20210406220921.24313-2-michael@walle.cc>
References: <20210406220921.24313-1-michael@walle.cc>
 <20210406220921.24313-2-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <50f474611ecf0f5e61c9a14a24b28773@walle.cc>
X-Sender: michael@walle.cc
Cc: Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?Q?J=C3=A9r=C3=B4me?= =?UTF-8?Q?_Pouiller?=
 <jerome.pouiller@silabs.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rob Herring <robh+dt@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Wingman Kwok <w-kwok2@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Chris Snook <chris.snook@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sunil Goutham <sgoutham@marvell.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Byungho An <bh74.an@samsung.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sean Wang <sean.wang@mediatek.com>, Salil Mehta <salil.mehta@huawei.com>,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Murali Karicheri <m-karicheri2@ti.com>, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kalle Valo <kvalo@codeaurora.org>, Mirko Lindner <mlindner@marvell.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Vladimir Oltean <olteanv@gmail.com>,
 Fugang Duan <fugang.duan@nxp.com>, Vadym Kochan <vkochan@marvell.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 Helmut Schaa <helmut.schaa@googlemail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "David S . Miller" <davem@davemloft.net>, Taras Chornyi <tchornyi@marvell.com>,
 Vinod Koul <vkoul@kernel.org>, Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joyce Ooi <joyce.ooi@intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/2] of: net: pass the dst
 buffer to of_get_mac_address()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Am 2021-04-07 00:09, schrieb Michael Walle:
[..]
> diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
> index bc0a27de69d4..2d5d5e59aea5 100644
> --- a/drivers/of/of_net.c
> +++ b/drivers/of/of_net.c
> @@ -45,42 +45,35 @@ int of_get_phy_mode(struct device_node *np,
> phy_interface_t *interface)
>  }
>  EXPORT_SYMBOL_GPL(of_get_phy_mode);
> 
> -static const void *of_get_mac_addr(struct device_node *np, const char 
> *name)
> +static int of_get_mac_addr(struct device_node *np, const char *name, 
> u8 *addr)
>  {
>  	struct property *pp = of_find_property(np, name, NULL);
> 
> -	if (pp && pp->length == ETH_ALEN && is_valid_ether_addr(pp->value))
> -		return pp->value;
> -	return NULL;
> +	if (pp && pp->length == ETH_ALEN && is_valid_ether_addr(pp->value)) {
> +		ether_addr_copy(addr, pp->value);

Mh, I guess this should rather be memcpy(addr, pp->value, ETH_ALEN) 
because
ether_addr_copy() needs 2 byte aligned source and destination buffers.

-michael
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
