Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE54B9D877
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 08:07:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B85F8C3F95F;
	Thu, 25 Sep 2025 06:07:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A1E9C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:57:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODHsPk002079
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 24 Sep 2025 23:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v+yaI6FR7vnjbNWezGxMpDdF/FgNA9YLXfOVLnAIGDw=; b=P9gCCREWzxKeVd2V
 crGtYZJhqWdeA6L9ylVakwG7eJbJL+3fEPZ+HRBE2DAiMSD664VSrGwD56/hLDTx
 G19ES1RuknZbcSIY1VI3I5p8a9kJpAaukA2nK03pKZSDxvn0HQ2g746lLdytgjtF
 b7g6+Ft7Dx0NpIVdovNPEcaNvmQSKxdHXS2EDuU2fi/6+sV+/mBU16qoGfm9DVCA
 eOFXCo/Uh9TB8P3xyz8SknPPKGLqeHb+avwZrZI54T5TlRqZiOGlviCQnn6rGhUX
 kvAj68jGGAUxAwP+MM8gHMwAzsZqIB9BYe/WgjkWzNlnWHIhr1SEz5aDcbqZpt0X
 ZuXz3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p413-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:57:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2698b5fbe5bso6586375ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 16:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758758219; x=1759363019;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+yaI6FR7vnjbNWezGxMpDdF/FgNA9YLXfOVLnAIGDw=;
 b=OE8TanqBhGYTsyUf2BUJ0BICM6pteAId9tg+42t3V1l1E2bAL25MimAwopQ2A/rc4I
 T2J07SlsdkimksD2dXnP4hlcVQAAbSgYdI57rN+06bQgXPNhJNLEsniMmgq5e10yhAcc
 vAvt5q/2HrgdMJSVNz033rK9HiZrQzttqJmJHHlKW6j9wjOwWMPmpc2+oGXvsl58Epu1
 mSvN8j1Dq5BTtHRp6k7Qe62dJKcg/pWEyWzclYiys3t1ch7cy1XeOg8YlRJLVFmBTyMx
 q61Den6ZD37QAJnWLpcU6cxrDtMfvsHcIH5yROiIcGrz9Z7HWaj6pc8J4YTW4xwHc4RW
 Oueg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx0UhUcw2yZTk1c1/hPeu3+aVTqEgCeN0/KaXoPcwQPnj6CcWI0ObpkJr0dgk2u4URP2TSwvnw0UPNtg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxclQPW708JLhUIxVFdl2wjVtrKiqzw0wcL1fjihwHSTvt68CrD
 PzGhCtdhGKlr2SDTjBa+wWLRi77v8zxCVwEJI3j9kbPDJz6aiL1DhhE1y9lJvpBvS783XBOf3gS
 UTNxONXzB8DXn8IxKXdhhNNBLVftwo2FAyDFxqPqBAwDKxPrhkB+/zUo9JloogoYgnU2y6mfbB6
 t/Urpusfc=
X-Gm-Gg: ASbGnctZETvTAobItc36Vy1vTExcNboVLdvdWcZMIO2yF1ZnziJOAzYSNibPG7QOWRA
 lROpwVtszsKw1qPXxpP3aNBCa3XzQSqffIelURDx2IrerK6nFSVUqcbyJtVJuLA8b6a0e/SfKE4
 4BRVKSV49LIrry0YmPmsQtYGrqoS5gy6wxd9XGZGGGdlYn8We3n4eOtcMyXBSS7B+gSn0z0gLEf
 8aUhijOjKKKTMW/RKupNSI5ryZwbv+O4gUA0P2Ec67QbQJfxgJO/BavUnPf5F/FVudgmh8vaROd
 6FvPyxos/4mas5aO+6LrrN1QEI/rWJ6VSiMmGL78hz5ML7HW6T7aesckQidsqnU/u/bC19Wdsje
 G3IctYf8jaI468Dw=
