Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27944CFCEFC
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 10:44:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB0C8C8F283;
	Wed,  7 Jan 2026 09:44:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 824BBC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 09:44:04 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079d2cr2879176
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 7 Jan 2026 09:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=; b=aF3TKZEJ6v73HHqG
 d05iyFZX60Wm1hxG0Ew1f9lRKKvuVtYpiKraE2mOV5U2l+3eIfiWGrzYbxIgfkNI
 W+0l+kMZjwrEAWwcNZqESmUpbq1DBfN27Mt/hYqpHT3Mt6lyVs1puP7eC4ADj11G
 +Dr4cheiY6IC8DmmT24D+W/db3kwlM4m92stsDFJqK4T8to+aOZneIhTBYa/mChm
 Nyzp1oAuMo9Wgl8FtpjEuUZG0/5Q4bkawVX2PXEq0M+AUfeovPimd1z24BTygkY+
 wZV6bFpkrgY4Tsudt0wtnDeXSwAi4WHYDEtqJXjQ9YDCcvKMhrXqyVQslNEZEnGr
 tgtkYg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn1cr0kf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 09:44:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a0d058fc56so23578875ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 01:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767779042; x=1768383842;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
 b=TsHJ9aoXPv91yONm0iNvVR7xtg1bMlfAhYxo0GGgfkJCA2YyVTiy/vKB8Qo95WA6o6
 7Go9MNEu3+tpXlcqrMcjq40WnQmbdtZVifVvm6NwRhDnV89ixdPsc7eoXGIApRh7Z4Zp
 EFwNyiF7KlDco0a2V2NtTIKw5zKU+0fllUmI/4W4IAHfkB++RLA2uL95R6vKg7v7SJA7
 FzPf4gbxbHgbVLPr9v26w0prNNdBRhU7Xl/S6j3GpjnfYxtH6MuT99uBfo7KJVu2KZni
 fNw6ksVFJ0jh/zRCf7hs+//ycTbRHdkeKeaJwlQCiHsm6DtEiHKHzRk2TPLE/1T4YPG4
 M/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767779042; x=1768383842;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
 b=hFGokS9RFIlWy6FZV/TyT6ujZc3AS1rNEu21xaZxsuVz8ZgVoU5NzS9xLeBwqqvkGd
 OZceMdy5vZdU0rK6kz/Rv7on323mdKdkIh297e3xHF2E/N/qbLwwHaw6df6xUjAtvobe
 wDhb8JlnPdtuatIBLCgrZhIPC1eRvPSm9HPYjUAt6yFaTjulfDaYg8j8y3HkMcQ72sFF
 DDk96hPEKwhiGkGkVpIwAqfC5QZKsflR95hibsG2efmrC8ezh8MVnFJCBv3se5LRFfa1
 mV8xuQxMilwE8obkxWv0TIF0g8EB79s/BVroad8lrW4Hi9w619oSumqU4zI6HAaCesCH
 uOmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjDJnFsNIZZ5uLPxsTwdAS1vLl23uqawjwYHN2inSr+UDiJ/WVQC3P62lmOQC2+ciaggsJiSm/NBCTGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+JTeztS7SK8AGRIVqGfz4vaIqUi+txQyfkWLI5oC+ADYf8bgb
 cRX0H1CZx/h/sbwaWqv+10+1A55SBN0e/ugK4a0JZiP7/tWZFkGomhgncqCqzYwoIMpyt218F+V
 V/5+A90xPFjdLZZIhlBCSoUnMtrzAX4IL2GWFK0HZZcvr2OC4+ekBVDQs/3gyztPScF/xBO3OKc
 wrE/J8eAY=
X-Gm-Gg: AY/fxX6pPTY2Sv2JsuXMPUWMAL4jm8m86KqFvuzV3wbTTBP+OV0pxR/1rfKO1RvdGXU
 kanqRvlbYt8NoLNErlgrBFPeh55aIjbU0Azi+3abqCJVn7emRhqB0OEuCXhxIJ8Sr95R3O9Db1E
 dI4A708qnhAlWRnFfB1rwZ01VnnwtM9LOOEsRata6MsGHfEWaoubUgHnvMAkxa99ooz+X4SGYQJ
 Ot0fTKfg2AOyoCYyhy7NZe10M1m+l6bvetcQnvJwNjXwpwPSyMoS8BjlohT7Yz/FcEeTTHC6sV1
 ym05csme++PpjNohOWW6bWgUefnRytkYFoN5gnGS8hHQCPv2irRxPkkEkNZdNkzLZUVzW9s00x7
 dDCpdc5HOF2hKaF5XOzIhAvK/N0AmXrhtFQ==
