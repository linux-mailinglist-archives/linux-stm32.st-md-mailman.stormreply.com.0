Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FA1C86483
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Nov 2025 18:45:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E46E6C57B72;
	Tue, 25 Nov 2025 17:45:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E6B2C56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:45:44 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP9ZqOi1233477
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 25 Nov 2025 17:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=; b=OmejZUaHSIegwbWP
 nYdDKnAN04CA26fyMpoDRm7bJr173/6TLRyaxlqh/LnBBE5MyYruowlXN2Cr8NXx
 6osWJAYb/UO7W7AHKOnEQrqjW+q5KYH2Gtyr05JqHckHhKxgnL+0CDpzgfGIOTID
 4WmrMrpECw5a0cIlDI8l7zNdqjzhmpWdfzDulpr3oju1OFw8agWBfSXxTUO1k/vt
 ADCd+b6OVehes1/cAPd7pFPT24iBtXn+HBLeEL3GisM/4Uth3Vb5buc+VeURhikg
 8CC50KF6SNHKW5yvE42yPoMqW906F7VvDgbvzT9RmQWjM3MaI45e9P6Sm0vecoHV
 oGSvgQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyk3ss-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:45:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-297df52c960so147718525ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 09:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764092743; x=1764697543;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
 b=c+GZ/RRGW+yDmGCbrBqZmKgPlYls2eArSvPl33O2brlUolSc4i4NIiJGNf2LG8weNC
 fWNQGbH3Y/N9XC+eEc+MiznE5LA0B4um5r8Q7T3qjaeD8L2HlXzVKccSFDUAUDdi/thu
 1lDSES10p/QpWm6PJ0+gUGEa76ONtbhMertKuctgLP6VIaD1Q8j+YEPiL7r/ZduB1NKO
 kuih5HNaORFq7fzV2CgOgPMyPovAq72eOJC7zMwrV+1YR9Wk4dYtNx2LkN327RKClqXU
 /be3MdqeQXKwcRFmHtaqKsDiHJB80Eu0fJiABw+7FoX3BpDbBYJFpSUNnByvmmdlWUlw
 9hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764092743; x=1764697543;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
 b=D6wb/HWE7p4N9/bZonSGrAzudeE9VE3uQFuCfdVysrIWh5Pt7+CUZP2ZNllZXItJWj
 QhlhMcwboR3v2MJxb3NfbVva6xqRIhFPU1Jvuq5ERFQLmdLfPL+PqpxtDC/VJpYoG4UI
 QT3hv8z80tSYGJo51uDfjwrOpRBQdYlpiKyCFjrvc4nLPTHib4WFs2k+A1kmsUzy4THC
 i23eDDxtmCkPzqDD+2dZoUc6At13S1NTVpG2Vu3Ist4xpAJivj/6m3igjBu6wAfdVAap
 U/mxZLNYcDTtQOEJEs09GpZBNplIlhtvl/0p5B1j+RPg1HAzFMi4u1uGYGwS2JV3ClGa
 ofUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUq45/XJstucL/CEu+XWqfVT2RUFfAUrBt3popguDF3U22wRiE/JQwfyePfJWKfNyvSmgGMCAzd8t2rQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNwg6FxwUlW61uKsZvKhbMXcD/dR/BVOGusFYvIeC0V9RKdKKF
 +lzwoZimtX2FLhbck75aI8nHpSpP5HD9qPBq3lG9GgVvBdkggrxH726Ocrv/uEd0njMkYL3wbEl
 lnzjdWdvMsBANTky3ya6/YxL15d6ArR+/kLIpShqPPWxj8HxR59RfzdzEViZ+Fp3MICZbJ0ANOU
 xBiupwyfs=
X-Gm-Gg: ASbGncsv+Yp2x9uCs7bmIfdq/9+IZHc1frJErzzy0m4Fn4/rnrtKFUitAyuIfekbTqF
 QqR5OFXEaPmkt8z2uus+JImfli63AF1EvGrvTgLee8Hk2vBxC4jVwFT4dYxeC74L9QLZ2aQlXI6
 rHBeXfElFTOVA5aGm9lFrZi+Isa8wFLS3xouvk5mLz0yaSF+akFF3tG4QQ2T0cPmTxkvEOaxpEA
 jVuwBSltBzOlEr26aAAUJRemzr2wPjkjIwQb/yCxnIe3kZr+1yGcWKFM2qkuEmlUDe1etx9dFmV
 8syuBgfho3jSj1oM6mWIVK0M98wJvGE3Oq6jZLn34VvjQfkGBVY1Vmuyp5Uy5DFaW1Qv4YJv162
 4xk+Y6TMxNNNOZ8P60QQ=
X-Received: by 2002:a17:902:ef0f:b0:295:745a:8016 with SMTP id
 d9443c01a7336-29b6be8c765mr182969125ad.11.1764092742601; 
 Tue, 25 Nov 2025 09:45:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWkvU7FtwVCjG3746418hQFphvRV7z9bBpLk0ElI56NuQn8FoZbZcci0AL6j/gHuF7bZXtmQ==
X-Received: by 2002:a17:902:ef0f:b0:295:745a:8016 with SMTP id
 d9443c01a7336-29b6be8c765mr182968755ad.11.1764092742112; 
 Tue, 25 Nov 2025 09:45:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 09:45:41 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:11 +0530
MIME-Version: 1.0
Message-Id: <20251125-kaanapali-mmcc-v2-v2-2-fb44e78f300b@oss.qualcomm.com>
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
X-Proofpoint-GUID: DyFtyErK_ndl62RffvZFLpPOGxEju1gh
X-Proofpoint-ORIG-GUID: DyFtyErK_ndl62RffvZFLpPOGxEju1gh
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=6925eb47 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rVs2PR1jS8wsPJa1_kIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfXwNZTtXsvsNBc
 d1c40fhZ11iP3+n3GI7pQasMa3OhGk9rFq/Z9a1qSwbhUYF9MAe1GBWkZjG2jYavnsZ2f3gvNJI
 hf6yPXT1j85giCHxOFqMQ/AuQgHdsFRmfWCjz7dv2MIs5i2ifZqWQSxg9DBnisN8wj+SW3gqE46
 g+DlZzVh1wNhwDPydrPMDhGNfbx2lkMbhhpYiEbA6MJ27kFInh5nOqp23SlkWFaU6OJ9T9ilSeJ
 xzwictvkF0/hRINYV8PqQWSkoujGIr1HOJ5kZuEkUdnIsd2k0mTEorDVxZ/8Ki6advBdz5UzBK9
 U0XQ/9F/UVePFGlPlkHxBFaHvQF9dihBpdtxmqmVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 02/11] clk: qcom: clk-alpha-pll: Add
 support for controlling Pongo EKO_T PLL
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

Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting
the PLL.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index ec5b4e4810300fa787420356bb073c24bb05da62..fc55a42fac2ffe589ba270010eb47c0816832ca7 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -28,6 +28,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
+	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
@@ -207,6 +208,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
+#define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
