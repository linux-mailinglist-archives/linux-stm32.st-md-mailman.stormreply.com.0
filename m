Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE3338A33
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 11:35:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E186FC5718B;
	Fri, 12 Mar 2021 10:35:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45A32C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 10:35:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CARHUX013360; Fri, 12 Mar 2021 11:34:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=XP5HDGc4nz2vrLtPSOaKwwrgwp31hjufsN+Yp5NoFSs=;
 b=P6mwRF3vmtt3zWJjsMuxIhpGMQ65OAXu72dnEnHurQO9/rqgnBInnryGIgOxVpuqMhEj
 2MEDl7ELsp/FSggiaOdgxUU/YhzGq35KZNL3w8VuQry4nJf9w5GDEV1OnM0Yc5cFp7F5
 NPICkMi7sLeeXPBxArnnH30kqEkROrBDNu6z3CnzjMOcq9MqijAJ56IFfDyp6WxbmVp6
 Lj6+mZ3/a8LnVNRdoNuIBQ+JdrMIwXD+/UEcLyN11eMi7rJ0O58ASjmXfoRrave9dNOU
 IbnflS6/kDxOErF2ykoXNqH1naCkFTpYVFCr5B5g7wPgFvuScuQFC1JRHzA4kl0FFBz5 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374037ceun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 11:34:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC6CE10002A;
 Fri, 12 Mar 2021 11:34:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7984221786;
 Fri, 12 Mar 2021 11:34:46 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar 2021 11:34:46
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <broonie@kernel.org>, <amelie.delaunay@foss.st.com>
Date: Fri, 12 Mar 2021 11:34:46 +0100
Message-ID: <1615545286-5395-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32: drop devres version of
	spi_register_master
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

From: Antonio Borneo <antonio.borneo@foss.st.com>

A call to spi_unregister_master() triggers calling remove()
for all the spi devices binded to the spi master.

Some spi device driver requires to "talk" with the spi device
during the remove(), e.g.:
- a LCD panel like drivers/gpu/drm/panel/panel-lg-lg4573.c
  will turn off the backlighting sending a command over spi.
This implies that the spi master must be fully functional when
spi_unregister_master() is called, either if it is called
explicitly in the master's remove() code or implicitly by the
devres framework.

Devres calls devres_release_all() to release all the resources
"after" the remove() of the spi master driver (check code of
__device_release_driver() in drivers/base/dd.c).
If the spi master driver has an empty remove() then there would
be no issue; the devres_release_all() will release everything
in reverse order w.r.t. probe().
But if code in spi master driver remove() disables the spi or
makes it not functional (like in this spi-stm32), then devres
cannot be used safely for unregistering the spi master and the
binded spi devices.

Replace devm_spi_register_master() with spi_register_master()
and add spi_unregister_master() as first action in remove().

Fixes: dcbe0d84dfa5 ("spi: add driver for STM32 SPI controller")

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/spi/spi-stm32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 25c076461011..97cf3a2d4180 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1929,7 +1929,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
-	ret = devm_spi_register_master(&pdev->dev, master);
+	ret = spi_register_master(master);
 	if (ret) {
 		dev_err(&pdev->dev, "spi master registration failed: %d\n",
 			ret);
@@ -1960,6 +1960,7 @@ static int stm32_spi_remove(struct platform_device *pdev)
 	struct spi_master *master = platform_get_drvdata(pdev);
 	struct stm32_spi *spi = spi_master_get_devdata(master);
 
+	spi_unregister_master(master);
 	spi->cfg->disable(spi);
 
 	if (master->dma_tx)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
