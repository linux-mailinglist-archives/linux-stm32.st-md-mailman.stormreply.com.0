Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E485ED873
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 11:11:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BFF3C63328;
	Wed, 28 Sep 2022 09:11:12 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F03CFC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 09:11:09 +0000 (UTC)
X-UUID: ae273e35f070465191b2fe17ce823d33-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oVDBocalE6iH6BUbpNZ/+kTn1nGjDCnsZXt//IzMZh0=; 
 b=nkgCDgzMoNixQtKEs1r+wppzlL06n2cfZ0VPbSFYkkDVAwBWsjc/jmHrX4cf1y+xrVjlmp7JO/tfcY64/mM9l1VsaR5leLezcJPRddQ3Bj8S3liE41H3U6RfEati2IR2XXYgPq00bK8emoeHgFQjyDzVcpk6SCoBZW0tGQ2cGIk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:adab7f3b-c441-491e-a1b7-720f8314b9c7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.11, REQID:adab7f3b-c441-491e-a1b7-720f8314b9c7, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:39a5ff1, CLOUDID:a92982e4-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:220928171106ITR6S7KD,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ae273e35f070465191b2fe17ce823d33-20220928
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jianguo.zhang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 456801257; Wed, 28 Sep 2022 17:11:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 17:11:04 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Sep 2022 17:11:03 +0800
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 28 Sep 2022 17:10:50 +0800
Message-ID: <20220928091052.18490-3-jianguo.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220928091052.18490-1-jianguo.zhang@mediatek.com>
References: <20220928091052.18490-1-jianguo.zhang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jianguo Zhang <jianguo.zhang@mediatek.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 2/4] dt-bindings: net: snps,
	dwmac: add new property snps, clk-csr
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

Add description for new property snps,clk-csr in binding file

Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 491597c02edf..4d5a56661322 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -288,6 +288,11 @@ properties:
       is supported. For example, this is used in case of SGMII and
       MAC2MAC connection.
 
+  snps,clk-csr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Frequency division factor for MDC clock.
+
   mdio:
     $ref: mdio.yaml#
     unevaluatedProperties: false
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
