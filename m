Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F671BA00C3
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 16:38:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D32BC3F959;
	Thu, 25 Sep 2025 14:38:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1396C36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 12:45:54 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso1216224f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 05:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758804354; x=1759409154;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q1ME8YRW1EiHZ7dEcb8o4VecctH4UDoVnukhBv0BDx4=;
 b=y7fUyAyjmdx5xJaMT7CgQ0XNYhWCdzWD4/VZigsfd4TpEYY/F/q+WXAqafejoyaviH
 sH0HlOleEl4TjMJrsGb5yOUfNropDr1cbRdpYJg3RmrZ2lsHP5QiYjYTtd/sKzMKrTtr
 uNc42uFas0VCxGUWVe6QPDPuUdqiqahnfOal2gg7b4nhmEnG+qcsmsvnsFL5SI8/r03x
 2lbCeMoh0oHH31AOuWaiFHZQcNKQLkaPJdNizmo0pQ3fs0irYH1mi39taJHvMnXXrOyd
 TUsTZlBS+/YWTG4DiKfOMh6rerzPt6IJDNuQEQq7Pwu43Sc6Di9NUFfqzcTfjETUgeze
 jiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758804354; x=1759409154;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q1ME8YRW1EiHZ7dEcb8o4VecctH4UDoVnukhBv0BDx4=;
 b=Xzp8ePGsCK4iHljA+8xuS3fYPhVSCOR1pqTwG3GDcghKVZTA25742qLjePgKeFn4FV
 HGF1UUSZ19SG0TfibVNEbz6ys/Kf4Pk6Qxj/I75/rAGOY1+NQ2sLO/3eshP6g843iItf
 WhThhaJcCF4CI97wjpc0sTC35Z3viVKmqlywxnF0URQNQ+NJtTJhl3joosMcvvxP26Ec
 ROA9yTgX6eKhFOAynSdglC17URuGCwda6yIp416HiXOufoyl8N/OchFeLhpjEW5lMv+R
 8kXf8DKAvIpWWk1KojzaK14LQpji/d8nJXWTmerQ5cVom51+Ib+WwA7l2/6YLWbGMJEe
 C2tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGFmPOTi5UO7+d7El8A+/ktGlB7dP8LSm4m0e0Rz3tHTzFt29SH+kp/hAE9v8Ue2dxFgEFpU6C9+u4Kw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx02AqJChxDQd4wNPy7thQgBV4ROafYbSpnRBX8o5rfH7fosuSF
 hWSzxX36wSspkaiC09uSPdV3plJrJZNbDN8kgKGoxcSekRj3rZ6116rtE+LQKSIxT7A=
X-Gm-Gg: ASbGncsCmKIR7FrVasR1idnsmXY/EAqPJI21G+ysKUXJIEaxuVh29Qu0bJbzG2XC+xp
 eipVsbiaKD8RKrc8fSEvPSvjBeU2yS6By3OPG0P+D4c0v2zbuBNc1gEwYmbeURf0vUXIkSUwtog
 ywHvulF4OiMthWj/v40UDb8ZiY6IibTvGN2B7hYMozzwCBi8THrJ7fXPrI8RpaBo/1FQHa1T4h4
 fPccMlbSkqJgEnCliv8C9516SXMYYHTYA3wl0dIRTGIJ+yUNaPdNE3yAQNphQjeNA2xFWMx95m1
 1k981DQwRZEKnpPqPm2jg4foojLIQx1HrneOrNQbf2mjEBSdJ6pW/YSljJQqWeNlTYIAIZ44BoN
 L64ZQv7cm1AsZ0Xk9Az9bOvQ3ZD1uEF1nrnjTNz574RaUid2eGMGMNZ6S2lsdroXFnTueVa5KFn
 BpfSUX4TzK0bLuLgp+kjUKZ02ewOVZ16o=
X-Google-Smtp-Source: AGHT+IHgwspsSyJil6o0uWFF7IZnRQvrQt6LmdeNavlBwJGyFuprquIfCQiyDMQnPxNE/NCstSSGOA==
X-Received: by 2002:a05:6000:610:b0:3ee:11d1:2a1e with SMTP id
 ffacd0b85a97d-40f5fea54d4mr2372328f8f.10.1758804353570; 
 Thu, 25 Sep 2025 05:45:53 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7d3780asm2812344f8f.52.2025.09.25.05.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 05:45:52 -0700 (PDT)
Message-ID: <0f4154fd-2852-4327-a60c-5ce30fba991f@linaro.org>
Date: Thu, 25 Sep 2025 13:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
X-Mailman-Approved-At: Thu, 25 Sep 2025 14:38:39 +0000
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 7/9] clk: qcom: camcc: Add support for
 camera clock controller for Kaanapali
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 25/09/2025 00:56, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for CAMCC clock controller for Kaanapali for the camera
> consumers to be able to do clock ops on them.

"Add support for Camera Clock Controller CAMCC on Kaanapali."

