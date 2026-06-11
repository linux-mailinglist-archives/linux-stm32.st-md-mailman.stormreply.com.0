Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TeJdLYsAK2oe1AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:38:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD276747DE
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:38:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=eLReAkDq;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b="ETIttxU/";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58629C9AE37;
	Thu, 11 Jun 2026 18:38:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1AABC58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:38:01 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BIQCHW4027786
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Jun 2026 18:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 biBbKAQ/jliorbg5WwizM2SwHjL/wKeTUXmlyHGAeBE=; b=eLReAkDqh7GSBx6+
 xK20IRF5mRcNLlRvEcUp0e3QWu4FpjLpKUl+SqlrxjnpJGUvc/PQMu8KW3qbsS6x
 FreFDqSjT8NKKRn5uksqe2h/jLtsogMc1OlJ4Yus7catu6wY6s5eSz7PvbEOVXJa
 t3HPUllcIxBaSNObfZdvHXsTHCh8UPdRQZP38xp/DQuBQtQA9HLn2/mCUwkQBN64
 O6Unn/nFmtPt0UthUFLr+ymQKGCmPKZ5GopyWUq1ahZATkzKZ4btyM6Lrsu1ItZ1
 hwWXv3srvkj7A5lcqSsHyf7qYo4W2P8OCdT1PWBE232y/RC8OoW+hIkHgBQ/uMie
 HyY7nQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014gtdu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:38:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-842446a3851so109968b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781203079; x=1781807879;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=biBbKAQ/jliorbg5WwizM2SwHjL/wKeTUXmlyHGAeBE=;
 b=ETIttxU/3hwcJaQu/dCK/HtBFE3OG3CC5Yv15lLrmtk0DSzjm9pBHqsuwbF1Awle6/
 Gn7zeRnXxVU6qKkPkPP/9zgzZgux/Q7shLqQzI4Yq6gNmZ4eDYCHqinFgyVTpBuhAu3f
 MudClE7Mr66k7cEK9fR9WCR8REAuRp2aOgPTrz98AzEKL7M4NyxanxQOswMVoTcz13MF
 T5RjJh/HNueKoepWgVo99DUyrsAYq5QCL4y8EH0QQrq9dPv5K//wXbpvonTIMdblK0E9
 +W/6J4GepJFnGcECJNPClZ2GRqT4z4qApgZKLPue+Lk20ZY3UVKH3keDO//spL+q/RIr
 lz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781203079; x=1781807879;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=biBbKAQ/jliorbg5WwizM2SwHjL/wKeTUXmlyHGAeBE=;
 b=E8KwXBOw/RtNxxDuygq5xfWLyaXrLWhfmFaW+oSiST7TSLraNTENDWQcjhImvvMvj8
 PBPwPF5p+ETPNk9h+j9CWb9XbC3nLiaxxImj84L9LOg+QK7F1cpNX3syY7HrrKxy7yVP
 EZTI1Qod1DwS1CFZAsl2qW061iFFuAGFqyel+a768w5KKnwCpG9UF2grh48DJMpv2kyr
 Io7bdJNFzhbJe2+xGYIaLWgwdhEdal00xo9O3OKvE4AYX9WjeRhhQXTRXxCqwrbpmEWt
 1hFm/fBJrU8j0S4vK3ZJeSYQ4R7gipamVWaCAFkfUO4q70m9pQ4C4rCb4WfleJafWFll
 tRXg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+2tNKBS4yrA/5mcau11eCLOjsgKg4zKlKrq3aZsq+oUx65yQclkFCw26BN+ECoah3XbQmwPCDbKulwOA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQbiAa584z97ZdC9DoyunOxMrX/yzSlWk+6cTO8pgkRRgErW40
 DiWAiV7UyBiuJ3/iuuwzQq84g5GjhMS2gZ2EUNjEC5t7+81wIkAcraHpjW62MJUs5DqY3Wfqctz
 OaLB90hF/0l9RaUIVulToyWk/mmZu1aFwJOmIk7tPi9s7CWd8srnycnUOaKIBMysyNAaJ3elyQh
 Ew0trwB3yXw9q+ruw+ng==
