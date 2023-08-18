Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC1E780D09
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 15:54:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E994C6B476;
	Fri, 18 Aug 2023 13:54:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58702C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 13:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692366848; x=1723902848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V1ASKrWZR21qiCs/uTkTgFEuUcWckcx/+Gm2AG2f6Q8=;
 b=XqoBrMELYdDqbUKCB8RN6mquBC5mN+wOINU+EvwsiflFZ7xauuXop8zd
 Kq9BoekbksKkypfKV/pe06/QX8S16pYoQaIJfhIsZp1x/U3ffF/4F068I
 jWNsBTa3n2MuS5HcZiV7MDmzKs4oxw2urHDEbFpFTbNH/JuRn/zSFuS3i
 2nWglLOeIZmYrIvVIXYg6cz1c2rpxrC2wiE20+DJKbUYH4Uely2P4Tc9n
 MsmkzvzcxOqxc+WWi7I549Nd7njy7B+7GB3MiPHE3ryCiKbMWO/Dav1Dk
 2Spie2UCrmwsRvpg1Vhfrb71qCj2V47XCKn63Wg1UQhWCCRmxfz5faAju g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="353408016"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="353408016"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 06:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="849307154"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="849307154"
Received: from pglc00067.png.intel.com ([10.221.207.87])
 by fmsmga002.fm.intel.com with ESMTP; 18 Aug 2023 06:53:59 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 18 Aug 2023 21:53:49 +0800
Message-Id: <20230818135350.12474-2-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230818135350.12474-1-rohan.g.thomas@intel.com>
References: <20230818135350.12474-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 1/2] dt-bindings: net: snps,
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
