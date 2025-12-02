Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B77CDC9B221
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Dec 2025 11:26:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86979C628D4;
	Tue,  2 Dec 2025 10:26:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12924C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Dec 2025 10:26:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B2815pc1927563
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 2 Dec 2025 10:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HyPluVgnUgAYmNSztPK9FzXm2nnVdVYGDg0U1TBzdaA=; b=hcUfdKCeK3ttKukg
 EI6yHuGnaPwb3B9IGNWU3xzBT/Nui1J8//lLC01yB2Xt1B96IWQ774hNp7h/KGmY
 b0nC8Bjxk4rrvwCtYenxJyZK1Mc+JrJftWNRcdzqeNKQ2rKtsZoyI3D/WMaywYhZ
 HcmyDWrxmuZ89G3lvx1Nenm/noBvc2CRKmXFwW+isyi2kQuP36z6pozOz3NNxhPG
 kRu49IuXGgSPWlutavikhZoOudtXnBbWSTR+OvFP9FkjOsrV5Rp316nFTK13QkfJ
 7UfW2pvTczdviQqKd3wekUDAxRqHK5WXQeoT6rqDXYQFiNP1gnibP7x0Xw82Hh6N
 o74nsQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asm4xsvf5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Dec 2025 10:26:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7bad1cef9bcso8999627b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Dec 2025 02:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764671209; x=1765276009;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HyPluVgnUgAYmNSztPK9FzXm2nnVdVYGDg0U1TBzdaA=;
 b=Ri6wuMPd4rHBXExwj1QIMZ8vuydsiJuNDN2Z1CzBAws3NQbv8R7v4EUOO4wYDdH9K9
 l0iMR3T8+5OCoODBuCTbKxCJNVAQxn5kY0HBlZZFXgCE+CSQuuiJoXXLfcheY+5XfcUb
 7htxVevyck4qgT8bM5DgzV9ZyN2wtSq8DuUgWVy3AqhDtiX2kZeOcH0Z2v/0fV75SsFQ
 78XDyHH3GZQalssiU9elAU9Nu4kIGkjR3qwCGadCMcbRz1sdEL1CsczuKgAlie+EtSuM
 jJOs5eFtnApdKbJ8q2nLSoruri6/idj7CGOtlV7Q4q3aTAaUGSYa5glhkALDzeohX9Y2
 mbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764671209; x=1765276009;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HyPluVgnUgAYmNSztPK9FzXm2nnVdVYGDg0U1TBzdaA=;
 b=Gs0vJstazc+t5XtCsYahmdAgu+xqa2D74O5D+Xsbjd6RUUBU2Wvu0w0zu3MtBWm50C
 aiMD5S3Yhcb+ALt7Ewx93QLbXShfbSb9ZrqDK4CUFXj1HpfV4iSSEL7YHzsKvI3Rc2TP
 ZrhlCt4vAg0F11iVT3lBAcDnNr8OmjA8tbc/RoQ/EdhpXtt7celllCnfSdeqhNrxzXWR
 MZzRbdHigoarOHKy/JZwdxBQkVhrKChquhbpNg5TluyRFhDPgFMpa1cdlO8Zt9xeCG+e
 QDg5Ps2LHoF7PEPBvebwO4vDqZfmc7M5QLwrvEkgbetJaBAj3CA6qRxyuEFscYndZk+u
 MMmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFjpgeOtYMPSegRGEvIOONuAK4jkFFZlh4HrohGq9XDo4izwtIG399uA9r5aRdQ69zl9j9bXHaIKEpIw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwFfQokRWLGxeiXiGCvopFmby0osAeaFmR08cfyBER5So82a+IU
 zSlNkZWN443uyffB1tty01kvzQBvLhMFo52DP5/CvZKlagzSMsCC1t9blpfurzkc1OH2USAyS1a
 5aOPxBDaJej5YNazl0kLx4Z3YMUQzyjpLLsv8enh35qsP24Jve/qS2IWg3W7VexQ3z+XU8rhF1X
 w1XP75vD0=
