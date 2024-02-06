Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0826B84C62E
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 09:26:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEDABC71295;
	Wed,  7 Feb 2024 08:26:38 +0000 (UTC)
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6174BC6DD99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 07:13:43 +0000 (UTC)
Received: from ssh248.corpemail.net
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id CZT00038;
 Tue, 06 Feb 2024 15:13:38 +0800
Received: from localhost.localdomain.com (10.73.45.222) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.34; Tue, 6 Feb 2024 15:13:38 +0800
From: Bo Liu <liubo03@inspur.com>
To: <lee@kernel.org>, <wens@csie.org>, <marek.vasut+renesas@gmail.com>,
 <support.opensource@diasemi.com>, <neil.armstrong@linaro.org>,
 <ckeepax@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
 <mazziesaccount@gmail.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
Date: Tue, 6 Feb 2024 02:13:03 -0500
Message-ID: <20240206071314.8721-8-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20240206071314.8721-1-liubo03@inspur.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
MIME-Version: 1.0
X-Originating-IP: [10.73.45.222]
tUid: 20242061513389d05567c28aed27fdad978a96868676a
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Wed, 07 Feb 2024 08:26:35 +0000
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Bo Liu <liubo03@inspur.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 07/18] mfd: dialog: convert to use maple tree
	register cache
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

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/mfd/da9052-core.c | 2 +-
 drivers/mfd/da9055-core.c | 2 +-
 drivers/mfd/da9062-core.c | 4 ++--
 drivers/mfd/da9063-i2c.c  | 2 +-
 drivers/mfd/da9150-core.c | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/da9052-core.c b/drivers/mfd/da9052-core.c
index 150448cd2eb0..dc85801b9fa0 100644
--- a/drivers/mfd/da9052-core.c
+++ b/drivers/mfd/da9052-core.c
@@ -533,7 +533,7 @@ const struct regmap_config da9052_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.max_register = DA9052_PAGE1_CON_REG,
 	.readable_reg = da9052_reg_readable,
diff --git a/drivers/mfd/da9055-core.c b/drivers/mfd/da9055-core.c
index 768302e05baa..1f727ef60d63 100644
--- a/drivers/mfd/da9055-core.c
+++ b/drivers/mfd/da9055-core.c
@@ -245,7 +245,7 @@ const struct regmap_config da9055_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.max_register = DA9055_MAX_REGISTER_CNT,
 	.readable_reg = da9055_register_readable,
diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index 73a22107900c..dbbc4779170a 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -476,7 +476,7 @@ static struct regmap_config da9061_regmap_config = {
 	.ranges = da9061_range_cfg,
 	.num_ranges = ARRAY_SIZE(da9061_range_cfg),
 	.max_register = DA9062AA_CONFIG_ID,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.rd_table = &da9061_aa_readable_table,
 	.wr_table = &da9061_aa_writeable_table,
 	.volatile_table = &da9061_aa_volatile_table,
@@ -582,7 +582,7 @@ static struct regmap_config da9062_regmap_config = {
 	.ranges = da9062_range_cfg,
 	.num_ranges = ARRAY_SIZE(da9062_range_cfg),
 	.max_register = DA9062AA_CONFIG_ID,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.rd_table = &da9062_aa_readable_table,
 	.wr_table = &da9062_aa_writeable_table,
 	.volatile_table = &da9062_aa_volatile_table,
diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index d715cf9a9e68..c6235cd0dbdc 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -342,7 +342,7 @@ static struct regmap_config da9063_regmap_config = {
 	.num_ranges = ARRAY_SIZE(da9063_range_cfg),
 	.max_register = DA9063_REG_CONFIG_ID,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static const struct of_device_id da9063_dt_ids[] = {
diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 94d621e20635..5c59cc869fb3 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -169,7 +169,7 @@ static const struct regmap_config da9150_regmap_config = {
 	.num_ranges = ARRAY_SIZE(da9150_range_cfg),
 	.max_register = DA9150_TBAT_RES_B,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = da9150_volatile_reg,
 };
-- 
2.18.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