X-Received: by 2002:a17:902:d481:b0:25f:45d9:6592 with SMTP id
 d9443c01a7336-27ed4a56577mr14637635ad.48.1758758218837; 
 Wed, 24 Sep 2025 16:56:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmqsLYBMpnPQAXHSlY2+YfF0P2SMFyW780ocQzNqXewKAoKC5mEI+DPfnaiEJF9eh1FUiWqA==
X-Received: by 2002:a17:902:d481:b0:25f:45d9:6592 with SMTP id
 d9443c01a7336-27ed4a56577mr14637355ad.48.1758758218398; 
 Wed, 24 Sep 2025 16:56:58 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 16:56:58 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:44 -0700
MIME-Version: 1.0
Message-Id: <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=9069;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=DhUpj40NQ2LD2wFIZmlHkYV7/QHoZ2IqSLLBAdqKXoM=;
 b=tWPzYVXOG0QKzonrF6pOxz4QjM7UrQmDHHJMdIXOfGB8Z1RjYMcZoE1W4RIbwXjVK65Vd6Z+f
 X+aOcb8rxepAaQ1K1lSgP6+Mv94lI9glazWQR8G6OynJmoM6Ty8bAHa
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: xgRk2sSSc3yYsuw5VZChlcbV3foRVamY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX3UYQHd7BVSYj
 4sQkSiZ5wlZuFWwGpkWQ9AuD53iflyBjRTstEZzzuezgYmiDxGj86t69WmMpbOWziRReUlz0OCr
 8sI6xDMhHHH+wTAMnrkkQXfWGB8p/GqBcwa+DLOZRBrGC8D+5qsWcQQri2HteeryCCJ+dRBeohZ
 LZF2Xv9dikjFX2niF4dhNm/nBRR03EiGxA11koWXqN6w6HnvfFSpjwTq0Axh2OO7vxZvp9AN3Ns
 W2Xs7M4i3IrSOCC6WUG/zLoRtk2M/iax5K1MVC+A3IYf9hv/UYbjvQM9n5roS+tO+A3s587YLvm
 XhtcULGLW02Oa43d88MBOq3nrrQ3c3YOTHqtnlGuXkHN0X/onlqWfrmhxBeUsS5hoM0iPgg+5bX
 qasirwrT
X-Proofpoint-ORIG-GUID: xgRk2sSSc3yYsuw5VZChlcbV3foRVamY
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4854c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=M9E809UxJf-Bpjq6rgYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
X-Mailman-Approved-At: Thu, 25 Sep 2025 06:07:35 +0000
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: [Linux-stm32] [PATCH 3/9] dt-bindings: clock: qcom: Add support for
 CAMCC for Kaanapali
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

Update the compatible and the bindings for CAMCC support on Kaanapali
SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   8 +-
 .../clock/qcom,kaanapali-cambistmclkcc.h           |  33 +++++
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   | 147 +++++++++++++++++++++
 3 files changed, 187 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index dbfcc399f10b..54b04ecf67c1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -12,9 +12,11 @@ maintainers:
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
-  domains on SM8450.
+  domains on SM8450 SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,kaanapali-camcc.h
+    include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
     include/dt-bindings/clock/qcom,sm8650-camcc.h
@@ -22,6 +24,8 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-cambistmclkcc
+      - qcom,kaanapali-camcc
       - qcom,sm8450-camcc
       - qcom,sm8475-camcc
       - qcom,sm8550-camcc
@@ -63,6 +67,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-cambistmclkcc
+              - qcom,kaanapali-camcc
               - qcom,sm8450-camcc
               - qcom,sm8550-camcc
     then:
