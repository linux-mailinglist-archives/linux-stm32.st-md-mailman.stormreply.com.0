Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9B13A28E3
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 12:00:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1253AC58D5B;
	Thu, 10 Jun 2021 10:00:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F833C57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 10:00:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15A9vwfY026066; Thu, 10 Jun 2021 12:00:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=CkJNWXGmOEbJPEOGF2dk0bMdnvuwJI+M4NFLzCdau3Q=;
 b=dqaOpPxe3iRRC6frrImuYQ61nDtbPhjxQO8NfLGxX2s4iZMrgqTQCIjTRWBp8n95dSs6
 yn1VD/tFo1dUR2yC4MqznTnAfdoNd9RyAP3LY6aWmi+Lnxnk8vbommBn2Ix5zJm07h4m
 +I+Er9E8JeQZHYgn5USUubzZGxroItSJzahq4NqBb6JQfKIFLEBJYbFCySdb5xh7LhWu
 bmrOBDwCYSib78Ryl19PbYTkcmHTKSfNU4TfvtdENkQ8fVIIyIQq1s6L1/QsOCYE/im8
 rqJ9GHRNGO+Uo/ZDYXfuo2TaNQHTMrxEJ6xxfcs7xYneevLYe5nqB6/4IZwNbX64C10Q 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39350hbs5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 12:00:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B20A10002A;
 Thu, 10 Jun 2021 12:00:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D50421CA7B;
 Thu, 10 Jun 2021 12:00:27 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun 2021 12:00:26
 +0200
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 10 Jun 2021 12:00:20 +0200
Message-ID: <20210610100020.2318-1-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_05:2021-06-10,
 2021-06-10 signatures=0
Cc: linux-kernel@vger.kernel.org,
 Etienne Carriere <etienne.carriere@foss.st.com>, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/1] serial: stm32: defer probe for dma devices
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

Defer device probe operation when a DMA channel request probe deferral.

