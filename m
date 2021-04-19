Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DC0363EC5
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Apr 2021 11:39:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFAB9C58D69;
	Mon, 19 Apr 2021 09:39:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D0D6C58D66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 09:39:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13J9QNjl027778; Mon, 19 Apr 2021 11:39:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=sFBSBQBDPyeSojaKMfT0U4e3EO47DQFQiaxc7wtZkdY=;
 b=vhYk2BUJS00OXL6DK4zQ3czNL5SDLNUR3DkNVej4UhubZj0ySRqSRQQmr9kknwhEtpxa
 U6CvOAHOMJm8/S0Wgx8nnPRpG4spMbSS/dnTpeh7XG/OYFyfZ2Lo0mD/lxVI13o1yPvo
 /DNdch1t1aPrrrENFemD4SBrs3n8+bO3Sfk8lAPzmPe+vHJlK9YVbSX7s8VPhsRBgjfZ
 mcFgOEzNLcq6F5XjZYvwD34t809MxToNgqROUxXXLCRpuVR5w9ARidnA6axlGqkR86Ox
 JFSg7pjdGyKfPPjVpUYkrClyXEvLlqznH2mFqgLotaGwg8iNHyl+KI4R3aOeAz/9vIfG VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 380s533cgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 11:39:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE1BC10002A;
 Mon, 19 Apr 2021 11:39:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE7A420A07F;
 Mon, 19 Apr 2021 11:39:14 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr 2021 11:39:14
 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Etienne Carriere
 <etienne.carriere@st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, <marex@denx.de>
Date: Mon, 19 Apr 2021 11:38:52 +0200
Message-ID: <20210419093852.14978-12-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419093852.14978-1-gabriel.fernandez@foss.st.com>
References: <20210419093852.14978-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_05:2021-04-16,
 2021-04-19 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Etienne Carriere <etienne.carriere@foss.st.com>
Subject: [Linux-stm32] [PATCH v3 11/11] clk: stm32mp1: new compatible for
	secure RCC support
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Platform STM32MP1 can be used in configuration where some clock
resources cannot be accessed by Linux kernel when executing in non-secure
state of the CPU(s).
In such configuration, the RCC clock driver must not register clocks
it cannot access.
They are expected to be registered from another clock driver such
as the SCMI clock driver.
This change uses specific compatible string "st,stm32mp1-rcc-secure"
to specify RCC clock driver configuration where RCC is secure.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/Kconfig        |  10 ++++
 drivers/clk/clk-stm32mp1.c | 101 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index a588d56502d4..44cc662f11f2 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -335,6 +335,16 @@ config COMMON_CLK_STM32MP157
 	help
 	  Support for stm32mp157 SoC family clocks
 
+config COMMON_CLK_STM32MP157_SCMI
+	bool "stm32mp157 Clock driver with Trusted Firmware"
+	depends on COMMON_CLK_STM32MP157
+	select COMMON_CLK_SCMI
+	select ARM_SCMI_PROTOCOL
+	default y
+	help
+	  Support for stm32mp157 SoC family clocks with Trusted Firmware using
+	  SCMI protocol.
+
 config COMMON_CLK_STM32F
 	def_bool COMMON_CLK && (MACH_STM32F429 || MACH_STM32F469 || MACH_STM32F746)
 	help
diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 6d3a36f81b2d..6adc625e79cb 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -2056,11 +2056,61 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 		  _DIV(RCC_DBGCFGR, 0, 3, 0, ck_trace_div_table)),
 };
 
+static const u32 stm32mp1_clock_secured[] = {
+	CK_HSE,
+	CK_HSI,
+	CK_CSI,
+	CK_LSI,
+	CK_LSE,
+	PLL1,
+	PLL2,
+	PLL1_P,
+	PLL2_P,
+	PLL2_Q,
+	PLL2_R,
+	CK_MPU,
+	CK_AXI,
+	SPI6,
+	I2C4,
+	I2C6,
+	USART1,
+	RTCAPB,
+	TZC1,
+	TZC2,
+	TZPC,
+	IWDG1,
+	BSEC,
+	STGEN,
+	GPIOZ,
+	CRYP1,
+	HASH1,
+	RNG1,
+	BKPSRAM,
+	RNG1_K,
+	STGEN_K,
+	SPI6_K,
+	I2C4_K,
+	I2C6_K,
+	USART1_K,
+	RTC,
+};
+
+static bool stm32_check_security(const struct clock_config *cfg)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(stm32mp1_clock_secured); i++)
+		if (cfg->id == stm32mp1_clock_secured[i])
+			return true;
+	return false;
+}
+
 struct stm32_rcc_match_data {
 	const struct clock_config *cfg;
 	unsigned int num;
 	unsigned int maxbinding;
 	u32 clear_offset;
+	bool (*check_security)(const struct clock_config *cfg);
 };
 
 static struct stm32_rcc_match_data stm32mp1_data = {
@@ -2070,11 +2120,23 @@ static struct stm32_rcc_match_data stm32mp1_data = {
 	.clear_offset	= RCC_CLR,
 };
 
+static struct stm32_rcc_match_data stm32mp1_data_secure = {
+	.cfg		= stm32mp1_clock_cfg,
+	.num		= ARRAY_SIZE(stm32mp1_clock_cfg),
+	.maxbinding	= STM32MP1_LAST_CLK,
+	.clear_offset	= RCC_CLR,
+	.check_security = &stm32_check_security
+};
+
 static const struct of_device_id stm32mp1_match_data[] = {
 	{
 		.compatible = "st,stm32mp1-rcc",
 		.data = &stm32mp1_data,
 	},
+	{
+		.compatible = "st,stm32mp1-rcc-secure",
+		.data = &stm32mp1_data_secure,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, stm32mp1_match_data);
@@ -2234,6 +2296,9 @@ static int stm32_rcc_clock_init(struct device *dev, void __iomem *base,
 		hws[n] = ERR_PTR(-ENOENT);
 
 	for (n = 0; n < data->num; n++) {
+		if (data->check_security && data->check_security(&data->cfg[n]))
+			continue;
+
 		err = stm32_register_hw_clk(dev, clk_data, base, &rlock,
 					    &data->cfg[n]);
 		if (err) {
@@ -2301,11 +2366,45 @@ static int stm32mp1_rcc_init(struct device *dev)
 	return ret;
 }
 
+static int get_clock_deps(struct device *dev)
+{
+	static const char * const clock_deps_name[] = {
+		"hsi", "hse", "csi", "lsi", "lse",
+	};
+	size_t deps_size = sizeof(struct clk *) * ARRAY_SIZE(clock_deps_name);
+	struct clk **clk_deps;
+	int i;
+
+	clk_deps = devm_kzalloc(dev, deps_size, GFP_KERNEL);
+	if (!clk_deps)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(clock_deps_name); i++) {
+		struct clk *clk = of_clk_get_by_name(dev_of_node(dev),
+						     clock_deps_name[i]);
+
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) != -EINVAL && PTR_ERR(clk) != -ENOENT)
+				return PTR_ERR(clk);
+		} else {
+			/* Device gets a reference count on the clock */
+			clk_deps[i] = devm_clk_get(dev, __clk_get_name(clk));
+			clk_put(clk);
+		}
+	}
+
+	return 0;
+}
+
 static int stm32mp1_rcc_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	int ret = get_clock_deps(dev);
+
+	if (!ret)
+		ret = stm32mp1_rcc_init(dev);
 
-	return stm32mp1_rcc_init(dev);
+	return ret;
 }
 
 static int stm32mp1_rcc_clocks_remove(struct platform_device *pdev)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