X-Gm-Gg: ASbGncsh4dBr/eNhPuM+65G9PJYrwBpo8IOOOdgIyhjreIuHn0u7AhZlNSGr/I/ZsU8
 Scc8pXJ7D8WyCrN0yBm2SemptdyYHWSKVGPO7SyXDoUYbfcb+eG343syhpaTsE9BEAZUyKNJXLy
 cteUdug+PPg1cigoxC99zz4liDuV2vDv3jyk8JM3bkIjPiq7euRyDPBQKxMrNN+6FBPbXQkEjwf
 Bul9tDMKxggAL5kZqMKfNl86UVY2A6w6Mc9en9aJ2jxbyR/tcfgYE84FD4HFBErf8VhsMg75CwP
 y1oORgt5Ef6DRa4xQ62YtWsKPBQrGDNKOrsX8lXA7wimLzSF3uRNS6quk8vf3kYV03c1AbIgX2M
 0rX1T/cTqQuPzffN3VNDFeTxJePnGEtX8ZQ==
X-Received: by 2002:a05:6a00:189d:b0:7ab:e007:dec6 with SMTP id
 d2e1a72fcca58-7c58eaf2874mr46343183b3a.31.1764671208745; 
 Tue, 02 Dec 2025 02:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpNfD8nmqLv0TcMm5gxpZyZOh2xWWnJZnOrY2LiRkeixNuQOxOdAG4U5ATN7FgjOGKybBrhA==
X-Received: by 2002:a05:6a00:189d:b0:7ab:e007:dec6 with SMTP id
 d2e1a72fcca58-7c58eaf2874mr46343152b3a.31.1764671208286; 
 Tue, 02 Dec 2025 02:26:48 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d151ad4d6esm16379511b3a.26.2025.12.02.02.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 02:26:47 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 15:56:25 +0530
MIME-Version: 1.0
Message-Id: <20251202-sm8750_camcc-v1-1-b3f7ef6723f1@oss.qualcomm.com>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
In-Reply-To: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: JsbougaRTkMJBzM7203uIyJcnvSbRW59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4MyBTYWx0ZWRfX86jH3l/X9oxq
 5tZ7YfCU+BGAJuaI3VteG5147E6q2uD3rF6WZydu33O3Yh+f+LjDnpUkGDTpUvXZylOLZrRKhoM
 BKDnXKgxBQiWCO2+bBwlHfueVUR9d+yrXm1TZYJ9UcYb04TnI8DOKAG2E0heiFItgksAUTq8TZA
 pepF797W+PSsxxNdWPpMoCiPM5YLmBaf86o30TkIn9gbj8mutBPUiD97J2e3T+fplWRqITwCyxM
 VBlp0i8kD5LCezmPAI0v/anXyhF28R97gFGreoJH1DLguDuQTGFMz4EAn/NwKjocwC83Flxn7la
 aL2bQnYfJJtf6IE4uToJZgNdpm1bmheK3Kmlt5SW43u7uR7SnmI15Lu9nJUss0FpMe/HVLdCFEd
 ktU1dCqPsyAMf5EBpfc2Kf1U7G8ATA==
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=692ebee9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=03jAwwKPUxsBcueUP7gA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: JsbougaRTkMJBzM7203uIyJcnvSbRW59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020083
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] clk: qcom: clk-alpha-pll: Add support for
 Rivian ELU PLL
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

Add clock ops for Rivian ELU PLL, add the register offsets for supporting
the PLL.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6aeba40358c11e44c5f39d15f149d62149393cd3..8586649d76f8aef119ed51fbf1ca90bc5e3ce510 100644
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
@@ -3002,6 +3015,7 @@ void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
 		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
+	case CLK_ALPHA_PLL_TYPE_RIVIAN_ELU:
 		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_TRION:
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0903a05b18ccc68c9f8de5c7405bb197bf8d3d1d..b4492197419a7f326a4f6e6607ccee58ced509db 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
+	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
 	CLK_ALPHA_PLL_TYPE_STROMER,
@@ -208,6 +209,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
+#define clk_alpha_pll_rivian_elu_ops clk_alpha_pll_rivian_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_regera_ops;
 extern const struct clk_ops clk_alpha_pll_slew_ops;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
