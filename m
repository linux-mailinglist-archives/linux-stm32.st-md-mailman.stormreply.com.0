Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A7E1D27D0
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 08:29:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63F5FC3F93B;
	Thu, 14 May 2020 06:29:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 048FAC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 06:28:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [122.182.193.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5DDC2206B6;
 Thu, 14 May 2020 06:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589437736;
 bh=lUAkt5vJrfMpmMe8Jkqe96oDcybwBYVt4NwetVO5JMg=;
 h=From:To:Cc:Subject:Date:From;
 b=LVOE+Q9kRqSXL+zg+mFOQWp0z1vhkEjTU3aiJJRAlJNkxvWsxcaOLvltVzJf+GN1M
 7quwf51+Y+6tUMPit972YNYW7NVoTnlQEL6sMdyszSJe6wBDLDLvlF7TJ6sHnHTlyq
 y+ZS+BEosD8Ow5FNXjZenaPm150g5T/sMoGHUT+4=
From: Vinod Koul <vkoul@kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Date: Thu, 14 May 2020 11:58:36 +0530
Message-Id: <20200514062836.190194-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Cc: Rahul Ankushrao Kawadgave <rahulak@qti.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: fix num_por initialization
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

Driver missed initializing num_por which is por values that driver
configures to hardware. In order to get this values, add a new structure
ethqos_emac_driver_data which holds por and num_por values and populate
that in driver probe.

Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
Reported-by: Rahul Ankushrao Kawadgave <rahulak@qti.qualcomm.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e0a5fe83d8e0..bfc4a92f1d92 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -75,6 +75,11 @@ struct ethqos_emac_por {
 	unsigned int value;
 };
 
+struct ethqos_emac_driver_data {
+	const struct ethqos_emac_por *por;
+	unsigned int num_por;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -171,6 +176,11 @@ static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
 };
 
+static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
+	.por = emac_v2_3_0_por,
+	.num_por = ARRAY_SIZE(emac_v2_3_0_por),
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	unsigned int val;
@@ -442,6 +452,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
+	const struct ethqos_emac_driver_data *data;
 	struct qcom_ethqos *ethqos;
 	struct resource *res;
 	int ret;
@@ -471,7 +482,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		goto err_mem;
 	}
 
-	ethqos->por = of_device_get_match_data(&pdev->dev);
+	data = of_device_get_match_data(&pdev->dev);
+	ethqos->por = data->por;
+	ethqos->num_por = data->num_por;
 
 	ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_clk)) {
@@ -526,7 +539,7 @@ static int qcom_ethqos_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_por},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
-- 
2.25.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
