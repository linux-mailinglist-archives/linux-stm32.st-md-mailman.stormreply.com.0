Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 834523932CF
	for <lists+linux-stm32@lfdr.de>; Thu, 27 May 2021 17:46:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 327B1C57B69;
	Thu, 27 May 2021 15:46:40 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD7E2C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 May 2021 15:07:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [85.89.127.119])
 by mail.ispras.ru (Postfix) with ESMTPSA id 4622D40755E6;
 Thu, 27 May 2021 15:07:15 +0000 (UTC)
From: Dmitriy Ulitin <ulitin@ispras.ru>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 27 May 2021 18:06:26 +0300
Message-Id: <20210527150627.12995-2-ulitin@ispras.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527150627.12995-1-ulitin@ispras.ru>
References: <20210527150627.12995-1-ulitin@ispras.ru>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 May 2021 15:46:38 +0000
Cc: ldv-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 Dmitriy Ulitin <ulitin@ispras.ru>, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] stm32: Potential NULL pointer dereference in
	dcmi_irq_thread()
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

At the moment of enabling irq handling:

1922 ret = devm_request_threaded_irq(&pdev->dev, irq, dcmi_irq_callback,
1923			dcmi_irq_thread, IRQF_ONESHOT,
1924			dev_name(&pdev->dev), dcmi);

there is still uninitialized field sd_format of struct stm32_dcmi *dcmi.
If an interrupt occurs in the interval between the installation of the
interrupt handler and the initialization of this field, NULL pointer
dereference happens.

This field is dereferenced in the handler function without any check:

457 if (dcmi->sd_format->fourcc == V4L2_PIX_FMT_JPEG &&
458	    dcmi->misr & IT_FRAME) {

The patch moves interrupt handler installation
after initialization of the sd_format field that happens in
dcmi_graph_notify_complete() via dcmi_set_default_fmt().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Dmitriy Ulitin <ulitin@ispras.ru>
Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index d9b4ad0abf0c..ada0c01dc1b1 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -128,6 +128,7 @@ struct stm32_dcmi {
 	int				sequence;
 	struct list_head		buffers;
 	struct dcmi_buf			*active;
+	int			irq;
 
 	struct v4l2_device		v4l2_dev;
 	struct video_device		*vdev;
@@ -1752,6 +1753,14 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 	}
 
+	ret = devm_request_threaded_irq(dcmi->dev, dcmi->irq, dcmi_irq_callback,
+					dcmi_irq_thread, IRQF_ONESHOT,
+					dev_name(dcmi->dev), dcmi);
+	if (ret) {
+		dev_err(dcmi->dev, "Unable to request irq %d\n", dcmi->irq);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -1906,6 +1915,8 @@ static int dcmi_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0)
 		return irq ? irq : -ENXIO;
+
+	dcmi->irq = irq;
 
 	dcmi->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!dcmi->res) {
@@ -1919,14 +1930,6 @@ static int dcmi_probe(struct platform_device *pdev)
 		return PTR_ERR(dcmi->regs);
 	}
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, dcmi_irq_callback,
-					dcmi_irq_thread, IRQF_ONESHOT,
-					dev_name(&pdev->dev), dcmi);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to request irq %d\n", irq);
-		return ret;
-	}
-
 	mclk = devm_clk_get(&pdev->dev, "mclk");
 	if (IS_ERR(mclk)) {
 		if (PTR_ERR(mclk) != -EPROBE_DEFER)
-- 
2.25.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
