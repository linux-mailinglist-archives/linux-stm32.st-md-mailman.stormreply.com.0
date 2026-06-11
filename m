Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U4WNAZIAK2ok1AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:38:10 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B205B6747ED
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:38:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b="cBpGu/iP";
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=VTWu4mBd;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79413C9AE37;
	Thu, 11 Jun 2026 18:38:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15932C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:38:07 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BIQTT11401906
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Jun 2026 18:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +PfK1pXGOj99PCCrizdBT7nW7VolhzI0bx1MqJ3nKuI=; b=cBpGu/iPMSDZKQOl
 I5yfmD+8S+to6BxfjOiuV4YTmtdFJ7WvR/SCXLrtdtLP9jGZjVze1Ehak6Xx5aXl
 3HOBGEDSrTh8Z6+drm5ZVXIEKEbUZKUsyo0jK91tcETK+7rwtdZfHrrd0/SBCGni
 opcc7i3VHsI8lizD37fGci9frCWoWEfWA0o/3+X7VWw6baMty+3WhNzav6Okimh2
 TwLDkXDK73cbuGVhK5pBlAZMuB1FzcYTy+ghkPhISzHJoc4DNQmb0CJ2P6MH52zI
 gmBFBFV6BQpOTMu7oE81ilABEnIqUu0d+BRIj07spNrqxtdq5lGBL++bf9n91lOK
 Mwpw2w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd0ghr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:38:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-8421f5d76aaso138968b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 11:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781203086; x=1781807886;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+PfK1pXGOj99PCCrizdBT7nW7VolhzI0bx1MqJ3nKuI=;
 b=VTWu4mBd/e8agneYiz3mK+Au3hAiHoiFPqZfPAPkFur48LevgMcyYFtJID6XGNcog9
 yB2uiFxAq0g+eG1kZ9ePzrxrTFkbTMYyzXUeyObIm7//l+HytfWJZEnZAImM9W2cbySM
 4Nzc5yMCsbhdfWXmKfvEW/Hcn72C5x/r2Lk9iZIeSLOWCT01u7Gaz1E5MllZMBOcPk0s
 3ZJLFzRz1pAmiR09YRaCxyh6nwBXRQXbDJYiNzfuYZLEdcB/jcLLn5oQI1Ey4eVMSd+p
 BBSzJ3YjBRyFrFTQjArOL77PtZ/VuIEg53jdyf8QnTVaBW0lOc0PJbjMOHjieLT4d9Zz
 7ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781203086; x=1781807886;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+PfK1pXGOj99PCCrizdBT7nW7VolhzI0bx1MqJ3nKuI=;
 b=q4CmMdmOnXPGZ/XXZx83vSHRdfp/wugHNZCXW4Oiecf3jfblASTIg3+NPO6g4XC/8N
 IVZgE5AK6CvTuVhWzvt3kI724hLWd07AmCYCOOx+tQ6aGd0EJ2IYcAmQygPB5xMRhjYD
 XBLuObknxQsEwT7BvF3XP8ReyhOXRmTxYkwKasqMcDw1cAq0utWJv+OuE/P8e4Q+efnS
 qJRaVgsrU2C7j4Sx6iM302fT1WoIDeMZ0Kqhy3ANkuZOiJTsWgsy+XbqwqZ4iPYICEv0
 4MI/S4tqG/xxLfO1e809x/kblQT+USz15wk+x9jQXOZI8WcawSYc2b8m5rtU3aCaMIow
 qoIA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8t/PtFgL8wjRmW/XIaX+moIS0yLrh9cEVxx+wvAaO2KLllPRH4IVpZBJiQxo7+0oNpkmxTiwWDEPAx7g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzh2GIR/OEH/1w8AEGWj+WrEEANcowQvKeWczKqevt7DQUyXVN9
 lLw4o8Oex8JrDk+WRtmW2kXBo+CJYhQ/1BOU/iAKz4x3oJHCeGbNedzgOvAteVN4XK5w7nJoBfy
 Z9UWKhW0LTp22+BMrxktdaDjRYEOjDJet6UiBCRKtyB/3vX78cb14MoEBtLShBPy2QvR/HO/B9/
 2K2gNsPnLDpCqsHgEAfQ==
