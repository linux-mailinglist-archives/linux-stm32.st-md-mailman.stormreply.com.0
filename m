Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4CEB2B991
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 08:36:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06942C3F942;
	Tue, 19 Aug 2025 06:36:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89AD7C3F940
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:36:56 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57INtK3k002506
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 19 Aug 2025 06:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NsIfrvTLDxKj7MQKwmdBE+vbOboHExWTllcv4P/M3bA=; b=c+JMjzgEcVFmcxER
 v3JF67q6FOkC376kvXdUcyupeLy+T1ZB7CInbTGMcmOqLH9pfIQJBW36EzhEpaBq
 DbrcoBs2lK955IEMidOTVzVyfT5r2YUqIRQ7qj6CO6diaagvPNHPsKGyML2HGMEv
 D2gzTc+lJMlCGsx8pbAtcoLHnJZyyTGWfK1a+H63aMZXvVqNOaLQGv64d1Thl/s5
 r//HcGmwGHFurajZqtmQHu4O0bsO/9P9ludM8U95If+lfO5bRdsdwjbVF7nve8cI
 sW7vTww3IVzI5faDIxEYcFwv5e/lDUQaHRioSqn+w4sCntTJn+Ks/YWsYccxhSrs
 pBIyVQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vje5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:36:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24457f440f0so54700475ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 23:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755585414; x=1756190214;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NsIfrvTLDxKj7MQKwmdBE+vbOboHExWTllcv4P/M3bA=;
 b=GP3Hw/GuRkI+/AedqpTm/oR417sFsiYsbGuZdLKcJNaQwUAqW6JDY+Pxd82yKzKoEu
 G9RFUEbVmt2h9V2ejeSArQpxleaO+brR5gzm7/iahxN2XxEI0YExJWwrYV9DIBUgvPRq
 IdaUPD25XmODSDim6cd5GkmgbyTYSrfPT/c3z/qMGmH4FhDNuYiwNnrryYjcMpPiOSCv
 V3n80dHfAEn9gkfmPnK8gkz1FZatVI5Ek2dpqTiQME9w5vx6x7Qi6/IikuKwDUE5FqH2
 L9nGavzSKXQqmOpqBGMzmGsY+vKhc2OQrFtE/JNCL5n4OZecBPwb5ZljKhv0SKcu4bY5
 37iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT4jBRrTr31t7eXswRJ3vKX6dymzopzYK8IyNKEIrWANz/avz5w+aFwNSkXdvVmSA9TG9MX4yRfrkdog==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwKFm8ZNFLuFS0bnYDuriOVM5fK8tfbM4cw7/CJA20TFLFOoqFJ
 QSaZOzCKJgVnuNeAWLILy3fRrQmiFQ1Ze7mLx3TFn3b9K7LPIGXJCjxLwInWGvUNjuvQ4zUuyHF
 0HYlt/Bo1WrMA1WrHV/gP+TytIUa76hig+i+z8fZlPYOb5ImLfEpRM7+3wATE+STYg6xM0oUXcC
 vItd9FZW59ZWdabSpV+Q==
X-Gm-Gg: ASbGncssW3EJ4kjRESg4zPEyrqNqXzRQTVQ83J4u7uN9FSlIWJpK2RRJMfgwj7Wsx4M
 CI/Fes2pvN+a+Z/ujh6zgpCqBICyZ3V1G0MSYJkuvJU/i674cv+qff1Io3CL+ijL0sYcjmR+MqZ
 +V9ku5PRT3/B6Z8oVOMqmGO4wcFTML2VZB9R+T39mPX6rFjABXkF+vSYNZ8V8UTVW6MxNNI4MA6
 aVxAM2iXZrh6Xty7yG9dWdl8HrsD2Aj72q+/DRxsv5l539a0JRBuAo3gHYrhIHIi1nxtr4hYF/w
 kvKapdX6DSlSyNwVPD6gEYCFE2zK/4KlauFR/BNWpIs+jp+aQV987VdJFtKCs+r+UbbCMEEGv5i
 aLtdIu0EC2uX/OUycRFe7HQAEsEDAXQG/Dg==
