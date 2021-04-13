Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D8E35E86A
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 23:40:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34984C57B78;
	Tue, 13 Apr 2021 21:40:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8401CC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 21:40:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B20D2613B6;
 Tue, 13 Apr 2021 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618350012;
 bh=toVub+slEHyxpan1zl2EKjAs+n9L+DqJjmVyXdpSda8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pRV3XRV88aPlnwLClx5LDM21mdefxIbRGFcsOMAWKDGAPSf1o7HWMcUJArQ3XXTo2
 omQ7Z2UBYmJ/4VEgdmDWMtz3nLyeoWfPZMbM/epzVuNn/dfLkNcaqGX/sQ3OpMjUBS
 bAKgZugFWBnTeaINp8LqtfjdEpx90+cwvi+asWJoSAi80GbrFagrnhafBEMs9d/q64
 V1GuK22jWWyeImHuDUYrsXisI7HOHaVrq3GZpA1n6OF84dCG4EQ57enrHgZGDRNpgk
 +wx2yJOLG9rxC5gEKrr9mBBot2pLRQqzLRJSzYPRKCwgwQuIOp0m7AJtIXo8z3kOIr
 TcOoK6hf+PaXg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9A519609B9;
 Tue, 13 Apr 2021 21:40:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161835001262.18297.4500601910911096840.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 21:40:12 +0000
References: <20210412174718.17382-1-michael@walle.cc>
In-Reply-To: <20210412174718.17382-1-michael@walle.cc>
To: Michael Walle <michael@walle.cc>
Cc: andrew@lunn.ch, benh@kernel.crashing.org, paulus@samba.org,
 rafal@milecki.pl, nobuhiro1.iwamatsu@toshiba.co.jp,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 mpe@ellerman.id.au, narmstrong@baylibre.com, michal.simek@xilinx.com,
 joabreu@synopsys.com, linux-imx@nxp.com, Mark-MC.Lee@mediatek.com,
 hauke@hauke-m.de, s.hauer@pengutronix.de, lorenzo.bianconi83@gmail.com,
 linux-omap@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, olteanv@gmail.com, claudiu.beznea@microchip.com,
 jerome.pouiller@silabs.com, hayashi.kunihiko@socionext.com,
 chris.snook@gmail.com, pantelis.antoniou@gmail.com, joyce.ooi@intel.com,
 gregory.clement@bootlin.com, madalin.bucur@nxp.com,
 martin.blumenstingl@googlemail.com, m-karicheri2@ti.com,
 yisen.zhuang@huawei.com, alexandre.torgue@st.com, w-kwok2@ti.com,
 sean.wang@mediatek.com, mripard@kernel.org, claudiu.manoil@nxp.com,
 linux-amlogic@lists.infradead.org, kvalo@codeaurora.org, mlindner@marvell.com,
 fugang.duan@nxp.com, bryan.whitehead@microchip.com,
 ath9k-devel@qca.qualcomm.com, UNGLinuxDriver@microchip.com,
 tchornyi@marvell.com, mcoquelin.stm32@gmail.com, khilman@baylibre.com,
 hkallweit1@gmail.com, andreas@gaisler.com, peppe.cavallaro@st.com,
 festevam@gmail.com, stf_xl@wp.pl, f.fainelli@gmail.com, frowand.list@gmail.com,
 linux-staging@lists.linux.dev, wens@csie.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 grygorii.strashko@ti.com, bh74.an@samsung.com, radhey.shyam.pandey@xilinx.com,
 vz@mleia.com, john@phrozen.org, salil.mehta@huawei.com,
 sergei.shtylyov@gmail.com, linux-oxnas@groups.io, shawnguo@kernel.org,
 davem@davemloft.net, helmut.schaa@googlemail.com, thomas.petazzoni@bootlin.com,
 linux-renesas-soc@vger.kernel.org, ryder.lee@mediatek.com,
 linux@armlinux.org.uk, vkochan@marvell.com, kuba@kernel.org,
 vivien.didelot@gmail.com, sgoutham@marvell.com,
 sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jernej.skrabec@siol.net, netdev@vger.kernel.org, nicolas.ferre@microchip.com,
 leoyang.li@nxp.com, stephen@networkplumber.org, vkoul@kernel.org,
 linuxppc-dev@lists.ozlabs.org, nbd@nbd.name
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/2] of: net: support
 non-platform devices in of_get_mac_address()
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

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Mon, 12 Apr 2021 19:47:16 +0200 you wrote:
> of_get_mac_address() is commonly used to fetch the MAC address
> from the device tree. It also supports reading it from a NVMEM
> provider. But the latter is only possible for platform devices,
> because only platform devices are searched for a matching device
> node.
> 
> Add a second method to fetch the NVMEM cell by a device tree node
> instead of a "struct device".
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] of: net: pass the dst buffer to of_get_mac_address()
    https://git.kernel.org/netdev/net-next/c/83216e3988cd
  - [net-next,v4,2/2] of: net: fix of_get_mac_addr_nvmem() for non-platform devices
    https://git.kernel.org/netdev/net-next/c/f10843e04a07

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
