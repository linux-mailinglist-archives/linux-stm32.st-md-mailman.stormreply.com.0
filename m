Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A365980E770
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 10:22:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6517AC6B45B;
	Tue, 12 Dec 2023 09:22:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E8AEC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 09:22:31 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BC7hVg4030233; Tue, 12 Dec 2023 09:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id; s=qcppdkim1; bh=l8zaNlEzCFdd
 J7GdqVAcppaYhBgAvRyZ9QUKgjvXKaE=; b=aeiMKbIpxLVlx5kNw8rKOQGHlxO3
 J9+0v4xmX6QTsjq6uf4YUQJFgWbqDJ9mwzw4Wp8+ABb8St4FK619S4fz42RjOYhg
 bYo0G9hfT4pcHZU5f2+6/Ja45d9fSlmC/BHr70TsyiZgtpM/iqadpyRcpO+ReU74
 MzZs8Ox7fxOH3y7FntUuwHVYBgI8L4nTsn0j52urGhmcf6PrAGE0Rogic/rV0cV5
 5BkJhbT7iwNCwFH/4C+vfRj25AwZJ1S6frdV0xPDKsIg6LlM1ZBCptBmIlE0eQfm
 w/JRJIjaiFzyReCof+0UOGX3OMxF9IPWeiRhk7wtal6wuxekK3jF3GGRVA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxkc806xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 09:22:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3BC9MDQu003963; 
 Tue, 12 Dec 2023 09:22:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3uvhakhnmy-1;
 Tue, 12 Dec 2023 09:22:13 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BC9MClj003954;
 Tue, 12 Dec 2023 09:22:12 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-snehshah-hyd.qualcomm.com
 [10.147.246.35])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3BC9MCeE003952;
 Tue, 12 Dec 2023 09:22:12 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2319345)
 id 99D6A5001C6; Tue, 12 Dec 2023 14:52:11 +0530 (+0530)
From: Sneh Shah <quic_snehshah@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 12 Dec 2023 14:52:08 +0530
Message-Id: <20231212092208.22393-1-quic_snehshah@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pDPfPCDoTvWSercp_38-MWIPTU2YRGPX
X-Proofpoint-ORIG-GUID: pDPfPCDoTvWSercp_38-MWIPTU2YRGPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120073
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net v4] net: stmmac: dwmac-qcom-ethqos: Fix
	drops in 10M SGMII RX
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

In 10M SGMII mode all the packets are being dropped due to wrong Rx clock.
SGMII 10MBPS mode needs RX clock divider programmed to avoid drops in Rx.
Update configure SGMII function with Rx clk divider programming.

Fixes: 463120c31c58 ("net: stmmac: dwmac-qcom-ethqos: add support for SGMII")
Tested-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
---
v4 changelog:
- Updated commit message to add more details on why 10M SGMII Rx is failing
- Added a macro for Rx clock divider value
v3 changelog:
- Added comment to explain why MAC needs to be reconfigured for SGMII
v2 changelog:
- Use FIELD_PREP to prepare bifield values in place of GENMASK
- Add fixes tag
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d3bf42d0fceb..31631e3f89d0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -34,6 +34,7 @@
 #define RGMII_CONFIG_LOOPBACK_EN		BIT(2)
 #define RGMII_CONFIG_PROG_SWAP			BIT(1)
 #define RGMII_CONFIG_DDR_MODE			BIT(0)
+#define RGMII_CONFIG_SGMII_CLK_DVDR		GENMASK(18, 10)
 
 /* SDCC_HC_REG_DLL_CONFIG fields */
 #define SDCC_DLL_CONFIG_DLL_RST			BIT(30)
@@ -78,6 +79,8 @@
 #define ETHQOS_MAC_CTRL_SPEED_MODE		BIT(14)
 #define ETHQOS_MAC_CTRL_PORT_SEL		BIT(15)
 
+#define SGMII_10M_RX_CLK_DVDR			0x31
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -598,6 +601,9 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
+/* On interface toggle MAC registers gets reset.
+ * Configure MAC block for SGMII on ethernet phy link up
+ */
 static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 {
 	int val;
@@ -617,6 +623,10 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 	case SPEED_10:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL;
 		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
+		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
+			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
+					 SGMII_10M_RX_CLK_DVDR),
+			      RGMII_IO_MACRO_CONFIG);
 		break;
 	}
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
