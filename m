Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F487F5EB8
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 13:06:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EB05C6B47A;
	Thu, 23 Nov 2023 12:06:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36FD5C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 12:06:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A0271063;
 Thu, 23 Nov 2023 04:07:13 -0800 (PST)
Received: from e127643.arm.com (unknown [10.57.3.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 198543F7A6;
 Thu, 23 Nov 2023 04:06:24 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Date: Thu, 23 Nov 2023 12:04:56 +0000
Message-Id: <20231123120459.287578-2-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123120459.287578-1-james.clark@arm.com>
References: <20231123120459.287578-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH v3 1/4] coresight: Fix uninitialized struct
	warnings
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

These warnings would be hit with the following W=1 build change so
initialize all structs properly.

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c   | 2 +-
 drivers/hwtracing/coresight/coresight-etb10.c      | 2 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 2 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
 drivers/hwtracing/coresight/coresight-funnel.c     | 4 ++--
 drivers/hwtracing/coresight/coresight-replicator.c | 2 +-
 drivers/hwtracing/coresight/coresight-stm.c        | 2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 2 +-
 drivers/hwtracing/coresight/coresight-tpda.c       | 2 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       | 2 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       | 2 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c         | 2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 3999d0a2cb60..e805617020d0 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -974,7 +974,7 @@ static const struct amba_id cti_ids[] = {
 	CS_AMBA_ID(0x000bb9aa), /* CTI - C-A73 */
 	CS_AMBA_UCI_ID(0x000bb9da, uci_id_cti), /* CTI - C-A35 */
 	CS_AMBA_UCI_ID(0x000bb9ed, uci_id_cti), /* Coresight CTI (SoC 600) */
-	{ 0, 0},
+	{ 0, 0, NULL },
 };
 
 MODULE_DEVICE_TABLE(amba, cti_ids);
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index fa80039e0821..05e21cffd33b 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -837,7 +837,7 @@ static const struct amba_id etb_ids[] = {
 		.id	= 0x000bb907,
 		.mask	= 0x000fffff,
 	},
-	{ 0, 0},
+	{ 0, 0, NULL },
 };
 
 MODULE_DEVICE_TABLE(amba, etb_ids);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 116a91d90ac2..8da1622e0837 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -1003,7 +1003,7 @@ static const struct amba_id etm_ids[] = {
 	CS_AMBA_ID_DATA(0x000bb95f, "PTM 1.1"),
 	/* PTM 1.1 Qualcomm */
 	CS_AMBA_ID_DATA(0x000b006f, "PTM 1.1"),
-	{ 0, 0},
+	{ 0, 0, NULL},
 };
 
 MODULE_DEVICE_TABLE(amba, etm_ids);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index ce1995a2827f..c5ea808ea662 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2390,7 +2390,7 @@ static const struct of_device_id etm4_sysreg_match[] = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id etm4x_acpi_ids[] = {
-	{"ARMHC500", 0}, /* ARM CoreSight ETM4x */
+	{"ARMHC500", 0, 0, 0}, /* ARM CoreSight ETM4x */
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, etm4x_acpi_ids);
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index a5b1fc787766..ef1a0abfee4e 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -350,7 +350,7 @@ MODULE_DEVICE_TABLE(of, static_funnel_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id static_funnel_ids[] = {
-	{"ARMHC9FE", 0},
+	{"ARMHC9FE", 0, 0, 0},
 	{},
 };
 
@@ -391,7 +391,7 @@ static const struct amba_id dynamic_funnel_ids[] = {
 		.id     = 0x000bb9eb,
 		.mask   = 0x000fffff,
 	},
-	{ 0, 0},
+	{ 0, 0, NULL },
 };
 
 MODULE_DEVICE_TABLE(amba, dynamic_funnel_ids);
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 91d93060dda5..73452d9dc13b 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -363,7 +363,7 @@ MODULE_DEVICE_TABLE(of, static_replicator_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id static_replicator_acpi_ids[] = {
-	{"ARMHC985", 0}, /* ARM CoreSight Static Replicator */
+	{"ARMHC985", 0, 0, 0}, /* ARM CoreSight Static Replicator */
 	{}
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index a1c27c901ad1..891ee64efed8 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -950,7 +950,7 @@ static const struct dev_pm_ops stm_dev_pm_ops = {
 static const struct amba_id stm_ids[] = {
 	CS_AMBA_ID_DATA(0x000bb962, "STM32"),
 	CS_AMBA_ID_DATA(0x000bb963, "STM500"),
-	{ 0, 0},
+	{ 0, 0, NULL },
 };
 
 MODULE_DEVICE_TABLE(amba, stm_ids);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 7ec5365e2b64..39bae35d4ffd 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -594,7 +594,7 @@ static const struct amba_id tmc_ids[] = {
 	CS_AMBA_ID(0x000bb9e9),
 	/* Coresight SoC 600 TMC-ETF */
 	CS_AMBA_ID(0x000bb9ea),
-	{ 0, 0},
+	{ 0, 0, NULL },
 };
 
 MODULE_DEVICE_TABLE(amba, tmc_ids);
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 5f82737c37bb..4ac954f4bc13 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -300,7 +300,7 @@ static struct amba_id tpda_ids[] = {
 		.id     = 0x000f0f00,
 		.mask   = 0x000fff00,
 	},
-	{ 0, 0},
+	{ 0, 0, NULL },
 };
 
 static struct amba_driver tpda_driver = {
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 97654aa4b772..bd13a548375c 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -933,7 +933,7 @@ static struct amba_id tpdm_ids[] = {
 		.id = 0x000f0e00,
 		.mask = 0x000fff00,
 	},
-	{ 0, 0},
+	{ 0, 0, NULL },
 };
 
 static struct amba_driver tpdm_driver = {
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 59eac93fd6bb..7e69048ac944 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -218,7 +218,7 @@ static const struct amba_id tpiu_ids[] = {
 		.id	= 0x000bb9e7,
 		.mask	= 0x000fffff,
 	},
-	{ 0, 0},
+	{ 0, 0, NULL },
 };
 
 MODULE_DEVICE_TABLE(amba, tpiu_ids);
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index 10e886455b8b..f0b6806202d1 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -586,7 +586,7 @@ static void smb_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ultrasoc_smb_acpi_match[] = {
-	{"HISI03A1", 0},
+	{"HISI03A1", 0, 0, 0},
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, ultrasoc_smb_acpi_match);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