X-Gm-Gg: Acq92OEbPIdWRbIjb56sLTp0zknNJsPmtIWaCs7FHRNX7C/slDW/ySiUxKwPIOuq5ur
 DsuDvgOlOf9k0JZTFfY5WlCoPywUSu3hay1O6xgzQePlulLaq2wG7fdgHc7LNEokXGkc7qu6p6a
 kFJLm2cZCyZ/GkzvxvkJPQ+nhI/FlBIfCICE9qzrsBEwIit+0Xz6o3w/YjfMydMpfiw63+5OSD1
 ZQHAczhfXFvETjDrqVuJ1HltBpQ0BAR41AKS84V20kuYhcR2508gzMYzL9y/xK4EWZ0m5mrSYfr
 wiDgn9+/72GbqeJClLYY4dmnbskpSU1ihm3/RgynsArrmSnTgAUeXudd1a2Io9NFaUDdK8cihv8
 POOyZRDIOFEBL0bByrAgIxhrsEQ3XZNufXgOdYhh8X5s9gFJ7LsI=
X-Received: by 2002:a05:6a00:3996:b0:842:2419:6bfe with SMTP id
 d2e1a72fcca58-843367c80d8mr4776306b3a.7.1781203079416; 
 Thu, 11 Jun 2026 11:37:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:3996:b0:842:2419:6bfe with SMTP id
 d2e1a72fcca58-843367c80d8mr4776275b3a.7.1781203078859; 
 Thu, 11 Jun 2026 11:37:58 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 11:37:58 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:03 +0530
MIME-Version: 1.0
Message-Id: <20260612-shikra_ethernet-v1-7-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3672;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=37UU7e/cKf9GlE3GmqWgcpRWeSVBORd1mW2l04FMXQw=;
 b=MhJgiFwQsYqNnejStdfMCaHyKzaDz3KQJdBU97MOITOsRWbwCfeLRz3OFGHS++DnH0f+vnXHf
 Ty6BeZNUQDlDwouL6b5BRIWwYgwZZ4xafmPFJxHHS99++YfNz4MQgiQ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: 0EGgQWS5QA6-ezSe02ufjp7cLoq6i_4s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfX6493CnVu2082
 ARkb/pnSh6ndxWBGV7DyxIvBy39Vvd6t3AT37GHGK9TrqpgjD/AC33cVtNl0tSwXbFoXKKfS9F8
 9yQNlDkQQTM8t6xR6TH30KUD3QtCxnw=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2b0088 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NHmBdxLQdYzBWVokJz8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfX7j8qWMeDiuBV
 iBDbn4ML/RvvG1sUfUz+ypQVimyGj/91Ul96xEWkHmOnnd7nvuPiYAKopwyqHK0TZHPkAHn0vld
 jPFuA84C3YTtgafBtts1xbdWYvcr0nlAVuefjJhlGQu34GC3U32V6duusXFuFmuXB8WZDHvChc/
 KcfAafBANnl5AbGmBnpOvZf9umODoBQtl0F8TnCenKV/54AeqomngQP02l0fSFD4t6H2JRzuYEH
 B29D1f73ShdRuAEPxy2RJjcGVYEQmdUSS+y++08Zwtih1qzFPm6OcMX0QwKkPqcPyzc8qEO5XGu
 XtkzusbIq96gsCo4oIUHYRaIDSn4uziKfVgmbhVirda1x3Scov5NPTKu2qoSLPLkMe+AAWJ6Ejw
 YJwaMmPPcE//BNGqWIqDvNBnt4a00kJQuz4Q+tfCHka+Rz0/mkt0T8axDOF7aLDL4HYkljwXUwI
 6UnbTAqyE0DW1PYlNKQ==
X-Proofpoint-ORIG-GUID: 0EGgQWS5QA6-ezSe02ufjp7cLoq6i_4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110186
Cc: devicetree@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 7/9] arm64: dts: qcom: shikra-cqm-evk:
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
X-Rspamd-Queue-Id: 8FD276747DE

Enable the first Gigabit Ethernet controller.  Add pin-control for the
RGMII and MDIO bus, a gpio-hog to assert the PHY power-enable GPIO at
boot, and the board-level ethernet0 overlay with PHY and MTL queue
configuration.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 119 ++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923bbc1fb5df28ab7899d47a0cf8dbe7..6a6bcd2e712a1d4db5ceea4733751397779963c9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/net/ti-dp83867.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
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
