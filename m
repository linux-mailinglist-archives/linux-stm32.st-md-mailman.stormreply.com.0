Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DAB802D88
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 09:49:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFAA1C6B46B;
	Mon,  4 Dec 2023 08:49:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 816B0C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 08:49:22 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B4669JV007345; Mon, 4 Dec 2023 08:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=CDImjb7xNhS+hFEs/G+MjK3uesJb5R58jLvNa7bSTkQ=;
 b=U+bCRgntYG6lWWqHu0G24OEAwGRnzT2DvjlKoUeZbX+NSHbR/qekM9/F7vfz7AbfVDRY
 2rScwxS2vZgbVGax9Rr/UxvletHgygwfDqRUsc5wmdBihYvpAUePsw2qyeRld2tzdx+i
 ulgGH9T9dorOxHvxxLNCxEqVqkQdJ883QOZy+q5EhbxheDGx2B4fH4zesD0Sas5UfuGB
 EW5Gy4qhGdzo8BR1keCLa9Dg3jZdVlCBjuzyKsj3y5AQeOqq/iMtJsxbLguSJnUVxxFL
 NZkgloATzfDBXDY1llKMw8e3e/bKkRHStyLmKIYr6yFxdgthgFkDoMHuUs/Go/80oH1O OQ== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqvp13ex3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Dec 2023 08:49:01 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3B48mvZE015621; 
 Mon, 4 Dec 2023 08:48:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3uqwnkghc2-1;
 Mon, 04 Dec 2023 08:48:57 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B48mvij015616;
 Mon, 4 Dec 2023 08:48:57 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-snehshah-hyd.qualcomm.com
 [10.147.246.35])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3B48muuD015615;
 Mon, 04 Dec 2023 08:48:57 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2319345)
 id 31B68602FA0; Mon,  4 Dec 2023 14:18:56 +0530 (+0530)
From: Sneh Shah <quic_snehshah@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  4 Dec 2023 14:18:54 +0530
Message-Id: <20231204084854.31543-1-quic_snehshah@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4IRSw3F21LUYQeQxmbPsUmBIoZ8NIWJ3
X-Proofpoint-ORIG-GUID: 4IRSw3F21LUYQeQxmbPsUmBIoZ8NIWJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_06,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040066
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: Add sysfs
	nodes for qcom ethqos
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

Add sysfs nodes to conifigure routing of specific vlan id to GVM queue.
GVM queue is not exposed to PVM stmmac, so TC ops can't configure routing.

Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 216 +++++++++++++++++-
 1 file changed, 215 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d3bf42d0fceb..ea89045a90a1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -109,6 +109,8 @@ struct qcom_ethqos {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
+	int gvm_vlan_prio;
+	int gvm_queue;
 };
 
 static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -710,6 +712,214 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %d\n", plat_dat->clk_ptp_rate);
 }
 
