Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF7768DA0
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:16:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC821C6C82C;
	Mon, 31 Jul 2023 07:16:21 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DB04C6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 06:26:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="453327535"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="453327535"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 23:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="727990182"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="727990182"
Received: from pglmail07.png.intel.com ([10.221.193.207])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jul 2023 23:26:54 -0700
Received: from localhost (pglc00300.png.intel.com [10.221.233.223])
 by pglmail07.png.intel.com (Postfix) with ESMTP id 84E504832;
 Fri, 21 Jul 2023 14:26:53 +0800 (+08)
Received: by localhost (Postfix, from userid 11742525)
 id 839CC80F8C4; Fri, 21 Jul 2023 14:26:53 +0800 (+08)
From: Boon@ecsmtp.png.intel.com, Khai@ecsmtp.png.intel.com,
 "Ng <boon.khai.ng"@intel.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 21 Jul 2023 14:26:16 +0800
Message-Id: <20230721062617.9810-2-boon.khai.ng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230721062617.9810-1-boon.khai.ng@intel.com>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:17 +0000
Cc: Boon Khai Ng <boon.khai.ng@intel.com>,
 Mun Yew Tham <mun.yew.tham@intel.com>,
 Leong Ching Swee <leong.ching.swee@intel.com>,
 G Thomas Rohan <rohan.g.thomas@intel.com>,
 Shevchenko Andriy <andriy.shevchenko@linux.intel.com>,
 Shevchenko Andriy <andriy.shevchenko@intel.com>
Subject: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature 1/2]
	dt-bindings: net: snps, dwmac: Add description for rx-vlan-offload
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

From: Boon Khai Ng <boon.khai.ng@intel.com>

This patch is to add the dts setting for the MAC controller on
synopsys 10G Ethernet MAC which allow the 10G MAC to turn on
hardware accelerated VLAN stripping. Once the hardware accelerated
VLAN stripping is turn on, the VLAN tag will be stripped by the
10G Ethernet MAC.

Signed-off-by: Boon Khai Ng <boon.khai.ng@intel.com>
Reviewed-by: Shevchenko Andriy <andriy.shevchenko@linux.intel.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index ddf9522a5dc2..905de37e861f 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -487,6 +487,11 @@ properties:
     description:
       Frequency division factor for MDC clock.
 
+  snps,rx-vlan-offload:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Enable hardware-accelerated RX VLAN stripping.
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
