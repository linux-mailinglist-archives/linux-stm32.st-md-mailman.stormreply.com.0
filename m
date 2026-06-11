Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id imUhCZgAK2or1AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:38:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C63216747F0
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:38:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=oRWz4di9;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=EoVSJ2+X;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A65BC9AE37;
	Thu, 11 Jun 2026 18:38:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5C47C712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:38:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BIQHiH4027945
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Jun 2026 18:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w+qgmHOGmRapWq0OUXXvIAYW2o7E/H8TFKc0cwHnGMM=; b=oRWz4di9ND6hN99G
 G3yEcSDwzj8xLcMa0+clj4YI8Gk7xkDWKM0Mk89+CbSb6nQs5u/pDSRyQPAAPQFK
 X3daIoEpaJmwI/nTcVjWiAx9+wVF4mTUQ3CxNjoI1VKJZGwnmljsdfnvGqBPyhlF
 523w/ifj/+K2hYwTAhlGy0HOoy9xNof8zOS2Q+GbpADle0GAMLtREemKNx9zORzP
 NjzDahAeP7oJ7g2kZ4pnrSw9vJROU3o0pOchDvYQ5MgujXC+rCIOvIpe7nt/X3Sk
 Mr3IkhrRp3ck958jOz/jHD90Yrc2NsvNnXyM5jdFBYE3LDf4vGqksG0fWaIzsZBK
 r+N2Xg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014gtf7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:38:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-84233efcaadso120789b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 11:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781203092; x=1781807892;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w+qgmHOGmRapWq0OUXXvIAYW2o7E/H8TFKc0cwHnGMM=;
 b=EoVSJ2+Xzxb1YhEbVE6T3bj+1ebQmR4Id1LmQIffjm26I/CREBhz565q57GcCZu/PO
 bhv5+gGjf8bWjlzZwAb9eBCMW97tZWVqKM53MMeVmfImFal4L3h3ZtxZlEkXCcfOkXX3
 bVWoTm6a+uTeuy29bVIl2WIX64FE6NAq2TFNvQdxyz+8uF00o9S4yIL+wl0DzsO/qv1Q
 L4OUSUeSA4LwXPNdzEFGl4qnkPCkApEi8reROMm7knC0xQ3kmFUz7Y7UQ0WLNLedpxqq
 y8qk4GfvlTciVGcxSFBucGplLcD6wyUYHTvOXMcFOpxOqoZbtwXXxnJRZXvua3nnT4Fh
 6XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781203092; x=1781807892;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=w+qgmHOGmRapWq0OUXXvIAYW2o7E/H8TFKc0cwHnGMM=;
 b=WQ323mqp87cPIQjNeMKbzrcSyHzkoz0uQGnivIk8z1l8mpyRSvjeBxg8V5ymqGKvQ2
 KI5XlqIw9t6SpXP7+KzF1h7b4ztNv7XDHJvw8stZxYHlBBkWZDRPBE8DSP0SHf+ywTdZ
 3xTj+CPRkW6kC5Lg2F/YM3XI/2TrgYxvu+7XSUJ4qOARZ6dWHGa07Sb6la0tVCU5qdcL
 LI+mawsGbViMu3xzitPJtG6SWUAWUbWqsOjakxG2ktXOeiZ07CWBmr5OaSnfvLGMQkjn
 Rd4bT+gA4gL34yREJ3KVlmbUy+MeKUVHs+4i/6ndZl6VfJ8Yl4fZNDPX15ijjHNEgGwP
 E0cQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/lFKkHlGlTZrHCHgq8Fp6OPodUPQ/YFr9UBOyxy1ETBhnOTagrEPdCDBdRLsmjgGQ06YJUcA1JU7Zp1Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyk6j7NHTvkxU3/cTyetI8RdP2b4U6o4Jq18b/V3BgTfIAT88zH
 CozexXg4UcYfAllQOqmpkuEnAq0XI/UPxHMTzWHq/hG3xRCqZxBf/ayejoCjF9upNsSidR0HK1w
 3gyWmIhJLLKpnP+c810rNrNvlmEeU2wvLrWtykHenEvi3u7BENT/owXj4MYlZWFnh4rxMmfyHAC
 MdXirdKduGDKjiEuf8mw==
X-Gm-Gg: Acq92OE080K3bm5/aEMY7pAzrJKCb2r8Xac0Kg2IGt6xFEJGz79/cAoMpH32TXaS/w8
 LboCiBRWxqwuYKjoN+8RIPo6nTGXPkQZ0u0j92rNnbQcGQGThRl1SzqJWsyZiJhh4yVi+na5R9w
 ypHxnOkuAy5S64tJ7MCoT1z9P4NBGO1pLmHcKh/E7MMIps9bkImmQBGs8g4ZGrMW8Ub6dMiFKH8
 bKZZj0vHYRED5whplkCVtlSsIR/MTR1h61KUZ1e+gepWWewV1P0oKexr94fnNt2jbm1o0CHh0/M
 199RuvPCvLIpAOCJBu5WElxkip0nFiBCbyTJd2lLp+1ZV9PCXo1Q10J9IvXTImBH9/znRcvE4w7
 gzNnGwVRmmtcdj4wSzwo1Yh2DdfHuYsj5njMukykm44q8z/mXFrw=
