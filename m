Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A030973FC14
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jun 2023 14:39:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C719C6B44D;
	Tue, 27 Jun 2023 12:39:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E3E0C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 12:39:35 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35R9hmpI017215; Tue, 27 Jun 2023 14:39:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=++8nkaCbYJRjEk4/xiM70BALnWisNUyizeXBtAiu6ZU=;
 b=ZBs/gkJU3kseVP2hyxMcy9ho8eiK/BwsxzMidexTqX+SjniqYuP1R/j/JUpUGincMNJo
 CX6rpoPkruwDq5cbEAzlZcnJssLFj+Xvk+ZhVL/l2gHPDXIWfo4NXZx4ewiTCylv2IfT
 pz9XnwyqfHFQrG1lXnZ3k61z6HNgSU2tOF063vzPjw3Z9qI7kTiW5HUw7Zb9LlGTPK1F
 g3DwRXjkA1hmrDaAK+Zdiwym83DaRdTZjHU2naj0eXamzacUPpD6lmajHicZgz2KHbJh
 noS+wPnPDgM02AHy+kZRZY15jYPHe2jY6pjdkK9QVjvMxInrXAR+WIWyhBSSMejndhjM jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rfu65ach1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jun 2023 14:39:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8CD4100057;
 Tue, 27 Jun 2023 14:39:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07013231514;
 Tue, 27 Jun 2023 14:39:13 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 27 Jun
 2023 14:39:12 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 27 Jun 2023 14:39:06 +0200
Message-ID: <20230627123906.147029-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_08,2023-06-27_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] spi: stm32: disable device mode with st,
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
Stop probing if this case happens, and print an error with involved
compatible.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
Changes since v1:
- Replace of_match_device()->data by of_device_get_match_data()

 drivers/spi/spi-stm32.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 6d10fa4ab783..0de56441f72e 100644
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
@@ -1798,8 +1802,16 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	bool device_mode;
 	int ret;
+	const char *compatible =
+		of_match_device(pdev->dev.driver->of_match_table, &pdev->dev)->compatible;
+	const struct stm32_spi_cfg *cfg = (const struct stm32_spi_cfg *)
+		of_device_get_match_data(&pdev->dev);
 
 	device_mode = of_property_read_bool(np, "spi-slave");
+	if (!cfg->has_device_mode && device_mode) {
+		dev_err(&pdev->dev, "spi-slave not yet supported with %s\n", compatible);
+		return -EPERM;
+	}
 
 	if (device_mode)
 		ctrl = devm_spi_alloc_slave(&pdev->dev, sizeof(struct stm32_spi));
@@ -1817,9 +1829,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
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
