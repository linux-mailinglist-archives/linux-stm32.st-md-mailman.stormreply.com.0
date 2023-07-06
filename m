Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFEA749729
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jul 2023 10:14:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCC47C6B45C;
	Thu,  6 Jul 2023 08:14:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0475C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 08:14:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3667J5QN028460; Thu, 6 Jul 2023 10:14:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=c5EMg95qPheNNBLTXxowIRmmt2QQXYhtphsjHwo2EsE=;
 b=WihLRuSUCIhlwL+cWQwqVD6B8J5Dtfk3gpEE+UbA3mP0ihvqIw+cqM+S1ikLtfgReAco
 ON8+lal6RSr08FvS71H8KjR3yXZS0/qdEdYph3aYaysyaJ4u6pFhtLjeowUJM24ajzHQ
 3ZhiPHimqnPqcjQGgG3a+VDyH5IWBDGH01wvDGEkpLkXRXLrR8coybE/E4o/Zi4u+U0n
 3EPQSKEzJOfkduMHPIpzWRH+QWvjS8WEeWDLmEupQS9g12u93TylEf4hJ+aMFXoFtIMi
 P+Pm+aJQx1sduToqRUzH8OZPsTQL/QKLFZ/2rMgp2PBNNH7FUHKPSMYVPJ3dEC+zrU9N jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rns47re5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jul 2023 10:14:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BC80100052;
 Thu,  6 Jul 2023 10:14:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F15C62138E1;
 Thu,  6 Jul 2023 10:13:59 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 6 Jul
 2023 10:13:59 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 6 Jul 2023 10:13:42 +0200
Message-ID: <20230706081342.468090-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_04,2023-07-06_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] spi: stm32: disable device mode with st,
	stm32f4-spi compatible
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

STM32 SPI driver is not capable to handle device mode with stm32f4 soc.
Stop probing if this case happens.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
Changes since v2:
- Do not cast of_device_get_match_data() function
- Remove compatible in dev_err

Changes since v1:
- Replace of_match_device()->data by of_device_get_match_data()

 drivers/spi/spi-stm32.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 6d10fa4ab783..536d89e044cf 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -238,6 +238,7 @@ struct stm32_spi;
  * @baud_rate_div_min: minimum baud rate divisor
  * @baud_rate_div_max: maximum baud rate divisor
  * @has_fifo: boolean to know if fifo is used for driver
+ * @has_device_mode: is this compatible capable to switch on device mode
  * @flags: compatible specific SPI controller flags used at registration time
  */
 struct stm32_spi_cfg {
@@ -259,6 +260,7 @@ struct stm32_spi_cfg {
 	unsigned int baud_rate_div_min;
 	unsigned int baud_rate_div_max;
 	bool has_fifo;
+	bool has_device_mode;
 	u16 flags;
 };
 
@@ -1750,6 +1752,7 @@ static const struct stm32_spi_cfg stm32f4_spi_cfg = {
 	.baud_rate_div_min = STM32F4_SPI_BR_DIV_MIN,
 	.baud_rate_div_max = STM32F4_SPI_BR_DIV_MAX,
 	.has_fifo = false,
+	.has_device_mode = false,
 	.flags = SPI_MASTER_MUST_TX,
 };
 
@@ -1774,6 +1777,7 @@ static const struct stm32_spi_cfg stm32h7_spi_cfg = {
 	.baud_rate_div_min = STM32H7_SPI_MBR_DIV_MIN,
 	.baud_rate_div_max = STM32H7_SPI_MBR_DIV_MAX,
 	.has_fifo = true,
+	.has_device_mode = true,
 };
 
 static const struct of_device_id stm32_spi_of_match[] = {
@@ -1798,8 +1802,13 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	bool device_mode;
 	int ret;
+	const struct stm32_spi_cfg *cfg = of_device_get_match_data(&pdev->dev);
 
 	device_mode = of_property_read_bool(np, "spi-slave");
+	if (!cfg->has_device_mode && device_mode) {
+		dev_err(&pdev->dev, "spi-slave not supported\n");
+		return -EPERM;
+	}
 
 	if (device_mode)
 		ctrl = devm_spi_alloc_slave(&pdev->dev, sizeof(struct stm32_spi));
@@ -1817,9 +1826,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	spi->device_mode = device_mode;
 	spin_lock_init(&spi->lock);
 
-	spi->cfg = (const struct stm32_spi_cfg *)
-		of_match_device(pdev->dev.driver->of_match_table,
-				&pdev->dev)->data;
+	spi->cfg = cfg;
 
 	spi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(spi->base))
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
