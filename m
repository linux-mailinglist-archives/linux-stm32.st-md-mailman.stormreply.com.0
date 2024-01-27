Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCEE83ED22
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jan 2024 14:04:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E31B8C6DD94;
	Sat, 27 Jan 2024 13:04:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2847AC6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 13:04:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40RCxpbl001346; Sat, 27 Jan 2024 13:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id; s=qcppdkim1; bh=6oebARhWnbWU
 R8eKVVvlJcocYHJTcYCqahQxWhiBad0=; b=HMaB8xqJ9VBO09LxitQsHPjqo4eU
 nHql5VcTIerEBoOYBhoEy5mfoDQ5DnM5+htqCHATo4CvqHduCjbjjR/yAEGrrbcX
 WbWjbbbU2G0JahoXEi07W84d619FI5TWonzTuc4MM3yYYgPwjGtGc31cY3uaR6n1
 U0WFs3x9EWXGCk8nIWyJ/j+c9UzI/tgXH4KLjynl7YIS2B7sKNj5fjQ7of9UrYW/
 cCXBUGxAvqDT1N5FgQbeAHF8NNHN1iTu86NBtVHfWFPTtHF8Fl48DqGRUA+SpKvi
 MUwlak0zHdSPnECgXS9HR+LL49GqmB5Rg/A6RyD+6UFzKb5Flp6kjBCRVQ==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvq6sgrrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jan 2024 13:04:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 40RD44xr032026; 
 Sat, 27 Jan 2024 13:04:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3vvtwkh1yy-1;
 Sat, 27 Jan 2024 13:04:04 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40RD43ad032020;
 Sat, 27 Jan 2024 13:04:03 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-snehshah-hyd.qualcomm.com
 [10.147.246.35])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 40RD43rP032019;
 Sat, 27 Jan 2024 13:04:03 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2319345)
 id A7D185013A4; Sat, 27 Jan 2024 18:34:02 +0530 (+0530)
From: Sneh Shah <quic_snehshah@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 27 Jan 2024 18:33:27 +0530
Message-Id: <20240127130327.22443-1-quic_snehshah@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hfW17_9FU6EIZ5OE24pmXqy0sXMCugSJ
X-Proofpoint-ORIG-GUID: hfW17_9FU6EIZ5OE24pmXqy0sXMCugSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401270097
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos: Add
	support for pm ops
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

Add qcom ethqos specific runtime and system sleep pm ops.
As part of system sleep qcom ethqos needs to disable all clocks.
This ops will be extended further with qcom specific features.

Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 51 ++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 31631e3f89d0..cba601ee9e01 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -720,6 +720,55 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %d\n", plat_dat->clk_ptp_rate);
 }
 
+static int qcom_ethqos_runtime_suspend(struct device *dev)
+{
+	struct net_device *ndev = dev_get_drvdata(dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	return stmmac_bus_clks_config(priv, false);
+}
+
+static int qcom_ethqos_runtime_resume(struct device *dev)
+{
+	struct net_device *ndev = dev_get_drvdata(dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	return stmmac_bus_clks_config(priv, true);
+}
+
+static int qcom_ethqos_suspend(struct device *dev)
+{
+	struct net_device *ndev = dev_get_drvdata(dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	int ret;
+
+	if (!ndev || !netif_running(ndev))
+		return -EINVAL;
+
+	ret = stmmac_suspend(dev);
+
+	return stmmac_bus_clks_config(priv, false);
+}
+
+static int qcom_ethqos_resume(struct device *dev)
+{
+	struct net_device *ndev = dev_get_drvdata(dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	int ret;
+
+	if (!ndev || !netif_running(ndev))
+		return -EINVAL;
+
+	stmmac_bus_clks_config(priv, true);
+
+	return stmmac_resume(dev);
+}
+
+const struct dev_pm_ops qcom_ethqos_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(qcom_ethqos_suspend, qcom_ethqos_resume)
+	SET_RUNTIME_PM_OPS(qcom_ethqos_runtime_suspend, qcom_ethqos_runtime_resume, NULL)
+};
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -838,7 +887,7 @@ static struct platform_driver qcom_ethqos_driver = {
 	.probe  = qcom_ethqos_probe,
 	.driver = {
 		.name           = "qcom-ethqos",
-		.pm		= &stmmac_pltfr_pm_ops,
+		.pm		= &qcom_ethqos_pm_ops,
 		.of_match_table = qcom_ethqos_match,
 	},
 };
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
