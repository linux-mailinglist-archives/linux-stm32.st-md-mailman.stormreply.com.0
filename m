Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPmlLYcoFGrfKAcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 12:46:31 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A4F5C95D5
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 12:46:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E221AC5A4C0;
	Mon, 25 May 2026 10:46:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 349F2C597BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 10:46:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64P9Er9I080260
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 25 May 2026 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=; b=hyujLfCl+/Vz1yng
 AFNgFf2wEJWfZp9aFWHwcwlwSswmQv17YNi5t/Vm+gEwzFN4h+pdHGCbwCIdg3J+
 9axuVT/NuLlIFaqZ3Q9c1VyBqeSyZmgsdFNCR2solExGuVsH0PQhfQLLMurY13sG
 FxefoQYHKLKo1L4xNY1xbJ2hp6eU2OnmhGqmXelmrPZBaJxgMSPmgRsj9lDM8kXX
 IM+nHRnZD6Ojm21sMIHDgVBOAJduFByFgybaxPBDaDlna83pLsZO2BkFRIwrttZV
 MW0xJfzq8oFfp+Q7iKiHU6lvOfUUnUQltWnDl0UDTWPcbGtBHxwFRcl3xa8IOBOu
 /8vPFA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma8awd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 10:46:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2bc763c7256so209725345ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779705987; x=1780310787;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=;
 b=JKIEIHb22zIF9tIWjyI2x0DABmvUx8URK+SbL+Ja5CXbz3JSk+yH+RVWit6ELbEdEz
 fdMbXSuKlXw72VWw5WkCORJn+pUvluQcUkkREsSgEyEJKKicuDatlULTQ8V3S5arbyUu
 /PTgisBn5XdAgjbVVaysf8J3gS6hsUMXh42QEsx4iMGG2ibUCrL4sJ4h0gA1pmiTIOwG
 DXE/AyAi4kBVlpM6cIqe8aDw8alD1TWYZ+MzjNL6X1JPscoLr9M7FgBsBJ9ob1nfRNFk
 /TSKVa6GCk+IhHARzIl8Cu1KiS5vdtzAEzk2xlMd+YbR/++5GJD9HJWb7BMWwsOFlyCc
 r1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779705987; x=1780310787;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=;
 b=pyF+Wp9cydoDA+lhzisSRgUXhQ21P9Ml9hejB8QjWcUaMEqdX18T0l4y23PpbVE2kW
 Q/PtLTRVYPRqvGLN5zsrm1XMlroMbs6W8+Lu7rsFSyKHyBnp+uG2NwCulW6AsCn8IY5a
 0TU9NluenTCnjo4wEFadg83oENA7oOnj/3K1yBK2H2I13ozxDrtR55E6DO1sIt+CHdB4
 Y0eHiNtT61KXVmnQ7kGuqhTd9tkzZZohpUpSPJt2u8t4MBTI9gw9DWpWoc0kArGjdbMG
 0I11HiRMJxxh8YOfV1GehTdGfoe9elYwHxY5X9ZELVuufXyUadnfSTCYifdM19/eqSIo
 p9mQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hUu8Vc8TcQ24+hDoBfddptr7lp1LW0o0M7W9EVd5JiwvCKQDKG/fzQQ8/CKRCcj9i/i0VB/bChzQKOQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw8YPS3l1kuSxQagP0juKPw6fZ8hrZxlAW/BGbT9v3d+h5NyyKV
 Hd2Wnc5Ubn7sZhq6/fhrs9VcSknKXvDDcQ0Jhq38jPoRisgpZkjfscwE9sgr81G7wMinwf+0MEr
 VwadGY5f1OV5Plc1yy1HwPTuhMUm5SZyg//AwpR+1V8XVjLaWLqVubGLFK3B7DDqYiA/0Y8NUmV
 1T6jzZZjKwwSlPncM=
X-Gm-Gg: Acq92OF0pEmdj60Jm8hxxVcMCVfQqpnhHQJFacMQGZ+ZrSRqZt6TOSNv2jmGBamOUDW
 ErFwuZZOzJFrnQJ6rx+mBZt5Koy54j07zYhMCynJTx18e9BVlOTNYRv6o0kWqA+PU74ueTTK1pm
 b3lAdRwPfzHM06QphCMEyaF0CUl1f5LW0RM4m4r/vP/I/JAe1+j+9yGyUtHOhAi1ZknVj483AZ6
 nbmk7T8WhqDs+yE7zmG5/o59vx3bzeXe6fKCO0Mrg5ZF7sB+1afpKosSyWATPMpTKjUlxXUr/Cb
 iYIW4WZxe5/yjX/yN0wi+Onb+3Ah7wxSMEU6dOe05SwewntEqdEYcG1VF+7eNS/wUnhNkAKiw1j
 QraM0BuUz851esIVJ8jsx8g87czxvf2InIaQtH58o7jo6/A==
X-Received: by 2002:a17:902:da89:b0:2b0:c59f:3b58 with SMTP id
 d9443c01a7336-2beb06552d6mr168809795ad.9.1779705986945; 
 Mon, 25 May 2026 03:46:26 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2b0:c59f:3b58 with SMTP id
 d9443c01a7336-2beb06552d6mr168809375ad.9.1779705986325; 
 Mon, 25 May 2026 03:46:26 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 03:46:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:04 +0530
MIME-Version: 1.0
Message-Id: <20260525-eliza_mm_cc_v2-v5-2-a1d125619a5a@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a142883 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: GiT2qHniHXtH977qgfMkiJV84-7tt8F5
X-Proofpoint-GUID: GiT2qHniHXtH977qgfMkiJV84-7tt8F5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX7tsGMIG4Rm/p
 xCzFtCh068FnWkivVOpOU7wOGxywLIgckSHuivIjgpfVfCzX4WyKgiqE7o37omSTbdnuGNvYycO
 LHIrDU6uAPjlJ29bsqt62G/YGTnK16wkN09wsXDzSe2EqQyDDbkMjqp6FrJ55zQFzIEObMXOv0K
 1SXHhAyUHetmjLH48IdAX15BG6bVHX2DNBPSW8DOg2BRz/+x5uZXQ1htyLHdqnD1J0+ZTtyFy3y
 0mbXw7QfvXURuYayuGQuhJikaDn1UX+wtZ4KdYmxPiRtL6c6czakpAqLgC71DvbD8U4ds6g/Geb
 6mnWFYKYC6iOQo8xKq6VOvo32v4fXboy6jDfUVOAfRy6JKUMZyL6ZumF4Lkt+fjWs84A9MXtYFx
 2tbD00y6qukFXGqVl4N3bH0kBzfcVOZWLnPTStFD5GTgWVUoS2WCnuKLjuknpQjrp5gMjNSWsOj
 lOictegyavohafX2U+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 2/7] dt-bindings: clock: qcom: document the
 Eliza GPU Clock Controller
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
	NEURAL_HAM(-0.00)[-0.664];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 78A4F5C95D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings documentation for the Eliza Graphics Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
