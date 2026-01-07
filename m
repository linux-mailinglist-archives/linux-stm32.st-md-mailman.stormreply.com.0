Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C3CFCEE8
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 10:43:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75BD9C8F282;
	Wed,  7 Jan 2026 09:43:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7D66C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 09:43:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6072kdj84137000
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 7 Jan 2026 09:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=; b=I18PnfuipaqPS9wX
 kF9iKeVqVxwr/RMebUMxFldv4ahClAXpe+Fg+56naXfIltprBLc1G+gFIVD/QhcD
 iDHjCi2dqQSqny8BsV3J+pyga2YvqeDDrll+fmFr4ag7ekC7U9aK0Evj8gXtYmca
 /8CHnwKGTLjLHU6AIVGYZhDVAIhv7nhOzFqjwOHreGrMGb4ZVQdONcmnOZ2TDRYx
 rQZ2f30PyIy66ikpRdw+NbdC4g31a97seoSY1jt40JyvQcTofvYYxfvYObUQPzXt
 qamYSDbSiXx/1CLZUzrIPy0SmwdJ44jdMkQjF1IjEAOVaEyDOVC6lxUnZ1tHSuBn
 +od1sg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e2sq3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 09:43:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b9b9e8b0812so3260285a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 01:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767779010; x=1768383810;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
 b=WplfSHIkT9Q7l9LpMQeZF3QHL/9dMRC18Ykr6Na0TXd4f1dS1lz5S3GXeVZdktyKDk
 t2Vs00PORlN+E2+Y3NDdZ1sX07XlmGCGshIkwsR1Ko2lLPrYkQy2+HVbLqtT9hrBPXUu
 KPl0NR8JB+T33+P3kCJC9kkHPD9/OWNThlIejU55B8dqVtkS6D/JL0z31t2ebXiHdRp9
 jya5xSUWu8Qk/6lzyhXkaCb4l/QHu/NjZG11ZbMEogtwrRQx16XVwT+MFkImU3wSl98c
 KlwGIVJJHGFhvoJfTYkG1c5e3mXZHv/juFCQecdfpdD0LCEkOg/KKQ2gR2jEEcfkXm5c
 MdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767779010; x=1768383810;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
 b=fzTze5WJqCqm/hWJgx7RSl44MCT/vuQwneL4FHzANfIvyov4u0ojiLqrF2qBWX7lL5
 RRKITxVNYJAop914uMXlmnbPax0OjMN0inv5HJ+UCXiGdmoZI+qVTrH5Q/eCeYJBWx3c
 4fuq/wyRtutMDbfEryYEVvgk3P82Q5SkQqU0fXrMuEM27zUL3e+3YqUm3d/PuEgS8aV0
 96oA0Il3uEWE+gfGKYRyI+lQac2IIbqWCmZvLw3VZHUSakuoCOhEXVMN4N8MDqPVCdgn
 pzK/FdjRKg37gt+3EbkeCgLraYJZhF0ONm6AIOHSGaoR2ps+LB0/H6JisYOO3W5sCGZk
 1InQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/H9uEPwTgtzyhogaxt92ajuAByrBLM8vI+L/H634cMowI2IYwUfdbGFMHSMUJM0YuuXBbc9XAzbYmoA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxMxIo1D2HwDELSsK4aGBQWJQdsl/poUmP+gf8UqLPAlN4trJc+
 PE9B4XwOJt6Rcre11lgB6AFtcAMoVmoo2pfrtF44RwVZ6yIg0mOEemv9pIlQR+NDRI+gycESKFH
 QhzwryNQuL6uOIJfPH00jsHCeNZ8RjqakszDXJBwRspmvNXO8LdFwNLIfADES/7y9MaNuZBuYDa
 j6FOB/9Uw=