diff --git a/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
new file mode 100644
index 000000000000..ddb083b5289e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
+
+/* CAM_BIST_MCLK_CC clocks */
+#define CAM_BIST_MCLK_CC_DEBUG_CLK				0
+#define CAM_BIST_MCLK_CC_DEBUG_DIV_CLK_SRC			1
+#define CAM_BIST_MCLK_CC_MCLK0_CLK				2
+#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC				3
+#define CAM_BIST_MCLK_CC_MCLK1_CLK				4
+#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC				5
+#define CAM_BIST_MCLK_CC_MCLK2_CLK				6
+#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC				7
+#define CAM_BIST_MCLK_CC_MCLK3_CLK				8
+#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC				9
+#define CAM_BIST_MCLK_CC_MCLK4_CLK				10
+#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC				11
+#define CAM_BIST_MCLK_CC_MCLK5_CLK				12
+#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC				13
+#define CAM_BIST_MCLK_CC_MCLK6_CLK				14
+#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC				15
+#define CAM_BIST_MCLK_CC_MCLK7_CLK				16
+#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC				17
+#define CAM_BIST_MCLK_CC_PLL0					18
+#define CAM_BIST_MCLK_CC_PLL_TEST_CLK				19
+#define CAM_BIST_MCLK_CC_PLL_TEST_DIV_CLK_SRC			20
+#define CAM_BIST_MCLK_CC_SLEEP_CLK				21
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,kaanapali-camcc.h b/include/dt-bindings/clock/qcom,kaanapali-camcc.h
new file mode 100644
index 000000000000..58835136b356
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-camcc.h
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_KAANAPALI_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAM_TOP_AHB_CLK					0
+#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
+#define CAM_CC_CAMNOC_DCD_XO_CLK				2
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
+#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
+#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
+#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				6
+#define CAM_CC_CAMNOC_RT_AXI_CLK				7
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				8
+#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				9
+#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				10
+#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				11
+#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				12
+#define CAM_CC_CAMNOC_XO_CLK					13
+#define CAM_CC_CCI_0_CLK					14
+#define CAM_CC_CCI_0_CLK_SRC					15
+#define CAM_CC_CCI_1_CLK					16
+#define CAM_CC_CCI_1_CLK_SRC					17
+#define CAM_CC_CCI_2_CLK					18
+#define CAM_CC_CCI_2_CLK_SRC					19
+#define CAM_CC_CORE_AHB_CLK					20
+#define CAM_CC_CPHY_RX_CLK_SRC					21
+#define CAM_CC_CRE_AHB_CLK					22
+#define CAM_CC_CRE_CLK						23
+#define CAM_CC_CRE_CLK_SRC					24
+#define CAM_CC_CSI0PHYTIMER_CLK					25
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				26
+#define CAM_CC_CSI1PHYTIMER_CLK					27
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				28
+#define CAM_CC_CSI2PHYTIMER_CLK					29
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				30
+#define CAM_CC_CSI3PHYTIMER_CLK					31
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				32
+#define CAM_CC_CSI4PHYTIMER_CLK					33
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				34
+#define CAM_CC_CSI5PHYTIMER_CLK					35
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				36
+#define CAM_CC_CSID_CLK						37
+#define CAM_CC_CSID_CLK_SRC					38
+#define CAM_CC_CSID_CSIPHY_RX_CLK				39
+#define CAM_CC_CSIPHY0_CLK					40
+#define CAM_CC_CSIPHY1_CLK					41
+#define CAM_CC_CSIPHY2_CLK					42
+#define CAM_CC_CSIPHY3_CLK					43
+#define CAM_CC_CSIPHY4_CLK					44
+#define CAM_CC_CSIPHY5_CLK					45
+#define CAM_CC_DRV_AHB_CLK					46
+#define CAM_CC_DRV_XO_CLK					47
+#define CAM_CC_FAST_AHB_CLK_SRC					48
+#define CAM_CC_GDSC_CLK						49
+#define CAM_CC_ICP_0_AHB_CLK					50
+#define CAM_CC_ICP_0_CLK					51
+#define CAM_CC_ICP_0_CLK_SRC					52
+#define CAM_CC_ICP_1_AHB_CLK					53
+#define CAM_CC_ICP_1_CLK					54
+#define CAM_CC_ICP_1_CLK_SRC					55
+#define CAM_CC_IFE_LITE_AHB_CLK					56
+#define CAM_CC_IFE_LITE_CLK					57
+#define CAM_CC_IFE_LITE_CLK_SRC					58
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				59
+#define CAM_CC_IFE_LITE_CSID_CLK				60
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				61
+#define CAM_CC_IPE_NPS_AHB_CLK					62
+#define CAM_CC_IPE_NPS_CLK					63
+#define CAM_CC_IPE_NPS_CLK_SRC					64
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				65
+#define CAM_CC_IPE_PPS_CLK					66
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				67
+#define CAM_CC_JPEG_CLK						68
+#define CAM_CC_JPEG_CLK_SRC					69
+#define CAM_CC_OFE_AHB_CLK					70
+#define CAM_CC_OFE_ANCHOR_CLK					71
+#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				72
+#define CAM_CC_OFE_CLK_SRC					73
+#define CAM_CC_OFE_HDR_CLK					74
+#define CAM_CC_OFE_HDR_FAST_AHB_CLK				75
+#define CAM_CC_OFE_MAIN_CLK					76
+#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				77
+#define CAM_CC_PLL0						78
+#define CAM_CC_PLL0_OUT_EVEN					79
+#define CAM_CC_PLL0_OUT_ODD					80
+#define CAM_CC_PLL1						81
+#define CAM_CC_PLL1_OUT_EVEN					82
+#define CAM_CC_PLL2						83
+#define CAM_CC_PLL2_OUT_EVEN					84
+#define CAM_CC_PLL3						85
+#define CAM_CC_PLL3_OUT_EVEN					86
+#define CAM_CC_PLL4						87
+#define CAM_CC_PLL4_OUT_EVEN					88
+#define CAM_CC_PLL5						89
+#define CAM_CC_PLL5_OUT_EVEN					90
+#define CAM_CC_PLL6						91
+#define CAM_CC_PLL6_OUT_EVEN					92
+#define CAM_CC_PLL6_OUT_ODD					93
+#define CAM_CC_PLL7						94
+#define CAM_CC_PLL7_OUT_EVEN					95
+#define CAM_CC_QDSS_DEBUG_CLK					96
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				97
+#define CAM_CC_QDSS_DEBUG_XO_CLK				98
+#define CAM_CC_SLEEP_CLK					99
+#define CAM_CC_SLOW_AHB_CLK_SRC					100
+#define CAM_CC_TFE_0_BAYER_CLK					101
+#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				102
+#define CAM_CC_TFE_0_CLK_SRC					103
+#define CAM_CC_TFE_0_MAIN_CLK					104
+#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				105
+#define CAM_CC_TFE_1_BAYER_CLK					106
+#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				107
+#define CAM_CC_TFE_1_CLK_SRC					108
+#define CAM_CC_TFE_1_MAIN_CLK					109
+#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				110
+#define CAM_CC_TFE_2_BAYER_CLK					111
+#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				112
+#define CAM_CC_TFE_2_CLK_SRC					113
+#define CAM_CC_TFE_2_MAIN_CLK					114
+#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				115
+#define CAM_CC_TRACENOC_TPDM_1_CMB_CLK				116
+#define CAM_CC_XO_CLK_SRC					117
+
+/* CAM_CC power domains */
+#define CAM_CC_IPE_0_GDSC					0
+#define CAM_CC_OFE_GDSC						1
+#define CAM_CC_TFE_0_GDSC					2
+#define CAM_CC_TFE_1_GDSC					3
+#define CAM_CC_TFE_2_GDSC					4
+#define CAM_CC_TITAN_TOP_GDSC					5
+
+/* CAM_CC resets */
+#define CAM_CC_DRV_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IPE_0_BCR					2
+#define CAM_CC_OFE_BCR						3
+#define CAM_CC_QDSS_DEBUG_BCR					4
+#define CAM_CC_TFE_0_BCR					5
+#define CAM_CC_TFE_1_BCR					6
+#define CAM_CC_TFE_2_BCR					7
+
+#endif

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