X-Gm-Gg: Acq92OEJOcZgvevE02XNwyLXzUhQNlX6j9YyuT+1LuK4iypn9s6IXtLdHQCz/VQafyo
 oXEuSosUpkcO5zIce1Q3b1x+Q3FFacNyiQr7NHDO3a01Hc0xxttdLKotqSlfHg7sh3rGgQtDznL
 W1bODQHIGTKXrEQV9+xLiZC/NwN8RvDmPTEhmelFmrWKONGpdLza7/pLdMy16H9YRYgL5AWYKUu
 9CS7Fnwaze7igVj9rncwcADRNN05Y7D7pbGW8mUSWpkrU45Rh/ufbCldGLNa8a3uaXTmxDk5Z3k
 8nBsT+jbgMG58WN7SbFCfF65EzhPdoEp1Uc6soUoDDODuxd8yjd1A9x1safrmsjh6fvQ71Sv1UB
 ioNFpGsU0fVhe4vcnDCKiP636xYNTprb6znxuJdULDcWI2gd/vbA=
X-Received: by 2002:a05:6a00:9086:b0:842:6a3b:60c9 with SMTP id
 d2e1a72fcca58-84336a9d215mr4674331b3a.24.1781203085814; 
 Thu, 11 Jun 2026 11:38:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:9086:b0:842:6a3b:60c9 with SMTP id
 d2e1a72fcca58-84336a9d215mr4674302b3a.24.1781203085349; 
 Thu, 11 Jun 2026 11:38:05 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 11:38:05 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:04 +0530
MIME-Version: 1.0
Message-Id: <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3540;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=YOkOPlGx5N4cYnsDHHVcCPeF3FpDW33P72uZWcaYh6E=;
 b=ApzXY5wzC5GwOGHJ+Bi+P1WJlfEbrlFV8OvAOFu0dF8rKEc0eqdqInIl5UvOofMKR+Ozi7EGS
 aXR9zT6D7iBBRAsftI1F8xeifG1vaXy210OTMjSl43TEtFmVWFUgKk6
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: D6ZUBTu07TM0_hOS9e6yQhrBRj-K3QUK
X-Proofpoint-GUID: D6ZUBTu07TM0_hOS9e6yQhrBRj-K3QUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NyBTYWx0ZWRfX4ejmrV171+sk
 nJ+HFtaZnwL62L8CXgRrhbZipe7hlUmRio7TAp/rw/5rthPUnwMtFxpRCPLdAIW+YFHLP6qmCna
 GIz/IXgGc2vj1ZuHznrfw03xK/rsG+dr8D1Oadn8yrtfsHbQmEjUoI/bU5Kunc2FCqvQPjzlM9Y
 FNE4FIJXcdYQmYRvsZzQOlXVO26C+vfpNCFawg6AVbd5943v+E+s+WVNXjCFPdbue1gSNuUuuY6
 vISfC/PtTcPWSQTuNkfRNXj0rH6ZfS3Oia7h5QkF/fJ+0GpRqZY5gBAhoMdV+9MLy/9SA0uEUZi
 TYqa1xzLZOO5vWYV6FQ7cvwcB9Jei2S8pyMihuDspk88Z7Xnv/vvEYMFAC3i9vLY6QO2b0cf+Bb
 VUEnxPSWu6b/vyMvhrzFCQoMsr3Sdp2t9qYEDWPu2dyMpMh6etFHNIpan8aKOxvs99XPXyH4HFA
 u9aE3aJF/HpLpTujyBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NyBTYWx0ZWRfX2ZgdtxB33QjA
 ONEpveI3tyrTNDyrd1kaH564ZjdxLTTBPLgVjYy9uRUlb0chsSqBtNzYuVqSFjLcFQCZJSQWAIE
 gZegCsjTDx3qf8nunsUqqN/VbOs2O00=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2b008e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=flSr5DCihV0d4yMzew8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110187
Cc: devicetree@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk:
	Enable ethernet0
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
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:devicetree@vger.kernel.org,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B205B6747ED

Enable the first Gigabit Ethernet controller.  The board layout is
identical to the CQM EVK.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 119 ++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819e46bbc9ffa3dddc6fee6530a4a7a..1f2e4f6dd7cca436f62ba9f09cd328e5a2079095 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/net/ti-dp83867.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
@@ -60,6 +61,92 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&ethernet0 {
+	status = "okay";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet0_defaults>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <7>;
+			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -95,6 +182,38 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	ethernet0_defaults: ethernet0-defaults-state {
+		rgmii-rx-pins {
+			pins = "gpio121", "gpio122", "gpio123",
+			       "gpio124", "gpio125", "gpio126";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <16>;
+		};
+		rgmii-tx-pins {
+			pins = "gpio127", "gpio128", "gpio129",
+			       "gpio130", "gpio131", "gpio132";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+		rgmii-mdio-pins {
+			pins = "gpio133", "gpio134";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	emac0_phy_en_hog: emac0-phy-en-hog {
+		gpio-hog;
+		gpios = <149 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "emac0-phy-en";
+	};
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
