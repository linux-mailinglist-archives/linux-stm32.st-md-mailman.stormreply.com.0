Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3523C66F
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 09:04:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD5FAC36B3A;
	Wed,  5 Aug 2020 07:04:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D1F9C3F939
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 07:04:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07572SqX030160; Wed, 5 Aug 2020 09:04:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5f/kmG4N622sMrrGFS0Jhu+gX16MgwdDVf5qJCdceBQ=;
 b=PRIhE/WWA2z7xAjACT5MgmqYL9rp4r/aryLr4UTUHIqp/BAi141gpZ5eNi4SOgqk6KPv
 sVsCndw+E0LKq9Symouh6wSxpiyaDRexj+VgJolgrMHdlxpKDX5AVmzmAcosbogb/Ud6
 5BHCpX5KrAeWvzj7QVQCb7kOFqxoKaXlkRc7J3NCYEdp+fGJP7FnA6vZimNRxJaC6ABC
 quTSCqtKAEJ0hiwuCTSOEncfaZ2qPUcO22NXExez5f4Uf/Fd+oDvi2rEXWMkEdwYHEgT
 fs9lBLZBwgHMe75OWp6dUWYOrXTz7yZSIDgH3Nb7gmPbfVBs+1mtWQwXRp71NyPnwekg BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32n6hyq7tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 09:04:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE32C10002A;
 Wed,  5 Aug 2020 09:04:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2F812A4D8E;
 Wed,  5 Aug 2020 09:04:20 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug 2020 09:04:20
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <broonie@kernel.org>, <amelie.delaunay@st.com>
Date: Wed, 5 Aug 2020 09:02:13 +0200
Message-ID: <1596610933-32599-19-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_04:2020-08-03,
 2020-08-05 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 alain.volmat@st.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 18/18] spi: stm32h7: ensure message are
	smaller than max size
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

Ensure that messages given to transfer_one handler can actually be
handled by it. For that purpose rely on the SPI framework
spi_split_transfers_maxsize function to split messages whenever necessary.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/spi/spi-stm32.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index b909afd9e99b..bd21b698af84 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1021,6 +1021,20 @@ static int stm32_spi_prepare_msg(struct spi_master *master,
 		spi_dev->mode & SPI_LSB_FIRST,
 		spi_dev->mode & SPI_CS_HIGH);
 
+	/* On STM32H7, messages should not exceed a maximum size setted
+	 * afterward via the set_number_of_data function. In order to
+	 * ensure that, split large messages into several messages
+	 */
+	if (spi->cfg->set_number_of_data) {
+		int ret;
+
+		ret = spi_split_transfers_maxsize(master, msg,
+						  STM32H7_SPI_TSIZE_MAX,
+						  GFP_KERNEL | GFP_DMA);
+		if (ret)
+			return ret;
+	}
+
 	spin_lock_irqsave(&spi->lock, flags);
 
 	/* CPOL, CPHA and LSB FIRST bits have common register */
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
