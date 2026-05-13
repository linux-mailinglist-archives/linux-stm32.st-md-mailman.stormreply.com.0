Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MwDLoaYBGpiLwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 17:28:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5772A536161
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 17:28:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D603C87EC6;
	Wed, 13 May 2026 15:28:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FCACC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 15:28:04 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64D9jiEM3007657
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 13 May 2026 15:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=Q6vaBLC9Q5RyNtb6
 EcVgfERi3pa3bddoaQvnjIRvFdK80K7jrtX8Fau+FiMlDGCstKUV0Suz8lSYTv1f
 CIQfuOtVdwXdPKh+4G8QF5imNQ1hJe1I6ayDDjAAWaOhcnt3SgBI9/hNAtkVoQ4I
 RDDhV6HZ7C0GF7LgTSldz+6J28/1Z3n3/A42WrdQL3kpIHyGnmw9yE7m0/0A8Y+5
 9KBujGKvtbXAYLDdQjmD+53dhWXG7b0HXzCclOIEAueQN6z9dODF94bZ5yavGu4U
 eYCnyRCgtgW5K+eZt33Y6n+7cHEJ5fivsRVQluuH1WSIiqe4NwqF/fL5d547uCC9
 klBZgA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0h9qv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 15:28:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2bd15c00a1fso19988395ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778686082; x=1779290882;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
 b=dGP1CDLWUsAB8Z9wCK3MEGM2VVei/lozT+j82NtCXJAc8srUjjOVvhu4ggIICtavV2
 EJ/FtMyOtAKXIyjEJyzQmS+XUzmc6CIbQhXu4w0qOwAl9UMVXWwGtcJfyKiTiuxrTluN
 nHeXNUZVdJxUvmz2NmYMzAMvZHmcgqosmTgBqzeMQc2kb+B3Ai79LZyMFmPRnUpLGCQ6
 WfVygyIt2X7AgejG3jw6pFzu5M+IF7C+1N4/tBNqoxyU1OYe66/uBR60Q29sKNEcbl+v
 ObRCaBRcYZmTYOLxRbmznzTWzT+m9Nx170tXCk9hBJHt5eNCKfe9TmdIHwYPXFd+efL5
 0VZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778686082; x=1779290882;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
 b=owUc2ftoq0/brT7Bd/vF77qaP2j62840POGuDUgxQF2erKqZ24PLs8o6E/LBrtAVhl
 O6zdnqH2oy83R/c5lsGrdL2r0RtDgZFDlGi8bjbaiG/uxTiVq9pSOgcLLc5LL005H2s1
 rqlvoG6GSMjLNnQseK/qGcSIyLSdk16UnydqzGvfmyLA8A2XSuizmFyBm4ZE79tbHus2
 IWZ7EkuiFwekp6y/Ro077UFEZ2O+c9qpSfMSvIicC1EEm+/+r4g8ZDwLbWX1JrnapIk0
 uRJ+/cigxdPX/lSxLYjW9YwORqrsSNNHlGz4WVxPO8CIJIApFVuji1S5mFNigbDCdnAU
 8Hqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8U1pQb1aZeS9DTR7g806iaCifOJK09QljPNsAJ1GoCzw8iwNnfCqhdM9hyVGJAGLw22gRrS5gGf5QEZg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9zhZPS79t314SYS2sIVga5b1JjeoFC6GzNmroIMrLC9ys0Zhk
 dDKhS7SIgAoeaR60EDEH0KvpwZqStPc27qDsutGlHawf+dUrhopvdrIt7G8UioT03hnrnCeeyql
 /nItZF/mlBfJeY3jHjPBzICkYtgcnvVCb5OeJjW3T5qyb6e9vpB6lPFx78j25MvsnJom745UGzk
 Y6aQa+Jgk=
