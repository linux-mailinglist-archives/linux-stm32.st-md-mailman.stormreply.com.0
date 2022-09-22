Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2D5E5D74
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Sep 2022 10:29:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3390AC5EC56;
	Thu, 22 Sep 2022 08:29:27 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17539C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Sep 2022 08:29:25 +0000 (UTC)
X-UUID: c79b0294108243c1b360a754ca489968-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=eWT6NwkCN14h5TB+EPf73NJ/zNEFhEtNm5sSgc935zg=; 
 b=S1eTPjDUTNUv7S3uPlBLxFih6TcQvPEr2vLY9cP03DRCQSAFt0GJpNHRn2KFsExRVMtyot8KGfFHnd85HbYqpwFFlepNjhNa6mmfDjJ0TvEH86D1JhB+PWOlFBCYxyYPPf8KD0Bwbia5AgEaNJIHb3DQ2dSMcWNgoLFWpR3LbFw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:d9ec9872-9c13-4cb0-9883-0125139205bc, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:39a5ff1, CLOUDID:5539dee3-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c79b0294108243c1b360a754ca489968-20220922
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jianguo.zhang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1464567622; Thu, 22 Sep 2022 16:29:17 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Sep 2022 16:29:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Thu, 22 Sep 2022 16:29:15 +0800
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 22 Sep 2022 16:29:04 +0800
Message-ID: <20220922082906.800-1-jianguo.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jianguo Zhang <jianguo.zhang@mediatek.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/2] Mediatek ethernet patches for mt8188
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

Changes in v4:

v4:
1) Update the commit message of patch 'dt-bindings: net: snps,dwmac: add clk_csr property'
as Krzysztof Kozlowski'comment.

v3:
1) List the names of SoCs mt8188 and mt8195 in correct order as
AngeloGioacchino Del Regno's comment.
2) Add patch version info as Krzysztof Kozlowski'comment.

v2:
1) Delete patch 'stmmac: dwmac-mediatek: add support for mt8188' as
Krzysztof Kozlowski's comment.
2) Update patch 'dt-bindings: net: mediatek-dwmac: add support for
mt8188' as Krzysztof Kozlowski's comment.
3) Add clk_csr property to fix warning ('clk_csr' was unexpected) when
runnig 'make dtbs_check'.

Jianguo Zhang (2):
  dt-bindings: net: mediatek-dwmac: add support for mt8188
  dt-bindings: net: snps,dwmac: add clk_csr property

 .../devicetree/bindings/net/mediatek-dwmac.yaml        | 10 ++++++++--
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  |  5 +++++
 2 files changed, 13 insertions(+), 2 deletions(-)

--
2.25.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
