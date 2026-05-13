Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCqaKIqJBGoxLQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 16:24:10 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDDB534FD4
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 16:24:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16CAEC8F290;
	Wed, 13 May 2026 14:24:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87699C8F291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 14:24:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64DA0sGc2321437
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 13 May 2026 14:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=; b=JmUl7uW1J5WFqGSX
 6F3nvyG9fAV3nWnhsroFhEN66SRZt/4N1PuJC85Ju8bMOAn3dQNcvhaJk3qkGDKK
 TS/D24r78CfTndlo7pqmSy0uP4xXuAfGRFv1ouh0Bs9NuNj77NPlSYjxyvAIS+Bj
 RvoCXzCW1i/YRpKATkw+gzu7VJKDnJdQvBx6Nb9iuKpaCJSToMn2OAKO9qevfkFo
 MAj5B0wYpu/sbtkMDhKOUsIL5Yw7phm5/KH3BFMqLckAASVfyAezgB/FVBr+mfiL
 CSVzJ/HBxLTGOxdAT5USJ852rb1u9yzz7SHZp/3BPlaiMriiZaTKDx0pGugTglvV
 IKM1jQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguad23-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 14:24:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2b9fe2d6793so123853105ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778682246; x=1779287046;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=;
 b=QeOhI+wPIYTFpkNWr/I+pCI1osLrSKV8sHOGo+3IhijSGQ9S202kJDHMAaghopYeQn
 +W+Zbahf74TfipgFngnAFuZXAZuaZ2K9HJySg77+wNb87KZzuhkAJMWJRFWR8MSxKGlL
 sbawj3tV8lmAYUOz1HrxN6WyqjwmW344YOJHU3axcZlBR/429ek4wgBlkUxyJ1qiDr+k
 nLmzcIx/Iqd4vmf2ezp0bNvfCs1Hp+THfdNK+G2oMGDCTIkiAgV2j0LEA+gGazm22kdg
 6I+g8mfRP3XdBUn4q0ajzQJXulAiflnbs/pHwCqo6fwtplgJbQnZNWUBJkSaZCcZ2aOM
 bJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778682246; x=1779287046;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=;
 b=LJ2l6HxcDh9r3TatTCllsHiwPpIepg+OI7BimiS82uE/uJo5Eq0Xl3x6kqJ+0rD1Dt
 /lt/pPTaIgROPofJv10R4nvVDZdFCw7JMtd6s1JU+JVQnKjusIzH/sXeAkiGcM9Kwvqe
 S6hboy9nVTGH0J9m6l/QlZGfW1w/8/oV+f7h9+KGjj91CMBuWFh3DqXY/jolItAhX0PP
 cMw1Ngz/JlncMcqPKY2Hq/yPC5KiBOPh+Xo89wdrOsHU5pkJ998qtvgmXDqg11w4wQKL
 L1xjUX4IhOT3jcIPRDQgkpluuCeubl4FHkQw6ExaH+hZ2woYHS/e+Uf7sqsexyhs3C1q
 gseg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9uVWkrkj6wwfNErH6IvRqIet6UIckmddka+08ApEFYEn+9nvtpkbhdsMpBzWEwxyhpApkWoDtKA+L08w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxWZdRYEYfJytJziqj+73PI5sf0rEGoeW3ljGOwtwpclrKI6VbV
 ScXISRCXGzHk7ERjLkKWXEq6+LKTPhcsKJSFNvUGTZNyEh4pZ8tdylstTi1sj4g0wdjCiEQcDyE
 NUI3PuRLirhbRuzvyURIwLxdNV/tWKrLGmilmb2/Cx2eHYoSjE5N1+HBHtL/XFoLEyDbo+RFFau
 sV6SU+ih4=
X-Gm-Gg: Acq92OGiN6LbWR2Dk29UW4wLa+vkAY1Ci/0Z53HjV9/wZPTUVPnVrXL4TdmTxi4DRst
 WzJJj278d54JLk+e1GV7TulPcLcSKK0nxY47807puZZLvlWG3PtEZZnz0uSURtucS13BfjJMQLo
 sCzvPrCiFw2Glq1JboYncLzE4aqOJYNU+P7x8RZKTdE4E8Eog9FBhqPewEjDp9vRy2xGlsEh4sI
 Rl205UbfEUsBXfVzVSfD9e5U66uiGewoMNQo6xyGaBy+eiXRrF64n191LqFa3hCoagKL6Qpy7AN
 0e0UXaP8xIhWsnV5Z/GmpUDMFQbMfp9mTnolBGPc3c0AY2SUCzXuXtUMx6DyuYIz0PrKaHmXLhM
 BvinAAvoe+qrWzQZL/vIBld+KGHpwQYkpTBqzgWcl7vbKrw==
X-Received: by 2002:a17:902:f650:b0:2b2:4d36:7aa with SMTP id
 d9443c01a7336-2bd2772e10cmr39657455ad.35.1778682246223; 
 Wed, 13 May 2026 07:24:06 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2b2:4d36:7aa with SMTP id
 d9443c01a7336-2bd2772e10cmr39656995ad.35.1778682245716; 
 Wed, 13 May 2026 07:24:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 07:24:05 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:12 +0530
MIME-Version: 1.0
Message-Id: <20260513-eliza_mm_cc_v2-v3-7-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a048986 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VHfLmW6ThCf22OJDftsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: B_Laj6ksV0fxLLdCXEplpW9qxhiXu0CX
X-Proofpoint-ORIG-GUID: B_Laj6ksV0fxLLdCXEplpW9qxhiXu0CX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfXwZsc7IPKDerM
 3IsLJZ/d/QEIBruLa8iTK837wq9SKkc3iU0MEgQPUc53mIJPyJdS8mYM2MDoet7ISLfQ7fiecaI
 gANWYbuBC4cRXm7RI1BSL1s3zp+LqwXPR5vCaiQEH371x9Ov0Sg2uSfVK59aGe8SoMHDSf7mm8F
 APJzH3fetOUVHpZF3wCaCBM53+bLHLtmLbIVsJ2B6F0kUAOLsX4i9dOYCB9Llc/UBsJkvOIr8n3
 p44YntELfy8c0GSWTKKxh7UFi9hpXAAq6a+Xz64qnRblwgZHkiDmN7kegSgS7VF8XEtoHrYqPQp
 CrjOFq3l/2X47chFmX3OIDdh0bglw0QPT98cc+7WimMMTFXHGFZ0kJc3Hns0kaMBwMK0W8Xs9jS
 JtM7jB3nzIvTs4gFGQqg1bQe/KsFxwrIp/COLwYrfeuIrkp7vnP3ir1jug5Jle4+RunO3elgnG2
 Truu/k4iEo81audgWGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130147
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 7/7] arm64: dts: qcom: eliza: Add support
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
X-Rspamd-Queue-Id: 4DDDB534FD4
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
	NEURAL_HAM(-0.00)[-0.882];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..07c871c1d4b0b22ccccd7753e8b7af26811c6956 100644
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
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&sleep_clk>;
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
+				 <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&sleep_clk>;
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
