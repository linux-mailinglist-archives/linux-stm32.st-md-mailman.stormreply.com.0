Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 121EE588E5D
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Aug 2022 16:17:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C72C4C6410A;
	Wed,  3 Aug 2022 14:17:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E4A4C640F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Aug 2022 14:17:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27394fhl000833;
 Wed, 3 Aug 2022 16:17:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=fG0az3nsvTetEWWb1lkFNzqadymX70SmUKv9kJFTVbg=;
 b=GMg+Mz+rhI7sAtWhP0RVPV9gBRxyofCPTaxz8WmtS7VkG2PTei2js22rncVEpOdaci+F
 UkkJ/bY4eBwgw3Bjg+U+9NCiQjruIxfg7RaeDoGvCXlHuYPirEDfqWQjvzFEUJtMNEd9
 wvtUuNTWOu0VzSOzj5Nx16FQdgCKZt8gb2ml9j/fMjVU7J7+LKLveywba0WBdcU4/oeI
 uf9wA4UVlDquJ21MAEMfKHBRsnRhoDEdhvKc/es1fcAq+cvdyZbhsS3pAq/rlAiBn5VG
 zm2NYbKuUeDxQCaZE8Yxrxb4mIU7XfburTAGptHTtYphdC8KGWwMSXrSn5DgUt0FpfGG tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hq2b01bq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Aug 2022 16:17:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83CF2100038;
 Wed,  3 Aug 2022 16:17:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E4212248CA;
 Wed,  3 Aug 2022 16:17:01 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 3 Aug
 2022 16:17:01 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Wed, 3 Aug 2022 16:16:55 +0200
Message-ID: <20220803141657.301793-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220803141657.301793-1-patrice.chotard@foss.st.com>
References: <20220803141657.301793-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] spi: stm32-qspi: Remove
	stm32_qspi_wait_poll_status() unused parameter
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

op parameter is not used, remove it.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/spi-stm32-qspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index c0239e405c39..94356781e75b 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -331,8 +331,7 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi,
 	return err;
 }
 
-static int stm32_qspi_wait_poll_status(struct stm32_qspi *qspi,
-				       const struct spi_mem_op *op)
+static int stm32_qspi_wait_poll_status(struct stm32_qspi *qspi)
 {
 	u32 cr;
 
@@ -405,7 +404,7 @@ static int stm32_qspi_send(struct spi_mem *mem, const struct spi_mem_op *op)
 		writel_relaxed(op->addr.val, qspi->io_base + QSPI_AR);
 
 	if (qspi->fmode == CCR_FMODE_APM)
-		err_poll_status = stm32_qspi_wait_poll_status(qspi, op);
+		err_poll_status = stm32_qspi_wait_poll_status(qspi);
 
 	err = stm32_qspi_tx(qspi, op);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
