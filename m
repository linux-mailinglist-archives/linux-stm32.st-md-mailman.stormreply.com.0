Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB699B9D88E
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 08:07:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 780AAC3FACF;
	Thu, 25 Sep 2025 06:07:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5B3AC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:57:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODdFLV017430
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 24 Sep 2025 23:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 whQbs3wiuPAqBz9Jjv5ZFhRkNTOJ8XJEl5gSQZH89GA=; b=hbN+Ga2guHNW8qEK
 KKw6wOkHbIOclDJI/5pL3H0ANFrrlpKXW89ITwtMJEiElJLncBeqvFE5AAf72h18
 tJ/FqDAxb9eq+uzBSWhRsDbSLI5TLRaSspu2R/HPaohcnbXR6bnR+jrceRz5ma6Y
 K4FQ+Tbotzg3XEgRwKLC8S6l2LBdF06qkI5ft1SJCfdfwHHcS6SKpEEQPSM9YULJ
 yHy6dkm3/G3BzhAc8pzBm1FHLivE98DwyQd5RRN7vvCuVfQNxAnEMnvdHpYXq5ZT
 g+eITb42T1LX2qH7zRkzRbxJbckV7tNXadcAqCCLi8wwIFBZak8MMRZWtOWnBZLu
 LouFPw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjye74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:57:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4f8e079bc1so213488a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 16:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758758229; x=1759363029;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whQbs3wiuPAqBz9Jjv5ZFhRkNTOJ8XJEl5gSQZH89GA=;
 b=W9zHI16QyBZU/RMZnJEfrAISFPMAXh9DcZAL1X2ErbRZrS3brzGGsAvnTfoWWp0Zq2
 f9ripvaMigTIONqSLsIhzOK4OvBXfyU91cBFy9lDoYeQAQS/LL5M5mZKz5fnkV2E840p
 ju9ubqah6KgoJaUZYLw84yVcn3aeFX29LSwZiI8mbgEYc3GXOiq4pqYQEOST++akM8dd
 mVGYVJS1Aaj80RL9Jpxdvyi+2RJwpl0a95ctoTad+mEfdZ6BRit8EtpFr6SLPzmtNZ+h
 /1tA/VmwOIv6ruyqHDtazqNzH3r60bqzBMYiFf7R31hi/grjWaS1h+sBQMBXIFG/mNys
 6D2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtoLZTxqYDAYFGjrN3bj1oga9IaTX/DVRmNB/fNWlfl4EIewNNBkH80kRKssWDJAaAaHkbeW+4FqBvAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyKQyJw7RZhP7n8ho+6EppYNwfQ3g5fU94woF/qT3EepST2n5oU
 tBwcMm6TP+Nk+7oocgRWl/+S8yIFRbdkb+iSDqWsWm0zVpiOYpzZIqYD/SSt+pWYOe1sRgwKpDE
 4LZlZOs9v59qIs8rGA1l8CEBDmHMy1c8GZOQFwzPiY1ipXrkiB66cC6dsJGFD/D5Wn9AyY3m7Ht
 Glv0HQTho=
X-Gm-Gg: ASbGncs+icUgPHiid7cIrE8Noc33+csDSelC7bKPyF13mhItypFMhD0PaLgVf8mO0xi
 Io0zjavylfGNGJvgXEzAC+ovAaGO38uoXhufZk6A2cp1ljSr0CliUxHL5nBLPCuMRgi3aK3H//I
 uz7mF095lQ5NmR9/8A1vJz9da9vYrPoOqnhmCCOnY5bEyLt4fKdMmfn/joak6LU5Wjgk0IVgY4/
 rI1rNgQHFT1CYG58MYHSVAJVSpR47PuZLtB0NADXVoijSwcSaLNPzJBLcEfZtyCFDhgcc/c269F
 8OUzOg3ulFdoOn4JNz1fO3050mZKI1p3PX6CcT610KX4XgWXzFT8UmYRgMj3BWNo6vGqrpUfbMP
 GIDEg/NLzagthlos=
X-Received: by 2002:a17:903:19ef:b0:274:3db8:e755 with SMTP id
 d9443c01a7336-27ed4a7ec49mr14662805ad.30.1758758228900; 
 Wed, 24 Sep 2025 16:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeLVNnqEB8YDGaHiwrFwNJEes2zVf++GEsnoGVYvNOJ6NtI+i2tQDRuvRU0dEk8CSTkSH5uA==
X-Received: by 2002:a17:903:19ef:b0:274:3db8:e755 with SMTP id
 d9443c01a7336-27ed4a7ec49mr14662305ad.30.1758758228224; 
 Wed, 24 Sep 2025 16:57:08 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 16:57:07 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:50 -0700
