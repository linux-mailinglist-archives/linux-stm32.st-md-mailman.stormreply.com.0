Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C98B9D875
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 08:07:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 751B6C3F95B;
	Thu, 25 Sep 2025 06:07:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56C76C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:56:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONrGBD002127
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 24 Sep 2025 23:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sJEE5mkM8VRYrT5n8DkRmcckkaultqJjWLyD42H8UpY=; b=ILvBvQzDs7M8iopP
 5CJpI/jAY3aajvg1U+5qwMuqTtitdZcyfOQl+Bf2sp9soIbL2Hq/hcUSyrr+ejcH
 cYfWTigKbAxE17AwyuZr90KsoslinW0qU3GCoJ0rrwrPuOg6BtVdqd307TL19S3P
 gFmRt2JPUBd4gHpXZI58eGoVQFflhsWS8fkTlGyvctLGTP1BayT2x+ZP93TXEzhO
 mZIJAPEZm0NnQRfP+ZBLx7urKzC5iC06fkXRX+qKSZH9p4IxFKnwEwceolRnephb
 1ZtV90XPq6qwLloA3ucXIIEmkJWDLsU7Lon/t/M/VpgOPrTyTklGWJGwvxuT70CY
 LBoFKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p40p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:56:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-268141f759aso2949825ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 16:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758758216; x=1759363016;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJEE5mkM8VRYrT5n8DkRmcckkaultqJjWLyD42H8UpY=;
 b=wuFW+2EXRg6zGWS2TNm9jpXFgprEdxX7sln4dfHZl745wneXhCgTG6T89GXAWsDUoH
 HH461MQEMUVQ7LN3AZsaEV4j3haoDCVS+kF80+cwL7NO5epjeaohACup/6fzMVaDVECo
 T+brS/PVJj+DdYhO2ZB5kfnzXhxkQBPQTKJ3tQuZ8lQQ7jYYzD2lnkfXYR4sQPJBEjQu
 FUiUfub/2NZzrX+YKz7T9RkJ247/tGjKFOs0cjYTYW+HANrEe7OpJma8RZeaI7SXD4WV
 LkXHJKq1y27jK3r15z8jQn5K3inLR1iu4DNn3kfNLWgV34YCBDBjUO87Mzc8MzTj1QL/
 1BSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAuSbjxyxPxaCRnaw0CDQspT5ztJcZWGpr5ysQoBq66Lwewoe/+mnmVt5J1zyFQUgPSHoeiSObPstSlw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUmpYo99IdW0w5EWhS8UTSQlnH+VWDToTfVk0izaSAue5/PzW+
 WMCpW0FHCM9+sLVDw9YsDDQpqxtQh+HRR9tvqm775mPxx7HYJ3RFo5St011h0xDbsju0xsQ1sJT
 HtvdMl7ekASBfNA2gfXGgOHdShikq6BuwlDNFNn/oi/1824Eix+piugR/ctcDfht0JbSvQXO9wz
 2YYWKKHhU=
X-Gm-Gg: ASbGncvSZ+dTC851Vx3BnWrDougqp9qeWggLaZNRuJuu+aivfZojopweOlfOe9d0UW0
 FgenXp+ttQh9eMOT1kkO+UAxH3jIOXCkfsvvRtXegXsHdfsOLIdJWR7CxnHQfistLzlsGi1623c
 OjV21UTdNOCRC/ghRzKjiU0Lq2nhffxtcIDX9SBBT9iMzxn/pTb83ZgKJiQKYzUuSpgHh6zwaaN
 NciNWoAsxIIZZ5m1UkDXdtV1ya0Fj0g3Q+hKAiL4YQwjSquGsedoo5OzYfCXVpwpK8rTLbt/ScZ
 JBo2aPLeowcxqgkDDRgI1DS2BfVY/4wcIJ/iYgAEQ950R2X/nPzbNBCxOyBmIufaTEfpXFt8Hle
 7QGsSyTAhd/jnRc4=
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id
 d9443c01a7336-27ed4a78d72mr14184365ad.59.1758758215780; 
 Wed, 24 Sep 2025 16:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJWQg6ccd13z7nuVk7VSbi1XJrSuF73yhddJx5KdOBXS/U2OU/vJpWRcXmqMM/HeYcdhJqBQ==
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id
 d9443c01a7336-27ed4a78d72mr14184115ad.59.1758758215234; 
 Wed, 24 Sep 2025 16:56:55 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 16:56:54 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:42 -0700
