Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE593CFCEEF
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 10:43:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD5F1C8F281;
	Wed,  7 Jan 2026 09:43:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32897C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 09:43:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60790tDx1979494
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 7 Jan 2026 09:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=; b=Ozuw9KO+XLGIjCyq
 9yEL5vyXjHzQBj1MmyqlWtdpct72F5AqBBYcSwHQdP2CqsqriZB8JwKdW1OuFpn+
 1wYpL5xlhlnrjzR/ucFEjrM1aY6HWRiMdznSBe6htuU3L03ymf498WrVRB+5PwQO
 wfR5DrdD0WyO36Eun1YyIF5xFvJ/VlJ/Ro/sqA3l6NnX4xzpwqj+uL1zqtRrPuX3
 jZCVzGLWEXYG/f9BeX8VmrUB1bmHO8pY+CxcTugbknXdHQhA5ivQzzAp+ta+j1GR
 V3BIUNFktjjMEeDKW+hUrKB1ohPRSWrK2U3TQojtTVoejnwl83KC2Gzqzf1nalkl
 S6aE/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavhhbh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 09:43:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b9ceccbd7e8so2634661a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 01:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767779023; x=1768383823;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=;
 b=HM9n1AGq/dZU/A9F8O5IhOH0mK4YzU2HsA7CAHwEhctRpcRxiC9zf07CEKBlWCGEkT
 vkqIbV8ZcwhkrXg7Qd9SI8EeMDnNC+9dZHSxxuOxQQqMXGJoXYESpCTLA+uwFwPIPvHO
 p+HE+YhBLoFmnTKTN+j8XVnX4cmW0s4bY+hqixCX8+wbicjXW0USLuMij1ugpPuDXdBx
 b6ztiVklnosPXvCQuy36GtjgDA6AJRDSNyZhvwUfqZFDvEPZ5ytZkcoZre1RDhBhBYdm
 IbVHVHNP5e3stDaxgSvjorQUvk8LKYzFfFE7skGdHj6nNYxKXpcGmF4K/9r8fqeZhxGn
 EJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767779023; x=1768383823;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=;
 b=EQKtKaHYGQLiRureHIMUawLG9JX5dSx/9wIfEkNRqHxmhklgppEHIXQ1qRK4ajHHdX
 C2fe2mQZLEnAEc/L+kJV6UGUvZMYFrVPbzqf1UYTfkN8TIy2fCQYfhzYOX8rInkdR0mW
 ytFz68UjpYOe+JGSWDuEwAe3z7GNm4YGQsgGmq2OSulzGUuXUsi9I00ypqGEiyjihR+o
 ioz2x8Y9Gup+k9r/aTeoq+qMns1Ko+FDdOlEpjtspYRamGKVEVK1SqaOjCdeArTcM7/q
 1mbLhlpDg6uyEzULOntmRitEo/58yem2rPLzNQVUCAggS89xQdjziq4XvpEwPY02VJ7s
 Lf7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNZOpi52wqkasTifqs+i83B8eoNRB8w9Y6D1PRGiA/XSvItFVdXzHzRsSHepueKm5qbaLUyMtsBwlL0Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy4WiT6BIEOhCBTkWndc1UABaeUW2w6EuoHs0eNOaCIs1NtE1fh
 lQ8cRYIw2HA/VLdFhrf0yvpdvyjkCufwqznOH0JboIZyjFKefqPlfaaXoOnR2dtWsMftKzvsfCO
 SBQcl5S4mSpC2fjd9UahVtMoqm0aMYytwed/w+knq7lFa9bLRGemKyqxVoVtQxCKr11vsHz39ue
 TrxAE37og=
X-Gm-Gg: AY/fxX4TiS1IBKJrAT/RRVWlGJl+IimhjH/pWdY7aiKVNY11/7C0b7QfWd2uyrVjwz7
 fCIuxGTfQ+rrYhRj2Lx2HIk4dOwp91crmpO+Y8xZkeY01bbu0qquito9xADoKnwsPbatmwcbvgp
 UiGeI+yapWGczW1BLp1flDHeDm8g+VFfb35Y7xX5GCpU116cqeIYGRkih0FT1S1OSVqVvSIRE0J
 ccUjT59WpaXVQ7IzxbDGQqtAwwUE6GJyNNl5hd5pPXGOKL8E7rYPJnDJVE6I5hYIaMgmo6X4rw+
 CJiBEb01jDvU4LkUivToEDdZJgOHrcH/2LV2TP2Xo/qQiMHoRcMt5m746dsrUE0tLWh/RKF2YHc
 Oo3in2lcZaI0qe9/aCSekQqT9aIYyLpgptA==
X-Received: by 2002:a05:6a21:99a8:b0:366:14ac:e20c with SMTP id
 adf61e73a8af0-3898fa66b18mr1776777637.74.1767779023049; 
 Wed, 07 Jan 2026 01:43:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0AnOJy4NH19DQo79E8i5R6u4z0mklQ6JkIdwaoZ6T/2epP4OoF3d39rajQElEH1uLuGzY+w==
X-Received: by 2002:a05:6a21:99a8:b0:366:14ac:e20c with SMTP id
 adf61e73a8af0-3898fa66b18mr1776749637.74.1767779022553; 
 Wed, 07 Jan 2026 01:43:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 01:43:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:06 +0530
MIME-Version: 1.0
Message-Id: <20260107-kaanapali-mmcc-v3-v3-3-8e10adc236a8@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX51TrIJgWxacM
 vBveaOJFKdWXN5Br0ZxhDcYn/X3Li/WpmBJpinbGnhQqs9AFxix17Rqbi1sKo3DrOUgwtreXuR8
 oqPrfn+CsNXRXWriS5ei9RXcUX7gzbsl94XPXZz3eaRRyODlESBVjqTnkC6z0U4UBmU5vPmUpjA
 rX5EEjKEMg/wCpPOQ0j2vLMpCoNIKkDv7I9nmtrSMLl6VGeO+QlApvKyp/3pYQ0rRXNNPsmc6NX
 YJrUm86GDDOSIk73etCnz/SEbwnNHCTHQsTLjmOOvVchkO0IEZH+MinNCTuvrQXUM5FgJagCP7D
 qDVSjKQVc4x7QMOnLWXSUF5RuE6ZhAgd98yZHz5w+duwAXf6GMVjMkOv69HGfbK+MV1oumhqWZF
 Fhqzy+7dTk2HVRYX9SaKG6xiokcvlwA2FpOrv+OokNcJLnKVXZUhuTOhzHdyKBiQoVn/DOcWz+G
 A10djwSxps2N621JHAQ==
X-Proofpoint-ORIG-GUID: nbdbff_z0ghOJDv4kBVnjpPl2Z7SGowG
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e2acf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fFf9reVGpRxvdFVPZdQA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: nbdbff_z0ghOJDv4kBVnjpPl2Z7SGowG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070078
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 03/11] clk: qcom: clk-alpha-pll: Add
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
