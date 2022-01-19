Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E4649323F
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jan 2022 02:21:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38640C5EC57;
	Wed, 19 Jan 2022 01:21:25 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9865C5C82B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jan 2022 01:21:23 +0000 (UTC)
X-UUID: bf9e6ac19536479c95c34f0e9dfed317-20220119
X-UUID: bf9e6ac19536479c95c34f0e9dfed317-20220119
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2129486808; Wed, 19 Jan 2022 09:21:18 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 19 Jan 2022 09:21:17 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 09:21:16 +0800
Message-ID: <c6f990fdf047eb90acaeb29f9f9b2941d6b7bf30.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 19 Jan 2022 09:21:15 +0800
In-Reply-To: <1642433742.934070.3923086.nullmailer@robh.at.kernel.org>
References: <20220117070706.17853-1-biao.huang@mediatek.com>
 <20220117070706.17853-8-biao.huang@mediatek.com>
 <1642433742.934070.3923086.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, dkirjanov@suse.de,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v12 7/7] net: dt-bindings: dwmac:
 add support for mt8195
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

Dear Rob,
	Thanks for your comments.

	If patch "[PATCH net-next v12 4/7] arm64: dts: mt2712: update
ethernet device node" is applied with dt-binding patches, "make
dtbs_check" will not report 
such warnings.
	Please review it kindly, thanks.

On Mon, 2022-01-17 at 09:35 -0600, Rob Herring wrote:
> On Mon, 17 Jan 2022 15:07:06 +0800, Biao Huang wrote:
> > Add binding document for the ethernet on mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.yaml          | 28
> > ++++++++++++++++---
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for
> dtbs_check.
> This will change in the future.
> 
> Full log is available here: 
> https://patchwork.ozlabs.org/patch/1580608
> 
> 
> ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref']
> is too short
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]]
> is too short
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not
> contain items matching the given schema
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: compatible: 'oneOf' conditional failed, one must
> be fixed:
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: Unevaluated properties are not allowed
> ('compatible', 'reg', 'interrupts', 'interrupt-names', 'mac-address', 
> 'clock-names', 'clocks', 'power-domains', 'snps,axi-config',
> 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,txpbl',
> 'snps,rxpbl', 'clk_csr', 'phy-mode', 'phy-handle', 'snps,reset-gpio', 
> 'mdio' were unexpected)
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
