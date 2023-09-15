Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A17447A1B52
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Sep 2023 11:54:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 624D9C6B477;
	Fri, 15 Sep 2023 09:54:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCA19C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Sep 2023 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694771679; x=1726307679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SNz9ScF+wt804GivI3ixasEzsFqTt1XAXDDCOHpojXU=;
 b=C6IW1tHWAhoK8KJ/y1SGEZUZ+KaLKRifcuLgaE+71cZpO7SNV/KlDQg8
 xGUOiAgAwbbUesotB8Ai/xy5uUNX4PuK5kKDFwoxD3QWKvjTjyx/1T9rk
 65yPGZdrc9gGC+yhpfoVpcwzzJqOm2uN5K8U1tILvLV5HHD/uuxWff1ha
 aFu3Bqf1ljFV1i4OWNGbHPOP6Fw9OqGkgZjpHdeSiiWWnIbMxPfm3dplo
 KM6agoJoTsXwkKpSn12jh90Bksup+xFd2aYAtP5Ga4wyH9VTxuMK9DOlO
 iSd5scjQDNJJaT/ZcKv44GA4RBiaYgenuHHK3aZUlcwS71oGU+xRXjHKy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381938694"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="381938694"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:54:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744916306"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="744916306"
Received: from pglc00032.png.intel.com ([10.221.207.52])
 by orsmga002.jf.intel.com with ESMTP; 15 Sep 2023 02:54:27 -0700
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
Date: Fri, 15 Sep 2023 17:54:16 +0800
Message-Id: <20230915095417.1949-2-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915095417.1949-1-rohan.g.thomas@intel.com>
References: <20230915095417.1949-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 1/2] dt-bindings: net: snps,
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

Add dt-bindings for coe-unsupported property per tx queue.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index ddf9522a5dc2..365e6cb73484 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -394,6 +394,9 @@ properties:
               When a PFC frame is received with priorities matching the bitmask,
               the queue is blocked from transmitting for the pause time specified
               in the PFC frame.
+          snps,coe-unsupported:
+            type: boolean
+            description: TX checksum offload is unsupported by the TX queue.
         allOf:
           - if:
               required:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
