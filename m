Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHmxDqgoFGrfKAcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 12:47:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C03105C961B
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 12:47:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A45FC5A4C5;
	Mon, 25 May 2026 10:47:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5791C5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 10:47:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64P5ZKDt2460030
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 25 May 2026 10:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=; b=YPCBmmv1j1oD2Rzs
 9KFYS60zUJ+4ap74UyWpRcQKuJtpnlXowA94aQIzNm7BXU0KpLlcZekyszuEGenN
 +aHtYHyXffKyjOSsOXX3kLtgsaGCJfBdT7pM/SQjy0bZkDuHRVli2VuPhubJSlp1
 0ugp5ZkSdHQBHWQxvdvuUSp2tLL0WzAmD5ib4csuQg0rZt7Y5uyzZAVcKiLe+C+v
 ieBG/l0GOXPLPw/ad1icgL/ZBUtSugp2Q/7oJQLn3c0KDQQBXUaR7GABUZ2BC1pj
 T7O+YyuTBy3Ah47U9QR+M/gUmaaaU5RuCELfRbxogxTCeIQVjk3UKozVa8pzhOXH
 7Yqkwg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmpq73-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 10:47:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ba268cb5e6so99695265ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779706020; x=1780310820;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=;
 b=AWKlxNTwyuHIz1nB2K6XvMfyOrbEnru78d92oOIs3FXGxIFGPKEJrFKRprG80AQS2b
 ptBcDEs/uaNde0/adh+C9hPWkT52GQmPVrdnT5juECFeauFQocwgVSXgOnQ5riKGtjtw
 nw45uaVHPbZpslA9u1DlQrRhjpGhMPNsKhtKA2czSOPOynp4HquisdIbnGqSJb0uym7k
 xWBhuUkxUup2RnHhoBjNjhy+8CePjVFQw0bLp9Xm0twmC0O8ER1QguYvjiNzNh3BaCwD
 ULTC/J0KS03Yf1GKSEZFFYMIxKcKA1zdKyPVrLxY0pNQS8fV+MCQcjJfasfZsv0PRbLL
 cTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779706020; x=1780310820;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=;
 b=jV1ifplRfua+9NJkNxmgYSqiM5NPJ5zQfbmkC/zIVcyHTJcbk1msnyrXFwZtwX68GT
 2uTT7cYVUF5zKrEgeshHbaZRGW4QTj7jaG0+0/s9ngKXUxYT14iOjuMKEpIf3ZoWV7Z/
 VhVhRX0CY8NEfjUTUesz3E1k9C2SaRwzIJ9dkGUI5sJIyIjSrbjOKyN7Hox0DYpE/3Ne
 pe+B89u1i7hW0KWIjBHv5Awld97fcW3kZ4x8R+IulhlNTOvRJioL1BSsq3FcLPDeXBhE
 vMRB2Nthi8yGjLlnvABTm86UugHZQ3yZ1JT1FnwEMhSYS6AAJ0zW29gIrZJWznc4X7DB
 O9Dg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8XovrphW1xt5NXIx7Ua7T5q5dQckC97hec+MFZDFnc7kSAqfj8zUNCXVk8jOwifTqvy62ar+hqQ3Jx9g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzHSB8oufg1wlSGxjuAxcncVgPC1rQ77q9lUEExOSghKzXGEs4r
 fPXzkrBp9+8EekKUegp3+0DMd1OT9cpEwpHHuvRZ2zUvX/J1UJ1vRmyUJy2SqiDoqGHvEhw1Yl7
 8DCj9KQ2yLXazY/XO9Ut9cVPko3WF4UEZSgMG/nV5JDHWzY8QIB6Xql5zvYwoQzF4WK+soT23nr
 NqtNzPTzkQdRvLXCI=
X-Gm-Gg: Acq92OGclDkht3+Er6pRL/EE+OOHrM6j8BS808CSJCptZ++uivpjPaFFkeYmcV4u5tL
 L56Ecv6QMhSpWeindLvCrm1QXVbW5w+3YzmMS0hiAIKDGiqVxbkIbCJitFdZywMpFRlA8RLu797
 DbQQafBuD+a0HFheVPWRR6RYz/4IPSsH9ssMWGEm2VThrwwn4zkCqbdkK2v7d0iXW/dRK79v4WA
 MwJ6hUk5Eu0lu7RGzCTnq2/7tvV3eAFrlpLkSoYXzZE8FdUyj+8CbO2ektFFu1EqOh9a82vn+Re
 OQLzmUKKot5md4KkycSv/bw6iHpdXQQfzsF8KUPYRKyy+vB1yxMmC5hsdWYmSitxbdHGQErL3as
 cf1LqH5aUclMcPAII6+RiRVJmhlEwJQvMSRsB2EKJgkWcFA==
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id
 d9443c01a7336-2beb037a5ebmr150819525ad.17.1779706020575; 
 Mon, 25 May 2026 03:47:00 -0700 (PDT)
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id
 d9443c01a7336-2beb037a5ebmr150819125ad.17.1779706020078; 
 Mon, 25 May 2026 03:47:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 03:46:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:09 +0530
MIME-Version: 1.0
Message-Id: <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX8QJopgpDp78v
 v60vjp5N2NJL7o5Gl42ufANoZ9xOfLH4q/3Sx4eCN72PXwVM4pDLEhTS56ByRutdpbQuK7sPgh1
 +iV4tPPh8VgTxWd/JPMszRfX0yMdTdbT0HBHs02xFfyW9n9y+8aSb7VAW9qMwKocQV8pcGKz4CW
 YqB8GdEbaPvIXg5+KaFk7WQ5RJSNmWiF3uE/PIzeof44bXh4UmIZ8EYEl6NE3Fm9FdnFNp7jsO1
 6+c8tzPpPLOx7RJeGzAeSOJHqGW4lQhzg2ZFsBo9k2qrso9lMhOBrm9f6RgSfdCwOsvkpW/vYSq
 e75Ng7sN4nchQoDI0I704dYZQ24O8adKDSxQSJ+Ff/j+ovWIOkKXt5KV4S6hDziC7hoYimzyEED
 rIZ37vuIQV+f261LkT7/XaBB9WetEqXHYvOP61NQ+I3yTXYTNGJv14mKz24dwSCRFutBllsMQZR
 4jX9jBhBXILbtx2wt0Q==
X-Proofpoint-ORIG-GUID: UbBfK4W3fx4lTeKl1WgSS8rO1vOEPqiW
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a1428a5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: UbBfK4W3fx4lTeKl1WgSS8rO1vOEPqiW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 7/7] arm64: dts: qcom: eliza: Add support
 for MM clock controllers
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
	NEURAL_HAM(-0.00)[-0.682];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C03105C961B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..88673e7b2a5f0b38675aea517daceed9c3f9a386 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3,8 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -709,6 +713,19 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +879,23 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +917,33 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
