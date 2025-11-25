Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F1C86486
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Nov 2025 18:45:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11FFBC60469;
	Tue, 25 Nov 2025 17:45:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1333EC60468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:45:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APBJ7Gb1672533
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 25 Nov 2025 17:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=; b=CIk+mNR9ZkMiHU2V
 NUV85Z+vWMJ1lvwQa4IcB1LitcaaRUDS+oIDx2psUThKh19+4apDlC9GaDEZ3QVg
 KzIIO3Z0qXVmgk/7YL37G11MmJRxW4TkDa1/QBsUVnUZO+hab679/2PPuvrU7f6j
 V1y7LEfKlxQYfz10bNMY/zqWq4MFlR76bTK1BC87bNtUmLZY9U8riZr0XDlL1qds
 PqXqPL+S2nHJjHRNW7ZV/zJaT6obQ/TzrNLZV4roK5pfLDnvqIAcGORRELKFSSs7
 V/PwOTkinn0CrzWHYdfZuT+VmW9mz4lqzNxNAhIUPMafxM13nt9lAnaCINP6zJjL
 BurRLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an5w82bd9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:45:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-297f8a2ba9eso130484975ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 09:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764092749; x=1764697549;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=;
 b=K1Njh4roFtY+ZwBdB/DJIxWJzelNNim2l/aYicTufUYAnRuvc1NvILnhCzxrOfiggQ
 FiuVxoSiyQyM0UXrA6EmPoEi8+H0YjW/gKKO5gJhG9PcyPWmw9TYHT+wRjoh/GBBLKfM
 aeBUOhtaRAF/JbWSDbLJmJ8BaLqvtGXu/+cc+NaFkmtDBLMY+zrVP3bTQ9drKcwTWMyF
 mY21lBXVXrk3HPQehVmRRuEAwq2AyatnrpIazx7xTgxZ0Z9wXQCQB23WE204vB8UNLbn
 2YIA3c5w+QJn82lHNwXVtY84OriOsoZ4e5XoZYm5yINwyzxgF14TN5idRg10egbLSglg
 SwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764092749; x=1764697549;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=;
 b=M/iT56oeo5vJsrRnETlpOpTPMTryGDRmaxKQ0sEqM74OCHFDBMvK8IqBZNRq7FB8VP
 03IXQl7ZRR0LcccdwfAT02zlIHsdPn0Y21fhb3pdPU0H2ngg3pKTI2OaLN3lwoP9oFyx
 TFILNsbGd80xq1oyX6rygNuGgVCNgOP7b4W053ZzSV/kiIW7WnGKp103EwU+PWNjJqfH
 FR6HPluCCvLHLFMnjSboXQj+hNZ9MXevAmQD82czJ7kELOqnFLyBmqZVWyvehs+EI2zj
 YZc2no+lSduZvF/gIfXU2VIJks0Ww6Xb1QWZN07sWim6lFfqkEGPnOBFhedsK8j+rosu
 MYFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfRY8QulgDQqeOMIcz/lgvJsChUPh9wLgwet8iDCPyrzPc+EE7hxDIrUInpglvZU9a1kjGm2fzUSTOcQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1GfpbCIme2VNSxXbDgdXcsORmpMPwRFQwloxZDTO/yaCwj/pu
 bewGAhhDpOphPfMMHSTFINJXGpS871YaIvS/EgC5jXumB6aBA3sKJiQLf9nhBUgVkoQtJoDp6XU
 iQtC/LsxOy7htJAFWFDTxw/QpgRVQ5zO/GqZRuujJeatVGuv7Nt0HtvtHsaSgaUSEAS7r+uAa9s
 NVKZk7Tn8=
X-Gm-Gg: ASbGncsRjJqtdV1GGOmW0Z1EU28Cyg7BscDwVNZuRUXEVFUmHZXQvpAj2h7f7/wZH7s
 In/0aUstxxCjW21hHbqzEa+RdJMTGXXfMtJonhZFO2v6aRbdyR949UCxpPijB0jiH6gaIBiCzND
 urVSal3I0oJD5cLvqng57P3j3kQdbClNELwuzZpO2XhV0oQ4D6mq0H5eF5z8YnsYmIL8C1SW04A
 vag23wXAucRhxVmP/zzlxpzFHyqJN8TKyZpEHRxEV+dQ7KLrpWnCideUBGTDtPpGomkM4qERHOc
 gUIMUQmgL98ePhWuork4UVV4nwJScQ2Hws3PMWlLCWcApXTFp9FTCn2IcSqwMsFUvp6jnhJceKD
 9/L0G7zIduUS48TInauA=
