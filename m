Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ugHAAmErKGri/QIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 17:04:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C0C6617E3
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 17:04:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=ljIyuDQk;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=kTwn2ltO;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F677C8F292;
	Tue,  9 Jun 2026 15:04:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31CDFC8F294
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2026 15:03:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659CmmIf2700902
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 9 Jun 2026 15:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=; b=ljIyuDQk9FzaHl6O
 K7gOjQJNj8g4pkgmE2oy+jqjEeOF0kZt1kA7vjugP+XWDux6tWhxK6opWPLIHSDn
 8RPotDBHnJb5W7qNQo6AhyajCSqfcVRB0rweuVrqWE2hDtMUKSCq2LojZ69k8dxW
 PrTVbzlHgs9LD+JAiymYgliKxm1sDkj1VtIQx0yAqgpy1EyIEm8//CF+mwGVdeGC
 C9j4zEuGr4tJT2eYcL1aQhN8rOmDf6+p3hFFqkOovLVB67Pvmj84i4RPUi0oXaKw
 7+BQE+2PagrtuI8nwmPh756efZaRMTiBUKxBDKkvcrMzr1jzyLLSUJj3FaW4JQ9R
 rg0BoA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeat36y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2026 15:03:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-36e09ec696aso9666580a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2026 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781017437; x=1781622237;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=;
 b=kTwn2ltOjz/0SP0XeIumZJWMOYZUVv4k2RX3uPj9/uS7IV7cbKgcXohKe92OVSuDR3
 E7WObGkPP1kUG0EnxZjLB1T9gJnwDXIv2CT+2zidLMNhvZIajpLMb1Ahgw1hePxyMf3r
 dpipPMiMAkiwCLTs0usbx+27HvJLS6iChQmb1zMjHc6pNVgbdKUrFpgNv3HfFiwP7faK
 VuqOvWoUvaQSV71KDNnJhxv7wr3+NlJ9kQvyTTogmj60Q6kBbemVoA+Esnmid/UYKSv3
 9kOnJ3slvPN7ZL88wbo/DVk/YrUnzrJyNFqpA0E9IoHwxLN6G0ku3WlgZl0HE9xGYJxH
 NzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781017437; x=1781622237;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=;
 b=XhtC9OrW5ulA8s1wmUFkx9Gf5cYdMksW0uXWkosWqEydiXot+b0BDLCr8QQ6IM+1gd
 d5TlFzvYMxySI5X7X+XI6FAj+IIfXv4fPPW+PGFgH/G7CzVvEP5G22yBN2ORxPzaLZK6
 CZ9eoYWALWOwUlVCA+X8/7MgfZKDCh3riWzWHKPVj00TladJ+kX5isyVqVyLG3I3nDRk
 sgTKErv4L1XoYeY8HBcTvd547cVz0xmCmDTWGWnMoVjJtSTnMuTJFcX5HkbOGVgkV7j7
 ATSHrCl61unEfC+wm3SLxCZlHO1sVQqnFVNGVDpVnhkN5ZenBo2+BiLweeoFh2nSCQH4
 rMgg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/BVtiesRhdTkVVsEhZedf8rrYZIiXkGZjEW66Uk+CIkmHbNvpsEm/zehdfQ21mfDrMTCuw9yxre8BuAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzvQdAR9ZZfkICpz4QHj/61KdCcj+n/UQwX65xE29lrV1jApWao
 a3OI6XBtLj1jSVgBfOpCxfFEi2jLYj+W/CQ3fC3bzHM36GKCWOKHBzeG6YN/fJce6YgkweIIMJj
 ow3g6pFqI/t9/k98YkcQiq3RKf+R6czRXdfsxqH2G2qFQeBn4z9cy2MgnE/qxmoXmrIbvK1AoNH
 hRoq3YKfE=
X-Gm-Gg: Acq92OHOnwFw6Urg7u2Q2TZfgFhmstrT2F6QTcGSqE6TF4Ss+aTJz3axM6OQBJAdOzp
 p1o1BWyTT/PPhde3yRclnlYhIYw/6qcHq/qIT5UFiPGINOAi47gU3POpgARrp9GFCzBcH+7ayOz
 Rzu3Wdu94hu+/rcaxeAYoxSKcVxu5IpQUiWRVnYzDjVRkwUl7uXc0+qX7yrRvTr5wALVvHiJn0u
 ZTLCJ/QsjFqH1WNgrCCqF88vpHfwRfMZs3YcgIVjV6igYWWmFCb2DOJ5970ri0gFau6iMUCyeDf
 OvE8xhUG2gxBy87b2UAiMwyaeDVV5I7A9Ai+mpvO8hB2PEoITuLpYicy9cjgGQbF/+Ah2f/lE6u
 UKByH7h+ep7i2JaL8/hjz0c9rBeW9orlgyYLMnxR+rFHFOM18bwtSLm1/
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id
 98e67ed59e1d1-370f0d4c33emr26138421a91.19.1781017436517; 
 Tue, 09 Jun 2026 08:03:56 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id
 98e67ed59e1d1-370f0d4c33emr26138338a91.19.1781017435965; 
 Tue, 09 Jun 2026 08:03:55 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 08:03:55 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:58 +0530
MIME-Version: 1.0
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: i7qPru9FHMSgZZX7OgqkhWjyKS-wTut4
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a282b5d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QpH9IB84JAnPMoRP7PIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfX46jHkhJfURQ0
 YmkpOHxgBBpa8nhZ6kFYPlmjvPQte86a+8zTtkzPPjgX1LQ7960z7qJMuekV5/leNr+uLpsaisG
 l9SH9wqOkXZnrgkfI57NXW3pZM2Pu2zYQh/V8LCiRNBd8rsSl6aiStL5g+HXMa+0rCkt6E3UPPe
 F/x3O1C9qUNpbARhfMSlNfqFkv8GnrY6fskZatAKUTBofGBpPmzY+suPdwPzVp3hYHmig+/Zdmk
 ax2GNgBfzUk+DL65wTxKFEThxkhbLbA/GiJk3ofcV/vU3AwA2tzDrKt9Fa00/lAGPwpua8vVF3O
 ZZHTCmtRt1uY/l6fVNma26uUD80oBDW9kzFTptk9P9osWuKp2hoIJ6gI9PQJu7XBzOhrHkVOeLj
 445IZ0lKgGpdCMTZ2HuFSNbUxqRO/gi6ieeG4Wg0umOWuQH5D62+RGglLdiX6ZMJUsWvRnsxuN3
 i4njKfUN3lz7qifpP4Q==
X-Proofpoint-GUID: i7qPru9FHMSgZZX7OgqkhWjyKS-wTut4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090143
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support
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
X-Rspamd-Action: no action
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
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3C0C6617E3

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e4295dba89ecb77c6df60f6f08d15..c5635f22e2a7a68fe665a5b5236901b17de6983d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1779,6 +1783,19 @@ aggre2_noc: interconnect@1700000 {
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
@@ -2657,6 +2674,50 @@ mdss_dp0_out: endpoint {
 			};
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
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
