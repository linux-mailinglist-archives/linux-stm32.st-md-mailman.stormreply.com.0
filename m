Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNUTHYEoFGrfKAcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 12:46:25 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 312EE5C95C6
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 12:46:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0CEAC597BF;
	Mon, 25 May 2026 10:46:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03517C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 10:46:22 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64P6YKY0281139
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 25 May 2026 10:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=; b=iWUOeg4ViKLcqOYz
 3tqo9umiPdnH+cYBOwSmQQSW6cjcSp9VmNGiUK9QGqNz614/qpLq8e4W4pSid+uZ
 NGqsmNHkl5wVLnqhI20GRUQ3CSSYp1iEi9ilusfKmx+xIlNEYcItVIBMeRPpTzzP
 M1AG2JaDixtQ6MrXFFDDrL61/JD+cIJxk9gF3wNnfCXYgAyuTb5vdBrEkzc/XPzB
 tMGydYH8QNZqjjjuJN8e17idzjFKmeNslgsA+dLcHKVOx2aEj1i3oO5BYgaeqoWv
 gX70VFyhUfLUm/U+Eih83QgcWvoFpz0fH2PzFPMfjMaxeiDRublf7iwvQ0DeKLvd
 Po3IDA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3e91w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 10:46:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2bd04e4fe3dso25057355ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779705981; x=1780310781;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=;
 b=KsJ3BLzOP2lsmY6ZeQuNqiMlYRi4aROvcHANsf6pDRNZ7l3x1MeRrNewR05NlgTCjx
 M4CgG+3FVe5507xoefwP5AbsqDiXArIctj35VKoxpTkQedMD5j/C30bv0uiybPI6JHnj
 89ZK8fq3v2zprstwE1uk5TrwawoawXJcMRjirzQKSP6RtnaN5emr3IM8TB8T/NEV2mTj
 c8qZNRON/YA7BHKK3ohvn90Xt/q88KWAVh3zWHGOw148qDVjd0r/YTKmg2DAG2LFwCwn
 XN+nDVWLSv3C4yg2D3k4TJCd52iAVNBdUZdszSlyFL0AzS56sqOfM9g5Ddt+oEepizmU
 5eAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779705981; x=1780310781;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=;
 b=b87gRTi9nhl9vCHeDoDhnARyIi1/BNMCKBWnV0fhmXh7Sde379N/OrLX1KW9lAshmO
 EsmJko/q+jKbnMF+Wjt1z7IfaV9lrzaa0zL89GNxxq4oH1ctaFkpuYkk9+HnZnvzPTl0
 xN8gLWmnf6D+gCpWnjpma5CWAtYI8TGcudkY88/ryXR2Qbqg65B8aexW62gwb2ZU7jp5
 YoaUVFUpU0iw0fcosfbqVOaPvqYuOKAWgWfD2sE98IlC2KPPBy4yNU2qIrmcqeFmHBMe
 C4lnP6ryMHKP0ZPWFgtntPA8gAso35Q7qra8C8vHKSWvK1JYKhFYm7wsfQEX1E3C4laZ
 Ff0Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8u/CfwLaYdGwuJgiHHuwNryH3O+Ax7S+Zr0uyNdymBT52Wv3Ntisg38WMxeWFKjSDyFbZLnEeWch6EHw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/HeHXP1LtJ1WQ2NHvZEG30IpdR6yODHCoUJyiiCK3QLewqUWZ
 l0d6W2PQIQpiGhkUhTI02xWEBvvgCR34x3pKFkY8Dd0IggQy8qi23aG+0WWYC9naN/Pob4zayRH
 FHXhdi/YUgubf8QyxYvGjbRh4+fnGIbO2FdfdfxM7wXAx9GxmxjH8lyQP/XahaSNv0/7JA9i1n8
 BZQO1Djxg9KLeXf38=
X-Gm-Gg: Acq92OGXNRAmFBrvmqoWN9O+I0Lf7NfanrRcPfDOfumnqT14J1MmoXeG6vZiAtKAw1R
 es4+q5y8b041XRNGcmEL0yUVo8jSmJvQS8CiW6HEDA6hSCd/VI3bG32vARJOnmkoXx/zmMTs/oY
 l39D5ayo3TFW67E530arHKWuXuAR6zSsjZcjd3atChvLf8W732V+UFcD6YO2Vn/pVplvaACes4/
 olfmCZFkFdViPbNxXdsOWQNdU3EjQmqICk21gfn7yr4IrJHvLyR8Z9t97id88mDz2/u0N9uvNR0
 tnfP2dexvrlbCMTLP0v4X2BuiiS1rsQSyaOrFPt+oEzGub1XCi1PRkPRz7ork9Ir48JzC4btrOQ
 fHMgl5/2M6O3Jlvf/1NlMlw8IxS4rqo1BrRpo++1Xgl+6ew==
X-Received: by 2002:a17:903:2381:b0:2bc:ac76:c1c9 with SMTP id
 d9443c01a7336-2beb05e8633mr145799415ad.16.1779705980468; 
 Mon, 25 May 2026 03:46:20 -0700 (PDT)
X-Received: by 2002:a17:903:2381:b0:2bc:ac76:c1c9 with SMTP id
 d9443c01a7336-2beb05e8633mr145799125ad.16.1779705980019; 
 Mon, 25 May 2026 03:46:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 03:46:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:03 +0530
MIME-Version: 1.0
Message-Id: <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: uEZAQuRwmIz5sFgA5c3tYVTq4_B54Pgd
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a14287d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=p7IodTP_qeDR1Assq60A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX1CZEyZPqhxcH
 0soYLTIdEQXP0fqYem4v+UdMoFOM/3Va3I8bCGfOieCTXmNuinvLcO1TxYw3ZS5OR4cicV+Z5dq
 AwSE9TYGwZguoYrkg0nVHObLH8her85PhZqaFVa66XFtATr7lBWJR9QE37Ph2kLKzFoQ+p6+lE0
 cT0ihOI73Qume8ACROQ+VHVA5+5F62+4rCwoSJYHRNSwoOZ+tZ6Nhyz40ezP0A8iSjRV8M6AWZy
 8nGXqZEogU4C1L1SXILS+wDeJZZdO7b/yekVcnGqnVS4mMoedscAaqTm/sdLvyyj4AxPOByNu+N
 JHQZIwdyXyMntMbN6H48OavxPzD1LbNc7XF+kw9jxEIDKNHgAYD0OkXjkXrwOeMh3nhrlbo8ISL
 McOyjOqS5qG5KATCocOXHKfrLTyhiponViEKb1P5pPzC5dwcHNYHGk8jPgr74UFBknQqZOMpC/8
 EAbaK6TtNsqVdJv/IPQ==
X-Proofpoint-GUID: uEZAQuRwmIz5sFgA5c3tYVTq4_B54Pgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250109
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/7] dt-bindings: clock: qcom: Add video
 clock controller on Qualcomm Eliza SoC
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:luca.weiss@fairphone.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.655];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 312EE5C95C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..c0c9e450b8cda53625b6f6bdb1bdfe5f2bfbee25 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -29,6 +34,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
