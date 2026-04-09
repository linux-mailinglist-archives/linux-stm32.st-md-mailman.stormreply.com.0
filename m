Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePvxNevr12kbUwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 20:11:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4723CE812
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 20:11:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47066C87EC6;
	Thu,  9 Apr 2026 18:11:55 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE987C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2026 18:11:53 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 639Cep1U2866294
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 9 Apr 2026 18:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 90mdpQup8rBx7BL1jnOaOW8ntM6siN7SFRLLyNJz170=; b=XHt5epio5cFRDWxq
 HkwPdJj1EDoY160Mj5/L9CiczSF99rZy+kQQrAw/5KOLGJMJMxmvQB5rb9NkeUP1
 mIu1l0w4X5UlkSKIPzJ9RMcxtmmSLIz8Vj26Llcy1dsC0tCpIiVQK4eJzKEek8D1
 lXoaOm+y99rz1qMXEZynoelqBzg9y3+lgN2HT6yZaLd46Ess3+2Rn2Kov6PnRGrl
 Hk1nTSBqtF3A+QGY21/qXYL0rldoGSNRmweb007b74ZqAY9iZvSNVp0BoSZz4WMq
 glvdOs1wpv8npsOtMYnHilgLXtiv9xa9w/kJ/jQIrwNBio9Xksyxrdozr86dqTHQ
 TfCbXA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayha5u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 18:11:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c76c62eb15bso721514a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775758311; x=1776363111;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=90mdpQup8rBx7BL1jnOaOW8ntM6siN7SFRLLyNJz170=;
 b=gKSyxmJxmK3gPgibHVm2pWok46pXFAu1ZfTaEuPKH14OSMXchonoeWDnc6uoVJEpvf
 Y52tNK1NiOZnPbuaxpCAcOf9TxtdcbZ9uobg+fi9vceHkp07HGL2CYnpcKCbWPsnqTtj
 ZZyHKebTpbZDW3hFCaU6WRbex2bkwsdL3IEB/vZ6+kUq7gk4fgvhz+Jig6kw/g1OZ5GZ
 WOKLYBFWX5VkkRIWi5jlskMgOigdvLlFLXxdVZWt4z6/FLlCXPaL/jUc6PdQAEIs8lTt
 ziQNlv1GJJbhKktouazt3qmYo0bL89YI65wTM7oDIbFo7z+QAP5D4/Tm/wtidhnj4hz/
 bVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775758311; x=1776363111;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=90mdpQup8rBx7BL1jnOaOW8ntM6siN7SFRLLyNJz170=;
 b=lwryxppCAxSnavaA5fTe5vnaqW/NutCZqHJF3cjAt6hIMEHNg8hh9btteZ2jUHB4QP
 zR6gHdRq6eSyLS9wWg323DU3ah/QcQ9RTuUeRrppOMKAq7g5mpvR0qlzhDWLPh4JqKEX
 ZkJdEKRYz4c/dO7HkvazKvr5rw8pYikt0Wtlyrhhvdq07AZT0xt3dT64ALPdZ4LCV2jY
 ksb1XmboDIJ0POJqJ5/rL61pGTW6evyX4Z1Cy4LyMHXKd7Nnqczuegx93HJNLHc6VuZI
 PblXFTEDuqoIORx4IgB7CTEc1AIFf8eviuMksd5503ZaFWeOTtkOVQnxU/rTkuXZDcwf
 Eg5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJKf7wMSAWStUw+3F2gmkHjCf2JJ5V0GYjl4x3rR2Xd1EkhXnekjuJUVqGMAeGY9TAKzlfIOcyCB2x0A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxA4HBrpsTVyaZzjPJSXtgbpSKOlEgPIbTDi/Hx+sSPP/8t6SXD
 bTYy3GVJfbacc1ylvJtCWvXI4NrZa3a8esJdGX2zUH314b8+DxvSxQXbVbzFPGvkVsFCUdmEkl6
 Q5k1yhybDrCwRZUObuQ34aq6J1GMZKflipgjyQVt+4+z3vaWC9L0wL4CSfxBzEewNt3Eg1O1Ba/
 XM6OKpqQ4=
X-Gm-Gg: AeBDiesqFz9ZK0e2t6tUAtA+rdyxn072im0rFBPVwU2TksJef34IuYAfztwNx14cs3b
 oUK6Phj29h3LV6Nd9tK+KTYkYoPGT799vbYvY8dIgMlI8295qxVHFUokgg8eI+gjzxTlo11Xxb9
 L5qGlDd7zQMg7V26TFL9xdUyapkpa+6wlSqR/Lva3P3ZZwn4KHfD1OP46NGsOcSGxOJEULaQ4hG
 2b+ds9f7V4pV9nrGUf68YMP76K30RK21aMOaBeTx4JSC+Wnb5y+WXk309pRIIkBkVHorhzWd3uo
 DP+WM3sd4a57LQdTSaRiFcwaGTSFLvmKLY+3ObqHNtqK8b1aaA+o1tBZQABfP2P51GRf8jVGf6M
 WqjC1sj5Z018N0cIqzH/RBYf/FbPf/NE+PBa60JOE0lTBIA==
X-Received: by 2002:a05:6a20:e291:b0:39f:461f:be7e with SMTP id
 adf61e73a8af0-39fc8342976mr5438780637.44.1775758310706; 
 Thu, 09 Apr 2026 11:11:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:e291:b0:39f:461f:be7e with SMTP id
 adf61e73a8af0-39fc8342976mr5438739637.44.1775758310061; 
 Thu, 09 Apr 2026 11:11:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 11:11:49 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:49 +0530
MIME-Version: 1.0
Message-Id: <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d7ebe8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lLqgR-C0kdikbQ7S4h0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX2/0JrfpwaYhj
 9yBibgMdogwWReqS+OzmgUgclJ7RC2NEE09MaR42xDvfZgTPj1zEzQj/1Qm05mzw0mC9UgbyzQW
 lFXLITrt0X18HPoP7lVYgg2VgzD0pzxXD8p5an3W8z/c0xIKNi57mq6gDXNBRA8pGdKweUFZBBg
 zPlszD8OFaFpNUhbq8rljckNzSljbrcI+DimR1KpHgjz5b++WHgcNTqdIAueT/VHSshPON3OXyB
 Rt375lc7La1nfdEVX5JwRs+y5J0+Sj8gniZojEGV0C8UuCklykYO7JnQEDA0snJFRGf+2MB2jb7
 7RESqNG78Y8Iw1Epw3j4+3JLAznXlf8gbvJrswzWidu5eBzq/BDYSGRZLeSXNrcQsFucU5LuHF9
 InvRP5A28VbJwsitma8ARBu23Y1GQsXdidd19hIH27obILQQy8q88ZSJJ2TeWRLJfybAT5RQszB
 jvNPe10SZo5MXQbprrg==
X-Proofpoint-GUID: g3yWoFm4R_s5qF_WzbOrNAIfcacr9Neu
X-Proofpoint-ORIG-GUID: g3yWoFm4R_s5qF_WzbOrNAIfcacr9Neu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support
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
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.158];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 7E4723CE812
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..7a2a3dba86b9395743781cdf724e81733140ecd0 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -709,6 +709,18 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +874,23 @@ tcsr: clock-controller@1fbf000 {
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
@@ -883,6 +912,31 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
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
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
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