X-Received: by 2002:a17:902:fc50:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-245e02c1277mr16956215ad.3.1755585413802; 
 Mon, 18 Aug 2025 23:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOco999Bi1j/ttDYbCi3adNC02Vim++BGoj+wK9RJiQcjLfwcPNu9Sf7OenyvPy4yfGschLQ==
X-Received: by 2002:a17:902:fc50:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-245e02c1277mr16955945ad.3.1755585413364; 
 Mon, 18 Aug 2025 23:36:53 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 23:36:53 -0700 (PDT)
From: YijieYang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:58 +0800
MIME-Version: 1.0
Message-Id: <20250819-qcs615_eth-v4-3-5050ed3402cb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=1620;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=esGpkrp578FqjkRZx/3YPPX9onv/FUSUV77hdcvh6nw=;
 b=SUGbTSGQ410eDz8ELdraMbuF+QvX9Z7EjnQVSHXQrih713dfkqJqB0VRBBkKfxTattHHcRdCV
 LC73TCyJ5V5CFuy5wSYE3kML7+6fQj/5Yhsi4kHtiXSyscOKAuX5Nlo
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfXxTqB/iimjcQi
 U5y739mgrSQiSJ81oqIFbY1swl5rCG3zpfSNv+0pI5s0/2zz1Zp1H0Bj06PH/qruU6VSEr/6Bun
 FHDunyTwkBoqd3dUn1pORrW3OxP2f/np7fMKphJ6/+0FITaEdC7+pCnkc9PONB0bjvBKCH3MGXd
 nCkqGNF4Hcgrz1xEcDkzVSlastqxU35X7TD5T6zld6as5IMWaVCeMMbdvIb7+97267CUnxBu6dp
 PneJKtYsvVrwQ6B5dIn6rgegvc+FkBGHHZycqKrTa/xYniu3OXhOzDPgUthXLFw2VGuNSUUfVKX
 /sLQAqVpbVEdZBZIAjuh6deILeq/kpcgdaweUVcXnJHIcOMH3/lmkTKUZjo0HU2AVaL4cSX3Apc
 sr6xD2l7
X-Proofpoint-GUID: d6xspGhbRS6hG9JbMIK5rFBMf7liXu4C
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a41b87 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ufJ1yBTjRq6Z22V5Zn0A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: d6xspGhbRS6hG9JbMIK5rFBMf7liXu4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139
Cc: stable+noautosel@kernel.org, devicetree@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yijie Yang <quic_yijiyang@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH v4 3/6] arm64: dts: qcom: qcs615: add ethernet
	node
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

Add an ethernet controller node for QCS615 SoC to enable ethernet
functionality.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 591fcb740259..8ec97532911c 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -491,6 +491,39 @@ soc: soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		#address-cells = <2>;
 		#size-cells = <2>;
+		ethernet: ethernet@20000 {
+			compatible = "qcom,qcs615-ethqos", "qcom,qcs404-ethqos";
+			reg = <0x0 0x00020000 0x0 0x10000>,
+			      <0x0 0x00036000 0x0 0x100>;
+			reg-names = "stmmaceth",
+				    "rgmii";
+
+			clocks = <&gcc GCC_EMAC_AXI_CLK>,
+				 <&gcc GCC_EMAC_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC_PTP_CLK>,
+				 <&gcc GCC_EMAC_RGMII_CLK>;
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "rgmii";
+
+			interrupts = <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq",
+					  "eth_lpi";
+
+			power-domains = <&gcc EMAC_GDSC>;
+			resets = <&gcc GCC_EMAC_BCR>;
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <20480>;
+
+			status = "disabled";
+		};
 
 		gcc: clock-controller@100000 {
 			compatible = "qcom,qcs615-gcc";

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