Then optionally list any notable features or differences from previous 
clock controllers of this class.

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/Kconfig                   |   10 +
>   drivers/clk/qcom/Makefile                  |    1 +
>   drivers/clk/qcom/cambistmclkcc-kaanapali.c |  437 +++++
>   drivers/clk/qcom/camcc-kaanapali.c         | 2661 ++++++++++++++++++++++++++++
>   4 files changed, 3109 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index d9cec3e52c25..520471dba632 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -19,6 +19,16 @@ menuconfig COMMON_CLK_QCOM
>   
>   if COMMON_CLK_QCOM
>   
> +config CLK_KAANAPALI_CAMCC
> +	tristate "KAANAPALI Camera Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_KAANAPALI_GCC
> +	help
> +	  Support for the camera clock controller on Qualcomm Technologies, Inc
> +	  Kaanapali devices.
> +	  Say Y if you want to support camera devices and functionality such as
> +	  capturing pictures.
> +
>   config CLK_GLYMUR_DISPCC
>   	tristate "GLYMUR Display Clock Controller"
>   	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index c42de903ef0d..e9919ce86f32 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>   obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>   obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
>   obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
> +obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
>   obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
>   obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
>   obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
> diff --git a/drivers/clk/qcom/cambistmclkcc-kaanapali.c b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
> new file mode 100644
> index 000000000000..96e0f0f5d0bf
> --- /dev/null
> +++ b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
> @@ -0,0 +1,437 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_AHB_CLK,
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +	DT_SLEEP_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN,
> +	P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN,
> +};
> +
> +static const struct pll_vco rivian_eko_t_vco[] = {
> +	{ 883200000, 1171200000, 0 },
> +};
> +
> +/* 960.0 MHz Configuration */
> +static const struct alpha_pll_config cam_bist_mclk_cc_pll0_config = {
> +	.l = 0x32,
> +	.cal_l = 0x32,
> +	.alpha = 0x0,
> +	.config_ctl_val = 0x12000000,
> +	.config_ctl_hi_val = 0x00890263,
> +	.config_ctl_hi1_val = 0x1af04237,
> +	.config_ctl_hi2_val = 0x00000000,
> +};
> +
> +static struct clk_alpha_pll cam_bist_mclk_cc_pll0 = {
> +	.offset = 0x0,
> +	.config = &cam_bist_mclk_cc_pll0_config,
> +	.vco_table = rivian_eko_t_vco,
> +	.num_vco = ARRAY_SIZE(rivian_eko_t_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_bist_mclk_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_rivian_eko_t_ops,
> +		},
> +	},
> +};
> +
> +static const struct parent_map cam_bist_mclk_cc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN, 3 },
> +	{ P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN, 5 },
> +};
> +
> +static const struct clk_parent_data cam_bist_mclk_cc_parent_data_0[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_bist_mclk_cc_pll0.clkr.hw },
> +	{ .hw = &cam_bist_mclk_cc_pll0.clkr.hw },
> +};
> +
> +static const struct freq_tbl ftbl_cam_bist_mclk_cc_mclk0_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(24000000, P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN, 10, 1, 4),
> +	F(68571429, P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN, 14, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_bist_mclk_cc_mclk0_clk_src = {
> +	.cmd_rcgr = 0x4000,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_bist_mclk_cc_parent_map_0,
> +	.hw_clk_ctrl = true,
> +	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_bist_mclk_cc_mclk0_clk_src",
> +		.parent_data = cam_bist_mclk_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_bist_mclk_cc_mclk1_clk_src = {
> +	.cmd_rcgr = 0x401c,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_bist_mclk_cc_parent_map_0,
> +	.hw_clk_ctrl = true,
> +	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_bist_mclk_cc_mclk1_clk_src",
> +		.parent_data = cam_bist_mclk_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_bist_mclk_cc_mclk2_clk_src = {
> +	.cmd_rcgr = 0x4038,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_bist_mclk_cc_parent_map_0,
> +	.hw_clk_ctrl = true,
> +	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_bist_mclk_cc_mclk2_clk_src",
> +		.parent_data = cam_bist_mclk_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_bist_mclk_cc_mclk3_clk_src = {
> +	.cmd_rcgr = 0x4054,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_bist_mclk_cc_parent_map_0,
> +	.hw_clk_ctrl = true,
> +	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_bist_mclk_cc_mclk3_clk_src",
> +		.parent_data = cam_bist_mclk_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_bist_mclk_cc_mclk4_clk_src = {
> +	.cmd_rcgr = 0x4070,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_bist_mclk_cc_parent_map_0,
> +	.hw_clk_ctrl = true,
> +	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_bist_mclk_cc_mclk4_clk_src",
> +		.parent_data = cam_bist_mclk_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_bist_mclk_cc_mclk5_clk_src = {
> +	.cmd_rcgr = 0x408c,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_bist_mclk_cc_parent_map_0,
> +	.hw_clk_ctrl = true,
> +	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_bist_mclk_cc_mclk5_clk_src",
> +		.parent_data = cam_bist_mclk_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_bist_mclk_cc_mclk6_clk_src = {
> +	.cmd_rcgr = 0x40a8,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_bist_mclk_cc_parent_map_0,
> +	.hw_clk_ctrl = true,
> +	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_bist_mclk_cc_mclk6_clk_src",
> +		.parent_data = cam_bist_mclk_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_bist_mclk_cc_mclk7_clk_src = {
> +	.cmd_rcgr = 0x40c4,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_bist_mclk_cc_parent_map_0,
> +	.hw_clk_ctrl = true,
> +	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_bist_mclk_cc_mclk7_clk_src",
> +		.parent_data = cam_bist_mclk_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_branch cam_bist_mclk_cc_mclk0_clk = {
> +	.halt_reg = 0x4018,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4018,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_bist_mclk_cc_mclk0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_bist_mclk_cc_mclk0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_bist_mclk_cc_mclk1_clk = {
> +	.halt_reg = 0x4034,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4034,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_bist_mclk_cc_mclk1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_bist_mclk_cc_mclk1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_bist_mclk_cc_mclk2_clk = {
> +	.halt_reg = 0x4050,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4050,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_bist_mclk_cc_mclk2_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_bist_mclk_cc_mclk2_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_bist_mclk_cc_mclk3_clk = {
> +	.halt_reg = 0x406c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x406c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_bist_mclk_cc_mclk3_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_bist_mclk_cc_mclk3_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_bist_mclk_cc_mclk4_clk = {
> +	.halt_reg = 0x4088,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4088,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_bist_mclk_cc_mclk4_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_bist_mclk_cc_mclk4_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_bist_mclk_cc_mclk5_clk = {
> +	.halt_reg = 0x40a4,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x40a4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_bist_mclk_cc_mclk5_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_bist_mclk_cc_mclk5_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_bist_mclk_cc_mclk6_clk = {
> +	.halt_reg = 0x40c0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x40c0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_bist_mclk_cc_mclk6_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_bist_mclk_cc_mclk6_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_bist_mclk_cc_mclk7_clk = {
> +	.halt_reg = 0x40dc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x40dc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_bist_mclk_cc_mclk7_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_bist_mclk_cc_mclk7_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap *cam_bist_mclk_cc_kaanapali_clocks[] = {
> +	[CAM_BIST_MCLK_CC_MCLK0_CLK] = &cam_bist_mclk_cc_mclk0_clk.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK0_CLK_SRC] = &cam_bist_mclk_cc_mclk0_clk_src.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK1_CLK] = &cam_bist_mclk_cc_mclk1_clk.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK1_CLK_SRC] = &cam_bist_mclk_cc_mclk1_clk_src.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK2_CLK] = &cam_bist_mclk_cc_mclk2_clk.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK2_CLK_SRC] = &cam_bist_mclk_cc_mclk2_clk_src.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK3_CLK] = &cam_bist_mclk_cc_mclk3_clk.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK3_CLK_SRC] = &cam_bist_mclk_cc_mclk3_clk_src.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK4_CLK] = &cam_bist_mclk_cc_mclk4_clk.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK4_CLK_SRC] = &cam_bist_mclk_cc_mclk4_clk_src.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK5_CLK] = &cam_bist_mclk_cc_mclk5_clk.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK5_CLK_SRC] = &cam_bist_mclk_cc_mclk5_clk_src.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK6_CLK] = &cam_bist_mclk_cc_mclk6_clk.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK6_CLK_SRC] = &cam_bist_mclk_cc_mclk6_clk_src.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK7_CLK] = &cam_bist_mclk_cc_mclk7_clk.clkr,
> +	[CAM_BIST_MCLK_CC_MCLK7_CLK_SRC] = &cam_bist_mclk_cc_mclk7_clk_src.clkr,
> +	[CAM_BIST_MCLK_CC_PLL0] = &cam_bist_mclk_cc_pll0.clkr,
> +};
> +
> +static struct clk_alpha_pll *cam_bist_mclk_cc_kaanapali_plls[] = {
> +	&cam_bist_mclk_cc_pll0,
> +};
> +
> +static u32 cam_bist_mclk_cc_kaanapali_critical_cbcrs[] = {
> +	0x40e0, /* CAM_BIST_MCLK_CC_SLEEP_CLK */
> +};
> +
> +static const struct regmap_config cam_bist_mclk_cc_kaanapali_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x5010,
> +	.fast_io = true,
> +};
> +
> +static struct qcom_cc_driver_data cam_bist_mclk_cc_kaanapali_driver_data = {
> +	.alpha_plls = cam_bist_mclk_cc_kaanapali_plls,
> +	.num_alpha_plls = ARRAY_SIZE(cam_bist_mclk_cc_kaanapali_plls),
> +	.clk_cbcrs = cam_bist_mclk_cc_kaanapali_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(cam_bist_mclk_cc_kaanapali_critical_cbcrs),
> +};
> +
> +static const struct qcom_cc_desc cam_bist_mclk_cc_kaanapali_desc = {
> +	.config = &cam_bist_mclk_cc_kaanapali_regmap_config,
> +	.clks = cam_bist_mclk_cc_kaanapali_clocks,
> +	.num_clks = ARRAY_SIZE(cam_bist_mclk_cc_kaanapali_clocks),
> +	.use_rpm = true,
> +	.driver_data = &cam_bist_mclk_cc_kaanapali_driver_data,
> +};
> +
> +static const struct of_device_id cam_bist_mclk_cc_kaanapali_match_table[] = {
> +	{ .compatible = "qcom,kaanapali-cambistmclkcc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, cam_bist_mclk_cc_kaanapali_match_table);
> +
> +static int cam_bist_mclk_cc_kaanapali_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &cam_bist_mclk_cc_kaanapali_desc);
> +}
> +
> +static struct platform_driver cam_bist_mclk_cc_kaanapali_driver = {
> +	.probe = cam_bist_mclk_cc_kaanapali_probe,
> +	.driver = {
> +		.name = "cambistmclkcc-kaanapali",
> +		.of_match_table = cam_bist_mclk_cc_kaanapali_match_table,
> +	},
> +};
> +
> +module_platform_driver(cam_bist_mclk_cc_kaanapali_driver);
> +
> +MODULE_DESCRIPTION("QTI CAMBISTMCLKCC KAANAPALI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/qcom/camcc-kaanapali.c b/drivers/clk/qcom/camcc-kaanapali.c
> new file mode 100644
> index 000000000000..6bde0f5adcb3
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-kaanapali.c
> @@ -0,0 +1,2661 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_AHB_CLK,
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +	DT_SLEEP_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_CAM_CC_PLL0_OUT_EVEN,
> +	P_CAM_CC_PLL0_OUT_MAIN,
> +	P_CAM_CC_PLL0_OUT_ODD,
> +	P_CAM_CC_PLL1_OUT_EVEN,
> +	P_CAM_CC_PLL2_OUT_EVEN,
> +	P_CAM_CC_PLL3_OUT_EVEN,
> +	P_CAM_CC_PLL4_OUT_EVEN,
> +	P_CAM_CC_PLL5_OUT_EVEN,
> +	P_CAM_CC_PLL6_OUT_EVEN,
> +	P_CAM_CC_PLL6_OUT_ODD,
> +	P_CAM_CC_PLL7_OUT_EVEN,
> +};
> +
> +static const struct pll_vco taycan_eko_t_vco[] = {
> +	{ 249600000, 2500000000, 0 },
> +};
> +
> +/* 1200.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll0_config = {
> +	.l = 0x3e,
> +	.cal_l = 0x48,
> +	.alpha = 0x8000,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8062e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00008408,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll0 = {
> +	.offset = 0x0,
> +	.config = &cam_cc_pll0_config,
> +	.vco_table = taycan_eko_t_vco,
> +	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_taycan_eko_t_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll0_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
> +	.offset = 0x0,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll0_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll0_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll0.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll0_out_odd[] = {
> +	{ 0x2, 3 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll0_out_odd = {
> +	.offset = 0x0,
> +	.post_div_shift = 14,
> +	.post_div_table = post_div_table_cam_cc_pll0_out_odd,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_odd),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll0_out_odd",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll0.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
> +	},
> +};
> +
> +/* 665.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll1_config = {
> +	.l = 0x22,
> +	.cal_l = 0x48,
> +	.alpha = 0xa2aa,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8062e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00000408,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll1 = {
> +	.offset = 0x1000,
> +	.config = &cam_cc_pll1_config,
> +	.vco_table = taycan_eko_t_vco,
> +	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll1",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_taycan_eko_t_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll1_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
> +	.offset = 0x1000,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll1_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll1_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll1_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll1.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
> +	},
> +};
> +
> +/* 677.6 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll2_config = {
> +	.l = 0x23,
> +	.cal_l = 0x48,
> +	.alpha = 0x4aaa,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8062e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00000408,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll2 = {
> +	.offset = 0x2000,
> +	.config = &cam_cc_pll2_config,
> +	.vco_table = taycan_eko_t_vco,
> +	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll2",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_taycan_eko_t_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll2_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll2_out_even = {
> +	.offset = 0x2000,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll2_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll2_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll2_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll2.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
> +	},
> +};
> +
> +/* 720.56 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll3_config = {
> +	.l = 0x25,
> +	.cal_l = 0x48,
> +	.alpha = 0x8777,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8062e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00000408,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll3 = {
> +	.offset = 0x3000,
> +	.config = &cam_cc_pll3_config,
> +	.vco_table = taycan_eko_t_vco,
> +	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll3",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_taycan_eko_t_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll3_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
> +	.offset = 0x3000,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll3_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll3_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll3_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll3.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
> +	},
> +};
> +
> +/* 720.56 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll4_config = {
> +	.l = 0x25,
> +	.cal_l = 0x48,
> +	.alpha = 0x8777,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8062e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00000408,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll4 = {
> +	.offset = 0x4000,
> +	.config = &cam_cc_pll4_config,
> +	.vco_table = taycan_eko_t_vco,
> +	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll4",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_taycan_eko_t_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll4_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll4_out_even = {
> +	.offset = 0x4000,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll4_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll4_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll4_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll4.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
> +	},
> +};
> +
> +/* 720.56 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll5_config = {
> +	.l = 0x25,
> +	.cal_l = 0x48,
> +	.alpha = 0x8777,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8062e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00000408,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll5 = {
> +	.offset = 0x5000,
> +	.config = &cam_cc_pll5_config,
> +	.vco_table = taycan_eko_t_vco,
> +	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll5",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_taycan_eko_t_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll5_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll5_out_even = {
> +	.offset = 0x5000,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll5_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll5_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll5_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll5.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
> +	},
> +};
> +
> +/* 960.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll6_config = {
> +	.l = 0x32,
> +	.cal_l = 0x48,
> +	.alpha = 0x0,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8062e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00008408,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll6 = {
> +	.offset = 0x6000,
> +	.config = &cam_cc_pll6_config,
> +	.vco_table = taycan_eko_t_vco,
> +	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll6",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_taycan_eko_t_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll6_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll6_out_even = {
> +	.offset = 0x6000,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll6_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll6_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll6_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll6.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll6_out_odd[] = {
> +	{ 0x2, 3 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll6_out_odd = {
> +	.offset = 0x6000,
> +	.post_div_shift = 14,
> +	.post_div_table = post_div_table_cam_cc_pll6_out_odd,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll6_out_odd),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll6_out_odd",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll6.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
> +	},
> +};
> +
> +/* 1000.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll7_config = {
> +	.l = 0x34,
> +	.cal_l = 0x48,
> +	.alpha = 0x1555,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8062e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00000408,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll7 = {
> +	.offset = 0x7000,
> +	.config = &cam_cc_pll7_config,
> +	.vco_table = taycan_eko_t_vco,
> +	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll7",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_taycan_eko_t_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll7_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll7_out_even = {
> +	.offset = 0x7000,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll7_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll7_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll7_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll7.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
> +	},
> +};
> +
> +static const struct parent_map cam_cc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
> +	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
> +	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
> +	{ P_CAM_CC_PLL6_OUT_ODD, 4 },
> +	{ P_CAM_CC_PLL6_OUT_EVEN, 5 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_0[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll0.clkr.hw },
> +	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
> +	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
> +	{ .hw = &cam_cc_pll6_out_odd.clkr.hw },
> +	{ .hw = &cam_cc_pll6_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_1[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
> +	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
> +	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
> +	{ P_CAM_CC_PLL6_OUT_ODD, 4 },
> +	{ P_CAM_CC_PLL6_OUT_EVEN, 5 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_1[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll0.clkr.hw },
> +	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
> +	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
> +	{ .hw = &cam_cc_pll6_out_odd.clkr.hw },
> +	{ .hw = &cam_cc_pll6_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_2[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
> +	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
> +	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
> +	{ P_CAM_CC_PLL7_OUT_EVEN, 6 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_2[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll0.clkr.hw },
> +	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
> +	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
> +	{ .hw = &cam_cc_pll7_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_3[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL1_OUT_EVEN, 4 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_3[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll1_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_4[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL2_OUT_EVEN, 5 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_4[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll2_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_5[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL3_OUT_EVEN, 6 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_5[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll3_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_6[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL4_OUT_EVEN, 6 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_6[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll4_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_7[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL5_OUT_EVEN, 6 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_7[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll5_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_8[] = {
> +	{ P_BI_TCXO, 0 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_8[] = {
> +	{ .index = DT_BI_TCXO },
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(200000000, P_CAM_CC_PLL0_OUT_EVEN, 3, 0, 0),
> +	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_EVEN, 1.5, 0, 0),
> +	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_camnoc_rt_axi_clk_src = {
> +	.cmd_rcgr = 0x212cc,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_camnoc_rt_axi_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_camnoc_rt_axi_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src[] = {
> +	F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_cci_0_clk_src = {
> +	.cmd_rcgr = 0x21250,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_cci_0_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_cci_1_clk_src = {
> +	.cmd_rcgr = 0x2126c,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_cci_1_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_cci_2_clk_src = {
> +	.cmd_rcgr = 0x21288,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_cci_2_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] = {
> +	F(266666667, P_CAM_CC_PLL0_OUT_MAIN, 4.5, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
> +	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
> +	.cmd_rcgr = 0x21064,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_cphy_rx_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_cre_clk_src[] = {
> +	F(137142857, P_CAM_CC_PLL6_OUT_EVEN, 3.5, 0, 0),
> +	F(200000000, P_CAM_CC_PLL0_OUT_ODD, 2, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
> +	F(480000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
> +	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_cre_clk_src = {
> +	.cmd_rcgr = 0x211a0,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_cre_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_cre_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_csi0phytimer_clk_src[] = {
> +	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
> +	.cmd_rcgr = 0x20000,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi0phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
> +	.cmd_rcgr = 0x20024,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi1phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
> +	.cmd_rcgr = 0x20044,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi2phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
> +	.cmd_rcgr = 0x20064,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi3phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
> +	.cmd_rcgr = 0x20084,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi4phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_csi5phytimer_clk_src = {
> +	.cmd_rcgr = 0x200a4,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi5phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_csid_clk_src = {
> +	.cmd_rcgr = 0x212a4,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csid_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_fast_ahb_clk_src[] = {
> +	F(213333333, P_CAM_CC_PLL6_OUT_ODD, 1.5, 0, 0),
> +	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
> +	.cmd_rcgr = 0x200dc,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_fast_ahb_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_fast_ahb_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_icp_0_clk_src[] = {
> +	F(500000000, P_CAM_CC_PLL7_OUT_EVEN, 1, 0, 0),
> +	F(600000000, P_CAM_CC_PLL7_OUT_EVEN, 1, 0, 0),
> +	F(740000000, P_CAM_CC_PLL7_OUT_EVEN, 1, 0, 0),
> +	F(875000000, P_CAM_CC_PLL7_OUT_EVEN, 1, 0, 0),
> +	F(1000000000, P_CAM_CC_PLL7_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_icp_0_clk_src = {
> +	.cmd_rcgr = 0x211f8,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_2,
> +	.freq_tbl = ftbl_cam_cc_icp_0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_icp_0_clk_src",
> +		.parent_data = cam_cc_parent_data_2,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_icp_1_clk_src = {
> +	.cmd_rcgr = 0x21220,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_2,
> +	.freq_tbl = ftbl_cam_cc_icp_0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_icp_1_clk_src",
> +		.parent_data = cam_cc_parent_data_2,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
> +	.cmd_rcgr = 0x21144,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_ife_lite_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
> +	.cmd_rcgr = 0x21170,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_ife_lite_csid_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_ipe_nps_clk_src[] = {
> +	F(332500000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
> +	F(475000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
> +	F(575000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
> +	F(675000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
> +	F(825000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_ipe_nps_clk_src = {
> +	.cmd_rcgr = 0x20188,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_3,
> +	.freq_tbl = ftbl_cam_cc_ipe_nps_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_ipe_nps_clk_src",
> +		.parent_data = cam_cc_parent_data_3,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_jpeg_clk_src = {
> +	.cmd_rcgr = 0x211c4,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_cre_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_jpeg_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_ofe_clk_src[] = {
> +	F(338800000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
> +	F(484000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
> +	F(586000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
> +	F(688000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
> +	F(841000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_ofe_clk_src = {
> +	.cmd_rcgr = 0x2011c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_4,
> +	.freq_tbl = ftbl_cam_cc_ofe_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_ofe_clk_src",
> +		.parent_data = cam_cc_parent_data_4,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
> +	F(40000000, P_CAM_CC_PLL6_OUT_ODD, 8, 0, 0),
> +	F(60000000, P_CAM_CC_PLL6_OUT_EVEN, 8, 0, 0),
> +	F(120000000, P_CAM_CC_PLL0_OUT_EVEN, 5, 0, 0),
> +	F(240000000, P_CAM_CC_PLL0_OUT_MAIN, 5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
> +	.cmd_rcgr = 0x21314,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_qdss_debug_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_slow_ahb_clk_src[] = {
> +	F(56470588, P_CAM_CC_PLL6_OUT_EVEN, 8.5, 0, 0),
> +	F(80000000, P_CAM_CC_PLL0_OUT_EVEN, 7.5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
> +	.cmd_rcgr = 0x20100,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_slow_ahb_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_tfe_0_clk_src[] = {
> +	F(360280000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
> +	F(480000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
> +	F(630000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
> +	F(716000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
> +	F(833000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_tfe_0_clk_src = {
> +	.cmd_rcgr = 0x21018,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_5,
> +	.freq_tbl = ftbl_cam_cc_tfe_0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_tfe_0_clk_src",
> +		.parent_data = cam_cc_parent_data_5,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_tfe_1_clk_src[] = {
> +	F(360280000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
> +	F(480000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
> +	F(630000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
> +	F(716000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
> +	F(833000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_tfe_1_clk_src = {
> +	.cmd_rcgr = 0x21094,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_6,
> +	.freq_tbl = ftbl_cam_cc_tfe_1_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_tfe_1_clk_src",
> +		.parent_data = cam_cc_parent_data_6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_6),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_tfe_2_clk_src[] = {
> +	F(360280000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
> +	F(480000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
> +	F(630000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
> +	F(716000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
> +	F(833000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_tfe_2_clk_src = {
> +	.cmd_rcgr = 0x210f8,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_7,
> +	.freq_tbl = ftbl_cam_cc_tfe_2_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_tfe_2_clk_src",
> +		.parent_data = cam_cc_parent_data_7,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_7),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_xo_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_xo_clk_src = {
> +	.cmd_rcgr = 0x2134c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_8,
> +	.freq_tbl = ftbl_cam_cc_xo_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_xo_clk_src",
> +		.parent_data = cam_cc_parent_data_8,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_8),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cam_top_ahb_clk = {
> +	.halt_reg = 0x2137c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2137c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cam_top_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cam_top_fast_ahb_clk = {
> +	.halt_reg = 0x2136c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2136c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cam_top_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_nrt_axi_clk = {
> +	.halt_reg = 0x212f8,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x212f8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_nrt_axi_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_camnoc_rt_axi_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_nrt_cre_clk = {
> +	.halt_reg = 0x211bc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x211bc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_nrt_cre_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cre_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_nrt_ipe_nps_clk = {
> +	.halt_reg = 0x201b0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x201b0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_nrt_ipe_nps_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ipe_nps_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_nrt_ofe_main_clk = {
> +	.halt_reg = 0x20144,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x20144,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_nrt_ofe_main_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ofe_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_rt_axi_clk = {
> +	.halt_reg = 0x212e4,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x212e4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_rt_axi_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_camnoc_rt_axi_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_rt_ife_lite_clk = {
> +	.halt_reg = 0x2116c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2116c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_rt_ife_lite_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ife_lite_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_rt_tfe_0_main_clk = {
> +	.halt_reg = 0x21040,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21040,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_rt_tfe_0_main_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_tfe_0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_rt_tfe_1_main_clk = {
> +	.halt_reg = 0x210bc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x210bc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_rt_tfe_1_main_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_tfe_1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_rt_tfe_2_main_clk = {
> +	.halt_reg = 0x21120,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21120,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_rt_tfe_2_main_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_tfe_2_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_xo_clk = {
> +	.halt_reg = 0x2130c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2130c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_xo_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cci_0_clk = {
> +	.halt_reg = 0x21268,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21268,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cci_0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cci_0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cci_1_clk = {
> +	.halt_reg = 0x21284,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21284,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cci_1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cci_1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cci_2_clk = {
> +	.halt_reg = 0x212a0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x212a0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cci_2_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cci_2_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_core_ahb_clk = {
> +	.halt_reg = 0x21348,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x21348,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_core_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cre_ahb_clk = {
> +	.halt_reg = 0x211c0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x211c0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cre_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cre_clk = {
> +	.halt_reg = 0x211b8,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x211b8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cre_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cre_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi0phytimer_clk = {
> +	.halt_reg = 0x20018,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x20018,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi0phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi0phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi1phytimer_clk = {
> +	.halt_reg = 0x2003c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2003c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi1phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi1phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi2phytimer_clk = {
> +	.halt_reg = 0x2005c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2005c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi2phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi2phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi3phytimer_clk = {
> +	.halt_reg = 0x2007c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2007c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi3phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi3phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi4phytimer_clk = {
> +	.halt_reg = 0x2009c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2009c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi4phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi4phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi5phytimer_clk = {
> +	.halt_reg = 0x200bc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x200bc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi5phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi5phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csid_clk = {
> +	.halt_reg = 0x212bc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x212bc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csid_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csid_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csid_csiphy_rx_clk = {
> +	.halt_reg = 0x20020,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x20020,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csid_csiphy_rx_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy0_clk = {
> +	.halt_reg = 0x2001c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2001c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy1_clk = {
> +	.halt_reg = 0x20040,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x20040,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy2_clk = {
> +	.halt_reg = 0x20060,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x20060,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy2_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy3_clk = {
> +	.halt_reg = 0x20080,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x20080,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy3_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy4_clk = {
> +	.halt_reg = 0x200a0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x200a0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy4_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy5_clk = {
> +	.halt_reg = 0x200c0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x200c0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy5_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_icp_0_ahb_clk = {
> +	.halt_reg = 0x21248,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21248,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_icp_0_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_icp_0_clk = {
> +	.halt_reg = 0x21210,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21210,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_icp_0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_icp_0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_icp_1_ahb_clk = {
> +	.halt_reg = 0x2124c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2124c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_icp_1_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_icp_1_clk = {
> +	.halt_reg = 0x21238,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21238,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_icp_1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_icp_1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ife_lite_ahb_clk = {
> +	.halt_reg = 0x2119c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2119c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ife_lite_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ife_lite_clk = {
> +	.halt_reg = 0x2115c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2115c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ife_lite_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ife_lite_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
> +	.halt_reg = 0x21198,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21198,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ife_lite_cphy_rx_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ife_lite_csid_clk = {
> +	.halt_reg = 0x21188,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21188,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ife_lite_csid_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ipe_nps_ahb_clk = {
> +	.halt_reg = 0x201cc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x201cc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ipe_nps_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ipe_nps_clk = {
> +	.halt_reg = 0x201a0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x201a0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ipe_nps_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ipe_nps_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ipe_nps_fast_ahb_clk = {
> +	.halt_reg = 0x201d0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x201d0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ipe_nps_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ipe_pps_clk = {
> +	.halt_reg = 0x201b4,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x201b4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ipe_pps_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ipe_nps_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ipe_pps_fast_ahb_clk = {
> +	.halt_reg = 0x201d4,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x201d4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ipe_pps_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_jpeg_clk = {
> +	.halt_reg = 0x211dc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x211dc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_jpeg_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_jpeg_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ofe_ahb_clk = {
> +	.halt_reg = 0x20118,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x20118,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ofe_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ofe_anchor_clk = {
> +	.halt_reg = 0x20148,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x20148,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ofe_anchor_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ofe_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ofe_anchor_fast_ahb_clk = {
> +	.halt_reg = 0x200f8,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x200f8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ofe_anchor_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ofe_hdr_clk = {
> +	.halt_reg = 0x20158,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x20158,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ofe_hdr_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ofe_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ofe_hdr_fast_ahb_clk = {
> +	.halt_reg = 0x200fc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x200fc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ofe_hdr_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ofe_main_clk = {
> +	.halt_reg = 0x20134,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x20134,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ofe_main_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ofe_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ofe_main_fast_ahb_clk = {
> +	.halt_reg = 0x200f4,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x200f4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ofe_main_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_qdss_debug_clk = {
> +	.halt_reg = 0x2132c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2132c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_qdss_debug_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_qdss_debug_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_qdss_debug_xo_clk = {
> +	.halt_reg = 0x21330,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21330,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_qdss_debug_xo_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_0_bayer_clk = {
> +	.halt_reg = 0x21044,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21044,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_0_bayer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_tfe_0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_0_bayer_fast_ahb_clk = {
> +	.halt_reg = 0x21060,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21060,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_0_bayer_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_0_main_clk = {
> +	.halt_reg = 0x21030,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21030,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_0_main_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_tfe_0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_0_main_fast_ahb_clk = {
> +	.halt_reg = 0x2105c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2105c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_0_main_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_1_bayer_clk = {
> +	.halt_reg = 0x210c0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x210c0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_1_bayer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_tfe_1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_1_bayer_fast_ahb_clk = {
> +	.halt_reg = 0x210dc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x210dc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_1_bayer_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_1_main_clk = {
> +	.halt_reg = 0x210ac,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x210ac,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_1_main_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_tfe_1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_1_main_fast_ahb_clk = {
> +	.halt_reg = 0x210d8,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x210d8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_1_main_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_2_bayer_clk = {
> +	.halt_reg = 0x21124,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21124,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_2_bayer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_tfe_2_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_2_bayer_fast_ahb_clk = {
> +	.halt_reg = 0x21140,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21140,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_2_bayer_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_2_main_clk = {
> +	.halt_reg = 0x21110,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21110,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_2_main_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_tfe_2_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tfe_2_main_fast_ahb_clk = {
> +	.halt_reg = 0x2113c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2113c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tfe_2_main_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_tracenoc_tpdm_1_cmb_clk = {
> +	.halt_reg = 0x21394,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x21394,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_tracenoc_tpdm_1_cmb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct gdsc cam_cc_titan_top_gdsc = {
> +	.gdscr = 0x21334,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_titan_top_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc cam_cc_ipe_0_gdsc = {
> +	.gdscr = 0x20174,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_ipe_0_gdsc",
> +	},
> +	.parent = &cam_cc_titan_top_gdsc.pd,
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
> +};
> +
> +static struct gdsc cam_cc_ofe_gdsc = {
> +	.gdscr = 0x200c8,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_ofe_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
> +};
> +
> +static struct gdsc cam_cc_tfe_0_gdsc = {
> +	.gdscr = 0x21004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_tfe_0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
> +};
> +
> +static struct gdsc cam_cc_tfe_1_gdsc = {
> +	.gdscr = 0x21080,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_tfe_1_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
> +};
> +
> +static struct gdsc cam_cc_tfe_2_gdsc = {
> +	.gdscr = 0x210e4,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_tfe_2_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
> +};
> +
> +static struct clk_regmap *cam_cc_kaanapali_clocks[] = {
> +	[CAM_CC_CAM_TOP_AHB_CLK] = &cam_cc_cam_top_ahb_clk.clkr,
> +	[CAM_CC_CAM_TOP_FAST_AHB_CLK] = &cam_cc_cam_top_fast_ahb_clk.clkr,
> +	[CAM_CC_CAMNOC_NRT_AXI_CLK] = &cam_cc_camnoc_nrt_axi_clk.clkr,
> +	[CAM_CC_CAMNOC_NRT_CRE_CLK] = &cam_cc_camnoc_nrt_cre_clk.clkr,
> +	[CAM_CC_CAMNOC_NRT_IPE_NPS_CLK] = &cam_cc_camnoc_nrt_ipe_nps_clk.clkr,
> +	[CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK] = &cam_cc_camnoc_nrt_ofe_main_clk.clkr,
> +	[CAM_CC_CAMNOC_RT_AXI_CLK] = &cam_cc_camnoc_rt_axi_clk.clkr,
> +	[CAM_CC_CAMNOC_RT_AXI_CLK_SRC] = &cam_cc_camnoc_rt_axi_clk_src.clkr,
> +	[CAM_CC_CAMNOC_RT_IFE_LITE_CLK] = &cam_cc_camnoc_rt_ife_lite_clk.clkr,
> +	[CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK] = &cam_cc_camnoc_rt_tfe_0_main_clk.clkr,
> +	[CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK] = &cam_cc_camnoc_rt_tfe_1_main_clk.clkr,
> +	[CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK] = &cam_cc_camnoc_rt_tfe_2_main_clk.clkr,
> +	[CAM_CC_CAMNOC_XO_CLK] = &cam_cc_camnoc_xo_clk.clkr,
> +	[CAM_CC_CCI_0_CLK] = &cam_cc_cci_0_clk.clkr,
> +	[CAM_CC_CCI_0_CLK_SRC] = &cam_cc_cci_0_clk_src.clkr,
> +	[CAM_CC_CCI_1_CLK] = &cam_cc_cci_1_clk.clkr,
> +	[CAM_CC_CCI_1_CLK_SRC] = &cam_cc_cci_1_clk_src.clkr,
> +	[CAM_CC_CCI_2_CLK] = &cam_cc_cci_2_clk.clkr,
> +	[CAM_CC_CCI_2_CLK_SRC] = &cam_cc_cci_2_clk_src.clkr,
> +	[CAM_CC_CORE_AHB_CLK] = &cam_cc_core_ahb_clk.clkr,
> +	[CAM_CC_CPHY_RX_CLK_SRC] = &cam_cc_cphy_rx_clk_src.clkr,
> +	[CAM_CC_CRE_AHB_CLK] = &cam_cc_cre_ahb_clk.clkr,
> +	[CAM_CC_CRE_CLK] = &cam_cc_cre_clk.clkr,
> +	[CAM_CC_CRE_CLK_SRC] = &cam_cc_cre_clk_src.clkr,
> +	[CAM_CC_CSI0PHYTIMER_CLK] = &cam_cc_csi0phytimer_clk.clkr,
> +	[CAM_CC_CSI0PHYTIMER_CLK_SRC] = &cam_cc_csi0phytimer_clk_src.clkr,
> +	[CAM_CC_CSI1PHYTIMER_CLK] = &cam_cc_csi1phytimer_clk.clkr,
> +	[CAM_CC_CSI1PHYTIMER_CLK_SRC] = &cam_cc_csi1phytimer_clk_src.clkr,
> +	[CAM_CC_CSI2PHYTIMER_CLK] = &cam_cc_csi2phytimer_clk.clkr,
> +	[CAM_CC_CSI2PHYTIMER_CLK_SRC] = &cam_cc_csi2phytimer_clk_src.clkr,
> +	[CAM_CC_CSI3PHYTIMER_CLK] = &cam_cc_csi3phytimer_clk.clkr,
> +	[CAM_CC_CSI3PHYTIMER_CLK_SRC] = &cam_cc_csi3phytimer_clk_src.clkr,
> +	[CAM_CC_CSI4PHYTIMER_CLK] = &cam_cc_csi4phytimer_clk.clkr,
> +	[CAM_CC_CSI4PHYTIMER_CLK_SRC] = &cam_cc_csi4phytimer_clk_src.clkr,
> +	[CAM_CC_CSI5PHYTIMER_CLK] = &cam_cc_csi5phytimer_clk.clkr,
> +	[CAM_CC_CSI5PHYTIMER_CLK_SRC] = &cam_cc_csi5phytimer_clk_src.clkr,
> +	[CAM_CC_CSID_CLK] = &cam_cc_csid_clk.clkr,
> +	[CAM_CC_CSID_CLK_SRC] = &cam_cc_csid_clk_src.clkr,
> +	[CAM_CC_CSID_CSIPHY_RX_CLK] = &cam_cc_csid_csiphy_rx_clk.clkr,
> +	[CAM_CC_CSIPHY0_CLK] = &cam_cc_csiphy0_clk.clkr,
> +	[CAM_CC_CSIPHY1_CLK] = &cam_cc_csiphy1_clk.clkr,
> +	[CAM_CC_CSIPHY2_CLK] = &cam_cc_csiphy2_clk.clkr,
> +	[CAM_CC_CSIPHY3_CLK] = &cam_cc_csiphy3_clk.clkr,
> +	[CAM_CC_CSIPHY4_CLK] = &cam_cc_csiphy4_clk.clkr,
> +	[CAM_CC_CSIPHY5_CLK] = &cam_cc_csiphy5_clk.clkr,
> +	[CAM_CC_FAST_AHB_CLK_SRC] = &cam_cc_fast_ahb_clk_src.clkr,
> +	[CAM_CC_ICP_0_AHB_CLK] = &cam_cc_icp_0_ahb_clk.clkr,
> +	[CAM_CC_ICP_0_CLK] = &cam_cc_icp_0_clk.clkr,
> +	[CAM_CC_ICP_0_CLK_SRC] = &cam_cc_icp_0_clk_src.clkr,
> +	[CAM_CC_ICP_1_AHB_CLK] = &cam_cc_icp_1_ahb_clk.clkr,
> +	[CAM_CC_ICP_1_CLK] = &cam_cc_icp_1_clk.clkr,
> +	[CAM_CC_ICP_1_CLK_SRC] = &cam_cc_icp_1_clk_src.clkr,
> +	[CAM_CC_IFE_LITE_AHB_CLK] = &cam_cc_ife_lite_ahb_clk.clkr,
> +	[CAM_CC_IFE_LITE_CLK] = &cam_cc_ife_lite_clk.clkr,
> +	[CAM_CC_IFE_LITE_CLK_SRC] = &cam_cc_ife_lite_clk_src.clkr,
> +	[CAM_CC_IFE_LITE_CPHY_RX_CLK] = &cam_cc_ife_lite_cphy_rx_clk.clkr,
> +	[CAM_CC_IFE_LITE_CSID_CLK] = &cam_cc_ife_lite_csid_clk.clkr,
> +	[CAM_CC_IFE_LITE_CSID_CLK_SRC] = &cam_cc_ife_lite_csid_clk_src.clkr,
> +	[CAM_CC_IPE_NPS_AHB_CLK] = &cam_cc_ipe_nps_ahb_clk.clkr,
> +	[CAM_CC_IPE_NPS_CLK] = &cam_cc_ipe_nps_clk.clkr,
> +	[CAM_CC_IPE_NPS_CLK_SRC] = &cam_cc_ipe_nps_clk_src.clkr,
> +	[CAM_CC_IPE_NPS_FAST_AHB_CLK] = &cam_cc_ipe_nps_fast_ahb_clk.clkr,
> +	[CAM_CC_IPE_PPS_CLK] = &cam_cc_ipe_pps_clk.clkr,
> +	[CAM_CC_IPE_PPS_FAST_AHB_CLK] = &cam_cc_ipe_pps_fast_ahb_clk.clkr,
> +	[CAM_CC_JPEG_CLK] = &cam_cc_jpeg_clk.clkr,
> +	[CAM_CC_JPEG_CLK_SRC] = &cam_cc_jpeg_clk_src.clkr,
> +	[CAM_CC_OFE_AHB_CLK] = &cam_cc_ofe_ahb_clk.clkr,
> +	[CAM_CC_OFE_ANCHOR_CLK] = &cam_cc_ofe_anchor_clk.clkr,
> +	[CAM_CC_OFE_ANCHOR_FAST_AHB_CLK] = &cam_cc_ofe_anchor_fast_ahb_clk.clkr,
> +	[CAM_CC_OFE_CLK_SRC] = &cam_cc_ofe_clk_src.clkr,
> +	[CAM_CC_OFE_HDR_CLK] = &cam_cc_ofe_hdr_clk.clkr,
> +	[CAM_CC_OFE_HDR_FAST_AHB_CLK] = &cam_cc_ofe_hdr_fast_ahb_clk.clkr,
> +	[CAM_CC_OFE_MAIN_CLK] = &cam_cc_ofe_main_clk.clkr,
> +	[CAM_CC_OFE_MAIN_FAST_AHB_CLK] = &cam_cc_ofe_main_fast_ahb_clk.clkr,
> +	[CAM_CC_PLL0] = &cam_cc_pll0.clkr,
> +	[CAM_CC_PLL0_OUT_EVEN] = &cam_cc_pll0_out_even.clkr,
> +	[CAM_CC_PLL0_OUT_ODD] = &cam_cc_pll0_out_odd.clkr,
> +	[CAM_CC_PLL1] = &cam_cc_pll1.clkr,
> +	[CAM_CC_PLL1_OUT_EVEN] = &cam_cc_pll1_out_even.clkr,
> +	[CAM_CC_PLL2] = &cam_cc_pll2.clkr,
> +	[CAM_CC_PLL2_OUT_EVEN] = &cam_cc_pll2_out_even.clkr,
> +	[CAM_CC_PLL3] = &cam_cc_pll3.clkr,
> +	[CAM_CC_PLL3_OUT_EVEN] = &cam_cc_pll3_out_even.clkr,
> +	[CAM_CC_PLL4] = &cam_cc_pll4.clkr,
> +	[CAM_CC_PLL4_OUT_EVEN] = &cam_cc_pll4_out_even.clkr,
> +	[CAM_CC_PLL5] = &cam_cc_pll5.clkr,
> +	[CAM_CC_PLL5_OUT_EVEN] = &cam_cc_pll5_out_even.clkr,
> +	[CAM_CC_PLL6] = &cam_cc_pll6.clkr,
> +	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
> +	[CAM_CC_PLL6_OUT_ODD] = &cam_cc_pll6_out_odd.clkr,
> +	[CAM_CC_PLL7] = &cam_cc_pll7.clkr,
> +	[CAM_CC_PLL7_OUT_EVEN] = &cam_cc_pll7_out_even.clkr,
> +	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
> +	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
> +	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
> +	[CAM_CC_SLOW_AHB_CLK_SRC] = &cam_cc_slow_ahb_clk_src.clkr,
> +	[CAM_CC_TFE_0_BAYER_CLK] = &cam_cc_tfe_0_bayer_clk.clkr,
> +	[CAM_CC_TFE_0_BAYER_FAST_AHB_CLK] = &cam_cc_tfe_0_bayer_fast_ahb_clk.clkr,
> +	[CAM_CC_TFE_0_CLK_SRC] = &cam_cc_tfe_0_clk_src.clkr,
> +	[CAM_CC_TFE_0_MAIN_CLK] = &cam_cc_tfe_0_main_clk.clkr,
> +	[CAM_CC_TFE_0_MAIN_FAST_AHB_CLK] = &cam_cc_tfe_0_main_fast_ahb_clk.clkr,
> +	[CAM_CC_TFE_1_BAYER_CLK] = &cam_cc_tfe_1_bayer_clk.clkr,
> +	[CAM_CC_TFE_1_BAYER_FAST_AHB_CLK] = &cam_cc_tfe_1_bayer_fast_ahb_clk.clkr,
> +	[CAM_CC_TFE_1_CLK_SRC] = &cam_cc_tfe_1_clk_src.clkr,
> +	[CAM_CC_TFE_1_MAIN_CLK] = &cam_cc_tfe_1_main_clk.clkr,
> +	[CAM_CC_TFE_1_MAIN_FAST_AHB_CLK] = &cam_cc_tfe_1_main_fast_ahb_clk.clkr,
> +	[CAM_CC_TFE_2_BAYER_CLK] = &cam_cc_tfe_2_bayer_clk.clkr,
> +	[CAM_CC_TFE_2_BAYER_FAST_AHB_CLK] = &cam_cc_tfe_2_bayer_fast_ahb_clk.clkr,
> +	[CAM_CC_TFE_2_CLK_SRC] = &cam_cc_tfe_2_clk_src.clkr,
> +	[CAM_CC_TFE_2_MAIN_CLK] = &cam_cc_tfe_2_main_clk.clkr,
> +	[CAM_CC_TFE_2_MAIN_FAST_AHB_CLK] = &cam_cc_tfe_2_main_fast_ahb_clk.clkr,
> +	[CAM_CC_TRACENOC_TPDM_1_CMB_CLK] = &cam_cc_tracenoc_tpdm_1_cmb_clk.clkr,
> +	[CAM_CC_XO_CLK_SRC] = &cam_cc_xo_clk_src.clkr,
> +};
> +
> +static struct gdsc *cam_cc_kaanapali_gdscs[] = {
> +	[CAM_CC_IPE_0_GDSC] = &cam_cc_ipe_0_gdsc,
> +	[CAM_CC_OFE_GDSC] = &cam_cc_ofe_gdsc,
> +	[CAM_CC_TFE_0_GDSC] = &cam_cc_tfe_0_gdsc,
> +	[CAM_CC_TFE_1_GDSC] = &cam_cc_tfe_1_gdsc,
> +	[CAM_CC_TFE_2_GDSC] = &cam_cc_tfe_2_gdsc,
> +	[CAM_CC_TITAN_TOP_GDSC] = &cam_cc_titan_top_gdsc,
> +};
> +
> +static const struct qcom_reset_map cam_cc_kaanapali_resets[] = {
> +	[CAM_CC_DRV_BCR] = { 0x2138c },
> +	[CAM_CC_ICP_BCR] = { 0x211f4 },
> +	[CAM_CC_IPE_0_BCR] = { 0x20170 },
> +	[CAM_CC_OFE_BCR] = { 0x200c4 },
> +	[CAM_CC_QDSS_DEBUG_BCR] = { 0x21310 },
> +	[CAM_CC_TFE_0_BCR] = { 0x21000 },
> +	[CAM_CC_TFE_1_BCR] = { 0x2107c },
> +	[CAM_CC_TFE_2_BCR] = { 0x210e0 },
> +};
> +
> +static struct clk_alpha_pll *cam_cc_kaanapali_plls[] = {
> +	&cam_cc_pll0,
> +	&cam_cc_pll1,
> +	&cam_cc_pll2,
> +	&cam_cc_pll3,
> +	&cam_cc_pll4,
> +	&cam_cc_pll5,
> +	&cam_cc_pll6,
> +	&cam_cc_pll7,
> +};
> +
> +static u32 cam_cc_kaanapali_critical_cbcrs[] = {
> +	0x21398, /* CAM_CC_DRV_AHB_CLK */
> +	0x21390, /* CAM_CC_DRV_XO_CLK */
> +	0x21364, /* CAM_CC_GDSC_CLK */
> +	0x21368, /* CAM_CC_SLEEP_CLK */
> +};
> +
> +static const struct regmap_config cam_cc_kaanapali_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x2601c,
> +	.fast_io = true,
> +};
> +
> +static struct qcom_cc_driver_data cam_cc_kaanapali_driver_data = {
> +	.alpha_plls = cam_cc_kaanapali_plls,
> +	.num_alpha_plls = ARRAY_SIZE(cam_cc_kaanapali_plls),
> +	.clk_cbcrs = cam_cc_kaanapali_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_kaanapali_critical_cbcrs),
> +};
> +
> +static const struct qcom_cc_desc cam_cc_kaanapali_desc = {
> +	.config = &cam_cc_kaanapali_regmap_config,
> +	.clks = cam_cc_kaanapali_clocks,
> +	.num_clks = ARRAY_SIZE(cam_cc_kaanapali_clocks),
> +	.resets = cam_cc_kaanapali_resets,
> +	.num_resets = ARRAY_SIZE(cam_cc_kaanapali_resets),
> +	.gdscs = cam_cc_kaanapali_gdscs,
> +	.num_gdscs = ARRAY_SIZE(cam_cc_kaanapali_gdscs),
> +	.use_rpm = true,
> +	.driver_data = &cam_cc_kaanapali_driver_data,
> +};
> +
> +static const struct of_device_id cam_cc_kaanapali_match_table[] = {
> +	{ .compatible = "qcom,kaanapali-camcc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, cam_cc_kaanapali_match_table);
> +
> +static int cam_cc_kaanapali_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &cam_cc_kaanapali_desc);
> +}
> +
> +static struct platform_driver cam_cc_kaanapali_driver = {
> +	.probe = cam_cc_kaanapali_probe,
> +	.driver = {
> +		.name = "camcc-kaanapali",
> +		.of_match_table = cam_cc_kaanapali_match_table,
> +	},
> +};
> +
> +module_platform_driver(cam_cc_kaanapali_driver);
> +
> +MODULE_DESCRIPTION("QTI CAMCC KAANAPALI Driver");
> +MODULE_LICENSE("GPL");
> 

Please fix your commit log.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
