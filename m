Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C61B9D87D
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 08:07:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E503CC3FACA;
	Thu, 25 Sep 2025 06:07:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E259C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:57:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONq6oX021486
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 24 Sep 2025 23:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cTmi/UyKj7qkJkOliY/6Aqc8mHisf8eGbJha61ggIsY=; b=Wo/jAPv73ZmP1ECl
 qSlSMUgoHaR+wKHJBnYRBvEk164S7+UdXgzSIxIJK/pCEWmfH1P31bKPQHIf2i5t
 j21Gwgjf6tE+8xr/ZmyedO4292zFTvGdi81FOcxcZ64TN+UCyliXxaOoGF6+zPaI
 w8D7TZfpt28FC1+ceqB458gwJOPaKADN5pTR/5FMqjrqeB2GYFhFHqXvicA8TR5K
 7acbeVjxDtMviM5rnZXU1oMHYj7wfzUCrtZEk3Pk7eOJBLazwPj1tSYqe3Pw9vTv
 /xPJv3aAq8bq2+/UjxDQSsh6n/Uv1gRn3zla/eU0MdOdcw/Ai7UeS/PoUFalVIsk
 8z1IjQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadn8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:57:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24458274406so7199505ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 16:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758758222; x=1759363022;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTmi/UyKj7qkJkOliY/6Aqc8mHisf8eGbJha61ggIsY=;
 b=ktVzyqflwJg0GZHkAu2JCodgBeVfCqMz/5TPQeIyTXNnwdOMupX4QQnBT0GhdOS9WC
 GH/bpqoVztLWlX7s0D40BrP3a1+KINyvvaZo0rcBFMYFMFNexCxmGjtQ5Lf43BipWtxh
 942Hw4KPv9x4UUQJSg6TPUA/zK5QSY8Vj4XpBIwLsDCQ2mzkeks5BCTmf9n59qXahRJT
 PkPeqzO3aa/X/g+KeADkh4g0Y/2f66klCOUXampAN/518+NrleMZfuoZJ65rvJwS5NEf
 YKKqM+EsYrtrnNCkSO6DlVWNm9rgMCltZ6YeC/taHUJ8XNe/MimVbXiOeXEl4/n7W7pA
 1C9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlNIDmUvurOvjQwyhJiLRBYTh6pYjOWpZEoKjKD06gBUXpdqOjBURTWpgY1w6dWxLMS9iSBZqdSVOHZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+f8nP4c4Ltw2a3eOp4mtbE/7RQ/EpNeT6oI6FOpJJ5oaVcZBy
 0cmJa+on0p+2ewj9H3Q6btjlKve0DkQezs7v7uwXphRsEkPZaLL9QkYs/vq0vusRKtc9nhIxgCz
 9F3je3aV4Xr1qSDxJh6HorNuKnZsnJdACHbRAznm2AL/J2YdpjuT9t/Pj/QZuGLnL6dfU+HEf4v
 33SwEF1dg=
X-Gm-Gg: ASbGncva+orgBj7C6biAcMxt1xOBQv3Ws7ysycZ9u4sbJEjiAt1tYIiEw3K5ssCwoRT
 1VkWZ4yAb+2NYC4KFNfg6RaatLvXpSJ0YdVOTp1TpcRkqF52gjuHaHPUaZwOn3rtzs/Xsk/oIXZ
 3JW/wjJxYi0jzry2kaSoNSq0eTADW3CS8Pw/AreBdsA00rWZ7l0wC3iosYHttybwjVTRbB7eZmN
 a4jslPCST5UZ3p/5rSAq3lwnAsNi7CqvjIAf6uNde0InTUetK7FjZV6CAmrFmHwUziu0NePSPsU
 tgh1/68zH/Agj0FGkiVaGeOC0Df8cizcoMrNcoMggFzLdl3INQEF4nt5qiOIt8xKsGeXHVMaiRN
 hH7jN9ZNEso8quzQ=
X-Received: by 2002:a17:902:d4cd:b0:24c:7bc6:7ac7 with SMTP id
 d9443c01a7336-27ed49decddmr18175535ad.18.1758758222009; 
 Wed, 24 Sep 2025 16:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz1ZXxkFFFTlD2SQ441OysgvC2Kuy4qXtteB6KyN7lhfx4bZVyRt0+Bz8roDUaQ8SB4gd/1g==
X-Received: by 2002:a17:902:d4cd:b0:24c:7bc6:7ac7 with SMTP id
 d9443c01a7336-27ed49decddmr18175065ad.18.1758758221571; 
 Wed, 24 Sep 2025 16:57:01 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 16:57:01 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:46 -0700
