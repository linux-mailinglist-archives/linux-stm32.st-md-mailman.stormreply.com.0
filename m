Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DC481E5F0
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Dec 2023 09:35:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3E4CC6C83D;
	Tue, 26 Dec 2023 08:35:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEE59C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Dec 2023 08:35:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BQ67c6u018268; Tue, 26 Dec 2023 08:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id; s=qcppdkim1; bh=loTYWzO9V2la
 V51pZPGKA3Tqqx72zGLxFo0XGcH+SFY=; b=ZreBZp4na0b3ooxc63SYfGxKfgAt
 YusPVjOT++23bo12c0kD2LbAMcMjTLXQF7tl78L65Q8lnfESK0+t2al3JZnu3GKg
 hD0wHqjV7x30L9Q+GIlQvbzSkkSafbzCEqAZRs9p7NX74U8PbV0I+kirXEUrYXaI
 lA2whaTMPkJRYg0vB2EY0kkuNBSmktaNQ+XLWz7oOySGo+mu/HxXjnhZfpsHix7r
 8Nk8Ui7sdV64Ck0onjAzqYqAsoKVWikNRSa5NsxGyV5VhOq/447NwsLoV6ApML3V
 1NasdzSDPNq4sX/CiOUutB9ZvLtJRXn3ZdmxorVtfphZNUMTF5gGv7B2DA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v7s95rb7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Dec 2023 08:34:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3BQ8YYUP017003; 
 Tue, 26 Dec 2023 08:34:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3v5rmkmhje-1;
 Tue, 26 Dec 2023 08:34:34 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BQ8YXTe016996;
 Tue, 26 Dec 2023 08:34:34 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-snehshah-hyd.qualcomm.com
 [10.147.246.35])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3BQ8YXFX016995;
 Tue, 26 Dec 2023 08:34:33 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2319345)
 id 0C21D5299C3; Tue, 26 Dec 2023 14:04:33 +0530 (+0530)
From: Sneh Shah <quic_snehshah@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 26 Dec 2023 14:04:32 +0530
Message-Id: <20231226083432.24920-1-quic_snehshah@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Fa070FFpTpNBAynbl0Tru0yvGrIJ8Idl
X-Proofpoint-GUID: Fa070FFpTpNBAynbl0Tru0yvGrIJ8Idl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312260061
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net v2] net: stmmac: Fix ethool link settings
	ops for integrated PCS
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

Currently get/set_link_ksettings ethtool ops are dependent on PCS.
When  PCS is integrated, it will not have separate link config.
Bypass configuring and checking PCS for integrated PCS.

Fixes: ("aa571b6275fb net: stmmac: add new switch to struct plat_stmmacenet_data")
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride
Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
---
v2 changelog:
- Added tested by tag.
- Added Fixes tag.
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index f628411ae4ae..e3ba4cd47b8d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -311,8 +311,9 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (priv->hw->pcs & STMMAC_PCS_RGMII ||
-	    priv->hw->pcs & STMMAC_PCS_SGMII) {
+	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
+	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
+	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
 		struct rgmii_adv adv;
 		u32 supported, advertising, lp_advertising;
 
@@ -397,8 +398,9 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (priv->hw->pcs & STMMAC_PCS_RGMII ||
-	    priv->hw->pcs & STMMAC_PCS_SGMII) {
+	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
+	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
+	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
 		/* Only support ANE */
 		if (cmd->base.autoneg != AUTONEG_ENABLE)
 			return -EINVAL;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
