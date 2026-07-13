Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uZglNF38VGqtiQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 16:55:25 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A43D74CA6D
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 16:55:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=hnVlKmxn;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=kRfVIvvK;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AC1ACA8E42;
	Mon, 13 Jul 2026 14:55:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F1A0C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 14:55:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DCE3qD1561386
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 13 Jul 2026 14:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=; b=hnVlKmxnXPMktPQm
 yk+j1bTsKNGPKreQoVJyWZI/ztaKVl+Ut8GfBihC5lBvInp+KDtkC2twuPxM6qXP
 KCP8vKxoAzeYtn9k8ajpbo2hYYSU7W1ZnL9pME2qWyV0SgZHoBv5obpTE9t3WJVs
 N79RNddngnMcn+/UNmdcOBZanpXOPEqZw1FsscxRGGH9gi4m9VMnErj1C0TbhJeV
 q25dyT0/VhNThOUFN8ntuYiQY92PdtrrbQxLd4EvdqETLmLAX02QUD0WonTP9Cqd
 Pq48ZODrm9HvvVB0Dr3k/2UzB778ujlRLhuQnMPt3AGekDMNpY6/D9wIcA7xCBcM
 Nmz6sw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3b47n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 14:55:21 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-6a388981e98so2501355eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783954521; x=1784559321;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
 b=kRfVIvvKGZsGdAubzgEoQhXRY/EiRy/6dELeChSkGOPqlQl3y5hTz5c9bpP8JrNUlv
 u9hXTbIDYhwdtpfRlo/neeKD12M2jkNmj0ffrpOn0chCdUUerjClHJCqUrnTbBErJLU4
 BAMEIQDQHIqLkzhQB2wMDI7vN5fV9G39/Flg+ncHRyvt4n6/wZLbYRIEzY/7PHIjW6YL
 HyyQRhuop+dr+4XQBaWGy6z+SYU3LT6gnPGLobyciHs9I8OPfZbdR3XwmUc52ERjrxEU
 U5KlOBEOX7Qy/rsy/kYx/z9wP/J0Ycw2ptmAMEEYZodIwlCm22wneO86qpKn3rwPYAL/
 3NPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783954521; x=1784559321;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
 b=EAi3h5oy930ZtfYjt97bFPQzzc3g3elFw2hovArfTPprGybRS6TVwqUivnaQZAmUui
 204qonXahQUv4VbT/O4LBXDnsjjZfcu8DAuEnMZgIjGifCRBHsT4Spd7XBaAyajBlRoB
 2PMTWdbgAMw1Nj7VNtFn/sWB7r90c97KC6CZcYogzBBWkZQ/iw8DtkfmWcFMIlyKe93C
 dI4NBx9/6PsLD7VQRGREFIX8lmZ6caVA/qBP+HvGvNA+50MLVFHuPtMClQJkjKB4jpy7
 ES5hN7XnTKaj/9ES+5KN3NnVmTs7XYOeuOXXWOCNscmmsR0Ybv0k3Gs8hn91iHKGfN7N
 DL9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/dBvbzXwtTT/geNnm0RIjmWIXo6KpIBcmXR+wAXrjHyYfyRbYGU8xBvujSy0hYgnh+IJtP2Fn8UV3Jww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyi0yoDlVM9V3O+V/zmaQn0ca0/Lo0xvtnIFJQlLSuoifgYNM80
 3Cg2+yDeHs4EVsPlRQQ8OirYsDz6SCUvD5YnacTYHkArsv4r7uGhza/q7d4h2IZnJ9/yb9Hi3Nr
 dYbSdoIM5esmyvpYKENnaY3+GQ/tac/6i8tOTNzbYh0KCXnIUjVVX77itpvcX5aZLl0w9I1+btS
 7GNYJDwC/GLiE6L9E=
X-Gm-Gg: AfdE7clXK7Cc3H11doAe4k6xZvFDAcHMl3YWiiPgilbuWT9HIoX2kJI4MlbNVwpSg+0
 nSbnP9wKg2z7aA3zog2CORa5WMkqHP3Za4i2OB5QPI/mpwCLhgadGQ3u4qsfhIalqMiiYWDifTm
 K1LdA9+5yqT/e7uE+1IqezSTARpBvlft2fenp153d0OnllApfB0y1wY8b0ZnaoTfrTR2eMgEGMK
 JuaTz8ujuK3G7lwTZXrWNYywmf5xjRX5myitLLYLBuh9k4eEzuEbIjqnZ7HNX5ooknGbGaU2gsi
 trV1iKUQy+vkA/01CM4EkVZ+TzOqR+n3Z4Caj08ra4b/Rn1SeuGMa5JMmj9E+3PRurMfZxrZVFs
 dkFfxLcJKTcPP+LJTQKU9EYSCB/dNgQJtZRc=
X-Received: by 2002:a05:6820:134a:b0:6a3:c52b:b95a with SMTP id
 006d021491bc7-6a3c52bbe58mr48667eaf.29.1783954520785; 
 Mon, 13 Jul 2026 07:55:20 -0700 (PDT)
X-Received: by 2002:a05:6820:134a:b0:6a3:c52b:b95a with SMTP id
 006d021491bc7-6a3c52bbe58mr48636eaf.29.1783954520268; 
 Mon, 13 Jul 2026 07:55:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 07:55:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:48 +0530
MIME-Version: 1.0
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-10-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX9S08X7M6NLLh
 UKAfCLba5RdSzMUzf7lyO56XVR5HuW/F6V5iFlrI6prhpdkfx1ofLtlB+Fke98micEQ0ICFI7o6
 TYX602slzwtYl5NAp2+pa7ZKbxXBrFvv5WvhyQY4/A/275oNY86b8IrA65Pqt1Xev80gIk0wCoF
 hIFi/8p+xyqNkF/0cNjYFtNgOmYvBSNTgtYo9+G2ytxYPoqaVl2yuWCjvCC8tCQJHOy/hfYJm7J
 qeOrs1IWaM021j6/6gplTAxF2xmyD71xbx3hHCirYGR5m59HK6u0RFJEHgf+NeQ17OvIh0lVKpy
 SIpBp2sGyXJT9oFzieJ1DKeoq++3QCBLKKmbmOXGPxQ65V6pIUzZlqzTvuHK8nEw+U5J8PiEHhy
 t7Utfyl3CD9J5QWi8IyS+OIZ2mQbFiThoQDj3eoO0J5GPFpg5+WFi6IGtotjt7dPCUziiCJG0Qf
 DYMqs48Ya4B0FSLu5MA==
X-Proofpoint-ORIG-GUID: _JBvKqZ7XQ1MKlDGdDmbTjISDoCPw_-S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXx0K26+Qb/ygx
 U9NU1Z1f0YwdAmcpxlCkyEKwhjc1IqId1EkLnGllRsxq3IdS8bdHi2p24UJwuzEhKDk/a0lGeLF
 RX/f4oVOcka9XeYIq6R5EFVOJf3eHd0=
X-Proofpoint-GUID: _JBvKqZ7XQ1MKlDGdDmbTjISDoCPw_-S
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54fc59 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 10/10] arm64: dts: qcom: eliza: Add support
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
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com,oss.qualcomm.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:email,stormreply.com:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A43D74CA6D

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e4295dba89ecb77c6df60f6f08d15..fed88a699fc264cc49e0bda79870a8dfb0b6c7f7 100644
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
@@ -1779,6 +1783,24 @@ aggre2_noc: interconnect@1700000 {
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
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2657,6 +2679,60 @@ mdss_dp0_out: endpoint {
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
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
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
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
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
