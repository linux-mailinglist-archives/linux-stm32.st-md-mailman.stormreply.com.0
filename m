Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD48170D3
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 14:50:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19B25C6DD70;
	Mon, 18 Dec 2023 13:50:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1155BC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 13:50:56 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BIAsVWW017332; Mon, 18 Dec 2023 13:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id; s=qcppdkim1; bh=nUdOg7e/uqM8
 fAT/uL8XeBHHGJeylXDTsQX179ijxSk=; b=RxMEhI0NwhaB8DgcapUyRgMHCN/n
 zk6Pivg5MSY+vm24um1dVW2c+hxXhFP9ETICnsUGFxQ4oqmg2LfbksgnakeayWjo
 hI21iB9FuXMVuALz31K+kvN87u1/4mlEmyvzAUusGz8lsb4MnAglB90RoJeZ3eo2
 vlOhsdBDVarMUE3WhAIE+DwJ4+e7LN8W9UEs2+ymvoXoJpSJQe/aK/+erWx1LVDg
 OZiQ9RkkgtONSfrxVQFUrc7N2oflGFjs1bXbZ/kLzNuA/uMkJNFlpb2cMCNEPXSD
 lkorj2AdpJVZBuFQNtu87uO0CDqjdLeJVUbkMtvyUoagVzKYWbW/wRynUA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v2j2dgr4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Dec 2023 13:50:41 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3BIDoblo013928; 
 Mon, 18 Dec 2023 13:50:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3v14ym0na4-1;
 Mon, 18 Dec 2023 13:50:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BIDoa0d013922;
 Mon, 18 Dec 2023 13:50:36 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-snehshah-hyd.qualcomm.com
 [10.147.246.35])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3BIDoa8n013918;
 Mon, 18 Dec 2023 13:50:36 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2319345)
 id 9DB1D5001DB; Mon, 18 Dec 2023 19:20:35 +0530 (+0530)
From: Sneh Shah <quic_snehshah@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Halaney <ahalaney@redhat.com>
Date: Mon, 18 Dec 2023 19:20:32 +0530
Message-Id: <20231218135032.27209-1-quic_snehshah@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: MsEGX18yZSJR_NepSVO8KsNU-e5xjiMl
X-Proofpoint-GUID: MsEGX18yZSJR_NepSVO8KsNU-e5xjiMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312180100
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: Fix ethool link
	settings ops for integrated PCS
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
When PCS is integrated in MAC, it will not have separate link config.
Bypass cofiguring and checking PCS link config for integrated PCS.

Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
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