+static ssize_t gvm_vlan_routing_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *user_buf, size_t size)
+{
+	struct net_device *netdev = to_net_dev(dev);
+	struct stmmac_priv *priv;
+	struct qcom_ethqos *ethqos;
+	u32 prio;
+	s8 input = 0;
+
+	if (!netdev) {
+		pr_err("netdev is NULL\n");
+		return -EINVAL;
+	}
+
+	priv = netdev_priv(netdev);
+	if (!priv) {
+		pr_err("priv is NULL\n");
+		return -EINVAL;
+	}
+
+	ethqos = priv->plat->bsp_priv;
+	if (!ethqos) {
+		pr_err("ethqos is NULL\n");
+		return -EINVAL;
+	}
+
+	if (kstrtos8(user_buf, 0, &input)) {
+		pr_err("Error in reading option from user\n");
+		return -EINVAL;
+	}
+
+	if (input < 1 || input > 7) {
+		pr_err("Invalid option set by user\n");
+		return -EINVAL;
+	}
+
+	if (input == ethqos->gvm_vlan_prio)
+		pr_err("No effect as duplicate input\n");
+
+	ethqos->gvm_vlan_prio = input;
+	prio  = 1 << input;
+
+	stmmac_rx_queue_prio(priv, priv->hw, prio, ethqos->gvm_queue);
+
+	return size;
+}
+
+static ssize_t gvm_queue_mapping_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *user_buf, size_t size)
+{
+	struct net_device *netdev = to_net_dev(dev);
+	struct stmmac_priv *priv;
+	struct qcom_ethqos *ethqos;
+	u32 prio;
+	s8 input = 0;
+
+	if (!netdev) {
+		pr_err("netdev is NULL\n");
+		return -EINVAL;
+	}
+
+	priv = netdev_priv(netdev);
+	if (!priv) {
+		pr_err("priv is NULL\n");
+		return -EINVAL;
+	}
+
+	ethqos = priv->plat->bsp_priv;
+	if (!ethqos) {
+		pr_err("ethqos is NULL\n");
+		return -EINVAL;
+	}
+
+	if (kstrtos8(user_buf, 0, &input)) {
+		pr_err("Error in reading option from user\n");
+		return -EINVAL;
+	}
+
+	if (input == ethqos->gvm_queue)
+		pr_err("No effect as duplicate input\n");
+
+	ethqos->gvm_queue = input;
+	prio  = 1 << input;
+
+	return size;
+}
+
+static ssize_t gvm_queue_mapping_show(struct device *dev,
+				      struct device_attribute *attr, char *user_buf)
+{
+	struct net_device *netdev = to_net_dev(dev);
+	struct stmmac_priv *priv;
+	struct qcom_ethqos *ethqos;
+
+	if (!netdev) {
+		pr_err("netdev is NULL\n");
+		return -EINVAL;
+	}
+
+	priv = netdev_priv(netdev);
+	if (!priv) {
+		pr_err("priv is NULL\n");
+		return -EINVAL;
+	}
+
+	ethqos = priv->plat->bsp_priv;
+	if (!ethqos) {
+		pr_err("ethqos is NULL\n");
+		return -EINVAL;
+	}
+
+	return scnprintf(user_buf, 256, "%d\n", ethqos->gvm_queue);
+}
+
+static ssize_t gvm_vlan_routing_show(struct device *dev,
+				     struct device_attribute *attr, char *user_buf)
+{
+	struct net_device *netdev = to_net_dev(dev);
+	struct stmmac_priv *priv;
+	struct qcom_ethqos *ethqos;
+
+	if (!netdev) {
+		pr_err("netdev is NULL\n");
+		return -EINVAL;
+	}
+
+	priv = netdev_priv(netdev);
+	if (!priv) {
+		pr_err("priv is NULL\n");
+		return -EINVAL;
+	}
+
+	ethqos = priv->plat->bsp_priv;
+	if (!ethqos) {
+		pr_err("ethqos is NULL\n");
+		return -EINVAL;
+	}
+
+	return scnprintf(user_buf, 256, "%d\n", ethqos->gvm_vlan_prio);
+}
+
+static DEVICE_ATTR_RW(gvm_queue_mapping);
+
+static DEVICE_ATTR_RW(gvm_vlan_routing);
+
+static int ethqos_remove_sysfs(struct qcom_ethqos *ethqos)
+{
+	struct net_device *net_dev;
+
+	if (!ethqos) {
+		pr_err("ethqos is NULL\n");
+		return -EINVAL;
+	}
+
+	net_dev = platform_get_drvdata(ethqos->pdev);
+	if (!net_dev) {
+		pr_err("netdev is NULL\n");
+		return -EINVAL;
+	}
+
+	sysfs_remove_file(&net_dev->dev.kobj,
+			  &dev_attr_gvm_queue_mapping.attr);
+	sysfs_remove_file(&net_dev->dev.kobj,
+			  &dev_attr_gvm_vlan_routing.attr);
+
+	return 0;
+}
+
+static int ethqos_create_sysfs(struct qcom_ethqos *ethqos)
+{
+	int ret;
+	struct net_device *net_dev;
+
+	if (!ethqos) {
+		pr_err("ethqos is NULL\n");
+		return -EINVAL;
+	}
+
+	net_dev = platform_get_drvdata(ethqos->pdev);
+	if (!net_dev) {
+		pr_err("netdev is NULL\n");
+		return -EINVAL;
+	}
+
+	ret = sysfs_create_file(&net_dev->dev.kobj,
+				&dev_attr_gvm_queue_mapping.attr);
+	if (ret) {
+		pr_err("unable to create passthrough_en sysfs node\n");
+		goto fail;
+	}
+
+	ret = sysfs_create_file(&net_dev->dev.kobj,
+				&dev_attr_gvm_vlan_routing.attr);
+	if (ret) {
+		pr_err("unable to create cv2x_priority sysfs node\n");
+		goto fail;
+	}
+
+	return ret;
+
+fail:
+	ethqos_remove_sysfs(ethqos);
+
+	return ret;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -812,7 +1022,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}
 
-	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+	ret = devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	return ethqos_create_sysfs(ethqos);
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
