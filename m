Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15D842451
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 13:03:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2DBFC6C820;
	Tue, 30 Jan 2024 12:03:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D90D5C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 12:03:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40U9S430031460; Tue, 30 Jan 2024 12:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=B+sgRFv5yp3Rlr3nFlR9pT+L2BHT0szx2DeDHoUL8MA=; b=GI
 la15J+Nvr+UEUuKXGOLBgiOpj4uQdwcvKh+pfMnW+HxdBO3/FifZyEjCM9fgvlu9
 khKGQfOAmli10UK/ZsTBZB0y7pXXWbIsBT7szgLdz087JOft0q3DVunS85+bv/l8
 kc1mGG5mBZpcZIX4LkJT2T0Pkwi+G3qyjq+nS+AZ4NCM+dRVGgcb2v3kDRholal9
 ppfkDx4fqpG1l9T+1GKXwZze1/k7LVBE6vrViO/8BJcJCfyITOAUNW0yX9/kPvtp
 dtBLOpHkQW2LW0k4uizanAicv/MCj8rnScvVvUwDj1kvmDa1g8Q8/E9vDRmcTMY1
 94Vlnb3bqaC8OXfFFCoQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxr2v11e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jan 2024 12:03:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UC3eXb014236
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jan 2024 12:03:40 GMT
Received: from hu-jsuraj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 30 Jan 2024 04:03:30 -0800
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
To: <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma
 <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Jose Abreu" <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>
Date: Tue, 30 Jan 2024 17:33:04 +0530
Message-ID: <20240130120306.4120632-2-quic_jsuraj@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240130120306.4120632-1-quic_jsuraj@quicinc.com>
References: <20240130120306.4120632-1-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: POfoLiKGSUoQUQuAyJPkJWyoUMFzFm-l
X-Proofpoint-ORIG-GUID: POfoLiKGSUoQUQuAyJPkJWyoUMFzFm-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_05,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300087
Cc: kernel@quicinc.com
Subject: [Linux-stm32] [PATCH net-next v12 1/3] dt-bindings: net: qcom,
	ethqos: add binding doc for safety IRQ for sa8775p
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

Add binding doc for safety IRQ. The safety IRQ will be
triggered for ECC(error correction code), DPP(data path
parity), FSM(finite state machine) error.

Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 9 ++++++---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 6 ++++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 7bdb412a0185..69a337c7e345 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -37,12 +37,14 @@ properties:
     items:
       - description: Combined signal for various interrupt events
       - description: The interrupt that occurs when Rx exits the LPI state
+      - description: The interrupt that occurs when HW safety error triggered
 
   interrupt-names:
     minItems: 1
     items:
       - const: macirq
-      - const: eth_lpi
+      - enum: [eth_lpi, sfty]
+      - const: sfty
 
   clocks:
     maxItems: 4
@@ -89,8 +91,9 @@ examples:
                <&gcc GCC_ETH_PTP_CLK>,
                <&gcc GCC_ETH_RGMII_CLK>;
       interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
-                   <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-      interrupt-names = "macirq", "eth_lpi";
+                   <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq", "eth_lpi", "sfty";
 
       rx-fifo-depth = <4096>;
       tx-fifo-depth = <4096>;
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 5c2769dc689a..9b04e2ed7c18 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -107,13 +107,15 @@ properties:
       - description: Combined signal for various interrupt events
       - description: The interrupt to manage the remote wake-up packet detection
       - description: The interrupt that occurs when Rx exits the LPI state
+      - description: The interrupt that occurs when HW safety error triggered
 
   interrupt-names:
     minItems: 1
     items:
       - const: macirq
-      - enum: [eth_wake_irq, eth_lpi]
-      - const: eth_lpi
+      - enum: [eth_wake_irq, eth_lpi, sfty]
+      - enum: [eth_wake_irq, eth_lpi, sfty]
+      - enum: [eth_wake_irq, eth_lpi, sfty]
 
   clocks:
     minItems: 1
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
