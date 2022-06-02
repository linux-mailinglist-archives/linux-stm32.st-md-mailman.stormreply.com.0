Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 748C053B578
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jun 2022 10:56:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 396FAC03FE0;
	Thu,  2 Jun 2022 08:56:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB9C4C03FFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jun 2022 08:56:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2528Q8pt013105;
 Thu, 2 Jun 2022 10:56:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=MXrgzl/V2YRiK3xTeuYKtDlVPXp3ezbyqB7OhN2g5iU=;
 b=sIQbd3vmq5CBT2TYD4iA6X+F6jh2QcIk56YjezoqowV4oqUrvJ0CPiiD44FodZ6JCJ+I
 JogQ0w2kkQeAtwO1eAJXmfYLLdZq0IpithO8OZflDuzN8nAiBI+xpKJSdqBVZYRJrHov
 7z/wSF58+tITGHqfqsKj9mlwDGgDJ2MvCn6J4kWnYLBA6tSpeDf/nikHH6BLPQqMcFco
 woTLeh+ttSXqvvTpCmNrN14Uelks7nHv1qs1UfXT6NaXyAlpP4ubW2GutSjTiLBO64ak
 JYi6W/7VYSgdTWRIeAUt9nQTJh0CBp/BP7Vtg0h7d0gTjk/pSMlc1DM2v8VmEOcjyqKY 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gespq06hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 10:56:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A74410002A;
 Thu,  2 Jun 2022 10:56:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24341216EF2;
 Thu,  2 Jun 2022 10:56:06 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 2 Jun
 2022 10:56:05 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Thu, 2 Jun 2022 10:55:56 +0200
Message-ID: <20220602085556.348139-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220602085556.348139-1-patrice.chotard@foss.st.com>
References: <20220602085556.348139-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_01,2022-06-01_01,2022-02-23_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [2/2] spi: stm32-qspi: Remove stm32_qspi_wait_cmd()
	unused parameter
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

struct spi_mem_op *op parameter is no more used, remove it.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/spi-stm32-qspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 2ad43c2f0526..e5068e694ca5 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -299,8 +299,7 @@ static int stm32_qspi_wait_nobusy(struct stm32_qspi *qspi)
 						 STM32_BUSY_TIMEOUT_US);
 }
 
-static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi,
-			       const struct spi_mem_op *op)
+static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi)
 {
 	u32 cr, sr;
 	int err = 0;
@@ -420,7 +419,7 @@ static int stm32_qspi_send(struct spi_mem *mem, const struct spi_mem_op *op)
 		goto abort;
 
 	/* wait end of tx in indirect mode */
-	err = stm32_qspi_wait_cmd(qspi, op);
+	err = stm32_qspi_wait_cmd(qspi);
 	if (err)
 		goto abort;
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