X-Received: by 2002:a05:6a20:2588:b0:244:d3d0:962a with SMTP id
 adf61e73a8af0-3898f91d2e5mr1676332637.22.1767779042375; 
 Wed, 07 Jan 2026 01:44:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIH4Z2Oahxy0UxkXkDyW/3P3Ci/gp4BIgoLAtCTUiDQ8zlt5KFUGw+C/ySvBhCDKkSEmp+cw==
X-Received: by 2002:a05:6a20:2588:b0:244:d3d0:962a with SMTP id
 adf61e73a8af0-3898f91d2e5mr1676298637.22.1767779041824; 
 Wed, 07 Jan 2026 01:44:01 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 01:44:01 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:09 +0530
MIME-Version: 1.0
Message-Id: <20260107-kaanapali-mmcc-v3-v3-6-8e10adc236a8@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3NyBTYWx0ZWRfX9s7xi7s0lWIE
 wb1KcoDJ+rkwoOtgAhnFm+fvYEDw42uRZTYMdwOrG5aUrS+FxEJqQJz+deNSCNQuGT5Z7n7HbFh
 prBaToNXAMw0o8aN2ZouMShUvwgxbB2prziDrcsXYvmSO8I6Nr1rRkw9E8mzedHBQqcSrNwtQjH
 zbQfvojXJc6Kdzknp4Hiw/xXJKXhfzGA9eM2zOLdyBtL1s8ZZsErWK1D0LtyDQx0lwFJUx2EqDq
 cIZl4ERXDQ6omO7vRd/TtgYSrc4UOHtaNjdvYBn1Ua1q1AEmdvnwxQ3aNYxX+yqcmLgsW06mYQk
 3kBMjBS1gP6XTqOIQtVvlFmmRARx1BlOEDDQWVZjID9YO8R8YUorKB/t7R1eLgSyiTKOB46zAHi
 TH1gy1GRdhjKVzBBfIMX9BFzpnXraHqevZT1i0QFWVHGgBYxa3I7UOLecKQ/RzrWIfVYJ/3nSfN
 8SN9Ac8s5fpnKQ7lmqw==
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=695e2ae3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=_xnZC5tmkvlqoiR1VIgA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: P2vzqukDxLmtz2QaxWzkYOSAnyDNu4KX
X-Proofpoint-GUID: P2vzqukDxLmtz2QaxWzkYOSAnyDNu4KX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070077
Cc: devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 06/11] dt-bindings: clock: qcom: Add
 Kaanapali video clock controller
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

Add device tree bindings for the video clock controller on Qualcomm
Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,kaanapali-videocc.h | 58 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b31bd833552937fa896f69966cfe5c79d9cfdd21..e6beebd6a36ee1ce213a816f60df8a76fa5c44d6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -22,6 +23,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
@@ -61,6 +63,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-videocc.h b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..cc0d41b895c92e1d0b84067093d2d7220c671a91
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0_VPP0_CLK					6
+#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
+#define VIDEO_CC_MVS0_VPP1_CLK					8
+#define VIDEO_CC_MVS0_VPP1_FREERUN_CLK				9
+#define VIDEO_CC_MVS0A_CLK					10
+#define VIDEO_CC_MVS0A_CLK_SRC					11
+#define VIDEO_CC_MVS0A_FREERUN_CLK				12
+#define VIDEO_CC_MVS0B_CLK					13
+#define VIDEO_CC_MVS0B_CLK_SRC					14
+#define VIDEO_CC_MVS0B_FREERUN_CLK				15
+#define VIDEO_CC_MVS0C_CLK					16
+#define VIDEO_CC_MVS0C_CLK_SRC					17
+#define VIDEO_CC_MVS0C_FREERUN_CLK				18
+#define VIDEO_CC_MVS0C_SHIFT_CLK				19
+#define VIDEO_CC_PLL0						20
+#define VIDEO_CC_PLL1						21
+#define VIDEO_CC_PLL2						22
+#define VIDEO_CC_PLL3						23
+#define VIDEO_CC_SLEEP_CLK					24
+#define VIDEO_CC_TS_XO_CLK					25
+#define VIDEO_CC_XO_CLK						26
+#define VIDEO_CC_XO_CLK_SRC					27
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0A_GDSC					0
+#define VIDEO_CC_MVS0_GDSC					1
+#define VIDEO_CC_MVS0_VPP1_GDSC					2
+#define VIDEO_CC_MVS0_VPP0_GDSC					3
+#define VIDEO_CC_MVS0C_GDSC					4
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0_VPP0_BCR					2
+#define VIDEO_CC_MVS0_VPP1_BCR					3
+#define VIDEO_CC_MVS0A_BCR					4
+#define VIDEO_CC_MVS0C_CLK_ARES					5
+#define VIDEO_CC_MVS0C_BCR					6
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				7
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				8
+#define VIDEO_CC_XO_CLK_ARES					9
+
+#endif

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
