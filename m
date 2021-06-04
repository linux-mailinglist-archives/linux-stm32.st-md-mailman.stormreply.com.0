Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993C39B44B
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jun 2021 09:50:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D768C57B69;
	Fri,  4 Jun 2021 07:50:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EDDAC57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jun 2021 07:50:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1547lKte015913; Fri, 4 Jun 2021 09:50:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=aOKc3+bOmiN2HPGgLoviW5WOayT0hOfjwgnF4Bhbjfw=;
 b=aL2TcYO8sO7alwCAyt8AF+Gc1smyw5DBGZrQyTC5LqoHG7RaFsINOArGL+T8UcNdWHAh
 W5DwamsTCeBdvTPDEZ5efN0NspuEK4dvg0GSqK9oIOqOyUDvfD3s+MTSklu3Hh+NPe5N
 qssG7aqsLwUZ71KJyVIwPoz+6NygZQ3x+Xl1rpETM9k9aL/1iXowviOYOuhssZnBjUNj
 dWfEmGeAnWjMlDr7NjAlCSpISauZcZJM2b4wnaUMSK81jkdbr2yoE571GwQC6oLXoMS1
 qEiZpeyZ+SPybc5TgqCM4HWvJXr1sL17BqRvRq6aFE6OMP9ZEuFZcAk9kmsolt5Ltyrs 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38yea1gq1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 09:50:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D3CB10002A;
 Fri,  4 Jun 2021 09:50:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0660B214D1B;
 Fri,  4 Jun 2021 09:50:19 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun 2021 09:50:18
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Fri, 4 Jun 2021 09:50:09 +0200
Message-ID: <20210604075009.25914-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_04:2021-06-04,
 2021-06-04 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32-qspi: Fix W=1 build warning
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

Fix the following compilation warning using W=1 build:
arm-linux-gnueabi-ld: drivers/spi/spi-stm32-qspi.o: in function `stm32_qspi_poll_status':

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index f4481fe48bf0..e71a4c514f7b 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -806,6 +806,7 @@ config SPI_STM32_QSPI
 	tristate "STMicroelectronics STM32 QUAD SPI controller"
 	depends on ARCH_STM32 || COMPILE_TEST
 	depends on OF
+	depends on SPI_MEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
 	  This driver does not support generic SPI. The implementation only
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
