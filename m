Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3D5300321
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jan 2021 13:34:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79F28C57194;
	Fri, 22 Jan 2021 12:34:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 955FDC424C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 10:51:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10MAmG84002482; Fri, 22 Jan 2021 11:51:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=vD3EHGbLxSS3YdjyiN4P/XEtIcwWhHbeghamkCuYDFE=;
 b=GEUvKPU/1XwRjiQmBsLk9FFhceuz4DNLsxYnguryd0REfL4ibyzsjY45KM2anEpCme39
 2M36ZnvtwVnlnU4UbsI3j7U+5NqNmbOuBGclgy7sxtYl92fyXtEV2AKCV61F+z93VIDX
 uVnIr+WiCHabf44TKwVUH8e/xVXsQlCdGLNTv9WlKvmwcTqx7vzwIay7TtKSyMS1VVlG
 FgGN0NCqCfEYx5TDb6I/VPV5z4F8s2jNNxESxuh1Ik+DR2p/l9444SBJ8g0NMRpgjCeI
 NwYBHW5egYcID9b3tF7CnlQ3boGXY09TwTrJjV+J5s5Kel4broDvINp2vC3G/PKZwkR4 jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pqhdue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 11:51:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8884F100034;
 Fri, 22 Jan 2021 11:51:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79E0822DBCA;
 Fri, 22 Jan 2021 11:51:20 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Jan 2021 11:51:20
 +0100
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Etienne Carriere
 <etienne.carriere@st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 22 Jan 2021 11:50:49 +0100
Message-ID: <20210122105101.27374-3-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122105101.27374-1-gabriel.fernandez@foss.st.com>
References: <20210122105101.27374-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_06:2021-01-21,
 2021-01-22 signatures=0
X-Mailman-Approved-At: Fri, 22 Jan 2021 12:34:42 +0000
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 02/14] clk: stm32mp1: merge 'ck_hse_rtc' and
	'ck_rtc' into one clock
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

'ck_rtc' has multiple clocks as input (ck_hsi, ck_lsi, and ck_hse).
A divider is available only on the specific rtc input for ck_hse.
This Merge will facilitate to have a more coherent clock tree
in no trusted / trusted world.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/clk-stm32mp1.c | 49 +++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 35d5aee8f9b0..0e1d4427a8df 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -245,7 +245,7 @@ static const char * const dsi_src[] = {
 };
 
 static const char * const rtc_src[] = {
-	"off", "ck_lse", "ck_lsi", "ck_hse_rtc"
+	"off", "ck_lse", "ck_lsi", "ck_hse"
 };
 
 static const char * const mco1_src[] = {
@@ -1031,6 +1031,42 @@ static struct clk_hw *clk_register_cktim(struct device *dev, const char *name,
 	return hw;
 }
 
+/* The divider of RTC clock concerns only ck_hse clock */
+#define HSE_RTC 3
+
+static unsigned long clk_divider_rtc_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	if (clk_hw_get_parent(hw) == clk_hw_get_parent_by_index(hw, HSE_RTC))
+		return clk_divider_ops.recalc_rate(hw, parent_rate);
+
+	return parent_rate;
+}
+
+static long clk_divider_rtc_round_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long *prate)
+{
+	if (clk_hw_get_parent(hw) == clk_hw_get_parent_by_index(hw, HSE_RTC))
+		return clk_divider_ops.round_rate(hw, rate, prate);
+
+	return *prate;
+}
+
+static int clk_divider_rtc_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	if (clk_hw_get_parent(hw) == clk_hw_get_parent_by_index(hw, HSE_RTC))
+		return clk_divider_ops.set_rate(hw, rate, parent_rate);
+
+	return parent_rate;
+}
+
+static const struct clk_ops rtc_div_clk_ops = {
+	.recalc_rate	= clk_divider_rtc_recalc_rate,
+	.round_rate	= clk_divider_rtc_round_rate,
+	.set_rate	= clk_divider_rtc_set_rate,
+};
+
 struct stm32_pll_cfg {
 	u32 offset;
 };
@@ -1243,6 +1279,10 @@ _clk_stm32_register_composite(struct device *dev,
 	_STM32_DIV(_div_offset, _div_shift, _div_width,\
 		   _div_flags, _div_table, NULL)\
 
+#define _DIV_RTC(_div_offset, _div_shift, _div_width, _div_flags, _div_table)\
+	_STM32_DIV(_div_offset, _div_shift, _div_width,\
+		   _div_flags, _div_table, &rtc_div_clk_ops)
+
 #define _STM32_MUX(_offset, _shift, _width, _mux_flags, _mmux, _ops)\
 	.mux = &(struct stm32_mux_cfg) {\
 		&(struct mux_cfg) {\
@@ -1965,13 +2005,10 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 		  _DIV(RCC_ETHCKSELR, 4, 4, 0, NULL)),
 
 	/* RTC clock */
-	DIV(NO_ID, "ck_hse_rtc", "ck_hse", 0, RCC_RTCDIVR, 0, 6, 0),
-
-	COMPOSITE(RTC, "ck_rtc", rtc_src, CLK_OPS_PARENT_ENABLE |
-		   CLK_SET_RATE_PARENT,
+	COMPOSITE(RTC, "ck_rtc", rtc_src, CLK_OPS_PARENT_ENABLE,
 		  _GATE(RCC_BDCR, 20, 0),
 		  _MUX(RCC_BDCR, 16, 2, 0),
-		  _NO_DIV),
+		  _DIV_RTC(RCC_RTCDIVR, 0, 6, 0, NULL)),
 
 	/* MCO clocks */
 	COMPOSITE(CK_MCO1, "ck_mco1", mco1_src, CLK_OPS_PARENT_ENABLE |
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
