Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC91C864B9
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Nov 2025 18:46:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F213BC60469;
	Tue, 25 Nov 2025 17:46:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4498C60469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:46:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APHAcjk3890136
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 25 Nov 2025 17:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9mfjDiu2kBjM6jqNbnnQdYrefwxs1EFwGsPAjFqaGiA=; b=VvMizyMxBJFmuDIV
 uBuvUkyLju6Mq7wY109FN4baPYs+nmOyrRyL/WBATebw9/CP5fFLA9QyWoLUIJJ2
 kd1Xf96j2KcYwhjCO6aRFNWOKA6Sr7D6aWydAa6t/8+1uYhcSXW02fuTjfK2I3dc
 ZFKV/ey2yAxnY7IBQHY/rnYlupVu21Jn3JNkrzqCZ3+ZQUwLReU1yTZEjZOEdodO
 Ym7MkvT23DwXlQ/D2AcY/SZe/QqREEohazNSvTSz+Y52myBi1+JLmXX2wxSfgqVg
 nVYmszhwWOZB5e7Zqw5PBcW+2qoIReM21BYrHZefnBIXEtvRVimTDxi1GZlabDNC
 T430Ng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme83e4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:46:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29845b18d1aso115397045ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 09:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764092792; x=1764697592;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9mfjDiu2kBjM6jqNbnnQdYrefwxs1EFwGsPAjFqaGiA=;
 b=QccScENa+oy969rqtLfH5iYpaHPKz0iNmWVO+ORUA5n/MeJBOXJOy9QdahrDUatCU5
 8V1X4ajIBN22LihAKpuF7qvO5cf1Q+r5Veabf/6hvOUzLhBz9oM9OBJDx/LkOCgsWelu
 m4hjdoKLUK9YfETxlan+HC/QCQYy7tdc+v4Wql1jQ8SOaX/PU5PF+ds9kbzYPYkvgzc7
 sjDyWP85+/UoNZXeo+xLqiA8UwZfhMrjtxU2ghz/j0ypIsXuZO3uDg+jsiuM6PcZspIv
 RHwc3xXh5GjPfAhFyXrdvj7Oeo4mUWa4X8zeVln7FyakcH9xNMz3L/cuB6t9e9RlmH9h
 UsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764092792; x=1764697592;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9mfjDiu2kBjM6jqNbnnQdYrefwxs1EFwGsPAjFqaGiA=;
 b=W5ZAU5YkwP7NsueBGGl+JwEiML9MBk0YEfWQP8wh50Qv+eFTP2Jn8pXIKm+aEIJWsY
 BxA8bTcaJUuQBLQHdCDymeL2ZbJQDWTJdgcJS5KUPqBFYwF1HYRUmtjhu7sWLu4QDNeq
 SVi7xxuU+FcTy/yTjKCrgwPnhrAlAjsxNHOKlS0XMVXYQJQ/qe8Nr5jm+/tx8CnMQOxD
 7VuPjiAIpaTGSnpEoju3al5LOyDrTIHVg2aID6HwY3dEqhTjt/a7ZEJTWgE7SjeJgGNC
 tx9v4lnpWD8DI/ThnDADiUqNIaaP2uTWGMeJPwMLVlyVmaRszLwtLkS7VBmI5KneLuYO
 vSxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8Wj2I1eZEEZo94H2Y5m33rzqqTLvADNEFnSBunc2XIdwssDkU7dQWU8IC9EIwVtpPaVMTAaK38pzwGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy5wybDhMopI+JaFwvwq3fKfWZWwQm3J6vsxsxBdNP0g3EneeCF
 1QySAbDosYsuDfUIG0bElQ1nO+QCHLtpGlqDg9frBZ4qWmj5XWTXo5zvswFd/v7N7mkOonz/vGV
 h+n6qTHIkgW4CcgEETm5pJnW2xmnbfO+wEovxXIoa944tEVPWM/2r2Bt3Qszguph350dnw30i5d
 NY3Zjqvs8=
