Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 180018034CA
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 14:27:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF950C6B46B;
	Mon,  4 Dec 2023 13:27:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A866C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 13:27:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B4Ce4AF011000; Mon, 4 Dec 2023 13:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=x6LE3MtLGhTYFhqYeP5YLz7sqj7w/XAt98FOhZLnZRI=;
 b=V22Vl24djUnUDIxatSXKFmWeDnk9oVMX+fnxLSOYexdpIp8skG/kd8Tq6l6bjN++lGRn
 uET2d3l9B4aY3gXfM+EmThe8VMVuLJ6+HAdpHQgzhBtFyw+e8qGLDKnGHwYydovjAHQt
 9IUudU73DC9hFaJ183Q3cNstgy/q2+YJWu7elleFfJeJA01DrWFP1rnJjVBtG34oCGUv
 JpPDhXzmSlj4RTdjfnpDcZ+qm4NqxPyp7uaA9x3P8T53+AzJYkKgmDcGtQxmNui+Cqzh
 QI14rZqMR7QUozeTXbty7zxGTnBVaRi0kOifTk5YNffOO6C5F4Zy/o6pc1Rg2UKDagc0 7g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usdfwge2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Dec 2023 13:27:04 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4DR2sf012818
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 4 Dec 2023 13:27:02 GMT
Received: from hu-jsuraj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 4 Dec 2023 05:26:53 -0800
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
 Andrew Halaney <ahalaney@redhat.com>
Date: Mon, 4 Dec 2023 18:56:16 +0530
Message-ID: <60c5e8ba8536538966fa4b22ccbd8345f8869a15.1701695218.git.quic_jsuraj@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1701695218.git.quic_jsuraj@quicinc.com>
References: <cover.1701695218.git.quic_jsuraj@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oFYomotq8I7OHHagPXN7ns1P349Pk735
X-Proofpoint-ORIG-GUID: oFYomotq8I7OHHagPXN7ns1P349Pk735
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_12,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=662 mlxscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040101
Cc: kernel@quicinc.com
Subject: [Linux-stm32] [PATCH net-next v3 2/3] arm64: dts: qcom: sa8775p:
	enable safety IRQ
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

Add changes to support safety IRQ Handling
Support for ethernet.

Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 13dd44dd9ed1..c92d8f9b92f5 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2394,8 +2394,9 @@ ethernet1: ethernet@23000000 {
 			      <0x0 0x23016000 0x0 0x100>;
 			reg-names = "stmmaceth", "rgmii";
 
-			interrupts = <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "macirq";
+			interrupts = <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "safety";
 
 			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
 				 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
@@ -2427,8 +2428,9 @@ ethernet0: ethernet@23040000 {
 			      <0x0 0x23056000 0x0 0x100>;
 			reg-names = "stmmaceth", "rgmii";
 
-			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "macirq";
+			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "safety";
 
 			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
 				 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
