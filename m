Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F51F363EC0
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Apr 2021 11:39:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 026B7C58D6C;
	Mon, 19 Apr 2021 09:39:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16A3CC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 09:39:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13J9RI4T024744; Mon, 19 Apr 2021 11:39:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=MQFahwvfutC3FxBs/hqCSrvMqO46K/tUe+kmA3pJK74=;
 b=vwIj+U8U1cWy6Ucrc5jZU9t2cI3OC2E7zjZh/6wFCRVll7VM14ygWMsTJZMqW7I2mcVa
 Qv6cfUv3erOxerFlKayN0hPaU1p4yr2s7XdJCe0FUH7P5+mRG0LKn8+LbgeDbuZoguk9
 Uidykvc+qhdkC20Nf6/2Le55U2uzntgseRcKyz86AxTA9OTAWqnKW0gSdnaQMUgJ/gi4
 vtdKrvxW5Ck4Zlnl+nCbcZyovFjk9Q4l0EJBwsiMwzK87V68zYEmr5oNeAOJO3jIKxhL
 NrUO4hIkA4o2j+gixV/PrfqfPD5/+ozvZXeXKqs8XB/rK4MYyFsZN+iOfooYr6BUoieT Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 380wj62ru2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 11:39:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F38010002A;
 Mon, 19 Apr 2021 11:39:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D87720A07F;
 Mon, 19 Apr 2021 11:39:07 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr 2021 11:39:07
 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Etienne Carriere
 <etienne.carriere@st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, <marex@denx.de>
Date: Mon, 19 Apr 2021 11:38:43 +0200
Message-ID: <20210419093852.14978-3-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419093852.14978-1-gabriel.fernandez@foss.st.com>
References: <20210419093852.14978-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_05:2021-04-16,
 2021-04-19 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 02/11] clk: stm32mp1: merge 'ck_hse_rtc'
	and 'ck_rtc' into one clock
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
 drivers/clk/clk-stm32mp1.c | 54 +++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 35d5aee8f9b0..a7c244fd0b03 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -245,7 +245,7 @@ static const char * const dsi_src[] = {
 };
 
 static const char * const rtc_src[] = {
-	"off", "ck_lse", "ck_lsi", "ck_hse_rtc"
+	"off", "ck_lse", "ck_lsi", "ck_hse"
 };
 
 static const char * const mco1_src[] = {
@@ -1031,6 +1031,47 @@ static struct clk_hw *clk_register_cktim(struct device *dev, const char *name,
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
+static int clk_divider_rtc_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	if (clk_hw_get_parent(hw) == clk_hw_get_parent_by_index(hw, HSE_RTC))
+		return clk_divider_ops.set_rate(hw, rate, parent_rate);
+
+	return parent_rate;
+}
+
+static int clk_divider_rtc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	unsigned long best_parent_rate = req->best_parent_rate;
+
+	if (req->best_parent_hw == clk_hw_get_parent_by_index(hw, HSE_RTC)) {
+		req->rate = clk_divider_ops.round_rate(hw, req->rate, &best_parent_rate);
+		req->best_parent_rate = best_parent_rate;
+	} else {
+		req->rate = best_parent_rate;
+	}
+
+	return 0;
+}
+
+static const struct clk_ops rtc_div_clk_ops = {
+	.recalc_rate	= clk_divider_rtc_recalc_rate,
+	.set_rate	= clk_divider_rtc_set_rate,
+	.determine_rate = clk_divider_rtc_determine_rate
+};
+
 struct stm32_pll_cfg {
 	u32 offset;
 };
@@ -1243,6 +1284,10 @@ _clk_stm32_register_composite(struct device *dev,
 	_STM32_DIV(_div_offset, _div_shift, _div_width,\
 		   _div_flags, _div_table, NULL)\
 
+#define _DIV_RTC(_div_offset, _div_shift, _div_width, _div_flags, _div_table)\
+	_STM32_DIV(_div_offset, _div_shift, _div_width,\
+		   _div_flags, _div_table, &rtc_div_clk_ops)
+
 #define _STM32_MUX(_offset, _shift, _width, _mux_flags, _mmux, _ops)\
 	.mux = &(struct stm32_mux_cfg) {\
 		&(struct mux_cfg) {\
@@ -1965,13 +2010,10 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
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
