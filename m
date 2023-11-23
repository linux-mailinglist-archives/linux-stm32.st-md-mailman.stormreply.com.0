Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1D37F5EBC
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 13:06:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 466A3C6B479;
	Thu, 23 Nov 2023 12:06:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C951CC6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 12:06:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B457D1042;
 Thu, 23 Nov 2023 04:07:18 -0800 (PST)
Received: from e127643.arm.com (unknown [10.57.3.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A56DA3F7A6;
 Thu, 23 Nov 2023 04:06:30 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Date: Thu, 23 Nov 2023 12:04:58 +0000
Message-Id: <20231123120459.287578-4-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123120459.287578-1-james.clark@arm.com>
References: <20231123120459.287578-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH v3 3/4] coresight: Fix undeclared variable
	warnings from sparse checker
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

Including the header with the declarations fixes the following warning
with a C=1 build:

  coresight-cfg-afdo.c:102:27: warning: symbol 'strobe_etm4x' was not declared. Should it be static?
  coresight-cfg-afdo.c:141:26: warning: symbol 'afdo_etm4x' was not declared. Should it be static?

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-cfg-afdo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-cfg-afdo.c b/drivers/hwtracing/coresight/coresight-cfg-afdo.c
index 84b31184252b..e794f2e145fa 100644
--- a/drivers/hwtracing/coresight/coresight-cfg-afdo.c
+++ b/drivers/hwtracing/coresight/coresight-cfg-afdo.c
@@ -9,6 +9,7 @@
 /* ETMv4 includes and features */
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 #include "coresight-etm4x-cfg.h"
+#include "coresight-cfg-preload.h"
 
 /* preload configurations and features */
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
