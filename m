Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138DC8649E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Nov 2025 18:46:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57168C60469;
	Tue, 25 Nov 2025 17:46:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04497C60468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:46:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APHAf9r3890211
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 25 Nov 2025 17:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=; b=KUmBiX5HvuclJ4i8
 bnEL8nT4vq5b/zVcOcxbjKLOQQPtSiVeOAT1iZ6LM8w8G2uos2FqJD2ZYYU/9WoH
 E0WADa1TZOSQ2cZy4FBszvG3JbXleKXxEFJ0Fy4AwBr+4CPZeLK7rYYVNe2qeEV/
 HIUEpYGEoxkeGJ/YMS4osdC2WFQJ0op4HfVLGzsPeSCW+Ealq9uhGek35o+3huqh
 8ZqdP7oWTlAmZqr+Pg069QwEsHfUFhUuPeaBZYQa1/Qd07TR+7jjXTk2gxgwZBI4
 1hnUQEvSXVtbIGlpUQASLQYJL91YgQBhYoudgzK/0RbJQx+Agqhze5u+ItK5UW3j
 jM5DlA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme83c8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:46:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-29848363458so128429395ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764092767; x=1764697567;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
 b=QWnkTcQ9Ek2UVqRtmON4lMQLBpGqY3E7nasqHjPXd+ys5NRHICEAFxLfOQF7t5dFQP
 Q30Jxkcye23GPkusEiJraQaaco5CDMlpcls/bpH3CVRTqx+MUFgrTlRFN4ivFCwqHieu
 4aHmEuj2AW/DzbAKU9OCnZWWb8i3jT8R2J5BQbRrIhoeg3OO61Rc6Z++3GcY6ztxN0xS
 Px3DwvsrNI7lkAwG2l5TY86uDfYdlwc7i6Ivyd7c9Ff/TTfUHY/hVjXxwAdIHaQ4Dc3G
 Yk33GDRXoWYzEF1CgjvkZqzjhQ4bRMSf3InFMmTz9UD+kkS32JfkcZK3xnrYPMBLz6aZ
 PmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764092767; x=1764697567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
 b=dZdreovxMVq4YYjqiNkz1u56T7zE1ZDPKPqn08elxk6d3IHhVmGtUYy3HJrj//yjQz
 HBnQ5ZJOwGbpbSD2iAkRqOQhPcPxL246Yi51u7i+YqasprrFW5KMVyOqKepLcaNu9GBb
 USlo0wV3DzXptp+31C+r5ucXBgeR7jJbyf51FjN4hV53qJ+Twtl7idHu5+WQKl+xd6am
 a0cPJ27oLS4NC8GHI9X1z74h+ww1qxGV4deHVbYU+2AgFfpskjd84uBe1ehEtC99Zr6d
 6ZkndTAqoQEubZ2j8MmQZ1Plcti8zrCv3WzXgiyduZgaH3x/fFVRt0YlU7ZEIxCphhov
 N7Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcDfhTdANqGrpTRX3Au24fxP8WFHXUNFkeEXFf+PnOAt2Gy7+5bPoPjcmRxeG98RXiO9oBRR5hzHAGHQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJitZQDec9IXnsBNiGbTS583qcvNMhXCvSVx+OcJABDb3MS4Y3
 6bkEuG0KXqkuX40v5jnSoXDgTH2zS7d4HwhpqvyPNt4WaI/Ju6KDAO2nmG5Jgt73sdbTsB/JVtB
 ZHbcHUK0CEylbzd/yKyb2GrodrIbwCLi6BKkDHj3afnxLfi+KH/SeYPMDj6Zox8d4zyaIShMjJy
 gLK/9+ymo=
X-Gm-Gg: ASbGnctRc0zB4uhIiUbaeHhLasDUQNp7hEEJcajMpvyVP18vw2DsZUnLNteRZnqjowJ
 nduAHTcfhE336tF4r+umeY4IeFDFnSht7w/FvtFLDnKD5SNSmcdfA8fCQh7me/r1kJECVS7dh0B
 r/uwb1DTFwRnBnDAMnGkcVNSgDn1hi2h02zKRLH9azmFkT7s2093+FZFvoSNkZjFhvd3P3Y33dx
 oCVz8nlw5UMScI05VzuJprSeeSN3A1OtDIykXYxcCgvbik96Dy3iPnuGoyNadXXs+qqldJEmXpn
 e0Xis/8i5sXTSNvX5HC6BHF6u0nzkDzRW6N+dM4S+3VVMHGTn2jVhlgD1KhrOrnJkcgY/WEfFk3
 ziC40bH0h1CJBBRBGWrk=
X-Received: by 2002:a17:902:f647:b0:262:cd8c:bfa8 with SMTP id
 d9443c01a7336-29b6bf35a2dmr205850215ad.34.1764092766838; 
 Tue, 25 Nov 2025 09:46:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+KSJB2xWtxVZ8oAlfa5za4pbJa3L620mPjdtau84L8l44CqGBLK2ZdHQZmtGTniP8opeA4A==
X-Received: by 2002:a17:902:f647:b0:262:cd8c:bfa8 with SMTP id
 d9443c01a7336-29b6bf35a2dmr205849675ad.34.1764092766316; 
 Tue, 25 Nov 2025 09:46:06 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 09:46:05 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:15 +0530
MIME-Version: 1.0
Message-Id: <20251125-kaanapali-mmcc-v2-v2-6-fb44e78f300b@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6925eb5f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=_xnZC5tmkvlqoiR1VIgA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX5gWx4pW4l5YF
 DewbIEe+Fo6AH9wY+wKXeHZeGm7oF+KdSsWzmAw+KPHXOX26mH232keoEwtnzSKxK+chy6WvrfA
 RlSRCTTx4FkvCpV3Vy/ID+L2xnnpBSlBAPwx8ZxQUt7pfDMpVIogy+gowYhYleeallo9PjJ8AZl
 6SDh1um4cPwX0Khkc7Qw6z9R/8kFEeQB323saCJg4tS9QugbcQ81gmEkHSM0u/FYQ/i2IX17a6q
 4LT3Sva2y+j05/UmmZ/yS+WaFTCKlw8AXiMOCEVkjow4Ti8gKCDLYykfCxBpnaKhGsHSp6OVckn
 FmBUygMmvugnyqv3ZkveAZ6mEPZUB/llnI6tz9jfrp74oK6A2mmA7ND8BW8fbAV/liEDXsSf/mx
 p+5VcjY9dTeVOhfKe6GQR1sNNKI3XQ==
X-Proofpoint-GUID: tGzjge2JZRnvFqImJG246I28J0Hxdnkl
X-Proofpoint-ORIG-GUID: tGzjge2JZRnvFqImJG246I28J0Hxdnkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148
Cc: devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 06/11] dt-bindings: clock: qcom: Add
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
