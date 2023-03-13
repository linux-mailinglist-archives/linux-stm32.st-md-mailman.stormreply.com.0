Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF36B852E
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:51:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AA68C6A61A;
	Mon, 13 Mar 2023 22:51:25 +0000 (UTC)
Received: from post.baikalelectronics.com (post.baikalelectronics.com
 [213.79.110.86])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3DA9C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:51:22 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 5CF5CE0EBB;
 Tue, 14 Mar 2023 01:51:22 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 baikalelectronics.ru; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:from:from:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=post;
 bh=/8CHQKcSQNOd84jUFb0GyleIApZIHIOE6ipgEgcboPQ=; b=ZuW2NnJXGaCa
 c8rmEbdZS4jhKDKbFuLmgLUJ+xIQ3xyiHEkmBOC7PdC6lZ7b+c5VFWNEbQPmZX/r
 BJAccZwbsCKjZvg5sCodLLvxDU7/kYeB0NoZnb+fLzdRMC1+gNOzYG+fYnWWmvKc
 TVssdaQGDKLUn6Eam7qkE2qryHILJKM=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 3DF24E0E6A;
 Tue, 14 Mar 2023 01:51:22 +0300 (MSK)
Received: from localhost (10.8.30.10) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Tue, 14 Mar 2023 01:51:21 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 14 Mar 2023 01:50:57 +0300
Message-ID: <20230313225103.30512-11-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH net-next 10/16] dt-bindings: net: dwmac: Add
	AXI-bus properties constraints
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

Currently none of the AXI-bus non-boolean DT-properties have constraints
defined meanwhile they can be specified at least based on the
corresponding device configs. Let's do that:
+ snps,wr_osr_lm/snps,rd_osr_lmt - maximum number of outstanding AXI-bus
read/write requests is limited with the IP-core synthesize parameter
AXI_MAX_{RD,WR}_REQ. DW MAC/GMAC: <= 16, DW Eth QoS: <= 32, DW xGMAC: <=
64. The least restrictive constraint is defined since the DT-schema is
common for all IP-cores.
+ snps,blen - array of the burst lengths supported by the AXI-bus. Values
are limited by the AXI3/4 bus standard, available AXI/System bus CSR flags
and the AXI-bus IP-core synthesize config . All DW *MACs support setting
the burst length within the set: 4, 8, 16, 32, 64, 128, 256. If some burst
length is unsupported a zero value can be specified instead in the array.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index d1b2910b799b..f24718a8d184 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -484,11 +484,17 @@ properties:
         $ref: /schemas/types.yaml#/definitions/uint32
         description:
           max write outstanding req. limit
+        default: 1
+        minimum: 1
+        maximum: 64
 
       snps,rd_osr_lmt:
         $ref: /schemas/types.yaml#/definitions/uint32
         description:
           max read outstanding req. limit
+        default: 1
+        minimum: 1
+        maximum: 64
 
       snps,kbbe:
         $ref: /schemas/types.yaml#/definitions/uint32
@@ -501,6 +507,8 @@ properties:
           this is a vector of supported burst length.
         minItems: 7
         maxItems: 7
+        items:
+          enum: [256, 128, 64, 32, 16, 8, 4, 0]
 
       snps,fb:
         $ref: /schemas/types.yaml#/definitions/flag
-- 
2.39.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
