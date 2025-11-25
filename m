Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F66C8647A
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Nov 2025 18:45:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D20A0C57B72;
	Tue, 25 Nov 2025 17:45:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B603C56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:45:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APBNchZ1672718
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 25 Nov 2025 17:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=; b=ov2+BXhlfhkyjxkj
 KnbJISDEgql4rZGwgyntBueF9Ij1iGIq03/TDSXrd62RP9FeJU4y7R9QiB2XtOl1
 Z4SzFET1nFR+V75xgiUxI2LoJS+YzoPXpLIk0K1Rpvt3Z60F5hKwpGTe3drdhUqe
 7Dm8qb3h0Tbey/Ww8Ld2gMycMnvsJ8jFn2cYk8Owpw+lLVrKtW+z66gL/XtISYDR
 ogayitwjWUHVWC8JbofZZL0kaG4qVLgzlyTu5SDmiEeCiVtkucdEcSn/CrRw5m8f
 /Yv0DtVCiSaZ3PhUPqsIf4+dwFwNCYNbDG8SMVFkrLukwhKcKE8ODIU7g6fHEq6/
 T+qBEg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an5w82bca-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:45:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297d50cd8c4so188409055ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 09:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764092736; x=1764697536;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
 b=HkYt9NKUSPFrdhHNghLuuhHBWQGzaEjW/801BYZiMLekySRWE2BH8rl1M8Hdi7Tixx
 gefirTwPKnRMd8/dLOiK2f1Te/B7FtPLqtXFSz+a9W6RGICSrQBJUmdgEKQbKufQ5l3N
 fbXHr6ymdtZylmf6oFV3cvzdQZ8Az9Cjng5iS/AsGYiem6o965XoWB11mxn4t66ImRLi
 pGNDZfzEpg35vz+uXqtP8/L2pBfJhV9PncOAgwNUJQ5wt4K9NEL86tbGKRwspcMxMzRD
 ljmVfcTbnd3frCP1Z06jtVj69+WEVhftACGdm7rHnhw9AAMX4cf5/+3iLpfnLlTRPmia
 HUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764092736; x=1764697536;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
 b=Z8m2NIUu+DkjX0HUQLB4Ex4Sl/SoHZg4D/bDihO1NeKx16jrgOIkuelViEQhM1MnTS
 oxZ1kDIQ47nmsyqRdG0l7mexRRkXxMs3FGUSXH7JYPawUSuyFEf8lpEUsIfvDPu+yT8E
 NlzGwD4Fhl4NZsv8FZeHziUqDC20u7AoqVFFKFnMQHLOIxfEkVUa3O1f7gwnbYZ7oukO
 mRe7rNc76uFQcH90Gq3Y97/7jFOedSZp/jgIsazr1viE0FrpYIrGeCSjOPl7sSJd8abG
 8/MAyxwhPyST5Y79j3CRV3VdnD9zDXvlKyv9KNEF/uWK1jm6npEG9Ijrpfu5mJn9zqUI
 LC3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl3lR8GHt3znpsKLIIg1zzZrfNL9ko/O9KJclqRt43zQUpDY41GE5pzjmt0sZ0z7oLjQpvYMoDeyZpRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwjOFyf7VvsIM6ZUIxVSEEuXdHuodWVzzI0SckG/TRxPotpeG9X
 UFXYqYFDvWPB6KHgIe0kjHmpbw6/j4o2HfsnR/aYuKYd/nBbnfbEz/3DZyu/1/riPH9JNa7LQLT
 gbgzA2IWCqqDRVQK2Ve52Cx0DORSyICWhIxdOTh5PJrCYrG4N1LYDgaF0e4CZGBN9hsdsOSBElD
 5/Lmofd6E=
X-Gm-Gg: ASbGnctn8/r6TvsBDhXnNl1pZFjg93P1VEJ8h1BfRU5KsoMt9f1DXW6jimKbglDO2QE
 KW6ebcDPAdEU9EYoPtb08Gs7EhdXFNm7dvHb5esdaPdJ+UTIkg3wFS4oeFaIh/X+kdgoR3ictjR
 g2Fi1ZaHLydkXSFM6+m9UKWpvtDzozUozkqiqpowN1oE66ZlAJxFeXQVK0QkcM5sKGeVDKQGoot
 kiUIwYV2TUSSPLs6DHKGT1Ac59uO4KNXfGMqiq0ff/bODk/Yfup5v3MbkTsOP7cgId29yn7z+5i
 RoHKL5M57dMoQenUmNcH73kADNBpvMn3mhFTa9vpAw5yDQtBmA56FCWRfANdSRmwX9yEnROKqXN
 yVgY2Z7yaVDZvl+3pJmtkFJcZtgOgVKPRrg==
X-Received: by 2002:a17:903:2ec6:b0:295:96bc:8699 with SMTP id
 d9443c01a7336-29baaf7b90bmr40218195ad.20.1764092736458; 
 Tue, 25 Nov 2025 09:45:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxPsF73cA1rD9RUUeKsVhqXSVlzd8Y1ZhLmKg/DCFPDWbHJfilV2yMNCSYMEKyoA6qt4Ypxw==
X-Received: by 2002:a17:903:2ec6:b0:295:96bc:8699 with SMTP id
 d9443c01a7336-29baaf7b90bmr40217975ad.20.1764092736060; 
 Tue, 25 Nov 2025 09:45:36 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 09:45:35 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:10 +0530
MIME-Version: 1.0
Message-Id: <20251125-kaanapali-mmcc-v2-v2-1-fb44e78f300b@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX4GPuTZKpN2tY
 BCn2HH3yNB8kGToFyEE+3SjzTfnhyk4Ae2VqC341D4j9SO1JtggSc4yCe2tnYAKUwFekfziHMK0
 3Fsgc0gD8ffU1mWrBPKMcwVq+m0nMqRQLBXQqmPae5jVypnY4axeEYcmsS+aHMvCR7/PZW+OhDK
 KyAJLYb4ZD+5tmq8YVV01mCVdtqWI0BTSkg2IRrYMzuacPawZEC1ajULSfyBKwR9FM/Wk5ObSL6
 7VIII+TxseF2x/Iw3e1GSanj9JVG7uCQGvNJuRTW3FA8Jf8j39fH0Ltp3x9LRzFn4Q8SpZzDhx8
 nMUFWwgDMQ0tqqsJbYeve7IvTezFpAE23Jm4Y8ZDA==
X-Authority-Analysis: v=2.4 cv=RvTI7SmK c=1 sm=1 tr=0 ts=6925eb41 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QKPxMsH92d9TYhJkRyAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: jIdx7m-v1e7yTXy_kd25zrVngFq8zI-c
X-Proofpoint-GUID: jIdx7m-v1e7yTXy_kd25zrVngFq8zI-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511250148
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 01/11] clk: qcom: clk-alpha-pll: Update the
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
