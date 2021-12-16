Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D1476769
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 02:28:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56EA7C5E2C5;
	Thu, 16 Dec 2021 01:28:22 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42101C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 01:28:19 +0000 (UTC)
X-UUID: aba171f221004e379e61fc097ed129d2-20211216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lPwZ/wiMhF2SlW3zUGCuz9quzus0l5KZmaU6H+G/S3Y=; 
 b=TBs2DTvlLhImgc7m8teAN9YfbsHuZPgnKbbdPUhla142rf0sOnm7ic9YChJu/XOUp5aQW4EduUXlszgipk82dEAH2IKnrbh8keZpZ4v8DftZx8MPzs6DTDI68B8O3+Xr/kLLNyxGYj5YZt22CRu8pd1lxtgNXdFzmxtOwidvKvg=;
X-UUID: aba171f221004e379e61fc097ed129d2-20211216
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1130924326; Thu, 16 Dec 2021 09:28:14 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Dec 2021 09:28:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Dec 2021 09:28:12 +0800
Message-ID: <c320d912b4569363514390718e2a81f565f9e225.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 16 Dec 2021 09:28:13 +0800
In-Reply-To: <c9b3d31a-1c18-32ec-8077-603bb93fe8d0@gmail.com>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-4-biao.huang@mediatek.com>
 <c9b3d31a-1c18-32ec-8077-603bb93fe8d0@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, dkirjanov@suse.de,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v8 3/6] arm64: dts: mt2712:
 update ethernet device node
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

Dear Matthias,
	Thanks for your comments~
On Wed, 2021-12-15 at 20:22 +0100, Matthias Brugger wrote:
> 
> On 10/12/2021 02:31, Biao Huang wrote:
> > Since there are some changes in ethernet driver,
> > update ethernet device node in dts to accommodate to it.
> > 
> 
> I have a hard time to understand how the first two patches are
> related to this 
> one. Please be more specific in your commit message.
This dts patch is not related to previous two patches in this series.

Actually, this patch should be sent with commit
"71a55a2315b047352b3d65e2d24724207be85ae2", which added extra RMII
support in driver. But unfortunately, we missed it out.

Is there any proper way to relate this patch to commit
"71a55a2315b047352b3d65e2d24724207be85ae2"? (Fixed tag seems not a good
choice, or just add more details in commit message?)
>  
> Also please beware that we should make sure that a newer driver
> version should 
> still work properly with an older device tree, which does not have
> your changes.
> 
> Regards,
> Matthias
> 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt2712-evb.dts |  1 +
> >   arch/arm64/boot/dts/mediatek/mt2712e.dtsi   | 14 +++++++++-----
> >   2 files changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > index 7d369fdd3117..11aa135aa0f3 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > @@ -110,6 +110,7 @@ &eth {
> >   	phy-handle = <&ethernet_phy0>;
> >   	mediatek,tx-delay-ps = <1530>;
> >   	snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> > +	snps,reset-delays-us = <0 10000 10000>;
> >   	pinctrl-names = "default", "sleep";
> >   	pinctrl-0 = <&eth_default>;
> >   	pinctrl-1 = <&eth_sleep>;
> > diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> > index a9cca9c146fd..9e850e04fffb 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> > @@ -726,7 +726,7 @@ queue2 {
> >   	};
> >   
> >   	eth: ethernet@1101c000 {
> > -		compatible = "mediatek,mt2712-gmac";
> > +		compatible = "mediatek,mt2712-gmac", "snps,dwmac-
> > 4.20a";
> >   		reg = <0 0x1101c000 0 0x1300>;
> >   		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> >   		interrupt-names = "macirq";
> > @@ -734,15 +734,19 @@ eth: ethernet@1101c000 {
> >   		clock-names = "axi",
> >   			      "apb",
> >   			      "mac_main",
> > -			      "ptp_ref";
> > +			      "ptp_ref",
> > +			      "rmii_internal";
> >   		clocks = <&pericfg CLK_PERI_GMAC>,
> >   			 <&pericfg CLK_PERI_GMAC_PCLK>,
> >   			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > -			 <&topckgen CLK_TOP_ETHER_50M_SEL>;
> > +			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > +			 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> >   		assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > -				  <&topckgen CLK_TOP_ETHER_50M_SEL>;
> > +				  <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > +				  <&topckgen
> > CLK_TOP_ETHER_50M_RMII_SEL>;
> >   		assigned-clock-parents = <&topckgen
> > CLK_TOP_ETHERPLL_125M>,
> > -					 <&topckgen CLK_TOP_APLL1_D3>;
> > +					 <&topckgen CLK_TOP_APLL1_D3>,
> > +					 <&topckgen
> > CLK_TOP_ETHERPLL_50M>;
> >   		power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
> >   		mediatek,pericfg = <&pericfg>;
> >   		snps,axi-config = <&stmmac_axi_setup>;
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
