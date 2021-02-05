Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF143109E0
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 12:09:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B3ECC57B52;
	Fri,  5 Feb 2021 11:09:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B8F2C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 11:09:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115AojUa021324; Fri, 5 Feb 2021 12:09:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=FCkDrTxbZDwU9CwRDiOr3Qlvt+6CQ9SFda6Q14KRmtE=;
 b=AjNDAZ4Tbg5BNwegVqNxY5TyOVFFJXz6OlNZGrZyQ60+NP4YBrjW6NlS9WsX4d6mjV8+
 YWXYOZNfwJjULdfC9AAjWJVCNCh4fYC3RTu7rVeiDLSLpfj88Pnhm8HmEVTre8mTKXUq
 VKmgSNa1THWYkcuDYIPoFRYpHWCAS1BD6LtzYAqM4husMsyaU+rHuXR3rBd3cNtZDfM/
 /SNeqFysEM4GmrUJB9O0ihjbm6nGq18cLji9ZVY/psL0Vylg+pfysYHBpSXca0wZFFPF
 IbpgIC4+xc3cBvmixVmSYDJlfetFWdJDFYc2ftNVJcw8l5pUR9F8ZI7CJTWDHAJocDha /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ey7hfu2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 12:09:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 762C4100034;
 Fri,  5 Feb 2021 12:09:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66AA4229F3C;
 Fri,  5 Feb 2021 12:09:44 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 12:09:44
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <broonie@kernel.org>, <amelie.delaunay@foss.st.com>
Date: Fri, 5 Feb 2021 12:08:55 +0100
Message-ID: <1612523342-10466-2-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612523342-10466-1-git-send-email-alain.volmat@foss.st.com>
References: <1612523342-10466-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_06:2021-02-05,
 2021-02-05 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/8] spi: stm32: properly handle 0 byte
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

Fixes: dcbe0d84dfa5 ("spi: add driver for STM32 SPI controller")
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/spi/spi-stm32.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index db3e305d9ec4..137213633e6d 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1657,6 +1657,12 @@ static int stm32_spi_transfer_one(struct spi_master *master,
 	struct stm32_spi *spi = spi_master_get_devdata(master);
 	int ret;
 
+	/* Don't do anything on 0 bytes transfers */
+	if (transfer->len == 0) {
+		spi_finalize_current_transfer(master);
+		return 0;
+	}
+
 	spi->tx_buf = transfer->tx_buf;
 	spi->rx_buf = transfer->rx_buf;
 	spi->tx_len = spi->tx_buf ? transfer->len : 0;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