MIME-Version: 1.0
Message-Id: <20250924-knp-mmclk-v1-5-d7ea96b4784a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=5673;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=3+AMGrPvAvQBSY+2/qnhXi9oqAQFFYcu3uy9wKNCKO0=;
 b=5hhic4HmTesLT9qJZ1m1XWzbJTfsiHTnnWLFKj0i3PaC3pzyKIePY94nEYjmeQ769U7ZUnmc5
 TnYV41MknKVA+n8o8WLPzc9CI/rpPhVyKkOW+1rdFgxjTAil/OiODVO
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: BD5vyw6Ojmx9UndTXKkajlGUfkF6Mny9
X-Proofpoint-ORIG-GUID: BD5vyw6Ojmx9UndTXKkajlGUfkF6Mny9
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4854f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=dEo2bzUl0lUh28VgVkgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX841gSRTOKGfd
 puLzGIX6Re6ZWzJJQLp+MWincTk4mon2b+GowSQgxuYSBrhk/+aG/JmoT338eq9NQovUGYRo2e5
 lBVMZ4OhlHCo4TepefBdT1iUlA8mOeGdOWeWpXorXtNgfiswlffydJit2iSD3KN5Fwlcu+hVXl3
 0rThn5T2u7+h67Ky9GKBYH0Ad9kLkt2I5HE9DulcKuilZPYR+Iz1yLRu7ROPrMrk9tc1BZZBohk
 DsoGYXaV3t1BsonGPDZ3x7HTTtHYWSBMNgQW1vQtlYIqkG6VL9PV0NIoKw9t38sGS6g3sR/sc5H
 ERD/3xHTJidZgK/cO4UJF2mnDq0n2J4tJRNGFvSttaZY1z6inyeimZ493mzu8MuY7hhYabx5o0i
 pJpICPFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113
X-Mailman-Approved-At: Thu, 25 Sep 2025 06:07:35 +0000
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: [Linux-stm32] [PATCH 5/9] dt-bindings: clock: qcom: document the
 Kaanapali GPU Clock Controller
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

Add bindings documentation for the Kaanapali Graphics Clock and Graphics
power domain Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 12 +++++
 4 files changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
new file mode 100644
index 000000000000..31398aec839d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics power domain Controller on Kaanapali
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm graphics power domain control module provides the power
+  domains on Qualcomm SoCs. This module exposes the GDSC power domain
+  which helps the recovery of Graphics subsystem.
+
+  See also::
+    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,kaanapali-gxclkctl
+
+  power-domains:
+    description:
+      Power domains required for the clock controller to operate
+    items:
+      - description: GFX power domain
+      - description: GMXC power domain
+      - description: GPUCC(CX) power domain
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - '#power-domain-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d68024 {
+            compatible = "qcom,kaanapali-gxclkctl";
+            reg = <0 0x3d68024 0x0 0x8>;
+            power-domains = <&rpmhpd RPMHPD_GFX>,
+                            <&rpmhpd RPMHPD_GMXC>,
+                            <&gpucc 0>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 44380f6f8136..6feaa32569f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -14,6 +14,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also::
+    include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
     include/dt-bindings/clock/qcom,sm4450-gpucc.h
@@ -26,6 +27,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
       - qcom,sar2130p-gpucc
       - qcom,sm4450-gpucc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-gpucc.h b/include/dt-bindings/clock/qcom,kaanapali-gpucc.h
new file mode 100644
index 000000000000..e8dc2009c71b
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-gpucc.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_KAANAPALI_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_GMU_CLK					3
+#define GPU_CC_CXO_AON_CLK					4
+#define GPU_CC_CXO_CLK						5
+#define GPU_CC_DEMET_CLK					6
+#define GPU_CC_DPM_CLK						7
+#define GPU_CC_FF_CLK_SRC					8
+#define GPU_CC_FREQ_MEASURE_CLK					9
+#define GPU_CC_GMU_CLK_SRC					10
+#define GPU_CC_GPU_SMMU_VOTE_CLK				11
+#define GPU_CC_GX_ACCU_SHIFT_CLK				12
+#define GPU_CC_GX_GMU_CLK					13
+#define GPU_CC_HUB_AON_CLK					14
+#define GPU_CC_HUB_CLK_SRC					15
+#define GPU_CC_HUB_CX_INT_CLK					16
+#define GPU_CC_HUB_DIV_CLK_SRC					17
+#define GPU_CC_MEMNOC_GFX_CLK					18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL0_OUT_EVEN					20
+#define GPU_CC_RSCC_HUB_AON_CLK					21
+#define GPU_CC_RSCC_XO_AON_CLK					22
+#define GPU_CC_SLEEP_CLK					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+
+/* GPU_CC resets */
+#define GPU_CC_CB_BCR						0
+#define GPU_CC_CX_BCR						1
+#define GPU_CC_FAST_HUB_BCR					2
+#define GPU_CC_FF_BCR						3
+#define GPU_CC_GMU_BCR						4
+#define GPU_CC_GX_BCR						5
+#define GPU_CC_XO_BCR						6
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
new file mode 100644
index 000000000000..460e21881c4f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GX_CLKCTL_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_GX_CLKCTL_KAANAPALI_H
+
+/* GX_CLKCTL power domains */
+#define GX_CLKCTL_GX_GDSC				0
+
+#endif

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
