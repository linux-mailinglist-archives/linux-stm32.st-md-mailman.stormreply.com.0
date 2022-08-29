Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 727E35A4BF4
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Aug 2022 14:33:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26A0CC04001;
	Mon, 29 Aug 2022 12:33:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2B95C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 12:33:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T7lCJ8005664;
 Mon, 29 Aug 2022 14:33:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=SS0hLQPrAPBMabF9dirIJRH0zBiCY+0ym1TnTQn0oCI=;
 b=2ZPUD6SR8RXeCDoNaZB2DXDLd+zcQmjcIwo5PulbFaV/omXwBd/C+kjwDO5RzSnGZwmN
 oYMB7Y44dR01CS+Fta3MOweUjR9D72nv9suWcvfuJk9coUJ8ya4LX2/On7L8HJgmKNfn
 EC0NxGBtZ2SYD0AJ6eVX7OdaSoj+jj5FwboKKyHVSrOJhkcLx9Q3mjAHtd8yGlfZl58L
 C8r3/iAIvJrHxhXrj8MIOMTDNowEc82g3XN3FoED+GtGC7m/UVSOGnn87fkUb70Ok2Vr
 hUYfNg45BhMucEZTRs+jDpzP2idS3yiTPENV2xvBva/gXR40i+1SURAmNl7UINWi6mvW zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j7a5hsn30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Aug 2022 14:33:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3EE410002A;
 Mon, 29 Aug 2022 14:33:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A6C2229A77;
 Mon, 29 Aug 2022 14:33:07 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Mon, 29 Aug
 2022 14:33:07 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 29 Aug 2022 14:32:50 +0200
Message-ID: <20220829123250.2170562-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32-qspi: Fix pm_runtime management in
	stm32_qspi_transfer_one_message()
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

ctrl->auto_runtime_pm was wrongly set to true when adding
transfer_one_message() callback.
As explained in commit 6e6ccb3d4cdc ("spi: stm32-qspi: Add pm_runtime support")
the expected behavior is to prevent runtime suspends between each transfer.

Add needed pm_runtime API calls in stm32_qspi_transfer_one_message().

Fixes: a557fca630cc ("spi: stm32_qspi: Add transfer_one_message() spi callback")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/spi-stm32-qspi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 679fd1c34f7e..227f450aa5f0 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -567,6 +567,10 @@ static int stm32_qspi_transfer_one_message(struct spi_controller *ctrl,
 	if (!spi->cs_gpiod)
 		return -EOPNOTSUPP;
 
+	ret = pm_runtime_resume_and_get(qspi->dev);
+	if (ret < 0)
+		return ret;
+
 	mutex_lock(&qspi->lock);
 
 	gpiod_set_value_cansleep(spi->cs_gpiod, true);
@@ -629,6 +633,9 @@ static int stm32_qspi_transfer_one_message(struct spi_controller *ctrl,
 	msg->status = ret;
 	spi_finalize_current_message(ctrl);
 
+	pm_runtime_mark_last_busy(qspi->dev);
+	pm_runtime_put_autosuspend(qspi->dev);
+
 	return ret;
 }
 
@@ -847,7 +854,6 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	ctrl->mem_ops = &stm32_qspi_mem_ops;
 	ctrl->use_gpio_descriptors = true;
 	ctrl->transfer_one_message = stm32_qspi_transfer_one_message;
-	ctrl->auto_runtime_pm = true;
 	ctrl->num_chipselect = STM32_QSPI_MAX_NORCHIP;
 	ctrl->dev.of_node = dev->of_node;
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
