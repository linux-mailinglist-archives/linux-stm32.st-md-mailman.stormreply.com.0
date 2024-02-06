Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CF784C62D
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 09:26:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1818C71293;
	Wed,  7 Feb 2024 08:26:38 +0000 (UTC)
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A8F4C6C85A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 07:13:43 +0000 (UTC)
Received: from ssh248.corpemail.net
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id CZT00139;
 Tue, 06 Feb 2024 15:13:39 +0800
Received: from localhost.localdomain.com (10.73.45.222) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.34; Tue, 6 Feb 2024 15:13:39 +0800
From: Bo Liu <liubo03@inspur.com>
To: <lee@kernel.org>, <wens@csie.org>, <marek.vasut+renesas@gmail.com>,
 <support.opensource@diasemi.com>, <neil.armstrong@linaro.org>,
 <ckeepax@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
 <mazziesaccount@gmail.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
Date: Tue, 6 Feb 2024 02:13:04 -0500
Message-ID: <20240206071314.8721-9-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20240206071314.8721-1-liubo03@inspur.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
MIME-Version: 1.0
X-Originating-IP: [10.73.45.222]
tUid: 2024206151339888f549b31f273a362f0bbdd55baa0cf
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Wed, 07 Feb 2024 08:26:35 +0000
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Bo Liu <liubo03@inspur.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/18] mfd: khadas-mcu: convert to use maple
	tree register cache
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
 drivers/mfd/khadas-mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index 61396d824f16..ba981a788692 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -72,7 +72,7 @@ static const struct regmap_config khadas_mcu_regmap_config = {
 	.max_register	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
 	.volatile_reg	= khadas_mcu_reg_volatile,
 	.writeable_reg	= khadas_mcu_reg_writeable,
-	.cache_type	= REGCACHE_RBTREE,
+	.cache_type	= REGCACHE_MAPLE,
 };
 
 static struct mfd_cell khadas_mcu_fan_cells[] = {
-- 
2.18.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
