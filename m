Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A90B2B992
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 08:37:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 144BDC3F942;
	Tue, 19 Aug 2025 06:37:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B216C3F940
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:37:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J0ckFL017547
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 19 Aug 2025 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ae35zkKIC0CJ5nbsXi7yf5SwcQqgHmGyPNS8+VvWx1s=; b=ZVEiNzhE+Tl4Rj0R
 WulZY0o88RbENvsUmd0z/k3HgdH2FwIr7UOWqe4HWznqHxKNw3veSNzHTlo/6KM3
 Z8aH3SMpTRqAr60UMrisijuT5gL7edu97lM1rq9ubQ/LY+yeWp4E/2CI9dScNIjA
 dZqQ5Ayx/Hob80EpiF/kF0fI1T+JRqACqtYH70xH6NgKgQeScquJy9RpNjOscb/N
 eYoulDAagOm67pDis7TBMpcuDTND1IkySdHNx7AUFGOhkPjisi3M86oL4bmbJken
 HPVPmzX+BBiflXxhz1DZcGZI2t423A3J9YTJt/1mSmYfr65OuoCe8WpWRvPSN+Fk
 mR803Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj747g8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:37:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4716fa1e59so4189600a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 23:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755585421; x=1756190221;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ae35zkKIC0CJ5nbsXi7yf5SwcQqgHmGyPNS8+VvWx1s=;
 b=KqxI8u7mm/FlO9wIqTrKgz0k86yRECIKhy3xpc4R/6cc/myxajsRDMGyQnxjR2/cSn
 cF4pJgbFsPqO+BPhoiyYVZs35IrAu5drDBZOtcdg0bUGIL6z7AqIMka4rnY7ypI9h30F
 yOlNEANFfYHRI6/TcNWRn8z1QFBUU3wQp4Ls+UHie6E/QBkCWAMwZCV44nCwc9NSL3rA
 yuhGzzgIlq3nSNKk+awgx9eY0STPlzhjrSXFQBviI5fmNPMbO/LYELBnJMExw9SPu03P
 4NDgKRT5tHeffP2LhZotuCObKRVWzXR38twpsVgEyYpa0lG9fP0ESrZd/fqN+32TkhkR
 PfqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI8SBvGGOTa9CwNq1qLKy5gQu3/cxvrDjjJFq6D0gP4Fex/pjAwOwjaIb5F5krSvW50Y/xzlqGB5UIBg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwYei5Exw1uw6z7NHlLPORZTF0C/XI3DG8udQZufmwA6RyqAe4o
 I+kIVG92BSVWPHX1zqXfAqVLtNYYj2abQwizicGKjCKwRxkmHbDTG5QFordoz70/i44Q2exG1ON
 dmqZE2y5HAkZAK4mi5YHa+o6ESwXrksLizNEMmZMAYea/rTv/U9vEN6aoJoyAdfevO3Fuy8+XHU
 CxTesk3HE=
X-Gm-Gg: ASbGnctyzaZ8hG1CuCqzVPN9xfATx9lNIoNUNZzQn46EcRBK1OY7QbbR9qwPbewS/it
 Tyswj0/RoJay+L8wrUHFedHtpGsDwclqKNN4x12EANldUw4yEuvjKp+arwwZh/QvUeTgCXmcU9c
 G0d571pA6myylOaJzaQWD9rEG2orhrsOya8uGnYJ98NwJZJny34DR3/s8qAM8MxMV78PpSpqq7z
 Lo60As8Xr5ZEG5D1bXGAKfnDWJO6ixDOZWnl9KetaJARi9EYQXW2kVZyHWcgF1nq1c12SNXdLMZ
 YC3IMzHIshW6QPBtAlWwDe2trFNjHD0+Hy+F880tIXium+wK2GPyETNW+1UURxl4oZ4tuAUiuBK
 5kMjVfH1fTFk5YtJqwlJ92T1fBOLS3HW4dg==
X-Received: by 2002:a17:902:db03:b0:23d:dd04:28e2 with SMTP id
 d9443c01a7336-245e0488c4fmr19904775ad.35.1755585420856; 
 Mon, 18 Aug 2025 23:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHplGjIOsxjG9ywwt+oNjQuHnKblFHJP7DfxgAQ8xey2qyG+dk48tjcBRJvmxvcv4HDGKrHbg==
X-Received: by 2002:a17:902:db03:b0:23d:dd04:28e2 with SMTP id
 d9443c01a7336-245e0488c4fmr19904435ad.35.1755585420372; 
 Mon, 18 Aug 2025 23:37:00 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 23:37:00 -0700 (PDT)
From: YijieYang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:59 +0800
MIME-Version: 1.0
Message-Id: <20250819-qcs615_eth-v4-4-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=2876;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=SBNbTe9YfI7ypi1j4e391PPYp7WypDnpFergOj/Dd7Q=;
 b=Y2i2zXFfa34tuFIzyhBVHW5D/Xyb8q0LcUejJetwkYc/LdcqZOdTvNtFXsejUdHPb7YxeCmqT
 1jqm9QwQyuoBnMs4I9qAjEVJHAoEMTcRllDLyPQmrgFZ1i3MufhCX7L
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: 1gZda-7-EYQfee8X5G8L59FB-TuIUedw
X-Proofpoint-ORIG-GUID: 1gZda-7-EYQfee8X5G8L59FB-TuIUedw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX2h6Hbyo5JFB4
 joWm6O0HyC7NbpF5Sz9TdYV+nQ2mMrCNbQ20G0LRECdS5SPYuqua3YP+Jqjcnx+LEWzByQDRZuQ
 vWabo5tUH97y0XKgQDyDNO5cCAytTr9rH7QZfEEiwj0noP8BNHE/hXrCKfVMVBiBRhQfrCQUmf3
 VEAvly216ORUgKBDLy0UWHDT95Q9OC+GtSyfucIMFL+HL6jpEu1lsFfnRbsEM/2CyBtkoyrigYJ
 ZRn15gywVzbbsneQW0Poi++H0Ru8D+K/oZ8rZDP5xJxLTCTOInpseDiZ3QcyAUKGsqBURo4ZzZu
 tlxZ3wD+yn7Pj66AIvJ8Xfnj1EPANb3KQZWcbEZabJ/CgEWQ1gVC/QLJXsmpFwwcfUT4UEVZgBg
 dN+JDCKI
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a41b8d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=FOSVMqNBLdhn2M3QeyoA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033
Cc: stable+noautosel@kernel.org, devicetree@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yijie Yang <quic_yijiyang@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH v4 4/6] arm64: dts: qcom: qcs615-ride: Enable
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

From: Yijie Yang <quic_yijiyang@quicinc.com>

Enable the ethernet node, add the phy node and pinctrl for ethernet.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 59582d3dc4c4..05d8609c0483 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -288,6 +288,59 @@ vreg_l17a: ldo17 {
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
+	mdio: mdio {
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
@@ -446,6 +499,57 @@ &sdhc_2 {
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
+		pps-pins {
+			pins = "gpio91";
+			function = "rgmii";
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