MIME-Version: 1.0
Message-Id: <20250924-knp-mmclk-v1-9-d7ea96b4784a@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=18272;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=3/H02SJ3xQ3Nki8AllzJUCYKKWSZ5lFN0mBwNa7nN1I=;
 b=Bh0WsmI50+191Zrtbw+9Y43A3fGQCLoHbMxF+XVcgnfo0RANABj5hLpzUzujVWBywMH8dm3bo
 GsgUvC/RHt6Bbf1Ht5rKepRdebRDml29ykvqmRJrBRbfjtUEFGHZVOz
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: K1ftCsBqjK6tNOIVYETA6PCmPLPlrbl3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX6MXhT/TT9mUW
 kOuIN7Zuo+H0/wF9WFPk/oq57T4kKYVKWr3Lqy9NnCl9YWObmb+2n3He/hBRStP4xXym35HaDLI
 DDkFg49ovBMU7IGEYmArWwPn2Lj27vIl8FaIfx8pDuKjWEB6kNQbNxwO75WZnSeiDlisk2drp1Y
 HsNMs9yLjATAz25DffLF4Ni/PdYra8VnrJGpTOp+HQlXl5OqPOXDLTrR2uTUbjdCk9p4f4BOyJq
 f1CjNvtJeVN/efIPqnNgNRn2qM10G8o+ftxmt8B/iOjHAAOvZG5SHXPMGoiG1+XA35kfIBpp0CN
 Yr61VivIipstGyK7rSpBIbjzOO3vXODVZG7N99pBHlcjcLD9Rk4ZbEZzhRB2bcc6DShlkFTnQ7y
 QuIQbpvB
X-Proofpoint-GUID: K1ftCsBqjK6tNOIVYETA6PCmPLPlrbl3
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d48556 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B_MwUqmwx3FHfgWfen4A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011
X-Mailman-Approved-At: Thu, 25 Sep 2025 06:07:35 +0000
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: [Linux-stm32] [PATCH 9/9] drivers: clk: qcom: Add support for GPUCC
 and GFXCLK for Kaanapali
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

From: Taniya Das <taniya.das@oss.qualcomm.com>

Support the graphics clock controller for Kaanapali for Graphics SW
driver to use the clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig              |   9 +
 drivers/clk/qcom/Makefile             |   1 +
 drivers/clk/qcom/gpucc-kaanapali.c    | 494 ++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gxclkctl-kaanapali.c |  86 ++++++
 4 files changed, 590 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e44df3df5986..b593acfe7438 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -66,6 +66,15 @@ config CLK_KAANAPALI_DISPCC
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
+config CLK_KAANAPALI_GPUCC
+	tristate "KAANAPALI Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_KAANAPALI_GCC
+	help
+	  Support for the graphics clock controller on KAANAPALI devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config CLK_KAANAPALI_VIDEOCC
 	tristate "KAANAPALI Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 83d3c867b768..0d3e512af281 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
