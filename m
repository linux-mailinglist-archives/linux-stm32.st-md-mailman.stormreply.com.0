Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C919C878DD
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Nov 2025 01:09:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10AA6C57B72;
	Wed, 26 Nov 2025 00:09:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5084C56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Nov 2025 00:09:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APHAiP43890398
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 26 Nov 2025 00:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=b+ATSEVV4P+08/zo6XOpCds2
 blOX1FJN+IVhYsTLJEk=; b=j/soigBmdQMNHS/DAD9D56Z/RhLjJb9B1La9FSXI
 NPNkArZrh1eIs8C+I4QWTIDTeV02bSqDZ58BQDDRBdUyRqTa8oWGGdlI8dukJM0w
 CyqVTv2dmxBV2hWgb/UFyBgwliuDQyHGZnOvVld5+PXz/Yc51zsOagn0fxV2qLbV
 ibEbOFrs8ngTnmkXb48J85KpOv1Gy+2TaNuPIuPDV0jg2oX6VTmBs/8Dx2yzf9wX
 3VL769+luAc64S9x6BmEWnJKSNdRp3YSELnyv8M16gYVFqU0w3i1eiHd7WngZAWq
 AFhj2wbIaB/XG3LOKP1gHQOmvuBFKFwvQm2JmQ4sqD6lUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme8x3a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Nov 2025 00:09:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2de6600c0so1727595985a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 16:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764115780; x=1764720580;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b+ATSEVV4P+08/zo6XOpCds2blOX1FJN+IVhYsTLJEk=;
 b=JhemtnlKXpBqBhTi6EQUEVdEkSMmROeiI9ApxQ+LymUJkGis9Yy9g63pTgkq460RIf
 WeFmuJitakeCqGR1OPERLWzFzj8eouK7/WunTng9ERX/ZmbJeZNvqVgGKO3kWuCtjDSK
 jZ9iqvKcEzZNw4x3YsSTg5A2AfvBrq+8XhO9ibGCe34CVGbbzsZS1MCOKCQYej6IcHpF
 Pvdof8RTuYvZ0Ki4KON4LvuaXweyfoh04yNdLlpQzYN4YNZ1cQaaLZcs895XGNCeUN7f
 1t/dwK9F2x3Hfw8r7egygapxTK9xY+K+uu8Lp6cLx0SZcB37llVPJoEulPOjn7bIUN3l
 UihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764115780; x=1764720580;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+ATSEVV4P+08/zo6XOpCds2blOX1FJN+IVhYsTLJEk=;
 b=tOPI6FlSNgU1B84B5UdpyCUWDqNRnPd4efkByxd4jsPW+F4fabYOFwJ413tzm4GdeJ
 yeNvAwh91SEHbPgtIuTMN15y1j7OtSm3+m7dylTBqk4Pn/uyxYoqN+O9Mdunjf515Ayg
 bR4cwHBhO8+IPFjjOh95B9jtAMPbEZ2Vd4Zltdfrs4WiKE5mJXS38yObcOnhjjcptwvZ
 teSN6HcjhOY9eUYK7p949osv45TdlSKT8CtkijRSl12ELQ7rA3yooonHiSdMyz3I3mTR
 n0PtTdWng92QUskHvIvW91RgrqvMV/VH8EoMTw7B2yB+mKsssYrfnfFZFg+Avi++kYhr
 0XDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWqGrhVaEqYPm3NzdfpYyP4ltmYUXLqM+ygcrQ60IxcswyURRtuz3G4I/1hNXN6Hk1mTumJwC3f94wCQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzXIzq/mscsnibwPOTvutpx7U0EsRvFarPL/5BpyQSdOgXvpG2i
 yw5oagppJwKW6XJOFj8S1FtzUEtYRhVUIx7gPjBCuTs0+5gRRf1q1va8xFysEoUTfxulznQueYT
 63yMYTuvgoGweF39s9lRybvlSFWeymhHJG7SDOFsWoyI7CfxVUTmOZTaIHuf+DEp6Np5hY8YeAa
 p6CU/v/tw=
X-Gm-Gg: ASbGncv1igM6ESclk53qBeaG+79DSlxkaTlsUQSNGMFBf9sKn5s4oLafA5oYj4RMdl3
 odQFUhJ+F0BD7eXkPP/86Z6ZvIxenQQHT1+LMktAte3uv5YIulDXVM/aYbbz8PlTFb6NAFZ3rK3
 TWECA1rSsrXWVBQq9ds9ZtssLy+2phGVcUvOY6D5dIzGyG+NLZSCxvktcRIUN4zGEk/sdijNzaC
 s2GQ0jLexI/sNvJ9AsRdFGwJbn6FWQdOcOv0lmZ+1yW20KYCzTQ36aDY9wzmVG2KLMfaEnw85v0
 Hau3WXqytfnUuecGEHKZ6EQyd5C60YmUqaekPrYoQSEgTUu7kZhv79nXotBJFPvG0gM52VR1yDV
 TrB8ZyxiH4KqaMyyNX62yLVRU3LMbXIt52T1rhSxfvfTBB4k84H7+wqXH9G2vh9IjTAcpgrlm01
 5StmI1NfnulgsLNQtZCRY/cTY=
X-Received: by 2002:a05:620a:f07:b0:8b2:eb79:d380 with SMTP id
 af79cd13be357-8b33d1b24ffmr2365547385a.5.1764115780539; 
 Tue, 25 Nov 2025 16:09:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqMwCIj9jauJnl/IsvBUByU2zMoHt50S9NDQDNYt4LnWXnAr38CbQEpcue1dMnJM0/WkNb2g==
