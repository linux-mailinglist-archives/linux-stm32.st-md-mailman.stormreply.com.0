Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E235A99035
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 17:17:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D703AC78F70;
	Wed, 23 Apr 2025 15:17:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF309C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 15:17:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7B10153B;
 Wed, 23 Apr 2025 08:17:51 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B0013F66E;
 Wed, 23 Apr 2025 08:17:54 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 23 Apr 2025 16:17:23 +0100
Message-Id: <20250423151726.372561-7-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423151726.372561-1-leo.yan@arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
MIME-Version: 1.0
Cc: Leo Yan <leo.yan@arm.com>
Subject: [Linux-stm32] [PATCH v2 6/9] coresight: Avoid enable programming
	clock duplicately
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

The programming clock is enabled by AMBA bus driver before a dynamic
probe.  As a result, a CoreSight driver may redundantly enable the same
clock.

To avoid this, add a check for device type and skip enabling the
programming clock for AMBA devices.  The returned NULL pointer will be
tolerated by the drivers.

Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 include/linux/coresight.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index b888f6ed59b2..26eb4a61b992 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -476,15 +476,18 @@ static inline bool is_coresight_device(void __iomem *base)
  * Returns:
  *
  * clk   - Clock is found and enabled
+ * NULL  - Clock is not needed as it is managed by the AMBA bus driver
  * ERROR - Clock is found but failed to enable
  */
 static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
 {
-	struct clk *pclk;
+	struct clk *pclk = NULL;
 
-	pclk = devm_clk_get_enabled(dev, "apb_pclk");
-	if (IS_ERR(pclk))
-		pclk = devm_clk_get_enabled(dev, "apb");
+	if (!dev_is_amba(dev)) {
+		pclk = devm_clk_get_enabled(dev, "apb_pclk");
+		if (IS_ERR(pclk))
+			pclk = devm_clk_get_enabled(dev, "apb");
+	}
 
 	return pclk;
 }
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