X-Received: by 2002:a17:903:32d0:b0:297:c272:80ec with SMTP id
 d9443c01a7336-29b6bf5f043mr212995935ad.42.1764092748730; 
 Tue, 25 Nov 2025 09:45:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvwp9H67m9nkeaPfXf+UyZa2R9bATzOBDe1yjAHO6XFle1m9u8q5H+vR7VP0wbSA9gBQxQYA==
X-Received: by 2002:a17:903:32d0:b0:297:c272:80ec with SMTP id
 d9443c01a7336-29b6bf5f043mr212995425ad.42.1764092748212; 
 Tue, 25 Nov 2025 09:45:48 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 09:45:47 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:12 +0530
MIME-Version: 1.0
Message-Id: <20251125-kaanapali-mmcc-v2-v2-3-fb44e78f300b@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX9dUmVFLYasHb
 CLRrrfBcOQKJpSeTfTFdL25Wp6PyqDUqEetvLCPubbAN32GGyRxWDM2wIvL5saPqNafFByASLpo
 xnwB/aJEgi/Ramc5RXuovuZ0fxi8Vbx0FuUS9VAwzA8vHNiDJeG0zIBl2WNNCxGbaxQT2wMvSGQ
 G1IVdte76jaQ2MI4T63KjS34u7gr77vi1s8MYu4alvyUXw9Bh1Me3YziocxlztkjgJ6pzY/ifP2
 aEZi8gllppXO5gf1g7GHYGbvK8VzWeM3xXws8LSYEQmR1N+61AosbiBZBBDuPTmdbTdzm51Aq0w
 TbA1ZqURb1AndLE3kyUTl4+DKCQcO6iVuPw3ok7uA==
X-Authority-Analysis: v=2.4 cv=RvTI7SmK c=1 sm=1 tr=0 ts=6925eb4d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fFf9reVGpRxvdFVPZdQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 2tlz7l-qsw4I8I-NOL7ZHJ3-N-ryL5Is
X-Proofpoint-GUID: 2tlz7l-qsw4I8I-NOL7ZHJ3-N-ryL5Is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511250148
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 03/11] clk: qcom: clk-alpha-pll: Add
 support for controlling Rivian PLL
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

Add clock ops for Rivian ELU and EKO_T PLLs, add the register offsets
for the Rivian ELU PLL. Since ELU and EKO_T shared the same offsets and
PLL ops, reuse the Rivian EKO_T enum.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6f50f0c4b984e991982ee8914a496c00c4ee063b..3fbdee6e67f9c82a2b93f2624a112934f01686d5 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -243,6 +243,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL] = 0x28,
 		[PLL_OFF_TEST_CTL_U] = 0x2c,
 	},
+	[CLK_ALPHA_PLL_TYPE_RIVIAN_ELU] = {
+		[PLL_OFF_OPMODE] = 0x04,
+		[PLL_OFF_STATUS] = 0x0c,
+		[PLL_OFF_L_VAL] = 0x10,
+		[PLL_OFF_USER_CTL] = 0x14,
+		[PLL_OFF_USER_CTL_U] = 0x18,
+		[PLL_OFF_CONFIG_CTL] = 0x1c,
+		[PLL_OFF_CONFIG_CTL_U] = 0x20,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x24,
+		[PLL_OFF_CONFIG_CTL_U2] = 0x28,
+		[PLL_OFF_TEST_CTL] = 0x2c,
+		[PLL_OFF_TEST_CTL_U] = 0x30,
+	},
 	[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
@@ -3006,6 +3019,7 @@ void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
 		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
+	case CLK_ALPHA_PLL_TYPE_RIVIAN_ELU:
 		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_TRION:
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index fc55a42fac2ffe589ba270010eb47c0816832ca7..da7d3d75592373cb2df472b9976f8c7063dc5021 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -32,6 +32,8 @@ enum {
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
+	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
+	CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T = CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
 	CLK_ALPHA_PLL_TYPE_STROMER,
@@ -210,6 +212,8 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 #define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
+#define clk_alpha_pll_rivian_elu_ops clk_alpha_pll_rivian_evo_ops
+#define clk_alpha_pll_rivian_eko_t_ops clk_alpha_pll_rivian_evo_ops
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 
 extern const struct clk_ops clk_alpha_pll_regera_ops;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
