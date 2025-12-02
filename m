Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7458C9B22D
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Dec 2025 11:26:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94500C628D3;
	Tue,  2 Dec 2025 10:26:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CBB2C628D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Dec 2025 10:26:56 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B28L5NM1927061
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 2 Dec 2025 10:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xq/1/qbY5qOV6cY4cpVQ853RyaWtJmkvfsdQijLG0ts=; b=HrymmUtJMnYk6yQ7
 e4BsED1gtJjTD6tfADhvEohKKiRTI+Tivn6aZm1ejwsJ40l6MKaZtLXZMBBNdIfB
 1Y5guiyyTtP3kjbqr9BkUKSAvdq6JEcyp80lG5tz1hlGLcyi6CJ3ZP+U3bcXdrGd
 A8dFnnHKKNhFAkLzWkFeG9ci0VJP1aqgKayydTZ9Rql7uIKoBAi+5wZa85V+7PpB
 mkI8rn3ufqq5AiALZ22/PT/5XB3rTZMeMpAftnHoUT75Z1Ua807c+AzjA5/Y5P7N
 X8DyfVe6PpGbSscdH3XpekIaH2SyeomRYVsgTu7roiRH5QsJGXk9MO/9hfdXKjlq
 ibPZnw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asm4xsvfk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Dec 2025 10:26:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7b8ed43cd00so5285259b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Dec 2025 02:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764671214; x=1765276014;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Xq/1/qbY5qOV6cY4cpVQ853RyaWtJmkvfsdQijLG0ts=;
 b=c4jB5cSt/6M5SeH6S/rfxjM9+zsmKw3MnwAlMKuZVLKMiVx0Fg9Dw0xkrmKyNC6SYe
 8PFcN3huHLAS1AJ2iAlouC0fuBzqynRW46zNz8o5IlL+mzS8haV06W/NPzKxDn2gIEMr
 7ohDUzi9akICWEZL02Eyb/IoQQb9eZAp0Jpm6jE++yTWy6UzfPBxi6oNhgqSrZSquXVv
 cFEWMuTekH4gAbamDzpA0J9SjaGUtSjvMUrCjprvRwtW8e1gOmgQDA2rEX+XPWV7Gahj
 jdqkpNVlzuhw/AJbT0gQpo8/wgdorLGVXrEq+tLbkUqj/nVC37m6EZelOmsQnttBwmi8
 7p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764671214; x=1765276014;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Xq/1/qbY5qOV6cY4cpVQ853RyaWtJmkvfsdQijLG0ts=;
 b=tSHqt+tUjBYr+1feYuPbJ6ZyPD803mSfUk+FubDjLWsAbdbGqccg77hQlhBUpluNa5
 gNvCMArRi4s4K8YgW3kdrynczhBsXZIKWvIIU1LqmsPlaJZqs9Z49dUFgrY4tqd0twUI
 KV2Iru3g4LGoX1GzJzom73oEdSJGpryc3G9ksQfJquq8Uwiy24Hy7SY41cf5el6E6ZEK
 wWYXWr7n3rY05Dmp18VviKXOW9XwuDP9fe14dOPBMEYdWcB1Afpr3h7LJkmtaRuqzKkI
 Fvj2la4oCdp8aC8/gLhUGrnvv3qFIpfjbrZ4BpSGUeHV+7FeBVFDceEgO1T7EsW5ODaS
 L+Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi4W52LGpwZg6zlJCjI+sufwvvEMpZbflPWxIeeyMlEF2s1wk8SKyXkCgqA7Ih6zXFVq9m8kilH+65kg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YySJ+bqsAkpTxM9LGPQLVPAeMWgeLOka1v/tMpGmLKaopmN86Cd
 sDa2sHG8ta2EST/MTmftmqkkU5m7izY4RmI3fanuB5NXi7TIqFd41Mb7inZOY082/kbjGJB1bwL
 LSBmJ0hDuxHUj9Ykx+oFs5ifz0wlj906D+NfH6Wcy9f1bzxp9Tmapqk6kCkkJ2UpY/nkfFHmKQq
 ZYLs8D98s=
