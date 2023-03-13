Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AFD6B852D
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:51:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EACA1C6A617;
	Mon, 13 Mar 2023 22:51:23 +0000 (UTC)
Received: from post.baikalelectronics.com (post.baikalelectronics.com
 [213.79.110.86])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1162EC6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:51:22 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 2E4DEE0EBC;
 Tue, 14 Mar 2023 01:51:21 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 baikalelectronics.ru; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:from:from:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=post;
 bh=Y6oIna2GYsMa/tMSylL09FYzZvzOQ9lU2CFxdQGOfk0=; b=SKtYgXiuZg8S
 apeiyaaMAoOItS4nHGsGT8jBPqU1dYK1JbgTyXFxti7Ojg7do32VL0YqEt4XFiK2
 pfM82JbaZ0/G9zbTCQXLz06JusQB2qt1BNst8Aubak4/rko4X7Jvu77e2LUs6WPB
 mwRvjSNsFz50lqF06FtsQrT3c8Dsi5Y=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
 by post.baikalelectronics.com (Proxmox) with ESMTP id A1151E0EBB;
 Tue, 14 Mar 2023 01:51:20 +0300 (MSK)
Received: from localhost (10.8.30.10) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Tue, 14 Mar 2023 01:51:19 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 14 Mar 2023 01:50:56 +0300
Message-ID: <20230313225103.30512-10-Sergey.Semin@baikalelectronics.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-Originating-IP: [10.8.30.10]
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 09/16] dt-bindings: net: dwmac:
	Prohibit additional props in AXI-config
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

Currently DT-schema of the AXI-bus config sub-node prohibits to have
unknown properties by using the unevaluatedProperties property. It's
overkill for the sub-node which doesn't use any combining schemas
keywords (allOf, anyOf, etc). Instead more natural is to use
additionalProperties to prohibit for that.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 89be67e55c3e..d1b2910b799b 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -466,7 +466,6 @@ properties:
 
   stmmac-axi-config:
     type: object
-    unevaluatedProperties: false
     description:
       AXI BUS Mode parameters.
 
@@ -518,6 +517,8 @@ properties:
         description:
           rebuild INCRx Burst
 
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-- 
2.39.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
