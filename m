Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 897CF779770
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Aug 2023 21:01:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DAD3C6B474;
	Fri, 11 Aug 2023 19:01:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 242FBC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 19:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691780470; x=1723316470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JvC5ybwWd2s2QwBOcdZZsCQYPiTGu+dFmBHjemTdC1g=;
 b=WhM71dR3uG4fnCje81K0a8IGpTsnlroDgLscfuzodu9KJl/buesRp8Bb
 MnPS3/VrVQGoKNShBXeEcrDorESd2qJWZcq69hh0RRJsLtIkbqxZ7LnyD
 63Pe78ZyNJyKKruvsM0Qw6+E8J5dH2RE11oUcMxQChixKv+IasQ9q0e0F
 y7Ixkr40eCVIQViFxdWEEZ9VW6PUnwjez3dKGG+OwCv0lVaJaFhLNr/b3
 81W3cBQplM8woHgqqZ3rRuQ+AXntDXQbK+JEaRibnq0a7E9lfHXTR9t/q
 kLiyEaHe9hvhAdA+gJDuRXCfmak2k4xDu6cWfgPKOuLG26q9SBVC/fNEw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402718878"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="402718878"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 12:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="802768053"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="802768053"
Received: from pglc00052.png.intel.com ([10.221.207.72])
 by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2023 12:00:44 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Date: Sat, 12 Aug 2023 03:00:31 +0800
Message-Id: <20230811190032.13391-2-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20230811190032.13391-1-rohan.g.thomas@intel.com>
References: <20230810150328.19704-1-rohan.g.thomas@intel.com>
 <20230811190032.13391-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 1/2] dt-bindings: net: snps,
	dwmac: Tx queues with coe
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

Add dt-bindings for the number of tx queues with coe support. Some
dwmac IPs support tx queues only for a few initial tx queues,
starting from tx queue 0.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index ddf9522a5dc2..0c6431c10cf9 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -313,6 +313,9 @@ properties:
       snps,tx-queues-to-use:
         $ref: /schemas/types.yaml#/definitions/uint32
         description: number of TX queues to be used in the driver
+      snps,tx-queues-with-coe:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: number of TX queues that support TX checksum offloading
       snps,tx-sched-wrr:
         type: boolean
         description: Weighted Round Robin
-- 
2.19.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