X-Received: by 2002:a05:620a:f07:b0:8b2:eb79:d380 with SMTP id
 af79cd13be357-8b33d1b24ffmr2365542385a.5.1764115779961; 
 Tue, 25 Nov 2025 16:09:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db8d967sm5474329e87.43.2025.11.25.16.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 16:09:39 -0800 (PST)
Date: Wed, 26 Nov 2025 02:09:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=69264545 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Z2JA_5PlO6FJ_Fz2AdgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDIwMSBTYWx0ZWRfX4zs7ioTiT2QQ
 Vr8m10OU3uy7nb4tpihlbMsExm3eaQrumSkHr2rt7gNRVKtSa77EvewtCKyciBXREPyCAwc9n6M
 LyFYynAKSR2ITV7nwOVt8g/d/DD+0jAcKnDHTr4ZLiI9vwt+CyQE7Sn2RCvUhXUHo7LkbHQ/Hl1
 1z18cyzT3LiXv6/GhxwDinzbjs3ox/Q5ayZdDSQyeQAFrPrHBO5vNIPAmwyNUhrw5nUOvYYg7D4
 uQBK2cyhrLh5eqEntxXVDyfgXG9FUkSmKMsJFbBNW/yZhwXM/pR/1suZw4TedCL2GkRXGRwPlOF
 kfJ3ZTjE0NEN1aMPGqdYrPN1hnDgaJB2JGeLD6GItBMlUUHyQ8xCPw0FrAOd6ukU9jt/ScE+DFM
 T0dvCwMTZquNH7b6jTSJL1HYdYKEpg==
X-Proofpoint-GUID: hm97TRaPtJDmOHcke6-7gc6n_iNNYn1q
X-Proofpoint-ORIG-GUID: hm97TRaPtJDmOHcke6-7gc6n_iNNYn1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250201
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [Linux-stm32] [PATCH v2 08/11] clk: qcom: dispcc: Add support
 for display clock controller Kaanapali
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

On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
> Support the clock controller driver for Kaanapali to enable display SW to
> be able to control the clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |   10 +
>  drivers/clk/qcom/Makefile           |    1 +
>  drivers/clk/qcom/dispcc-kaanapali.c | 1956 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1967 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index a284ba040b78ba2f7b7c7ead14023c0ec637f841..e293d1a816c2eece0291e9ee707698e97ed75cd8 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -46,6 +46,16 @@ config CLK_GLYMUR_TCSRCC
>  	  Support for the TCSR clock controller on GLYMUR devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>  
> +config CLK_KAANAPALI_DISPCC
> +	tristate "Kaanapali Display Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_KAANAPALI_GCC
> +	help
> +	  Support for the display clock controller on Qualcomm Technologies, Inc
> +	  Kaanapali devices.
> +	  Say Y if you want to support display devices and functionality such as
> +	  splash screen.
> +
>  config CLK_X1E80100_CAMCC
>  	tristate "X1E80100 Camera Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 0ac8a9055a43230d848c6a0c1ac118c03c3e18d2..98ec8aeb5d5049855bb65f7371a10fb2418a468f 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
> +obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
>  obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
> diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..baae2ec1f72aac04b265fb62433c75e9bd425d4d
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-kaanapali.c
> @@ -0,0 +1,1956 @@
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
> +#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
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
> +#define DISP_CC_MISC_CMD	0xF000
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +	DT_AHB_CLK,
> +	DT_SLEEP_CLK,
> +	DT_DP0_PHY_PLL_LINK_CLK,
> +	DT_DP0_PHY_PLL_VCO_DIV_CLK,
> +	DT_DP1_PHY_PLL_LINK_CLK,
> +	DT_DP1_PHY_PLL_VCO_DIV_CLK,
> +	DT_DP2_PHY_PLL_LINK_CLK,
> +	DT_DP2_PHY_PLL_VCO_DIV_CLK,
> +	DT_DP3_PHY_PLL_LINK_CLK,
> +	DT_DP3_PHY_PLL_VCO_DIV_CLK,
> +	DT_DSI0_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI0_PHY_PLL_OUT_DSICLK,
> +	DT_DSI1_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI1_PHY_PLL_OUT_DSICLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_DISP_CC_PLL0_OUT_MAIN,
> +	P_DISP_CC_PLL1_OUT_EVEN,
> +	P_DISP_CC_PLL1_OUT_MAIN,
> +	P_DISP_CC_PLL2_OUT_MAIN,
> +	P_DP0_PHY_PLL_LINK_CLK,
> +	P_DP0_PHY_PLL_VCO_DIV_CLK,
> +	P_DP1_PHY_PLL_LINK_CLK,
> +	P_DP1_PHY_PLL_VCO_DIV_CLK,
> +	P_DP2_PHY_PLL_LINK_CLK,
> +	P_DP2_PHY_PLL_VCO_DIV_CLK,
> +	P_DP3_PHY_PLL_LINK_CLK,
> +	P_DP3_PHY_PLL_VCO_DIV_CLK,
> +	P_DSI0_PHY_PLL_OUT_BYTECLK,
> +	P_DSI0_PHY_PLL_OUT_DSICLK,
> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
> +	P_DSI1_PHY_PLL_OUT_DSICLK,
> +};
> +
> +static const struct pll_vco pongo_eko_t_vco[] = {
> +	{ 38400000, 153600000, 0 },
> +};
> +
> +static const struct pll_vco taycan_eko_t_vco[] = {
> +	{ 249600000, 2500000000, 0 },
> +};
> +
> +/* 257.142858 MHz Configuration */

This is a bit strange frequency for the boot config.

> +static const struct alpha_pll_config disp_cc_pll0_config = {
> +	.l = 0xd,
> +	.cal_l = 0x48,
> +	.alpha = 0x6492,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8062e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00000008,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