X-Gm-Gg: Acq92OGQMIRJjZdXvYmDQxzEDGW1B9EYfJI+5FMn9pe7ap/EQBdtmFdL6CJdhLMesxU
 QIPgihKAswpILIgpLursd4x+lezL9xpZViVxI7g6Z4skArW2bhyErre8DE/4yNUldHmoPp8giQx
 mSJjv2ORIsViNUu2ZRPyDPMnWGyrkVn8soTDzVE+cFqbIdTWTvBtWj8DWOkQyeVhcenBp51GJx7
 S9VXfaWNgKbIJgfdTdYSLtGPwF1emFkfhbhFBkLTDVKcZvvhEG5Q3YrlogmjvIBiDBHdvqy8Rx6
 SPed+BxWQhnp7mlfsoKColJvE1R6rhA65wLSEp1aFBvDqtqH3frCsf0sctL7K/Ulu3Ynmmavua8
 a2Gh/L/6Ro1k8KiFnBlF+CBUIkoevJo5x/XOGY7G72nchZA==
X-Received: by 2002:a17:903:1786:b0:2b0:506b:e6f8 with SMTP id
 d9443c01a7336-2bd526ce854mr48275ad.5.1778686082014; 
 Wed, 13 May 2026 08:28:02 -0700 (PDT)
X-Received: by 2002:a17:903:1786:b0:2b0:506b:e6f8 with SMTP id
 d9443c01a7336-2bd526ce854mr47645ad.5.1778686081455; 
 Wed, 13 May 2026 08:28:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 08:28:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:37 +0530
MIME-Version: 1.0
Message-Id: <20260513-eliza_mm_cc_v2-v4-2-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX7LShTTPaLxsI
 wL2HkI1wG3tR0QXV8TES9ckcr+Iov5WUj3BQMF8yqOYl435ZE2o+Wo9Msal5Aq0lj/W/+ZPP6Vv
 ZXqdBnFmEOPn513nEOZnKOi/8zQlpHdmayYxL4vs6NIOU+0338xnQvPZmTqfyd1Y4uE1jHO0HSX
 aP1Fsb0kblvRzsi1NY8B9PrJs9jak5VVbc1M6bHYCbnjeHYPGYm75988E3didsBE1KrZH7dzt96
 F9VSOf+Detjajtvjl8d4yLjvz7sKd6Ank+sMyzQabCR8gp1II0I2yW0yhzUiNt1px/Lf2zyfaXh
 UHsLOzlJ2TcqdBAzgCtTqI427m0tEmSc0yAY7EEzHN3hVqZRf1F9Alg/mSvlhMQiaTqy4qyrcMs
 AWnAAtVel0P+Pdjs1Q5eeyLNoa0a2wdhUho1L3byPKQW3OueTiaAn/3FsklnSW+9WRfBRkqtzfS
 hnaIzRFZ4i9J2mCx2eg==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a049883 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: vE7ihAvyxho0mhGS_JXmgSRhHsf1JQnD
X-Proofpoint-GUID: vE7ihAvyxho0mhGS_JXmgSRhHsf1JQnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 2/7] dt-bindings: clock: qcom: document the
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
X-Rspamd-Queue-Id: 5772A536161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:luca.weiss@fairphone.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.906];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,qualcomm.com:email,stormreply.com:email,stormreply.com:url,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

Add bindings documentation for the Eliza Graphics Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 52 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

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
index 0000000000000000000000000000000000000000..706e1c93240a8234dd8017ee181d19e58091fd6d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,52 @@
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
+#define GPU_CC_GPU_SMMU_VOTE_CLK				12
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				13
+#define GPU_CC_HUB_AON_CLK					14
+#define GPU_CC_HUB_CLK_SRC					15
+#define GPU_CC_HUB_CX_INT_CLK					16
+#define GPU_CC_MEMNOC_GFX_CLK					17
+#define GPU_CC_MND1X_0_GFX3D_CLK				18
+#define GPU_CC_MND1X_1_GFX3D_CLK				19
+#define GPU_CC_PLL0						20
+#define GPU_CC_PLL1						21
+#define GPU_CC_SLEEP_CLK					22
+#define GPU_CC_XO_CLK_SRC					23
+#define GPU_CC_XO_DIV_CLK_SRC					24
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