With this change both DMA channels are acquired before DMA channels are
configured. Once no probe deferral is expected, DMAs are
configured and any failure in their configuration will make the driver
to fallback to interrupt mode as prior this change.

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index bf188bdf9717..cd6adb979df9 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1182,6 +1182,14 @@ static const struct of_device_id stm32_match[] = {
 MODULE_DEVICE_TABLE(of, stm32_match);
 #endif
 
+static void stm32_usart_of_dma_rx_remove(struct stm32_port *stm32port,
+					 struct platform_device *pdev)
+{
+	if (stm32port->rx_buf)
+		dma_free_coherent(&pdev->dev, RX_BUF_L, stm32port->rx_buf,
+				  stm32port->rx_dma_buf);
+}
+
 static int stm32_usart_of_dma_rx_probe(struct stm32_port *stm32port,
 				       struct platform_device *pdev)
 {
@@ -1199,19 +1207,11 @@ static int stm32_usart_of_dma_rx_probe(struct stm32_port *stm32port,
 	if (uart_console(port))
 		return -ENODEV;
 
-	/* Request DMA RX channel */
-	stm32port->rx_ch = dma_request_slave_channel(dev, "rx");
-	if (!stm32port->rx_ch) {
-		dev_info(dev, "rx dma alloc failed\n");
-		return -ENODEV;
-	}
 	stm32port->rx_buf = dma_alloc_coherent(&pdev->dev, RX_BUF_L,
 					       &stm32port->rx_dma_buf,
 					       GFP_KERNEL);
-	if (!stm32port->rx_buf) {
-		ret = -ENOMEM;
-		goto alloc_err;
-	}
+	if (!stm32port->rx_buf)
+		return -ENOMEM;
 
 	/* Configure DMA channel */
 	memset(&config, 0, sizeof(config));
@@ -1221,8 +1221,8 @@ static int stm32_usart_of_dma_rx_probe(struct stm32_port *stm32port,
 	ret = dmaengine_slave_config(stm32port->rx_ch, &config);
 	if (ret < 0) {
 		dev_err(dev, "rx dma channel config failed\n");
-		ret = -ENODEV;
-		goto config_err;
+		stm32_usart_of_dma_rx_remove(stm32port, pdev);
+		return ret;
 	}
 
 	/* Prepare a DMA cyclic transaction */
@@ -1232,8 +1232,8 @@ static int stm32_usart_of_dma_rx_probe(struct stm32_port *stm32port,
 					 DMA_PREP_INTERRUPT);
 	if (!desc) {
 		dev_err(dev, "rx dma prep cyclic failed\n");
-		ret = -ENODEV;
-		goto config_err;
+		stm32_usart_of_dma_rx_remove(stm32port, pdev);
+		return -ENODEV;
 	}
 
 	/* No callback as dma buffer is drained on usart interrupt */
@@ -1244,24 +1244,22 @@ static int stm32_usart_of_dma_rx_probe(struct stm32_port *stm32port,
 	ret = dma_submit_error(dmaengine_submit(desc));
 	if (ret) {
 		dmaengine_terminate_sync(stm32port->rx_ch);
-		goto config_err;
+		stm32_usart_of_dma_rx_remove(stm32port, pdev);
+		return ret;
 	}
 
 	/* Issue pending DMA requests */
 	dma_async_issue_pending(stm32port->rx_ch);
 
 	return 0;
+}
 
-config_err:
-	dma_free_coherent(&pdev->dev,
-			  RX_BUF_L, stm32port->rx_buf,
-			  stm32port->rx_dma_buf);
-
-alloc_err:
-	dma_release_channel(stm32port->rx_ch);
-	stm32port->rx_ch = NULL;
-
-	return ret;
+static void stm32_usart_of_dma_tx_remove(struct stm32_port *stm32port,
+					 struct platform_device *pdev)
+{
+	if (stm32port->tx_buf)
+		dma_free_coherent(&pdev->dev, TX_BUF_L, stm32port->tx_buf,
+				  stm32port->tx_dma_buf);
 }
 
 static int stm32_usart_of_dma_tx_probe(struct stm32_port *stm32port,
@@ -1275,19 +1273,11 @@ static int stm32_usart_of_dma_tx_probe(struct stm32_port *stm32port,
 
 	stm32port->tx_dma_busy = false;
 
-	/* Request DMA TX channel */
-	stm32port->tx_ch = dma_request_slave_channel(dev, "tx");
-	if (!stm32port->tx_ch) {
-		dev_info(dev, "tx dma alloc failed\n");
-		return -ENODEV;
-	}
 	stm32port->tx_buf = dma_alloc_coherent(&pdev->dev, TX_BUF_L,
 					       &stm32port->tx_dma_buf,
 					       GFP_KERNEL);
-	if (!stm32port->tx_buf) {
-		ret = -ENOMEM;
-		goto alloc_err;
-	}
+	if (!stm32port->tx_buf)
+		return -ENOMEM;
 
 	/* Configure DMA channel */
 	memset(&config, 0, sizeof(config));
@@ -1297,22 +1287,11 @@ static int stm32_usart_of_dma_tx_probe(struct stm32_port *stm32port,
 	ret = dmaengine_slave_config(stm32port->tx_ch, &config);
 	if (ret < 0) {
 		dev_err(dev, "tx dma channel config failed\n");
-		ret = -ENODEV;
-		goto config_err;
+		stm32_usart_of_dma_tx_remove(stm32port, pdev);
+		return ret;
 	}
 
 	return 0;
-
-config_err:
-	dma_free_coherent(&pdev->dev,
-			  TX_BUF_L, stm32port->tx_buf,
-			  stm32port->tx_dma_buf);
-
-alloc_err:
-	dma_release_channel(stm32port->tx_ch);
-	stm32port->tx_ch = NULL;
-
-	return ret;
 }
 
 static int stm32_usart_serial_probe(struct platform_device *pdev)
@@ -1336,16 +1315,43 @@ static int stm32_usart_serial_probe(struct platform_device *pdev)
 		device_set_wakeup_capable(&pdev->dev, true);
 		ret = dev_pm_set_wake_irq(&pdev->dev, stm32port->port.irq);
 		if (ret)
-			goto err_nowup;
+			goto err_deinit_port;
 	}
 
-	ret = stm32_usart_of_dma_rx_probe(stm32port, pdev);
-	if (ret)
-		dev_info(&pdev->dev, "interrupt mode used for rx (no dma)\n");
+	stm32port->rx_ch = dma_request_chan(&pdev->dev, "rx");
+	if (PTR_ERR(stm32port->rx_ch) == -EPROBE_DEFER) {
+		ret = -EPROBE_DEFER;
+		goto err_wakeirq;
+	}
+	/* Fall back in interrupt mode for any non-deferral error */
+	if (IS_ERR(stm32port->rx_ch))
+		stm32port->rx_ch = NULL;
+
+	stm32port->tx_ch = dma_request_chan(&pdev->dev, "tx");
+	if (PTR_ERR(stm32port->tx_ch) == -EPROBE_DEFER) {
+		ret = -EPROBE_DEFER;
+		goto err_dma_rx;
+	}
+	/* Fall back in interrupt mode for any non-deferral error */
+	if (IS_ERR(stm32port->tx_ch))
+		stm32port->tx_ch = NULL;
 
-	ret = stm32_usart_of_dma_tx_probe(stm32port, pdev);
-	if (ret)
-		dev_info(&pdev->dev, "interrupt mode used for tx (no dma)\n");
+	if (stm32port->rx_ch && stm32_usart_of_dma_rx_probe(stm32port, pdev)) {
+		/* Fall back in interrupt mode */
+		dma_release_channel(stm32port->rx_ch);
+		stm32port->rx_ch = NULL;
+	}
+
+	if (stm32port->tx_ch && stm32_usart_of_dma_tx_probe(stm32port, pdev)) {
+		/* Fall back in interrupt mode */
+		dma_release_channel(stm32port->tx_ch);
+		stm32port->tx_ch = NULL;
+	}
+
+	if (!stm32port->rx_ch)
+		dev_info(&pdev->dev, "interrupt mode for rx (no dma)\n");
+	if (!stm32port->tx_ch)
+		dev_info(&pdev->dev, "interrupt mode for tx (no dma)\n");
 
 	platform_set_drvdata(pdev, &stm32port->port);
 
@@ -1366,30 +1372,23 @@ static int stm32_usart_serial_probe(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 
-	if (stm32port->rx_ch) {
-		dmaengine_terminate_async(stm32port->rx_ch);
-		dma_release_channel(stm32port->rx_ch);
-	}
-
-	if (stm32port->rx_dma_buf)
-		dma_free_coherent(&pdev->dev,
-				  RX_BUF_L, stm32port->rx_buf,
-				  stm32port->rx_dma_buf);
-
 	if (stm32port->tx_ch) {
-		dmaengine_terminate_async(stm32port->tx_ch);
+		stm32_usart_of_dma_tx_remove(stm32port, pdev);
 		dma_release_channel(stm32port->tx_ch);
 	}
 
-	if (stm32port->tx_dma_buf)
-		dma_free_coherent(&pdev->dev,
-				  TX_BUF_L, stm32port->tx_buf,
-				  stm32port->tx_dma_buf);
+	if (stm32port->rx_ch)
+		stm32_usart_of_dma_rx_remove(stm32port, pdev);
 
+err_dma_rx:
+	if (stm32port->rx_ch)
+		dma_release_channel(stm32port->rx_ch);
+
+err_wakeirq:
 	if (stm32port->wakeup_src)
 		dev_pm_clear_wake_irq(&pdev->dev);
 
-err_nowup:
+err_deinit_port:
 	if (stm32port->wakeup_src)
 		device_set_wakeup_capable(&pdev->dev, false);
 
@@ -1416,28 +1415,20 @@ static int stm32_usart_serial_remove(struct platform_device *pdev)
 
 	stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_DMAR);
 
+	if (stm32_port->tx_ch) {
+		dmaengine_terminate_async(stm32_port->tx_ch);
+		stm32_usart_of_dma_tx_remove(stm32_port, pdev);
+		dma_release_channel(stm32_port->tx_ch);
+	}
+
 	if (stm32_port->rx_ch) {
 		dmaengine_terminate_async(stm32_port->rx_ch);
+		stm32_usart_of_dma_rx_remove(stm32_port, pdev);
 		dma_release_channel(stm32_port->rx_ch);
 	}
 
-	if (stm32_port->rx_dma_buf)
-		dma_free_coherent(&pdev->dev,
-				  RX_BUF_L, stm32_port->rx_buf,
-				  stm32_port->rx_dma_buf);
-
 	stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_DMAT);
 
-	if (stm32_port->tx_ch) {
-		dmaengine_terminate_async(stm32_port->tx_ch);
-		dma_release_channel(stm32_port->tx_ch);
-	}
-
-	if (stm32_port->tx_dma_buf)
-		dma_free_coherent(&pdev->dev,
-				  TX_BUF_L, stm32_port->tx_buf,
-				  stm32_port->tx_dma_buf);
-
 	if (stm32_port->wakeup_src) {
 		dev_pm_clear_wake_irq(&pdev->dev);
 		device_init_wakeup(&pdev->dev, false);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
