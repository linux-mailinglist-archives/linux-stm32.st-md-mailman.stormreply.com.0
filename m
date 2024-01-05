Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0FA824EF3
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 08:09:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A21F8C6C83C;
	Fri,  5 Jan 2024 07:09:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 517F4C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704438591; x=1735974591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wc3WOZrrvj/mfsHMCsBQFT+YmKFZV9lPnzebZ6PYOJs=;
 b=kr+uLRS1si3aZKDSgIP+LQOS/4zwXmCz7NPRpBKE+5pcvinbfAvLkbgL
 jPvBEhIxci7SBGFWJxG4BZA5D3w7PS5O2rxhMHpyMXGPlz6RtXOM4S/cF
 SS/XEBkRM8kwQX7COBcyhHfIfyWSKx0QV0dxVTpD07a/02Te6zwmZcVN6
 J9uDem1Q5wCntQQmVIIenI9o2gIII+pd9P7L6KEy7b/qCDfZjPQlVTAPh
 ZCSwMH1DmrumDjVU2pSny+D72i+2FhG0PRJmgjBnLd41/qoZTz1M5YlIt
 jhV6ccjgQQwH1Mi6PLC5aoIUo6kl3URXES+VELSQ9kxpC1wdcVZIoC3iy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="463845827"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="463845827"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 23:09:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="871167265"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="871167265"
Received: from pg-esw-build.png.intel.com ([10.226.214.65])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Jan 2024 23:09:46 -0800
From: Leong Ching Swee <leong.ching.swee@intel.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri,  5 Jan 2024 15:09:22 +0800
Message-Id: <20240105070925.2948871-2-leong.ching.swee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105070925.2948871-1-leong.ching.swee@intel.com>
References: <20240105070925.2948871-1-leong.ching.swee@intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Swee Leong Ching <leong.ching.swee@intel.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/4] dt-bindings: net: snps,
	dwmac: per channel irq
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

From: Swee Leong Ching <leong.ching.swee@intel.com>

Add dt-bindings for per channel irq.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
Signed-off-by: Swee Leong Ching <leong.ching.swee@intel.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 5c2769dc689a..e72dded824f4 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -103,17 +103,27 @@ properties:
 
   interrupts:
     minItems: 1
-    items:
-      - description: Combined signal for various interrupt events
-      - description: The interrupt to manage the remote wake-up packet detection
-      - description: The interrupt that occurs when Rx exits the LPI state
+    maxItems: 19
 
   interrupt-names:
     minItems: 1
+    maxItems: 19
     items:
-      - const: macirq
-      - enum: [eth_wake_irq, eth_lpi]
-      - const: eth_lpi
+      oneOf:
+        - description: Combined signal for various interrupt events
+          const: macirq
+        - description: The interrupt to manage the remote wake-up packet detection
+          const: eth_wake_irq
+        - description: The interrupt that occurs when Rx exits the LPI state
+          const: eth_lpi
+        - description: DMA Tx per-channel interrupt
+          pattern: '^dma_tx[0-7]?$'
+        - description: DMA Rx per-channel interrupt
+          pattern: '^dma_rx[0-7]?$'
+
+    allOf:
+      - contains:
+          const: macirq
 
   clocks:
     minItems: 1
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
