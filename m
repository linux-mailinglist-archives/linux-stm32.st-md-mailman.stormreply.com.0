Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFBF7F5EBD
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 13:06:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50F5BC6B479;
	Thu, 23 Nov 2023 12:06:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91872C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 12:06:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 842941063;
 Thu, 23 Nov 2023 04:07:21 -0800 (PST)
Received: from e127643.arm.com (unknown [10.57.3.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 830F53F7A6;
 Thu, 23 Nov 2023 04:06:33 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Date: Thu, 23 Nov 2023 12:04:59 +0000
Message-Id: <20231123120459.287578-5-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123120459.287578-1-james.clark@arm.com>
References: <20231123120459.287578-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH v3 4/4] coresight: Make current W=1 warnings
	default
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

Similarly to drivers/gpu/drm/amd/amdgpu/Makefile and
fs/btrfs/Makefile, copy the current set of W=1 warnings from
Makefile.extrawarn to the coresight makefile to make them default.
Unfortunately there is no easy way to do this without copying.

In addition to the default set of warnings, add -Wno-sign-compare to
disable that warning. That's because Makefile.extrawarn does some extra
steps to disable some -Wextra warnings unless W=2 or W=3 are used.
That's the only one that's needed for Coresight, so disable it.

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/Makefile | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 995d3b2c76df..4ba478211b31 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -2,6 +2,26 @@
 #
 # Makefile for CoreSight drivers.
 #
+
+# Current W=1 warnings
+subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
+subdir-ccflags-y += -Wmissing-declarations
+subdir-ccflags-y += -Wmissing-format-attribute
+subdir-ccflags-y += -Wmissing-prototypes
+subdir-ccflags-y += -Wold-style-definition
+subdir-ccflags-y += -Wmissing-include-dirs
+subdir-ccflags-y += -Wno-sign-compare
+condflags := \
+	$(call cc-option, -Wrestrict)				\
+	$(call cc-option, -Wunused-but-set-variable)		\
+	$(call cc-option, -Wunused-const-variable)		\
+	$(call cc-option, -Wpacked-not-aligned)			\
+	$(call cc-option, -Wformat-overflow)			\
+	$(call cc-option, -Wformat-truncation)			\
+	$(call cc-option, -Wstringop-overflow)			\
+	$(call cc-option, -Wstringop-truncation)
+subdir-ccflags-y += $(condflags)
+
 obj-$(CONFIG_CORESIGHT) += coresight.o
 coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
 		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
