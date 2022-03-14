Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4864D7C8B
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 08:57:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB293C628AB;
	Mon, 14 Mar 2022 07:57:25 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A130AC628A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 07:57:23 +0000 (UTC)
X-UUID: 49c98322db8e4929b6a34af11c90ad70-20220314
X-UUID: 49c98322db8e4929b6a34af11c90ad70-20220314
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1796742715; Mon, 14 Mar 2022 15:57:18 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Mar 2022 15:57:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Mar 2022 15:57:15 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, <angelogioacchino.delregno@collabora.com>
Date: Mon, 14 Mar 2022 15:57:06 +0800
Message-ID: <20220314075713.29140-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v13 0/7] MediaTek Ethernet Patches on
	MT8195
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

Changes in v13:
1. add reviewed-by in "net: dt-bindings: dwmac: add support for mt8195"
   as Rob's comments.
2. drop num_clks defined in mediatek_dwmac_plat_data struct in "stmmac:
   dwmac-mediatek: Reuse more common features" as Angelo's comments.

Changes in v12:
1. add a new patch "stmmac: dwmac-mediatek: re-arrange clock setting" to
   this series, to simplify clock handling in driver, which benefits to
   binding file mediatek-dwmac.yaml.
2. modify dt-binding description in patch "net: dt-bindings: dwmac: add
   support for mt8195" as Rob's comments in v10 series, put mac_cg to the
   end of clock list.
3. there are small changes in patch "stmmac: dwmac-mediatek: add support
   for mt8195", @AngeloGioacchino, please review it kindly.

Changes in v11:
1. add reivewed-by in "net: dt-bindings: dwmac: Convert mediatek-dwmac to
   DT schema" as Rob's comments.
2. fall back "net: dt-bindings: dwmac: add support for mt8195" to v8 version
   as mentioned in previous reply(https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20211216055328.15953-7-biao.huang@mediatek.com/):
   2.1 there is already a special clock named "rmii_internal", which need to
       be put to the end of the clock list(driver special handling),
       so we can't simply put new "mac_cg" for mt8195 to the end of the clock
       list.
   2.2 we prefer the if-then schema, which will make mt8195 clock list clearer
       with some duplicated information.
   2.3 we expect the future IC will follow mt2712 or mt8195, so we only need
       add new IC name to compatible list for future IC, and will not make the
       clock list binding files worse.

Changes in v10:
1. add detailed description in "arm64: dts: mt2712: update ethernet
   device node" to make the modifications clearer as Matthias's comments.
2. modify dt-binding description as Rob's comments, and "make dtbs_check" runs
   pass locally with "arm64: dts: mt2712: update ethernet device node"
   in this series.

Changes in v9:
1. remove oneOf for 1 entry as Rob's comments.
2. add new clocks to the end of existing clocks to simplify
   the binding as Rob's comments.

Changes in v8:
1. add acked-by in "stmmac: dwmac-mediatek: add platform level clocks
   management" patch

Changes in v7:
1. fix uninitialized warning as Jakub's comments.

Changes in v6:
1. update commit message as Jakub's comments.
2. split mt8195 eth dts patch("arm64: dts: mt8195: add ethernet device
   node") from this series, since mt8195 dtsi/dts basic patches is still
   under reviewing.
   https://patchwork.kernel.org/project/linux-mediatek/list/?series=579071
   we'll resend mt8195 eth dts patch once all the dependent patches are
   accepted.

Changes in v5:
1. remove useless inclusion in dwmac-mediatek.c as Angelo's comments.
2. add acked-by in "net-next: stmmac: dwmac-mediatek: add support for
   mt8195" patch

Changes in v4:
1. add changes in commit message in "net-next: dt-bindings: dwmac:
   Convert mediatek-dwmac to DT schema" patch.
2. remove ethernet-controller.yaml since snps,dwmac.yaml already include it.

Changes in v3:
1. Add prefix "net-next" to support new IC as Denis's suggestion.
2. Split dt-bindings to two patches, one for conversion, and the other for
   new IC.
3. add a new patch to update device node in mt2712-evb.dts to accommodate to
   changes in driver.
4. remove unnecessary wrapper as Angelo's suggestion.
5. Add acked-by in "net-next: stmmac: dwmac-mediatek: Reuse more common
   features" patch.

Changes in v2:
1. fix errors/warnings in mediatek-dwmac.yaml with upgraded dtschema tools

Changes in v1:
This series include 5 patches:
1. add platform level clocks management for dwmac-mediatek
2. resue more common features defined in stmmac_platform.c
3. add ethernet entry for mt8195

Biao Huang (7):
  stmmac: dwmac-mediatek: add platform level clocks management
  stmmac: dwmac-mediatek: Reuse more common features
  stmmac: dwmac-mediatek: re-arrange clock setting
  arm64: dts: mt2712: update ethernet device node
  net: dt-bindings: dwmac: Convert mediatek-dwmac to DT schema
  stmmac: dwmac-mediatek: add support for mt8195
  net: dt-bindings: dwmac: add support for mt8195

 .../bindings/net/mediatek-dwmac.txt           |  91 ----
 .../bindings/net/mediatek-dwmac.yaml          | 175 ++++++++
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts   |   1 +
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  14 +-
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 388 +++++++++++++++---
 5 files changed, 525 insertions(+), 144 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
 create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml

-- 
2.25.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