X-Gm-Gg: ASbGncv5Z2XI2k+Q6FcLBjTf8q8/1aUk7IIBdwQE77xa21cZvnhnzp0E1foENzfF+MR
 QkfJfJ6hUkGchUosEj8u5JsixYUuXqUwqG9rovq01sOOtpA1Rzn+eGZ8W4uKGfavodJVEGXpop8
 c77YbR1+oU4XNrP63OupyLYattq5k1Bxr0rRnpIrxoI2KjlPTk72YWqpE+ohOlT33ZZFJmLwmYt
 OkxwYDHKHZV3sOAdRqXUaKy3Ztf0I07gTxJGWpzrDyUxM0CmLMOolMc/fdy1rAewqWbOy8gQ6Jv
 pTNf8vtVwGfKV3xem2fx9mF+8biCGusSpSXc7al+3CIyoYP2MFAy9oTA8GXEsdJk0N8LV/P3LWZ
 S2lO0F0+SPkhHcTQCdAU=
X-Received: by 2002:a17:903:2451:b0:295:7423:4be2 with SMTP id
 d9443c01a7336-29b6c3c608dmr183741105ad.3.1764092791420; 
 Tue, 25 Nov 2025 09:46:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnDvV9AWAL0m4aTqELP47FRy0Iow25K2ZIvketbWdchVh6mQmFBNL4GjH0mpF8qymtnFaagg==
X-Received: by 2002:a17:903:2451:b0:295:7423:4be2 with SMTP id
 d9443c01a7336-29b6c3c608dmr183740685ad.3.1764092790805; 
 Tue, 25 Nov 2025 09:46:30 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 09:46:30 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:19 +0530
MIME-Version: 1.0
Message-Id: <20251125-kaanapali-mmcc-v2-v2-10-fb44e78f300b@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6925eb78 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FXoFOq9PtT0JJl4RUvYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX/aDRQ+3znLLP
 ylJSeu55CVZw2eCPUu1tSzt43WWOoPE3Ly+2FT4/lXPoNfR3GMSBV8iD78cnStqg2CrEnv3Mrub
 KVfn0j712LnOcithfypkhEAszF1AUoLhnf2IX2NTQvm33XNGMfckCJX6hIVMVLxSLjeWwEH7hri
 BCkJfq3lXBrktS/TVFru05DwO12VTzuK2NnEXweTcAEcXeZdcauvoBw5PWMGscM2qbG7eWjru9P
 2gUprTkz6a/2wJpHwH4umwvOfZ3BO7XQIc1OL4HdrqJqGWHguilK0Q679ayP5/7y0Lq4XZAxxEE
 9ofGsxaWUhTGUEFt295Lh08xl3HewypjxFtwSWU3nRukG+sXb8uclcuttTxFBmxOONSXNpOCiDl
 5YTIzKJsHMDTsBK6LETRxRACg9L2aw==
X-Proofpoint-GUID: sPyLbg9gTLRqRz0nZN2iS9Ld37EY9PBB
X-Proofpoint-ORIG-GUID: sPyLbg9gTLRqRz0nZN2iS9Ld37EY9PBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 10/11] clk: qcom: Add support for VideoCC
 driver for Kaanapali
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