X-Received: by 2002:a05:6a00:2d9f:b0:842:6e9f:9dc with SMTP id
 d2e1a72fcca58-84336a9eda9mr4743092b3a.34.1781203092248; 
 Thu, 11 Jun 2026 11:38:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9f:b0:842:6e9f:9dc with SMTP id
 d2e1a72fcca58-84336a9eda9mr4743069b3a.34.1781203091712; 
 Thu, 11 Jun 2026 11:38:11 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 11:38:11 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:05 +0530
MIME-Version: 1.0
Message-Id: <20260612-shikra_ethernet-v1-9-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=6213;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=myQOn368a4bEJkBKFi/AB/zdqSpCAE0Tjjhf3d8zs78=;
 b=6L7bDPM92n1GA/dkSKoqtFmo6gyQYaMeE5heucZ91kgX9VpAsVQwHgdprUw4av+2T6FNB/nz9
 +AyD4snXWCBAXT+Z8d1k+pmY4pSmAWMuwqYKYRYboWPIa4RtjbLydzp
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: xa780uUp4IqE2EtqSJugCfovNtBXmxH0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NyBTYWx0ZWRfX7BV0ZoVBoS94
 ndxqW4SaqrOKD1qLyg9QPkD+gAeK0br97VFHa2cnS1+FTqBsp4oN6speNgWLFfKvN5oUQmAZrd0
 fa5UuIlgVfsfccX/NMcZ7QoEiYklIxQ=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2b0095 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8zPImXEJHl8ypWhI0nAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NyBTYWx0ZWRfXyl9Zt6RwXvyh
 BJ4pyj8XMd20Jbk08NHlVj/iGKinO4npo5c0wudxv4lPOSswfzPAo8O44i85UFTk9FasLUbh7Yx
 XnjDRVNr74s1DJ7xY4LXcdEH32xRS3Zx+z9BBhvt6MKCg7aGNFzlJbA83v6LQjIH6U6ifFLpeGB
 hNTvjTdguCKqCyXpF1gnZs90xXdNN1v7EArpNU3KmWBI4rJuQFF3qtxzfa9ptTD0LUgGejmOerI
 gONUs8TniG9v2CxKYgGiMgNnESv6M4Xmyc9TM6NsW7oOtrQne/9in1fm23AMejQEVI4swGPRsi3
 lN3ZAbeicA6wyqO2ByoV4JSm0SvsjojGSSzf0yx+0nql0YS1sIlVbgV4kTHsyxhIKqcpbs5OOYn
 4GfOZKI53MCjK34ssfgfggEzf29rIPqE+3xmg+/0Jv4y4mSJhdiurBIPKg2tlhESof3n88NsxLz
 ctdyygJLFzZZvhftHRA==
X-Proofpoint-ORIG-GUID: xa780uUp4IqE2EtqSJugCfovNtBXmxH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110187
Cc: devicetree@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 9/9] arm64: dts: qcom: shikra-iqs-evk:
 Enable both ethernet ports
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
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:devicetree@vger.kernel.org,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: C63216747F0

Enable both Gigabit Ethernet controllers.  Each port has a dedicated
PHY with a gpio-hog to assert the power-enable GPIO at boot,
pin-control for the RGMII and MDIO bus, and MTL queue configuration.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 235 ++++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa8179111b921bf3bacc08884b84fb..d69b63dbc8e44f1bcec064564236ea23673bfa1f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/net/ti-dp83867.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -68,6 +69,178 @@ vreg_pmu_ch1: ldo4 {
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
+	snps,mtl-rx-config = <&emac0_mtl_rx_setup>;
+	snps,mtl-tx-config = <&emac0_mtl_tx_setup>;
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
+	emac0_mtl_rx_setup: rx-queues-config {
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
+	emac0_mtl_tx_setup: tx-queues-config {
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
+&ethernet1 {
+	status = "okay";
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet1_defaults>;
+
+	snps,mtl-rx-config = <&emac1_mtl_rx_setup>;
+	snps,mtl-tx-config = <&emac1_mtl_tx_setup>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy1: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <7>;
+			reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		};
+	};
+
+	emac1_mtl_rx_setup: rx-queues-config {
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
+	emac1_mtl_tx_setup: tx-queues-config {
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
 
@@ -103,6 +276,68 @@ &sdhc_1 {
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
+	ethernet1_defaults: ethernet1-defaults-state {
+		rgmii-rx-pins {
+			pins = "gpio137", "gpio138", "gpio139",
+			       "gpio140", "gpio141", "gpio142";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <16>;
+		};
+		rgmii-tx-pins {
+			pins = "gpio143", "gpio144", "gpio145",
+			       "gpio146", "gpio147", "gpio148";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+		rgmii-mdio-pins {
+			pins = "gpio149", "gpio150";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	emac0_phy_en_hog: emac0-phy-en-hog {
+		gpio-hog;
+		gpios = <66 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "emac0-phy-en";
+	};
+
+	emac1_phy_en_hog: emac1-phy-en-hog {
+		gpio-hog;
+		gpios = <53 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "emac1-phy-en";
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
