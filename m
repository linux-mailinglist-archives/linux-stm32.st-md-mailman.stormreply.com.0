Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 885386B8532
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:51:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F477C6A60F;
	Mon, 13 Mar 2023 22:51:29 +0000 (UTC)
Received: from post.baikalelectronics.com (post.baikalelectronics.com
 [213.79.110.86])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFC44C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:51:28 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 50FC9E0EBF;
 Tue, 14 Mar 2023 01:51:28 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 baikalelectronics.ru; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:from:from:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=post;
 bh=KQsws9NtBO6QlsruSY3+0FhvjbX+2h0WTEcfdAMql2o=; b=rsHkLLEACOd4
 MLMrh1uCsrIY/0keomOkDe34risa0j+VGgK0mFNltJnIQ2RNaDlyf3jHNG1GxRWV
 5Is6De4IdjTJkSxBjP4OuW1NdPtcpiBer0uz6ngIRdKEY9ypUW1D1LIAYIxXgh9S
 voPHE4s6yX7qOx+EheLu5ZNtdKtBNJo=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 0FADBE0E6A;
 Tue, 14 Mar 2023 01:51:28 +0300 (MSK)
Received: from localhost (10.8.30.10) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Tue, 14 Mar 2023 01:51:27 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joao Pinto
 <Joao.Pinto@synopsys.com>
Date: Tue, 14 Mar 2023 01:51:00 +0300
Message-ID: <20230313225103.30512-14-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH net-next 13/16] dt-bindings: net: dwmac: Fix
	MTL Tx Queue props description
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

Invalid MTL Tx Queues DT-properties description was added right at the
initial DCB/AVB features patch. Most likely due to copy-paste mistake the
text currently matches to what is specified for the AXI-bus config
properties. Let's fix that by providing correct descriptions for MTL Tx
Queue DT-properties utilized for the AVB feature (CBS algorithm) tuning.

Fixes: 19d918731797 ("net: stmmac: configuration of CBS in case of a TX AVB queue")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2ebf7995426b..69be39d55403 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -321,25 +321,37 @@ properties:
               available in this queue.
           snps,send_slope:
             $ref: /schemas/types.yaml#/definitions/uint32
-            description: enable Low Power Interface
+            description:
+              Send-Slope credit value subtracted from the accumulated credit
+              in the Queue for the Audio/Video bridging traffic. This is the
+              rate of the credit change in bits per cycle (40 ns, 8 ns and
+              3.2 ns for 100 Mbps, 1000 Mbps and 2.5/10 Gbps respectively).
             minimum: 0
             maximum: 0x3FFF
 
           snps,idle_slope:
             $ref: /schemas/types.yaml#/definitions/uint32
-            description: unlock on WoL
+            description:
+              Idle-Slope credit value added to the accumulated credit in the
+              Queue with the Audio/Video bridging enabled. This is the
+              rate of the credit change in bits per cycle (40 ns, 8 ns and
+              3.2 ns for 100 Mbps, 1000 Mbps and 2.5/10 Gbps respectively).
             minimum: 0
             maximum: 0x8000
 
           snps,high_credit:
             $ref: /schemas/types.yaml#/definitions/uint32
-            description: max write outstanding req. limit
+            description:
+              Maximum value accumulated in the credit parameter for the
+              Audio/Video bridging feature (specified in bits scaled by 1,024).
             minimum: 0
             maximum: 0x1FFFFFFF
 
           snps,low_credit:
             $ref: /schemas/types.yaml#/definitions/uint32
-            description: max read outstanding req. limit
+            description:
+              Minimum value accumulated in the credit parameter for the
+              Audio/Video bridging feature (specified in bits scaled by 1,024).
             minimum: 0
             maximum: 0x1FFFFFFF
 
-- 
2.39.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
