Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE29FC4A7
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Dec 2024 11:07:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68B99C78F69;
	Wed, 25 Dec 2024 10:07:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D6EAC78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Dec 2024 10:06:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BOMMS1i008690;
 Wed, 25 Dec 2024 10:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BS0b+HMiePrCAfUAlHyLtR3Szgb+8xgLPznjz09vHvs=; b=VGhNGQTcxUru3b30
 /sqNTuG/YZOhmLHFWvtYVE+Hgo2TKysAzzUTEsKeFh/t9CEosCgmzZTj1hKQyNMX
 t2bcnIId8Pk9dUJi0zjrd0W7i0NCtJp+et3vL3r8cr+nzer5Rcx2FcnK3W0BCAcn
 mNUxqgXcGfOJVLh9dBUPEIKOcmyQK7mRSnJHo8aV/b+poM6DLskKY2qOTnawCFwr
 Z5+mD13rRV9QHTmIOIvAbPtKuJZ8UhPgeRSxb9ILWIXUMVmXmffzPQo6u9lXT0Xe
 BNbSfVspgO29IGwDg0Mo1gYxRDzodR12/lApxBxDi/IKdkrOjOJwgdnFEz87Q5ph
 oVEWig==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qvngmwsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Dec 2024 10:06:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPA6fKE010946
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Dec 2024 10:06:41 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 02:06:35 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Wed, 25 Dec 2024 18:04:47 +0800
MIME-Version: 1.0
Message-ID: <20241225-support_10m100m-v1-3-4b52ef48b488@quicinc.com>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
In-Reply-To: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735121177; l=773;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=aYUgZ35Qq8dOfct/sH6UGyo/Czo3JUICJUL+i9SmgFs=;
 b=lw5nfj4Ao7+oYrEoc3xSl2pt3EqEAtD7UhtVvU2lPWfKlb2Gd+nSmWbypiRLHshJgSbPydUNO
 uzevepW92LuDp+bGeV3/bAJl4TWOZwKgobNrQzV6cW9dKRKH+viXQ1V
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KXXRbR0iUyI-HWacRhQnBRXd4pPh7E_x
X-Proofpoint-ORIG-GUID: KXXRbR0iUyI-HWacRhQnBRXd4pPh7E_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxlogscore=687 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250088
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yijie Yang <quic_yijiyang@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] arm64: dts: qcom: qcs615-ride: Enable RX
 programmable swap on qcs615-ride
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

The timing of sampling at the RX side for qcs615-ride needs adjustment.
It varies from board to board.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index bfb5de4a0d440efece993dbf7a0001e001d5469b..f22a4a0b247a09bd1057b66203a34b666cd119a8 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -206,6 +206,7 @@ &ethernet {
 	phy-handle = <&rgmii_phy>;
 	phy-mode = "rgmii";
 	max-speed = <1000>;
+	qcom,rx-prog-swap;
 
 	snps,mtl-rx-config = <&mtl_rx_setup>;
 	snps,mtl-tx-config = <&mtl_tx_setup>;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
