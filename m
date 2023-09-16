Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C23007A2E39
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Sep 2023 08:33:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C0C3C6B47F;
	Sat, 16 Sep 2023 06:33:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C4F7C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Sep 2023 06:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694846009; x=1726382009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=52OjBIdYros6Vg0OVslLmr8CvSafvNPl+icnhq/BIUM=;
 b=LzHu/POpWkK2iB5n0sXyg7jZ/ueP/CiiQoayd9bPUt4sKAmey8KyXVs9
 SBDlVFpR9NpZd6+N2Q5lSBo9npG1ezrZN8+p1j7VTrIhahX8mKPHNMYUv
 xKDRMVhbDY/KplZrMmHGO5LBrlsWCkQW3loMSDL00AT4oUSxykmN7tC0Z
 FAQfdUa7F6E3BR9wOm3HQGLkroZrqqWi5rAaOV93w17+YY9eHN61+f9z6
 HLThC7GHgzbx2CIuEBQKw3uilxEtNtUpL/Y9uEftqM45DkZSOWOe1dywA
 0sxKbS3gIxKiusMY6wJwstum4NDNamkgFy0MsAc8GeSE0fJGbqOJAgDwr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359637799"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; d="scan'208";a="359637799"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 23:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="780351413"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; d="scan'208";a="780351413"
Received: from pglc00032.png.intel.com ([10.221.207.52])
 by orsmga001.jf.intel.com with ESMTP; 15 Sep 2023 23:33:21 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, fancer.lancer@gmail.com
Date: Sat, 16 Sep 2023 14:33:11 +0800
Message-Id: <20230916063312.7011-2-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230916063312.7011-1-rohan.g.thomas@intel.com>
References: <20230916063312.7011-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 1/2] dt-bindings: net: snps,
	dwmac: Tx coe unsupported
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

Add dt-bindings for coe-unsupported property per tx queue. Some DWMAC
IPs support tx checksum offloading(coe) only for a few tx queues.

DW xGMAC IP can be synthesized such that it can support tx coe only
for a few initial tx queues. Also as Serge pointed out, for the DW
QoS IP tx coe can be individually configured for each tx queue. This
property is added to have sw fallback for checksum calculation if a
tx queue doesn't support tx coe.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index ddf9522a5dc2..5c2769dc689a 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -394,6 +394,11 @@ properties:
               When a PFC frame is received with priorities matching the bitmask,
               the queue is blocked from transmitting for the pause time specified
               in the PFC frame.
+
+          snps,coe-unsupported:
+            type: boolean
+            description: TX checksum offload is unsupported by the TX queue.
+
         allOf:
           - if:
               required:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
