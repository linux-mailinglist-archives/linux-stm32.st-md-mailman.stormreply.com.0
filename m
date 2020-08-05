Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 608CC23C673
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 09:04:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E3F2C36B3A;
	Wed,  5 Aug 2020 07:04:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67157C36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 07:04:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07573JwB012777; Wed, 5 Aug 2020 09:04:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jqECQj44WsYLYEzqi6QoOeyI+LAhjmK9fRhP1wA1ILU=;
 b=mkeC+VtORiROhMUOKeGVfpExcYaqMo+6KObfxARlK6zLnEH/F2XyUY5KLi/iVT3DPjL1
 y2nKk80f4L1yeqEaJsb9H7Je7HKN5BsmO8D2/sMJ1WX069vQWoiRjUnttvW4HwR5JR1B
 OfhYLAZv5f9AUTcOmj2QIyoNeElPqEj6m0cU7gQR1CAYzqNDnaKGHqBXDHxW6yiAysSu
 3JndZlylCmuJxXrlGFWv6UTRfjhNK9NCa0mth2PWFby6tNcwYbthY9Ah/NQVWNq+UrhG
 9+3CtxH2AogLMZkQ3DisM8rdGxsy5CyVdf7RHQko1E8ieEM617UBTxIRBIl2w7AexTwB Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32n6theqj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 09:04:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91046100038;
 Wed,  5 Aug 2020 09:04:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85ACF2A4D8E;
 Wed,  5 Aug 2020 09:04:20 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug 2020 09:04:20
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <broonie@kernel.org>, <amelie.delaunay@st.com>
Date: Wed, 5 Aug 2020 09:02:12 +0200
Message-ID: <1596610933-32599-18-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_04:2020-08-03,
 2020-08-05 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 alain.volmat@st.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 17/18] spi: stm32: properly handle 0 byte
	transfer
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

On 0 byte transfer request, return straight from the
xfer function after finalizing the transfer.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/spi/spi-stm32.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 177f82700de0..b909afd9e99b 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1658,6 +1658,12 @@ static int stm32_spi_transfer_one(struct spi_master *master,
 	unsigned long timeout;
 	int ret;
 
+	/* Don't do anything on 0 bytes transfers */
+	if (transfer->len == 0) {
+		spi->xfer_status = 0;
+		goto finalize;
+	}
+
 	spi->tx_buf = transfer->tx_buf;
 	spi->rx_buf = transfer->rx_buf;
 	spi->tx_len = spi->tx_buf ? transfer->len : 0;
@@ -1702,6 +1708,7 @@ static int stm32_spi_transfer_one(struct spi_master *master,
 
 	spi->cfg->disable(spi);
 
+finalize:
 	spi_finalize_current_transfer(master);
 
 	return spi->xfer_status;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
