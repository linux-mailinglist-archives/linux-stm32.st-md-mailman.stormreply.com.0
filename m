Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8589914A4D
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 14:54:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59B0ACB40AF
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 12:54:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 358C5CB40AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 12:54:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x46CkflF011958; Mon, 6 May 2019 14:54:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=92DnEj1hB/oVaDvk+JizWveVsX8kT8C4r3Oqx0ymrA4=;
 b=F0Jm5VScMzUIeYXbmYaTFg+8vgMGdOj8IzGZMCfFK1GjlpDLqHewaUO7+RLKhUnzR/6B
 tGD8NlOLM26NwONpSWWTqvw/GvE+TzMTIqceXBXCQgqccdUXYXhpclzOphZY8aY1P1Fp
 K89FxPaSG8rUvCxjEPa8BzIAvuWfSCg4T6S4yMROlWNR7TbiUWkKKNb0hdAjZS2sY0cm
 MGx72SXfOn4rOIQJC6GCn9JFM65ZBtqX55pYJQlUNe5+3Zv5S+q2InJ75cBa33mszE9g
 PmHEWrA79Th5qC92zynN6TVb6T2LF+AiWDEqZR6gtvbfNtdNwA6NdnPCKdxfTew/STEl vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s94c39ge4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 06 May 2019 14:54:28 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53B0431;
 Mon,  6 May 2019 12:54:27 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30B5E25BA;
 Mon,  6 May 2019 12:54:27 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019
 14:54:27 +0200
Received: from localhost (10.201.23.16) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019 14:54:26
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Mon, 6 May 2019 14:54:12 +0200
Message-ID: <1557147252-18679-3-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557147252-18679-1-git-send-email-olivier.moysan@st.com>
References: <1557147252-18679-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_08:, , signatures=0
Subject: [Linux-stm32] [PATCH 2/2] ASoC: stm32: i2s: manage identification
	registers
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

Add support of identification registers in STM32 I2S.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_i2s.c | 60 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 8ee697ff1f86..8846f49b2951 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -16,6 +16,7 @@
  * details.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -37,6 +38,10 @@
 #define STM32_I2S_TXDR_REG	0X20
 #define STM32_I2S_RXDR_REG	0x30
 #define STM32_I2S_CGFR_REG	0X50
+#define STM32_I2S_HWCFGR_REG	0x3F0
+#define STM32_I2S_VERR_REG	0x3F4
+#define STM32_I2S_IPIDR_REG	0x3F8
+#define STM32_I2S_SIDR_REG	0x3FC
 
 /* Bit definition for SPI2S_CR1 register */
 #define I2S_CR1_SPE		BIT(0)
@@ -143,6 +148,23 @@
 #define I2S_CGFR_ODD		BIT(I2S_CGFR_ODD_SHIFT)
 #define I2S_CGFR_MCKOE		BIT(25)
 
+/* Registers below apply to I2S version 1.1 and more */
+
+/* Bit definition for SPI_HWCFGR register */
+#define I2S_HWCFGR_I2S_SUPPORT_MASK	GENMASK(15, 12)
+
+/* Bit definition for SPI_VERR register */
+#define I2S_VERR_MIN_MASK	GENMASK(3, 0)
+#define I2S_VERR_MAJ_MASK	GENMASK(7, 4)
+
+/* Bit definition for SPI_IPIDR register */
+#define I2S_IPIDR_ID_MASK	GENMASK(31, 0)
+
+/* Bit definition for SPI_SIDR register */
+#define I2S_SIDR_ID_MASK	GENMASK(31, 0)
+
+#define I2S_IPIDR_NUMBER	0x00130022
+
 enum i2s_master_mode {
 	I2S_MS_NOT_SET,
 	I2S_MS_MASTER,
@@ -280,6 +302,10 @@ static bool stm32_i2s_readable_reg(struct device *dev, unsigned int reg)
 	case STM32_I2S_SR_REG:
 	case STM32_I2S_RXDR_REG:
 	case STM32_I2S_CGFR_REG:
+	case STM32_I2S_HWCFGR_REG:
+	case STM32_I2S_VERR_REG:
+	case STM32_I2S_IPIDR_REG:
+	case STM32_I2S_SIDR_REG:
 		return true;
 	default:
 		return false;
@@ -711,10 +737,11 @@ static const struct regmap_config stm32_h7_i2s_regmap_conf = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = STM32_I2S_CGFR_REG,
+	.max_register = STM32_I2S_SIDR_REG,
 	.readable_reg = stm32_i2s_readable_reg,
 	.volatile_reg = stm32_i2s_volatile_reg,
 	.writeable_reg = stm32_i2s_writeable_reg,
+	.num_reg_defaults_raw = STM32_I2S_SIDR_REG / sizeof(u32) + 1,
 	.fast_io = true,
 	.cache_type = REGCACHE_FLAT,
 };
@@ -865,6 +892,7 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 static int stm32_i2s_probe(struct platform_device *pdev)
 {
 	struct stm32_i2s_data *i2s;
+	u32 val;
 	int ret;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
@@ -903,8 +931,34 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Set SPI/I2S in i2s mode */
-	return regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
-				  I2S_CGFR_I2SMOD, I2S_CGFR_I2SMOD);
+	ret = regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
+				 I2S_CGFR_I2SMOD, I2S_CGFR_I2SMOD);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(i2s->regmap, STM32_I2S_IPIDR_REG, &val);
+	if (ret)
+		return ret;
+
+	if (val == I2S_IPIDR_NUMBER) {
+		ret = regmap_read(i2s->regmap, STM32_I2S_HWCFGR_REG, &val);
+		if (ret)
+			return ret;
+
+		if (!FIELD_GET(I2S_HWCFGR_I2S_SUPPORT_MASK, val)) {
+			dev_err(&pdev->dev,
+				"Device does not support i2s mode\n");
+			return -EPERM;
+		}
+
+		ret = regmap_read(i2s->regmap, STM32_I2S_VERR_REG, &val);
+
+		dev_dbg(&pdev->dev, "I2S version: %lu.%lu registered\n",
+			FIELD_GET(I2S_VERR_MAJ_MASK, val),
+			FIELD_GET(I2S_VERR_MIN_MASK, val));
+	}
+
+	return ret;
 }
 
 MODULE_DEVICE_TABLE(of, stm32_i2s_ids);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
