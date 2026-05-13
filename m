Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ0UF6qYBGpiLwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 17:28:42 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F329A5361C4
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 17:28:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A510EC8F292;
	Wed, 13 May 2026 15:28:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B46DDC8F290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 15:28:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64DASJBg2321285
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 13 May 2026 15:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=; b=NugxWcVnbPC0SIzn
 jD5buxOhkIkG+XVwRsLyXqay5wcrGanDz85Q6clFz0r82jB+Wphm9XU9CbqvUJ8R
 ejeqQKBmbdZ2hmq1qu+X4yMjce0bsYYG/rq7BCPftggA47GnmyYtefj33/gdOb7B
 stbxsiagNbESjC9tq2udMGWmZEKqtuxwXwewIkzd1kEl3CqqIHLkHJ4uRzZa9xax
 nDU1miCehQv66Zmts+T1YdaaJp3N5CkveTe55KjyvGa6buhpDp+KyQFl4pNfdm3l
 TFzHkdgr6bZTyMx4HavY7fwqWmaSRwOwJ7JffNAClPfUjqOUewkTWJRTMps4ksRs
 sYeBuA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguapx4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 15:28:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c81086bf930so4879208a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778686118; x=1779290918;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=;
 b=Cf/NGjRj1D+6u+5LuBUzJAYx5t16f1SGCthc1Uok6jjlQ5ivw/YTlLWDAh2lz5WqY/
 MCr5p01qAO/x/tzMArRdjmtVw3tpgMTJO4W89n+9//Sy4Qhlr9yVoKefEiTOZKJBegcX
 S9YQtuBk80yVwT+R3Ssdowh76xutIiX7FUVZ9w0yJ8kJL4xGXz8H7k5K77kOhn9cXbd3
 JgypOZEFokhI+Kt3Sb7Xm94XK2WdvMDFgEFUuwQmJDBvQIwbcZDGAtnDWh4vchhKeSVT
 rCtRcq3onxSmr19niZrlw2EeG1vSyc9EZj6ayiIT6XYzAhKtcjWrtqGOtHQeRlVAmrar
 bV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778686118; x=1779290918;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=;
 b=Eapx71wpuQKaKicJ+Iu+BeLw4Tx0pUivZgvQ1VVnc0tZSmheiPyvZcS2PupbHq9JGF
 rUkMTkGg2zDuqbGHOtJfAoor74RWyCmABxqjTT1iH0kFeQtuVDfFL8L0uUul0Qmr0OX9
 tcG1gTp8ZZThwyWZfzVyE68S3I4GeJduOxF5XjdgOBh4SIhl4n+2y2IAiX2zhVAD3IQ1
 aB9hx+hrXVgRmYJazlLuEB5+AbB3d9aRpClnD10MqVwQqjCN8jzMYY4Ckq6r6jd52hh0
 071eGNK+ULZOl0wRilWihFX6BkMRd5qN50TszAICPPIn82QnS/H+XDg8dTqP55F4Omtj
 kheg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/u//XPr3PezIIZIRfAj4rCA13QXLUe8WzQTMHopCpgQ2TPa4TWBFWV17UAtSkzlDUprziwkqm0WZTi0Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkyIYiLF6eNxsvgo2MbuAS68ysK/kmy9rohLHrP9+00uSzK7Nc
 rxewM/wBUPpCEBjZtXqPsrbwQE2Fh/yeb03/Sf4+kBf5SW6gnxZypj6ON7tCkIKZQUsj5Zf+OcB
 VeuLzLurUetgoYI2NIrjeO6SOv8UksS8mBNCEpTQg+J+Cppq+WP6StpWGb56FciCg9oxXfHH2Xz
 nGMEHucwM=
X-Gm-Gg: Acq92OHwROOI9puRLhsVfFiuK/fZs30PPPJSCkXwXKUNr/21G+ejNTUbE80vDUU0bds
 EyQ6VjCzdAnaDyf4doQSwpw6npaT9ONExNtLm6oIzmyvmplSD7GzkB4JGLSPPeWKG0h+EHf4su6
 0o9VAS4S2eUQepbLpZkK+DzUrZiIk6UU6JqlIieQgsHdMD0uqnwaj8SwTLuSZmvCJa2hVI9pWYn
 37DIv562Lwd+rg4Jqk/4/6k3JCkalR41dkV49EO1PMfZRpO55DmmhqRFSlwJGbPt1fsPwiOuyL7
 RqTeumUZVjpZgGAfMZTScTofrUPF0Xn/3u/zUxD0zinqDjK0rOajlniPef3zeR6gTygjM96Kyjr
 I/ZC5aZZN6+Xenv+FtZu1UZMLrslh6R3+idat1Z5aZ+1K9Q==
X-Received: by 2002:a17:903:1b6c:b0:2b9:6cde:c34b with SMTP id
 d9443c01a7336-2bcfd379c0amr80738085ad.15.1778686118401; 
 Wed, 13 May 2026 08:28:38 -0700 (PDT)
X-Received: by 2002:a17:903:1b6c:b0:2b9:6cde:c34b with SMTP id
 d9443c01a7336-2bcfd379c0amr80737665ad.15.1778686117892; 
 Wed, 13 May 2026 08:28:37 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 08:28:37 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:42 +0530
MIME-Version: 1.0
Message-Id: <20260513-eliza_mm_cc_v2-v4-7-e61b5434e8d9@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a0498a7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VHfLmW6ThCf22OJDftsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Z6BoHQqxogSPQfwpRSQstKjKwinjottY
X-Proofpoint-ORIG-GUID: Z6BoHQqxogSPQfwpRSQstKjKwinjottY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX+9V/x6AXn/0O
 tBAX3UA+GOVB2IOitw0+REe6QkEZcACnSQZYgGaF/zBhGYaMkWUzP7rUKheoICYrgVw4Gd0ay6D
 IukR4ntGFl/HMAr1KlSjCZCzdSwH7GT54rFBeHoePfadeOdckzWDXOvYnthkwU1EXN3XzriRN2Z
 0ZELSWifHpr0qds+ai+AZKPR7rgTLUzmAIcs4VpJLkXHnzaRkR9v81nSwaPLxd7GhUHuOMK+VFO
 Ufmmj9Uvei0jSchpwbZUtSvUGUgsOjzeHZiGK3loy6Hc5WuC/tjw8u9HmM/Uox8K2cIACPeFqI5
 +xfy8yJD9hmccr1jaMPGq5LfI8D5AfBbIOhxxu8s3PuxOjOv82yW/kq1tbL5taMsE7phsnEK7Sl
 x308P2CDIfp+91w/zTARoMFf902cQHdR1OzeHOwl319PMppsVwhMIOmwxqIYhQ1+G0e1PtoGYlV
 PbGAWXWSrtJTajFcC0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130158
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 7/7] arm64: dts: qcom: eliza: Add support
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
X-Rspamd-Queue-Id: F329A5361C4
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
	NEURAL_HAM(-0.00)[-0.873];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..1a47eb2a865717dde3fa0ff82665eecc8ffb87e2 100644
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
@@ -709,6 +713,18 @@ aggre2_noc: interconnect@1700000 {
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
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +878,23 @@ tcsr: clock-controller@1fbf000 {
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
@@ -883,6 +916,32 @@ lpass_lpicx_noc: interconnect@7420000 {
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