X-Gm-Gg: ASbGnctu69vBu33GUMRcUgjXHTD+G1bWg8oL+gMJAkknWnb3usHGC70rblDTk7ByvfZ
 qZLjLxFqFrzqIdOIERYjnTALAVAELAwaY2mTv2E/ogShOKFUuw/qFD0kZthKDpwpM2dM8GZ45C3
 loNc9GkUP5sSGCMStws3J0JJTT8Qp/NUj+Nh8+1Sy3RbJL7cI3TmpqOuvlrqjkh9RenG3+BtB1Q
 o/zAKg0+JPliioqofkX487akjo9ZIHNDRlXR1CebQkXoAwbfd6qNnHVwi5dKbLmYHHjOfrIWGZF
 /6E1qK1/WZhyAglz+qOul4U96uTUZQnQt5WvTC97x8wxQq3J8PxbF9Chqe+7jZwEzPVeND/E/xi
 HYq7d/C8skINC/xwnV00MSlVIVhHpENgsYg==
X-Received: by 2002:a05:6a00:2293:b0:7ab:995a:46b0 with SMTP id
 d2e1a72fcca58-7c58e110869mr45519556b3a.15.1764671214181; 
 Tue, 02 Dec 2025 02:26:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWZI+YcsomTJcukmCZTp3WFMFJIjvBKVWd4sgt6kZFpsvs4IyZVb4dFvzZJ+OSZDCVUbpaAQ==
X-Received: by 2002:a05:6a00:2293:b0:7ab:995a:46b0 with SMTP id
 d2e1a72fcca58-7c58e110869mr45519507b3a.15.1764671213651; 
 Tue, 02 Dec 2025 02:26:53 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d151ad4d6esm16379511b3a.26.2025.12.02.02.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 02:26:53 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 15:56:26 +0530
MIME-Version: 1.0
Message-Id: <20251202-sm8750_camcc-v1-2-b3f7ef6723f1@oss.qualcomm.com>
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
X-Proofpoint-GUID: CmXfrqcHG3e8SNgb7HnIv2hztcwYJ_pc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4MyBTYWx0ZWRfX12jtn/a7TH+8
 HirIIoJUv6O/+47BQjPayoPgm/biml9Qm8i23MvgnrSr6r2KnjvZ9qYUUm2ai93k2jB/r8hl64Z
 a/uNQ0SOOqPuk+zyo5Ay2rPOLj0+4wf2SeN2oSy2M2BoEscJodzW7uuZCpqvHIBRopv+tkWXFhs
 bibECbLgFZVd7E5fkruzJwRWOOuXM6FroWxusNgFGfAwTUhc8YfH4hRkPf2nHF4lfwdghV4atC8
 dj4nwXlhNxppbG/f+t/u8Vz0aNyBtHDSyeeDKkS5sTeGqTbbqMrqcGfHEgSSg2G0y1rnu6r8+/X
 qUun2eWmp+y6zBWpna5VD4jCIXoi00FVZKNLgNfzmjpUABCYYIuP5DTaxWsHXts4nLxuIYC0Og2
 MOAYdC9+9f2MczRW4M9Z3X1cQ4eqJA==
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=692ebeef cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=V-VBKSAWtLnD8EgR3IQA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CmXfrqcHG3e8SNgb7HnIv2hztcwYJ_pc
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
Subject: [Linux-stm32] [PATCH 2/3] dt-bindings: clock: qcom: Add camera
 clock controller for SM8750 SoC
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

Add device tree bindings for the camera clock controller on
Qualcomm SM8750 platform. The camera clock controller is split between
camcc and cambist. The cambist controls the mclks of the camera clock
controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   5 +
 .../dt-bindings/clock/qcom,sm8750-cambistmclkcc.h  |  30 ++++
 include/dt-bindings/clock/qcom,sm8750-camcc.h      | 151 +++++++++++++++++++++
 3 files changed, 186 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index c1e06f39431e68a3cd2f6c2dba84be2a3c143bb1..8e3baba5270b384eb03a68b4e47785e6c91ec6f7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -9,6 +9,7 @@ title: Qualcomm Camera Clock & Reset Controller on SM8450
 maintainers:
   - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
   - Jagadeesh Kona <quic_jkona@quicinc.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
@@ -18,6 +19,8 @@ description: |
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
     include/dt-bindings/clock/qcom,sm8650-camcc.h
