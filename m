Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F1ECFCF03
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 10:44:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05FA6C8F285;
	Wed,  7 Jan 2026 09:44:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDFCDC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 09:44:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6077JISb1476329
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 7 Jan 2026 09:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uoxee+h4RjL1xykbTwqckzvbi5sXcV85vpSTPbs6KOQ=; b=DP/N4zbBHZDeipLm
 2LAIhuwn41aPR3w0ZIv4/G1oWXv+U1EGInDJDTT28b6xtnHnjVmgliIV5nD1K8iZ
 hPJ8JaKdc8BYg8fiaP1rHR+jVcxJcWJvZiB1IQkvD3TUVW8mKz2rVBIc4qpiuSlK
 fmfZ4kLCIQbRoMH2Z1wrcWnK4vcLhhYWr8+WGrXhwsqT87Pa0FfyBR3uXKGKkXCv
 jxutgWDLKHKQa0au6p65G4kLCTUhtq3FQT45hqkShNBmgSTfKxzIs7y2ZN0J7h0D
 QtxcZNsNWKmMA77iuOdF/FQNzFnA952wNZ5twfBbxmgjGwL2/SxE2vxoltbWrfjS
 35GMhg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhayhsv0e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 09:44:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7f21951c317so1463177b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 01:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767779049; x=1768383849;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uoxee+h4RjL1xykbTwqckzvbi5sXcV85vpSTPbs6KOQ=;
 b=UEytjIzcbsQ/18+pzvg8JzrIImBf3pimaQUHdfY6NzAHW6GLTslzCNeJi7gOfdhY5C
 NCxnP09C0Lc/mkEVaa6Nm8M4iiMym8BIfUckAVz5O6GT9wgHAR35TBfaGI1fI+jSHSV2
 yEWTEFDzcurH+7SWKglyGJm4SKAhqjlWROpRSnKgXx0Muf3INZMvdx/EYt6JSq3GNDoG
 hpbytzGyZWWQky0/ZIJStFKKrsrQazvOrzJIMxkNo9dQwZLBlqlW+64IqiIm0Bp7W2sm
 Nzkr67igti6wQrtNjYU+ksupRmZNvSHcnfsnXaLWu5YNiY4mFILJEXu3pyv+WoK0scJe
 6Dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767779049; x=1768383849;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uoxee+h4RjL1xykbTwqckzvbi5sXcV85vpSTPbs6KOQ=;
 b=XuCYZJDA9i+lrlYh/mQ2jbVM3RGEHuG6LzRA5Fo4c0+BvAKCZ4GN0jHUTJ607SBf/W
 /fc8GboEE/2dG2INYyhZOueHoDd4ue15Q7iEr9P+q/cNT8F5HA8Nq/wI0Nh1U62JZDY2
 JZBwEwvLpUXLiAPhbofOhnCeFvFl/t05wLuhLpihZNPHiC8KwD/hbGE4LhAaYttkjLRK
 SKhX+Ci5I8t31wOedadUEAubr7v1s9PELsXKYP3BTsL1YQ5qgawwu4Cj/wuRowrx9khi
 1UFWmeazWAi4I6/adHVAnHQRk933pnfiYOeY58PKNIPqayLjVxedPBfxBl0heHQC3qFT
 UxCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFa+MZuRmJgBIlsn8vc1+FbYW95S2hVdWzv8sUsv0Us4GrF3dCWxgU3AGTJhAiyUZ1t4w1AImiQQTxmA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy8pVnTIYyhrwAJuDDsfFrXrOb4y08NEKeWJzFgy4TyDwITPSo1
 tDhsX9azIIFB2UdpoUtw0CBMZJ3F9B12NtHje01KIQKO6gW6gmgCspPBs9zXIeh0g9HSvXKCyI6
 r+sKxxw3KBnWZB+P07lDfY8E2EtLZ4oMB3+oexHDfOy2jQWLG9p79r8GAuC10lsXnuc/LuKid9E
 IQVyRjfqI=
X-Gm-Gg: AY/fxX64RRh7l3uJ3rE8Jmw4nJqI4LgjtP0VQ2mZL9V7aY++epZIrFBbslKfS0PlO1x
 Zlwim4ESyX/fyFO5lltJpXubDk+BLa4aRHFibu77eYpHEPka9yOu1Pf7Z1r4Dg7qF0qhu4DNCZT
 HaWA5xDgptXqpPguau2PsKVt2Skoj/7+34YYAbEkB+1XdSbY/yaTabKax7elmun4E+7+2NRHpdz
 hUc/nG3xcQEx8xvYHZZeEtQDdYr9xbVko3lZme2iOVpONwUapNR7+8mKemRrYyjcuYdjgHw5Q5A
 ip8cm+B+CeKukiqgQ/ZMyX82ZIyazV29+eoI0FshVy8MFbr3AAg+slEpg2w2L/jbYyd+Ft5kRdE
 yb/A7ugi1MB99JDr2TqPfY0BFKaC4QOlPNw==
