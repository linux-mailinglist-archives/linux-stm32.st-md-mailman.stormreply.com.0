Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9C4D3049
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Mar 2022 14:47:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 904E4C6049D;
	Wed,  9 Mar 2022 13:47:14 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54E14C60496
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Mar 2022 13:47:13 +0000 (UTC)
X-UUID: 8fe63ee1be564275bcb1df18153af3ab-20220309
X-UUID: 8fe63ee1be564275bcb1df18153af3ab-20220309
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1564107274; Wed, 09 Mar 2022 21:47:06 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 9 Mar 2022 21:47:05 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Mar 2022 21:47:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 21:47:04 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Wed, 9 Mar 2022 21:46:58 +0800
Message-ID: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, Fabien Parent <fparent@baylibre.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK Hu <ck.hu@mediatek.com>,
 moudy.ho@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] Fix MediaTek display dt-bindings issues
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

The vdosys0 series carried a nice dt-bindings conversion of the old
txt documentation for the entire mediatek-drm driver, but some of
the issues in there weren't seen.

This series is fixing all of the issues pointed out by a
`dt_binding_check` run, followed by `dtbs_check`.

Change in v2:
- remove mediatek,ethdr.yaml file
- change include header of mediatek,ovl-2l.yaml from mt8173 to mt8183

AngeloGioacchino Del Regno (3):
  dt-bindings: display: mediatek, mutex: Fix mediatek, gce-events type
  dt-bindings: display: mediatek, ovl: Fix 'iommu' required property
    typo
  dt-bindings: display: mediatek: Fix examples on new bindings

jason-jh.lin (1):
  Revert "dt-bindings: display: mediatek: add ethdr definition for
    mt8195"

 .../display/mediatek/mediatek,aal.yaml        |  23 ++-
 .../display/mediatek/mediatek,ccorr.yaml      |  23 ++-
 .../display/mediatek/mediatek,color.yaml      |  23 ++-
 .../display/mediatek/mediatek,dither.yaml     |  23 ++-
 .../display/mediatek/mediatek,dpi.yaml        |   3 +-
 .../display/mediatek/mediatek,dsc.yaml        |  23 ++-
 .../display/mediatek/mediatek,ethdr.yaml      | 147 ------------------
 .../display/mediatek/mediatek,gamma.yaml      |  23 ++-
 .../display/mediatek/mediatek,merge.yaml      |  49 +++---
 .../display/mediatek/mediatek,mutex.yaml      |  27 ++--
 .../display/mediatek/mediatek,od.yaml         |  14 +-
 .../display/mediatek/mediatek,ovl-2l.yaml     |  26 +++-
 .../display/mediatek/mediatek,ovl.yaml        |  28 ++--
 .../display/mediatek/mediatek,postmask.yaml   |  23 ++-
 .../display/mediatek/mediatek,rdma.yaml       |  28 ++--
 .../display/mediatek/mediatek,split.yaml      |  17 +-
 .../display/mediatek/mediatek,ufoe.yaml       |  19 ++-
 .../display/mediatek/mediatek,wdma.yaml       |  26 +++-
 18 files changed, 262 insertions(+), 283 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml

-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
