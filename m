Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC80A178DF
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2025 08:56:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D007C78F6E;
	Tue, 21 Jan 2025 07:56:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B71DC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2025 07:56:37 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L1tToG006053;
 Tue, 21 Jan 2025 07:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3M55RDZIhoScj1BK3E9p13CWYwK9W2yoOKDOnXxxQas=; b=DlY6cghHULhnx1HG
 6+Wic1/p2gGnASiudSNGVR0N6m9JxJrkLAiMhckkRVNMqVtNrcv1xmuRRboJGowY
 MUU/OLAK3M9ZoxoGULYM8KY9nex4n3Dkz8Zs3qlbr87ia6kZwxJ8FfLDHNKbopij
 k8EjhiD/QlLRE5LlR76JkDgSozDfGiHo/7SQoivLvjMs0XmvJbC2QpWBlIGdwzci
 Q3QD3Wqt7aCgG2Wa9ZwMZtRbTv+PPT9bJq0tAPC1pBZxlCMC/wEkPmL0DCIz2Cdn
 D5Rq8OFTit0EiPOkBJLvcEX7Q9o12csd7rZZebKcXXSPijaPuFFjcDEEOMbgxZgl
 hpVIMw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a2b80rfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2025 07:56:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L7u9IM026543
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2025 07:56:09 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 Jan 2025 23:56:04 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Tue, 21 Jan 2025 15:54:56 +0800
MIME-Version: 1.0
Message-ID: <20250121-dts_qcs615-v3-4-fa4496950d8a@quicinc.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
In-Reply-To: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737446143; l=2940;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=YEt+SvlU1KY5Og1iXrbbdYg96Nx8cW4rVfwyTnmUdEk=;
 b=xD9KuogOG/gZWOXndKcgUdDOnoY0NtYpZMXYSDQZKDQblazOug4AhbfD7xFAfLBp3JBHe7Rd4
 3Y92ndpLH16DusosHc/DJP96pnXIBJuEnX/c2pKDcB+Lj8Kx/ce37bp
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: DMu55lgGJr41YrRsyIjjU1lxXKaag2k9
X-Proofpoint-ORIG-GUID: DMu55lgGJr41YrRsyIjjU1lxXKaag2k9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210065
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yijie Yang <quic_yijiyang@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 4/4] arm64: dts: qcom: qcs615-ride: Enable
	ethernet node
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

Enable the ethernet node, add the phy node and pinctrl for ethernet. This
change is necessary to support ethernet functionality on this board.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 2b5aa3c66867676bda59ff82b902b6e4974126f8..2d201b5d09a79613364f0e514858dd30b25706a9 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -211,6 +211,59 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&ethernet {
+	pinctrl-0 = <&ethernet_defaults>;
+	pinctrl-names = "default";
+
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rgmii_phy: phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x7>;
+
+			interrupts-extended = <&tlmm 121 IRQ_TYPE_EDGE_FALLING>;
+			device_type = "ethernet-phy";
+			reset-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <1>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <1>;
+		snps,tx-sched-wrr;
+
+		queue0 {
+			snps,weight = <0x10>;
+			snps,dcb-algorithm;
+			snps,priority = <0x0>;
+		};
+	};
+};
+
 &gcc {
 	clocks = <&rpmhcc RPMH_CXO_CLK>,
 		 <&rpmhcc RPMH_CXO_CLK_A>,
@@ -278,6 +331,57 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	ethernet_defaults: ethernet-defaults-state {
+		mdc-pins {
+			pins = "gpio113";
+			function = "rgmii";
+			bias-pull-up;
+		};
+
+		mdio-pins {
+			pins = "gpio114";
+			function = "rgmii";
+			bias-pull-up;
+		};
+
+		rgmii-rx-pins {
+			pins = "gpio81", "gpio82", "gpio83", "gpio102", "gpio103", "gpio112";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		rgmii-tx-pins {
+			pins = "gpio92", "gpio93", "gpio94", "gpio95", "gpio96", "gpio97";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+
+		phy-intr-pins {
+			pins = "gpio121";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <8>;
+		};
+
+		phy-reset-pins {
+			pins = "gpio104";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+
+		pps-pins {
+			pins = "gpio91";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <8>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