Enable Kaanapali video clock driver for video SW to be able to control
the clocks from the Video SW driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig             |   9 +
 drivers/clk/qcom/Makefile            |   1 +
 drivers/clk/qcom/videocc-kaanapali.c | 821 +++++++++++++++++++++++++++++++++++
 3 files changed, 831 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 085f75f8ab1e2e6797767f88e3628961f2d3ba0a..4f9980da465128b2c172ed8309b30596f4ca765b 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -66,6 +66,15 @@ config CLK_KAANAPALI_DISPCC
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
+config CLK_KAANAPALI_VIDEOCC
+	tristate "Kaanapali Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_KAANAPALI_GCC
+	help
+	  Support for the video clock controller on Kaanapali devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 8b3ad2c68d489cc38a22d3b665cafb495fb698f1..6b04b29f1b42938f16e1ac702db6aa6755695c43 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
+obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
diff --git a/drivers/clk/qcom/videocc-kaanapali.c b/drivers/clk/qcom/videocc-kaanapali.c
new file mode 100644
index 0000000000000000000000000000000000000000..a335e94761a097614c1b602d17f9ea236b9d5140
--- /dev/null
+++ b/drivers/clk/qcom/videocc-kaanapali.c
@@ -0,0 +1,821 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,kaanapali-videocc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+#define ACCU_CFG_MASK GENMASK(25, 21)
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+	P_VIDEO_CC_PLL1_OUT_MAIN,
+	P_VIDEO_CC_PLL2_OUT_MAIN,
+	P_VIDEO_CC_PLL3_OUT_MAIN,
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 360.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x12,
+	.cal_l = 0x48,
+	.alpha = 0xc000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+/* 480.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll1_config = {
+	.l = 0x19,
+	.cal_l = 0x48,
+	.alpha = 0x0,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+/* 480.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll2_config = {
+	.l = 0x19,
+	.cal_l = 0x48,
+	.alpha = 0x0,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &video_cc_pll2_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+/* 480.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll3_config = {
+	.l = 0x19,
+	.cal_l = 0x48,
+	.alpha = 0x0,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll3 = {
+	.offset = 0x3000,
+	.config = &video_cc_pll3_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll3",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL3_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll3.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL2_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll2.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8060,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(240000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(800000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(1000000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0a_clk_src[] = {
+	F(240000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0a_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_mvs0a_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0a_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0b_clk_src[] = {
+	F(240000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(850000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0b_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_3,
+	.freq_tbl = ftbl_video_cc_mvs0b_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0b_clk_src",
+		.parent_data = video_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0c_clk_src[] = {
+	F(360000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(507000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(666000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(800000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1104000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1260000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0c_clk_src = {
+	.cmd_rcgr = 0x8048,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_4,
+	.freq_tbl = ftbl_video_cc_mvs0c_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_clk_src",
+		.parent_data = video_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x8194,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80d0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
+	.mem_enable_reg = 0x80E4,
+	.mem_ack_reg =  0x80E4,
+	.mem_enable_mask = BIT(3),
+	.mem_enable_ack_mask = 0xc00,
+	.mem_enable_invert = true,
+	.branch = {
+		.halt_reg = 0x80e0,
+		.halt_check = BRANCH_HALT,
+		.clkr = {
+			.enable_reg = 0x80e0,
+			.enable_mask = BIT(0),
+			.hw.init = &(const struct clk_init_data) {
+				.name = "video_cc_mvs0_freerun_clk",
+				.parent_hws = (const struct clk_hw*[]) {
+					&video_cc_mvs0_clk_src.clkr.hw,
+				},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+			},
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x81b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x81b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x81b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp0_clk = {
+	.halt_reg = 0x8134,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8134,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8134,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp0_freerun_clk = {
+	.halt_reg = 0x8144,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8144,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp0_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp1_clk = {
+	.halt_reg = 0x8108,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8108,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8108,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp1_freerun_clk = {
+	.halt_reg = 0x8118,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8118,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp1_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0a_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8090,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0a_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0a_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0a_freerun_clk = {
+	.halt_reg = 0x80a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0a_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0a_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0b_clk = {
+	.halt_reg = 0x80bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80bc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0b_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0b_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0b_freerun_clk = {
+	.halt_reg = 0x80cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0b_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0b_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x8164,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8164,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8164,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_freerun_clk = {
+	.halt_reg = 0x8174,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8174,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x81b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x81b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x81b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0_vpp0_gdsc = {
+	.gdscr = 0x8120,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs0_vpp0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_vpp1_gdsc = {
+	.gdscr = 0x80f4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs0_vpp1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0a_gdsc = {
+	.gdscr = 0x807c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs0a_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x814c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x80a8,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *video_cc_kaanapali_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_FREERUN_CLK] = &video_cc_mvs0_freerun_clk.branch.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0_VPP0_CLK] = &video_cc_mvs0_vpp0_clk.clkr,
+	[VIDEO_CC_MVS0_VPP0_FREERUN_CLK] = &video_cc_mvs0_vpp0_freerun_clk.clkr,
+	[VIDEO_CC_MVS0_VPP1_CLK] = &video_cc_mvs0_vpp1_clk.clkr,
+	[VIDEO_CC_MVS0_VPP1_FREERUN_CLK] = &video_cc_mvs0_vpp1_freerun_clk.clkr,
+	[VIDEO_CC_MVS0A_CLK] = &video_cc_mvs0a_clk.clkr,
+	[VIDEO_CC_MVS0A_CLK_SRC] = &video_cc_mvs0a_clk_src.clkr,
+	[VIDEO_CC_MVS0A_FREERUN_CLK] = &video_cc_mvs0a_freerun_clk.clkr,
+	[VIDEO_CC_MVS0B_CLK] = &video_cc_mvs0b_clk.clkr,
+	[VIDEO_CC_MVS0B_CLK_SRC] = &video_cc_mvs0b_clk_src.clkr,
+	[VIDEO_CC_MVS0B_FREERUN_CLK] = &video_cc_mvs0b_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK_SRC] = &video_cc_mvs0c_clk_src.clkr,
+	[VIDEO_CC_MVS0C_FREERUN_CLK] = &video_cc_mvs0c_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
+	[VIDEO_CC_PLL2] = &video_cc_pll2.clkr,
+	[VIDEO_CC_PLL3] = &video_cc_pll3.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_kaanapali_gdscs[] = {
+	[VIDEO_CC_MVS0A_GDSC] = &video_cc_mvs0a_gdsc,
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0_VPP1_GDSC] = &video_cc_mvs0_vpp1_gdsc,
+	[VIDEO_CC_MVS0_VPP0_GDSC] = &video_cc_mvs0_vpp0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_kaanapali_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x8178 },
+	[VIDEO_CC_MVS0_BCR] = { 0x80a4 },
+	[VIDEO_CC_MVS0_VPP0_BCR] = { 0x811c },
+	[VIDEO_CC_MVS0_VPP1_BCR] = { 0x80f0 },
+	[VIDEO_CC_MVS0A_BCR] = { 0x8078 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8164, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8148 },
+	[VIDEO_CC_MVS0_FREERUN_CLK_ARES] = { 0x80e0, 2 },
+	[VIDEO_CC_MVS0C_FREERUN_CLK_ARES] = { 0x8174, 2 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x81ac, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_kaanapali_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+	&video_cc_pll2,
+	&video_cc_pll3,
+};
+
+static u32 video_cc_kaanapali_critical_cbcrs[] = {
+	0x817c, /* VIDEO_CC_AHB_CLK */
+	0x81bc, /* VIDEO_CC_SLEEP_CLK */
+	0x81b0, /* VIDEO_CC_TS_XO_CLK */
+	0x81ac, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_kaanapali_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xa010,
+	.fast_io = true,
+};
+
+static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Enable clk_on sync for MVS0 and VPP clocks via VIDEO_CC_SPARE1
+	 * during core reset by default.
+	 */
+	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
+
+	/*
+	 *	As per HW design recommendation
+	 *	Update DLY_ACCU_RED_SHIFTER_DONE to 0xF for the below GDSCs
+	 *	MVS0A CFG3, MVS0 CFG3, MVS0 VPP1 CFG3, MVS0 VPP0 CFG3, MVS0C CFG3
+	 */
+	regmap_set_bits(regmap, 0x8088, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x80b4, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x8100, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x812c, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x8158, ACCU_CFG_MASK);
+}
+
+static struct qcom_cc_driver_data video_cc_kaanapali_driver_data = {
+	.alpha_plls = video_cc_kaanapali_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_kaanapali_plls),
+	.clk_cbcrs = video_cc_kaanapali_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_kaanapali_critical_cbcrs),
+	.clk_regs_configure = clk_kaanapali_regs_configure,
+};
+
+static const struct qcom_cc_desc video_cc_kaanapali_desc = {
+	.config = &video_cc_kaanapali_regmap_config,
+	.clks = video_cc_kaanapali_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_kaanapali_clocks),
+	.resets = video_cc_kaanapali_resets,
+	.num_resets = ARRAY_SIZE(video_cc_kaanapali_resets),
+	.gdscs = video_cc_kaanapali_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_kaanapali_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_kaanapali_driver_data,
+};
+
+static const struct of_device_id video_cc_kaanapali_match_table[] = {
+	{ .compatible = "qcom,kaanapali-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_kaanapali_match_table);
+
+static int video_cc_kaanapali_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_kaanapali_desc);
+}
+
+static struct platform_driver video_cc_kaanapali_driver = {
+	.probe = video_cc_kaanapali_probe,
+	.driver = {
+		.name = "videocc-kaanapali",
+		.of_match_table = video_cc_kaanapali_match_table,
+	},
+};
+
+module_platform_driver(video_cc_kaanapali_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC Kaanapali Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