+obj-$(CONFIG_CLK_KAANAPALI_GPUCC) += gpucc-kaanapali.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
new file mode 100644
index 000000000000..41ed660fcc10
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -0,0 +1,494 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,kaanapali-gpucc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_EVEN,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL0_OUT_ODD,
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 950.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x31,
+	.cal_l = 0x48,
+	.alpha = 0x7aaa,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000408,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpu_cc_pll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpu_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_gpu_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpu_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_pll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL0_OUT_EVEN, 2 },
+	{ P_GPU_CC_PLL0_OUT_ODD, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0_out_even.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(475000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(575000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(700000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(725000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(750000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x9318,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.hw_clk_ctrl = true,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_hub_clk_src[] = {
+	F(150000000, P_GPLL0_OUT_MAIN_DIV, 2, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(400000000, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_hub_clk_src = {
+	.cmd_rcgr = 0x93f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.hw_clk_ctrl = true,
+	.freq_tbl = ftbl_gpu_cc_hub_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div gpu_cc_hub_div_clk_src = {
+	.reg = 0x9430,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_hub_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x90bc,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x90bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x9104,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9104,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x90d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x90e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_demet_clk = {
+	.halt_reg = 0x9010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_demet_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_dpm_clk = {
+	.halt_reg = 0x9108,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9108,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_dpm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_freq_measure_clk = {
+	.halt_reg = 0x900c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x900c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_freq_measure_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gpu_smmu_vote_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gpu_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_accu_shift_clk = {
+	.halt_reg = 0x9070,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gmu_clk = {
+	.halt_reg = 0x9060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_aon_clk = {
+	.halt_reg = 0x93ec,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x93ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_cx_int_clk = {
+	.halt_reg = 0x90e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_memnoc_gfx_clk = {
+	.halt_reg = 0x90ec,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cc_cx_gdsc = {
+	.gdscr = 0x9080,
+	.gds_hw_ctrl = 0x9094,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x8,
+	.pd = {
+		.name = "gpu_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *gpu_cc_kaanapali_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_DEMET_CLK] = &gpu_cc_demet_clk.clkr,
+	[GPU_CC_DPM_CLK] = &gpu_cc_dpm_clk.clkr,
+	[GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GPU_SMMU_VOTE_CLK] = &gpu_cc_gpu_smmu_vote_clk.clkr,
+	[GPU_CC_GX_ACCU_SHIFT_CLK] = &gpu_cc_gx_accu_shift_clk.clkr,
+	[GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
+	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
+	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
+	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
+	[GPU_CC_HUB_DIV_CLK_SRC] = &gpu_cc_hub_div_clk_src.clkr,
+	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL0_OUT_EVEN] = &gpu_cc_pll0_out_even.clkr,
+};
+
+static struct gdsc *gpu_cc_kaanapali_gdscs[] = {
+	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_kaanapali_resets[] = {
+	[GPU_CC_CB_BCR] = { 0x93a0 },
+	[GPU_CC_CX_BCR] = { 0x907c },
+	[GPU_CC_FAST_HUB_BCR] = { 0x93e4 },
+	[GPU_CC_FF_BCR] = { 0x9470 },
+	[GPU_CC_GMU_BCR] = { 0x9314 },
+	[GPU_CC_GX_BCR] = { 0x905c },
+	[GPU_CC_XO_BCR] = { 0x9000 },
+};
+
+static struct clk_alpha_pll *gpu_cc_kaanapali_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static u32 gpu_cc_kaanapali_critical_cbcrs[] = {
+	0x9008, /* GPU_CC_CXO_AON_CLK */
+	0x93e8, /* GPU_CC_RSCC_HUB_AON_CLK */
+	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
+};
+
+static const struct regmap_config gpu_cc_kaanapali_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x95e8,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data gpu_cc_kaanapali_driver_data = {
+	.alpha_plls = gpu_cc_kaanapali_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_kaanapali_plls),
+	.clk_cbcrs = gpu_cc_kaanapali_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_kaanapali_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_cc_kaanapali_desc = {
+	.config = &gpu_cc_kaanapali_regmap_config,
+	.clks = gpu_cc_kaanapali_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_kaanapali_clocks),
+	.resets = gpu_cc_kaanapali_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_kaanapali_resets),
+	.gdscs = gpu_cc_kaanapali_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_kaanapali_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_kaanapali_driver_data,
+};
+
+static const struct of_device_id gpu_cc_kaanapali_match_table[] = {
+	{ .compatible = "qcom,kaanapali-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_kaanapali_match_table);
+
+static int gpu_cc_kaanapali_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_kaanapali_desc);
+}
+
+static struct platform_driver gpu_cc_kaanapali_driver = {
+	.probe = gpu_cc_kaanapali_probe,
+	.driver = {
+		.name = "gpucc-kaanapali",
+		.of_match_table = gpu_cc_kaanapali_match_table,
+	},
+};
+
+module_platform_driver(gpu_cc_kaanapali_driver);
+
+MODULE_DESCRIPTION("QTI GPUCC KAANAPALI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
new file mode 100644
index 000000000000..358cbd0a52fd
--- /dev/null
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
+
+#include "common.h"
+#include "gdsc.h"
+
+enum {
+	DT_BI_TCXO,
+};
+
+static struct gdsc gx_clkctl_gx_gdsc = {
+	.gdscr = 0x0,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gx_clkctl_gx_gdsc",
+		.power_on = gdsc_gx_do_nothing_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc *gx_clkctl_gdscs[] = {
+	[GX_CLKCTL_GX_GDSC] = &gx_clkctl_gx_gdsc,
+};
+
+static const struct regmap_config gx_clkctl_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
+	.config = &gx_clkctl_regmap_config,
+	.gdscs = gx_clkctl_gdscs,
+	.num_gdscs = ARRAY_SIZE(gx_clkctl_gdscs),
+	.use_rpm = true,
+};
+
+static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
+	{ .compatible = "qcom,kaanapali-gxclkctl" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
+
+static int gx_clkctl_kaanapali_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc);
+}
+
+static struct platform_driver gx_clkctl_kaanapali_driver = {
+	.probe = gx_clkctl_kaanapali_probe,
+	.driver = {
+		.name = "gxclkctl-kaanapali",
+		.of_match_table = gx_clkctl_kaanapali_match_table,
+	},
+};
+
+static int __init gx_clkctl_kaanapali_init(void)
+{
+	return platform_driver_register(&gx_clkctl_kaanapali_driver);
+}
+subsys_initcall(gx_clkctl_kaanapali_init);
+
+static void __exit gx_clkctl_kaanapali_exit(void)
+{
+	platform_driver_unregister(&gx_clkctl_kaanapali_driver);
+}
+module_exit(gx_clkctl_kaanapali_exit);
+
+MODULE_DESCRIPTION("QTI GFXCLKCTL KAANAPALI Driver");
+MODULE_LICENSE("GPL");

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
