Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC59C3C27
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 11:37:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 522E1C78F60;
	Mon, 11 Nov 2024 10:37:27 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8CA5C7803D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 10:37:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 75965A41462;
 Mon, 11 Nov 2024 10:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86C0C4CED5;
 Mon, 11 Nov 2024 10:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731321438;
 bh=jNP3EEmQCRYGu8RVX1ba7R/suetM+TihlMSotd59zHY=;
 h=From:To:Cc:Subject:Date:From;
 b=jKHBPUQefIWzQGovAC+9QQCjuqX7+leHBXJqOsNjgQVSuF6OiCpOvaHlnDumrDreH
 l2Sk+t9JTwk7SoJJPguosMtJAkKG6CDeAekLy7lKKSH2wryDDqNbimLwO//CQB4Idx
 a77AcUqMxzLlJSEA78CqGMWrwmOnNSo2qQXNOpky4nQnB1cKdvGWtidhTnv/2C8ocF
 f8Rh98ltcCqJBU8Xgvj74dIudRl4SRHRVdVGkf0eW34ixl/xgPLdeqpFll9FUIxJwK
 dZICPzDmfB4A46avMMOYb0Li9M5siGskf591O0h/7RUw/2jPKHmj9YjdUcjhENPNE1
 C5GEMWT8gvBKw==
From: Arnd Bergmann <arnd@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 11 Nov 2024 11:37:02 +0100
Message-Id: <20241111103712.3520611-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] phy: stm32: work around constant-value
	overflow assertion
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

From: Arnd Bergmann <arnd@arndb.de>

FIELD_PREP() checks that a constant fits into the available bitfield,
but if one of the two lookup tables in stm32_impedance_tune() does
not find a matching entry, the index is out of range, which gcc
correctly complains about:

In file included from <command-line>:
In function 'stm32_impedance_tune',
    inlined from 'stm32_combophy_pll_init' at drivers/phy/st/phy-stm32-combophy.c:247:9:
include/linux/compiler_types.h:517:38: error: call to '__compiletime_assert_447' declared with attribute error: FIELD_PREP: value too large for the field
  517 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                      ^
include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   68 |   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
  115 |   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      |   ^~~~~~~~~~~~~~~~
drivers/phy/st/phy-stm32-combophy.c:162:8: note: in expansion of macro 'FIELD_PREP'
  162 |        FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
      |        ^~~~~~~~~~

Rework this so the field value gets set inside of the loop and otherwise
set to zero.

Fixes: 47e1bb6b4ba0 ("phy: stm32: Add support for STM32MP25 COMBOPHY.")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/phy/st/phy-stm32-combophy.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/st/phy-stm32-combophy.c b/drivers/phy/st/phy-stm32-combophy.c
index 765bb34fe358..49e9fa90a681 100644
--- a/drivers/phy/st/phy-stm32-combophy.c
+++ b/drivers/phy/st/phy-stm32-combophy.c
@@ -122,6 +122,7 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 	u32 max_vswing = imp_lookup[imp_size - 1].vswing[vswing_size - 1];
 	u32 min_vswing = imp_lookup[0].vswing[0];
 	u32 val;
+	u32 regval;
 
 	if (!of_property_read_u32(combophy->dev->of_node, "st,output-micro-ohms", &val)) {
 		if (val < min_imp || val > max_imp) {
@@ -129,16 +130,20 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 			return -EINVAL;
 		}
 
-		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++)
-			if (imp_lookup[imp_of].microohm <= val)
+		regval = 0;
+		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
+			if (imp_lookup[imp_of].microohm <= val) {
+				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
 				break;
+			}
+		}
 
 		dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
 			imp_lookup[imp_of].microohm);
 
 		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
 				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
-				   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of));
+				   regval);
 	} else {
 		regmap_read(combophy->regmap, SYSCFG_PCIEPRGCR, &val);
 		imp_of = FIELD_GET(STM32MP25_PCIEPRG_IMPCTRL_OHM, val);
@@ -150,16 +155,20 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 			return -EINVAL;
 		}
 
-		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++)
-			if (imp_lookup[imp_of].vswing[vswing_of] >= val)
+		regval = 0;
+		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
+			if (imp_lookup[imp_of].vswing[vswing_of] >= val) {
+				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
 				break;
+			}
+		}
 
 		dev_dbg(combophy->dev, "Set %u microvolt swing\n",
 			 imp_lookup[imp_of].vswing[vswing_of]);
 
 		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
 				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
-				   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
+				   regval);
 	}
 
 	return 0;
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