+    include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
+    include/dt-bindings/clock/qcom,sm8750-camcc.h
 
 properties:
   compatible:
@@ -26,6 +29,8 @@ properties:
       - qcom,sm8475-camcc
       - qcom,sm8550-camcc
       - qcom,sm8650-camcc
+      - qcom,sm8750-cambistmclkcc
+      - qcom,sm8750-camcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h b/include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..51615bee307fd9e7f81f7e5c1662535093dd8b55
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_SM8750_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_SM8750_H
+
+/* CAM_BIST_MCLK_CC clocks */
+#define CAM_BIST_MCLK_CC_MCLK0_CLK				0
+#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC				1
+#define CAM_BIST_MCLK_CC_MCLK1_CLK				2
+#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC				3
+#define CAM_BIST_MCLK_CC_MCLK2_CLK				4
+#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC				5
+#define CAM_BIST_MCLK_CC_MCLK3_CLK				6
+#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC				7
+#define CAM_BIST_MCLK_CC_MCLK4_CLK				8
+#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC				9
+#define CAM_BIST_MCLK_CC_MCLK5_CLK				10
+#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC				11
+#define CAM_BIST_MCLK_CC_MCLK6_CLK				12
+#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC				13
+#define CAM_BIST_MCLK_CC_MCLK7_CLK				14
+#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC				15
+#define CAM_BIST_MCLK_CC_PLL0					16
+#define CAM_BIST_MCLK_CC_SLEEP_CLK				17
+#define CAM_BIST_MCLK_CC_SLEEP_CLK_SRC				18
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,sm8750-camcc.h b/include/dt-bindings/clock/qcom,sm8750-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..dae788247afe896ef812bef716897c6cf80df2bb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-camcc.h
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8750_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8750_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAM_TOP_AHB_CLK					0
+#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
+#define CAM_CC_CAMNOC_DCD_XO_CLK				2
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
+#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
+#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
+#define CAM_CC_CAMNOC_NRT_OFE_ANCHOR_CLK			6
+#define CAM_CC_CAMNOC_NRT_OFE_HDR_CLK				7
+#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				8
+#define CAM_CC_CAMNOC_RT_AXI_CLK				9
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				10
+#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				11
+#define CAM_CC_CAMNOC_RT_TFE_0_BAYER_CLK			12
+#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				13
+#define CAM_CC_CAMNOC_RT_TFE_1_BAYER_CLK			14
+#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				15
+#define CAM_CC_CAMNOC_RT_TFE_2_BAYER_CLK			16
+#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				17
+#define CAM_CC_CAMNOC_XO_CLK					18
+#define CAM_CC_CCI_0_CLK					19
+#define CAM_CC_CCI_0_CLK_SRC					20
+#define CAM_CC_CCI_1_CLK					21
+#define CAM_CC_CCI_1_CLK_SRC					22
+#define CAM_CC_CCI_2_CLK					23
+#define CAM_CC_CCI_2_CLK_SRC					24
+#define CAM_CC_CORE_AHB_CLK					25
+#define CAM_CC_CPHY_RX_CLK_SRC					26
+#define CAM_CC_CRE_AHB_CLK					27
+#define CAM_CC_CRE_CLK						28
+#define CAM_CC_CRE_CLK_SRC					29
+#define CAM_CC_CSI0PHYTIMER_CLK					30
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				31
+#define CAM_CC_CSI1PHYTIMER_CLK					32
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				33
+#define CAM_CC_CSI2PHYTIMER_CLK					34
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				35
+#define CAM_CC_CSI3PHYTIMER_CLK					36
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				37
+#define CAM_CC_CSI4PHYTIMER_CLK					38
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				39
+#define CAM_CC_CSI5PHYTIMER_CLK					40
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				41
+#define CAM_CC_CSID_CLK						42
+#define CAM_CC_CSID_CLK_SRC					43
+#define CAM_CC_CSID_CSIPHY_RX_CLK				44
+#define CAM_CC_CSIPHY0_CLK					45
+#define CAM_CC_CSIPHY1_CLK					46
+#define CAM_CC_CSIPHY2_CLK					47
+#define CAM_CC_CSIPHY3_CLK					48
+#define CAM_CC_CSIPHY4_CLK					49
+#define CAM_CC_CSIPHY5_CLK					50
+#define CAM_CC_DRV_AHB_CLK					51
+#define CAM_CC_DRV_XO_CLK					52
+#define CAM_CC_FAST_AHB_CLK_SRC					53
+#define CAM_CC_GDSC_CLK						54
+#define CAM_CC_ICP_0_AHB_CLK					55
+#define CAM_CC_ICP_0_CLK					56
+#define CAM_CC_ICP_0_CLK_SRC					57
+#define CAM_CC_ICP_1_AHB_CLK					58
+#define CAM_CC_ICP_1_CLK					59
+#define CAM_CC_ICP_1_CLK_SRC					60
+#define CAM_CC_IFE_LITE_AHB_CLK					61
+#define CAM_CC_IFE_LITE_CLK					62
+#define CAM_CC_IFE_LITE_CLK_SRC					63
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				64
+#define CAM_CC_IFE_LITE_CSID_CLK				65
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				66
+#define CAM_CC_IPE_NPS_AHB_CLK					67
+#define CAM_CC_IPE_NPS_CLK					68
+#define CAM_CC_IPE_NPS_CLK_SRC					69
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				70
+#define CAM_CC_IPE_PPS_CLK					71
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				72
+#define CAM_CC_JPEG_0_CLK					73
+#define CAM_CC_JPEG_1_CLK					74
+#define CAM_CC_JPEG_CLK_SRC					75
+#define CAM_CC_OFE_AHB_CLK					76
+#define CAM_CC_OFE_ANCHOR_CLK					77
+#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				78
+#define CAM_CC_OFE_CLK_SRC					79
+#define CAM_CC_OFE_HDR_CLK					80
+#define CAM_CC_OFE_HDR_FAST_AHB_CLK				81
+#define CAM_CC_OFE_MAIN_CLK					82
+#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				83
+#define CAM_CC_PLL0						84
+#define CAM_CC_PLL0_OUT_EVEN					85
+#define CAM_CC_PLL0_OUT_ODD					86
+#define CAM_CC_PLL1						87
+#define CAM_CC_PLL1_OUT_EVEN					88
+#define CAM_CC_PLL2						89
+#define CAM_CC_PLL2_OUT_EVEN					90
+#define CAM_CC_PLL3						91
+#define CAM_CC_PLL3_OUT_EVEN					92
+#define CAM_CC_PLL4						93
+#define CAM_CC_PLL4_OUT_EVEN					94
+#define CAM_CC_PLL5						95
+#define CAM_CC_PLL5_OUT_EVEN					96
+#define CAM_CC_PLL6						97
+#define CAM_CC_PLL6_OUT_EVEN					98
+#define CAM_CC_PLL6_OUT_ODD					99
+#define CAM_CC_QDSS_DEBUG_CLK					100
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				101
+#define CAM_CC_QDSS_DEBUG_XO_CLK				102
+#define CAM_CC_SLEEP_CLK					103
+#define CAM_CC_SLEEP_CLK_SRC					104
+#define CAM_CC_SLOW_AHB_CLK_SRC					105
+#define CAM_CC_TFE_0_BAYER_CLK					106
+#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				107
+#define CAM_CC_TFE_0_CLK_SRC					108
+#define CAM_CC_TFE_0_MAIN_CLK					109
+#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				110
+#define CAM_CC_TFE_1_BAYER_CLK					111
+#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				112
+#define CAM_CC_TFE_1_CLK_SRC					113
+#define CAM_CC_TFE_1_MAIN_CLK					114
+#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				115
+#define CAM_CC_TFE_2_BAYER_CLK					116
+#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				117
+#define CAM_CC_TFE_2_CLK_SRC					118
+#define CAM_CC_TFE_2_MAIN_CLK					119
+#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				120
+#define CAM_CC_XO_CLK_SRC					121
+
+/* CAM_CC power domains */
+#define CAM_CC_TITAN_TOP_GDSC					0
+#define CAM_CC_IPE_0_GDSC					1
+#define CAM_CC_OFE_GDSC						2
+#define CAM_CC_TFE_0_GDSC					3
+#define CAM_CC_TFE_1_GDSC					4
+#define CAM_CC_TFE_2_GDSC					5
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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