X-Gm-Gg: AY/fxX66b25l7vNp8/dzJXyq3fgBVAy49XMPcG2PeHYGTDgeTuPFTA57ExsieNqjllA
 HRxA0wJdXkR/xvcZTgaeoA6TwIB0c2y1EeYNmomd81+mtieScqCHSfRxXWlMKp9gLyz+/G73ofG
 kbRPMxhFpSU3Ck0VMtRo5Tp2pqNgv0M+moZBEaEeAvMEOTFOJsyFoTU6gsEaNJJ0Hwf6+tJD/pN
 Dlad/9exMj+4b6eaL/20RrEUTTD7BfW7wkwkANs4LpgCd8vaL00CAXs/2piQpbQQ6DLYgmF+2mk
 Q8W/VmfR12H7vFG1xMiiNRuORONvMkCqHgSYiakBE+dJh1DatyxlOeUSxmqI9pS52zOyy7ndeGs
 PyiKcN4nGx+dyBqEnXEKBSovT89lIudQjnA==
X-Received: by 2002:a05:6a00:8007:b0:7f6:5158:5b49 with SMTP id
 d2e1a72fcca58-81b7de5c201mr1814983b3a.19.1767779010377; 
 Wed, 07 Jan 2026 01:43:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMv8PnJ3CXFfRzrWhWCZsWCgO5o82SPURinQIFa1qFxjuJZcsiNvT/2i/W8Cd0JCfLWwcqdQ==
X-Received: by 2002:a05:6a00:8007:b0:7f6:5158:5b49 with SMTP id
 d2e1a72fcca58-81b7de5c201mr1814953b3a.19.1767779009939; 
 Wed, 07 Jan 2026 01:43:29 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 01:43:29 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:04 +0530
MIME-Version: 1.0
Message-Id: <20260107-kaanapali-mmcc-v3-v3-1-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX2tRNxbd4BK4y
 zF9HGUd9iKYe3/ZZyB6fcUPbAxGvhT/VouEprYX1VU2AUFymU7K2fpbndGN512zO4NmlozsBk+J
 wdiHvwZ95RELw0+gguV8xNyBdr8INdX/abT84vFhYoZVYp+w2xWnFYT5tN4A9cVLUYOk2fzEYz6
 b+65HZofOXG8o85CJ/T8TQRLWE9zI5TL5WGaJJV63saJ9VW3APVsQS0ndzQiwWGIDWahJ5I65RC
 SP3KEaEeQ4NyKXLOifaRKcSgaz8ZKBECnrcfU1qBzP3JmvNx7ReSpksSuXjZ40jWdYuDP/+2EVX
 lyt6z5vpj11JSAUUderrHWZGAop0s11UoRxdtTC461Na2y2uzWJqPgcTPpWQqO/afz2dhN+uuT6
 3Qv7/zB0NL3pHlLLqJiKq9HqxIFoYz1+jeGcYaonQASEO3sP7pQ9sT3eCxbm+smCVhVxEI+cyPM
 t7zOgly7fwDG+eRXguQ==
X-Proofpoint-GUID: i1soABeOR_j6G24ohZTpzTIxUeq3BQRq
X-Proofpoint-ORIG-GUID: i1soABeOR_j6G24ohZTpzTIxUeq3BQRq
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e2ac3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QKPxMsH92d9TYhJkRyAA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070078
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 01/11] clk: qcom: clk-alpha-pll: Update the
 PLL support for cal_l
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

Recent QCOM PLLs require the CAL_L field to be programmed according to
specific hardware recommendations, rather than using the legacy default
value of 0x44. Hardcoding this value can lead to suboptimal or incorrect
behavior on newer platforms.

To address this, introduce a `cal_l` field in the PLL configuration
structure, allowing CAL_L to be set explicitly based on platform
requirements. This improves flexibility and ensures correct PLL
initialization across different hardware variants.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 6 +++++-
 drivers/clk/qcom/clk-alpha-pll.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6aeba40358c11e44c5f39d15f149d62149393cd3..6f50f0c4b984e991982ee8914a496c00c4ee063b 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2338,7 +2338,11 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 		return;
 	}
 
-	lval |= TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+	if (config->cal_l)
+		lval |= config->cal_l << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+	else
+		lval |= TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+
 	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), lval);
 	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
 	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0903a05b18ccc68c9f8de5c7405bb197bf8d3d1d..ec5b4e4810300fa787420356bb073c24bb05da62 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -128,6 +128,7 @@ struct clk_alpha_pll_postdiv {
 
 struct alpha_pll_config {
 	u32 l;
+	u32 cal_l;
 	u32 alpha;
 	u32 alpha_hi;
 	u32 config_ctl_val;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
