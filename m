Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B563C5BF700
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Sep 2022 09:07:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59FBAC63326;
	Wed, 21 Sep 2022 07:07:42 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C7FFC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 07:07:40 +0000 (UTC)
X-UUID: 1aafac2bdd3a4619b4ba35014d9860d6-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RMD29Ra4Jz3s1p56HqwicqaG3GxhdMLLR3XQP6YPipw=; 
 b=Y0HbZ9W0dmDktbpRu9/Jhqg6HZTbAlbVK5c4ohL536tVAmv8v4SXJlOoYQ+3T+B6ZVTIW2rL2DTFF2YK/NIycGJqcE73/Q7Hzv4RgUUO8SS2Jq2UCjSq1RTSbqh+krwXK5KEEGxSALKTXK6wfdbGBO9G4t5soHlSbJWAVFZThPw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:d3eeaa46-d627-4638-ac1a-05bd4e567f2b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.11, REQID:d3eeaa46-d627-4638-ac1a-05bd4e567f2b, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:39a5ff1, CLOUDID:b96022f7-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:220920163629Q6TKKLW6,BulkQuantity:68,Recheck:0,SF:28|17|19|48|823|82
 4,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:41,QS:nil,BEC:nil,COL
 :0
X-UUID: 1aafac2bdd3a4619b4ba35014d9860d6-20220921
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jianguo.zhang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 597386031; Wed, 21 Sep 2022 15:07:36 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 15:07:35 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Wed, 21 Sep 2022 15:07:34 +0800
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 21 Sep 2022 15:07:21 +0800
Message-ID: <20220921070721.19516-3-jianguo.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921070721.19516-1-jianguo.zhang@mediatek.com>
References: <20220921070721.19516-1-jianguo.zhang@mediatek.com>
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
Subject: [Linux-stm32] [PATCH v3 2/2] dt-bindings: net: snps,
	dwmac: add clk_csr property
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

Add clk_csr property for snps,dwmac

Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 491597c02edf..8cff30a8125d 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -288,6 +288,11 @@ properties:
       is supported. For example, this is used in case of SGMII and
       MAC2MAC connection.
 
+  clk_csr:
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