MIME-Version: 1.0
Message-Id: <20250924-knp-mmclk-v1-1-d7ea96b4784a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=5962;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=MZ7pT/zHCTj4GLSlo+0Qr1VnVwjrOBMwlzKiEU+IMYY=;
 b=0fP1HwPThy+lD1iokHsFgCTin7xsW2/8SVdo2n7kMIlxkRAKB5HbDnxgRGtPkEo+a8ep+dKGT
 hZORM4ikJO8BOCyO+Piyq0EcbuNxH/HZNGBBMFeZ6nCDK0S4OhBRsnL
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: snbWM8q293AXNdVikvJvAn5RhmHRtO0B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXzU/Sl0RC5Z5l
 9aFB7E4tUGrJO8KKGZON/P4uCLkDcmuyhuawgxCrnKr7K4B5r8v8g1NERlyquWHPf5FrtPKa1Md
 8PJXM7laz5y5dM451yVsdKfpeIVulMfFER8IdRn0xLD+IzYcmfgvpHEkRxYkPm+y7ivZPPY4BR9
 CC9sH4pihuNXwMicWKCJk+Pplp1ZmrfRWQrwErIE0DsNSg2MSy8wn7uwQBTuE+H6RcFyB3Me5Ol
 3rVGTo8BihyILK5H8BswvPmWuoT/fyaldw+dm+e8vF+TXuWEoCMOYI/c2V0wINBKd/NfsZHk2Fs
 Vx/PFtZMg1/HEFNd6zVF/Mo6tUECHh+ngY484G0sI16DR4M/tB/vh4t3KU3umsKBkRzXJZ1ntKT
 0FDg8wvh
X-Proofpoint-ORIG-GUID: snbWM8q293AXNdVikvJvAn5RhmHRtO0B
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d48549 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1bJ6dZNBIeh337jv8YMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
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
Subject: [Linux-stm32] [PATCH 1/9] dt-bindings: clock: qcom: document
 Kaanapali DISPCC clock controller
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

Document device tree bindings for display clock controller for
Qualcomm Kaanapali SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   2 +
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  | 109 +++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index 30e4b4631575..591ce91b8d54 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8550, SM8650, SM8750 and few other platforms.
 
   See also:
+  - include/dt-bindings/clock/qcom,kaanapali-dispcc.h
   - include/dt-bindings/clock/qcom,sm8550-dispcc.h
   - include/dt-bindings/clock/qcom,sm8650-dispcc.h
   - include/dt-bindings/clock/qcom,sm8750-dispcc.h
@@ -23,6 +24,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-dispcc
       - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-dispcc.h b/include/dt-bindings/clock/qcom,kaanapali-dispcc.h
new file mode 100644
index 000000000000..05146f9dfe07
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-dispcc.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_KAANAPALI_H
+
+/* DISP_CC clocks */
+#define DISP_CC_ESYNC0_CLK					0
+#define DISP_CC_ESYNC0_CLK_SRC					1
+#define DISP_CC_ESYNC1_CLK					2
+#define DISP_CC_ESYNC1_CLK_SRC					3
+#define DISP_CC_MDSS_ACCU_SHIFT_CLK				4
+#define DISP_CC_MDSS_AHB1_CLK					5
+#define DISP_CC_MDSS_AHB_CLK					6
+#define DISP_CC_MDSS_AHB_CLK_SRC				7
+#define DISP_CC_MDSS_AHB_SWI_CLK				8
+#define DISP_CC_MDSS_AHB_SWI_DIV_CLK_SRC			9
+#define DISP_CC_MDSS_BYTE0_CLK					10
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				11
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				12
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				13
+#define DISP_CC_MDSS_BYTE1_CLK					14
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				15
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				16
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				17
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				18
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				19
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				20
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				21
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				22
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			23
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			24
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				25
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			26
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				27
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			28
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		29
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				30
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				31
+#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				32
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				33
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				34
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			35
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			36
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				37
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			38
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				39
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			40
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		41
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				42
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				43
+#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				44
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				45
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				46
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			47
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			48
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				49
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			50
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				51
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			52
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				53
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				54
+#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				55
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				56
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				57
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			58
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			59
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				60
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			61
+#define DISP_CC_MDSS_ESC0_CLK					62
+#define DISP_CC_MDSS_ESC0_CLK_SRC				63
+#define DISP_CC_MDSS_ESC1_CLK					64
+#define DISP_CC_MDSS_ESC1_CLK_SRC				65
+#define DISP_CC_MDSS_MDP1_CLK					66
+#define DISP_CC_MDSS_MDP_CLK					67
+#define DISP_CC_MDSS_MDP_CLK_SRC				68
+#define DISP_CC_MDSS_MDP_LUT1_CLK				69
+#define DISP_CC_MDSS_MDP_LUT_CLK				70
+#define DISP_CC_MDSS_MDP_SS_IP_CLK				71
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				72
+#define DISP_CC_MDSS_PCLK0_CLK					73
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				74
+#define DISP_CC_MDSS_PCLK1_CLK					75
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				76
+#define DISP_CC_MDSS_PCLK2_CLK					77
+#define DISP_CC_MDSS_PCLK2_CLK_SRC				78
+#define DISP_CC_MDSS_VSYNC1_CLK					79
+#define DISP_CC_MDSS_VSYNC_CLK					80
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				81
+#define DISP_CC_OSC_CLK						82
+#define DISP_CC_OSC_CLK_SRC					83
+#define DISP_CC_PLL0						84
+#define DISP_CC_PLL1						85
+#define DISP_CC_PLL2						86
+#define DISP_CC_SLEEP_CLK					87
+#define DISP_CC_XO_CLK						88
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+#define DISP_CC_MDSS_CORE_INT2_GDSC				1
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+#endif

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