X-Received: by 2002:a05:6a00:331b:b0:7e8:4471:8dd with SMTP id
 d2e1a72fcca58-81b7fbc8d76mr2091659b3a.62.1767779048740; 
 Wed, 07 Jan 2026 01:44:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzlFxm5Gj5e+T1ypcUeQYLoHF+GV0ngio/WwkHD0VhUanJJDn3ygFj6ZVjFlWN3cas4gxBJQ==
X-Received: by 2002:a05:6a00:331b:b0:7e8:4471:8dd with SMTP id
 d2e1a72fcca58-81b7fbc8d76mr2091618b3a.62.1767779048155; 
 Wed, 07 Jan 2026 01:44:08 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 01:44:07 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:10 +0530
MIME-Version: 1.0
Message-Id: <20260107-kaanapali-mmcc-v3-v3-7-8e10adc236a8@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfXwcLBf/YyK6KZ
 a3bhFFSuhvjB1CcjtMvGL03mVz1S10EZC4PsdTImEce5VvoHaEaWpIEMYs/JE9UvNjJuLFRxv2j
 9Dho/4nlvVhJJWTRU+Y178/jUiqXYUyz6YU/ikxd1BTEMdsqMu711pCTrb4vF4zUTVXpuXtTukp
 MsBUYtrnq+GjKi8pYT/ONF59SuxCODa2IwrdtiGQjHi0hMcYqXKUf0vwhUA0EAXuu3EPV3GPMoA
 L5pqMvHswLz924fQUwytVoNBLks7/3jWzoA14uTjAdj/cQ0QmX3WZ6+aTSzAOwQ72R/fQBd6G5h
 N4vQd4a8xVXFG0AgQZY2IKiR5N8+gpxvIzzB0M6/r/EGC8kxofEDaq2k3dnP1d//xzQIYNQyVYU
 dx4cqf8RPdnvHFI4pNpZXADIguKNHpdUQyF5wKWjPdux28+cm6eN87U5V67bLcKcnpLFS7uEqfd
 Mht0dRSGeW6q1/SgumQ==
X-Authority-Analysis: v=2.4 cv=VI7QXtPX c=1 sm=1 tr=0 ts=695e2aea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=l5CasOIcougls8LOFwwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JhbdYqjHy7Rma_E6S238Qt_2wnLbVlup
X-Proofpoint-ORIG-GUID: JhbdYqjHy7Rma_E6S238Qt_2wnLbVlup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070078
Cc: devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 07/11] dt-bindings: clock: qcom: document
 the Kaanapali GPU Clock Controller
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

Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement from the SW driver is to use
the GDSC power domain from the clock controller to recover the GPU
firmware in case of any failure/hangs. The rest of the resources of the
clock controller are being used by the firmware of GPU. This module
exposes the GDSC power domains which helps the recovery of Graphics
subsystem.

Add bindings documentation for the Kaanapali Graphics Clock and Graphics
power domain Controller for Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 13 +++++
 4 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5490a975f3db7d253a17cc13a67f6c44e0d47ef3
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
+  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
+  Power domains (GDSC). This module provides the power domains control
+  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+
+  See also:
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
+        clock-controller@3d64000 {
+            compatible = "qcom,kaanapali-gxclkctl";
+            reg = <0x0 0x03d64000 0x0 0x6000>;
+            power-domains = <&rpmhpd RPMHPD_GFX>,
+                            <&rpmhpd RPMHPD_GMXC>,
+                            <&gpucc 0>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 44380f6f81368339c2b264bde4d8ad9a23baca72..6feaa32569f9a852c2049fee00ee7a2e2aefb558 100644
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
index 0000000000000000000000000000000000000000..e8dc2009c71b705b4369a6c8cf83024a18c611d5
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
index 0000000000000000000000000000000000000000..f32dade67cf2f26e29b2df6a30018b2d1f62dea2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
@@ -0,0 +1,13 @@
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
+#define GX_CLKCTL_GX_SLICE_GDSC				1
+
+#endif

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
