Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 583F9240235
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Aug 2020 09:13:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A315C3FADA;
	Mon, 10 Aug 2020 07:13:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A6ADC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Aug 2020 07:13:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07A7CINi020015; Mon, 10 Aug 2020 09:12:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tlWSkjZvbyR9Qy2VKCg4c4PZZFkede4DNbC7P6xGMvY=;
 b=TRARDpzJXIWy6RTxpVgMBbTavkhh5qJTvbJYKCH31v0jHLeP2UBoDXfEX3EljOQ5vVAc
 1RbZxYvYZs/yEAEXLOf5L/poDf/QYTzbQQtW4eKmEhctWZ87dLGj+tFyY0LbWO2HVar/
 G7ZMmneLQjfE8RLoq1x07FkJa9m10KuYp0MyAgOQQnA+pti50PLbmPcoCwfTh6euiiaA
 lYs5GbbQsOVSzc3C+6ASrTSHa95XdNGKf7cBgyOizOZuq+uyGW7IvAofwuuFMjVPNMtb
 Ad4J/+gnRoLEhvL00AZ0AZQ28oeuHiiaQeeEOfWq0AljgxdNRWam9EoTuDj62sH1L4GX bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32sma16n87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 09:12:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 680B810003B;
 Mon, 10 Aug 2020 09:12:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C96B2AD9EB;
 Mon, 10 Aug 2020 09:12:52 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Aug 2020 09:12:52
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <broonie@kernel.org>, <amelie.delaunay@st.com>
Date: Mon, 10 Aug 2020 09:12:38 +0200
Message-ID: <1597043558-29668-6-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597043558-29668-1-git-send-email-alain.volmat@st.com>
References: <1597043558-29668-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_03:2020-08-06,
 2020-08-10 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 alain.volmat@st.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/5] spi: stm32: always perform registers
	configuration prior to transfer
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

SPI registers content may have been lost upon suspend/resume sequence.
So, always compute and apply the necessary configuration in
stm32_spi_transfer_one_setup routine.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
v2: identical to v1

 drivers/spi/spi-stm32.c | 42 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 9b90a22543fd..d4b33b358a31 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1597,41 +1597,33 @@ static int stm32_spi_transfer_one_setup(struct stm32_spi *spi,
 	unsigned long flags;
 	unsigned int comm_type;
 	int nb_words, ret = 0;
+	int mbr;
 
 	spin_lock_irqsave(&spi->lock, flags);
 
 	spi->cur_xferlen = transfer->len;
 
-	if (spi->cur_bpw != transfer->bits_per_word) {
-		spi->cur_bpw = transfer->bits_per_word;
-		spi->cfg->set_bpw(spi);
-	}
-
-	if (spi->cur_speed != transfer->speed_hz) {
-		int mbr;
-
-		/* Update spi->cur_speed with real clock speed */
-		mbr = stm32_spi_prepare_mbr(spi, transfer->speed_hz,
-					    spi->cfg->baud_rate_div_min,
-					    spi->cfg->baud_rate_div_max);
-		if (mbr < 0) {
-			ret = mbr;
-			goto out;
-		}
+	spi->cur_bpw = transfer->bits_per_word;
+	spi->cfg->set_bpw(spi);
 
-		transfer->speed_hz = spi->cur_speed;
-		stm32_spi_set_mbr(spi, mbr);
+	/* Update spi->cur_speed with real clock speed */
+	mbr = stm32_spi_prepare_mbr(spi, transfer->speed_hz,
+				    spi->cfg->baud_rate_div_min,
+				    spi->cfg->baud_rate_div_max);
+	if (mbr < 0) {
+		ret = mbr;
+		goto out;
 	}
 
-	comm_type = stm32_spi_communication_type(spi_dev, transfer);
-	if (spi->cur_comm != comm_type) {
-		ret = spi->cfg->set_mode(spi, comm_type);
+	transfer->speed_hz = spi->cur_speed;
+	stm32_spi_set_mbr(spi, mbr);
 
-		if (ret < 0)
-			goto out;
+	comm_type = stm32_spi_communication_type(spi_dev, transfer);
+	ret = spi->cfg->set_mode(spi, comm_type);
+	if (ret < 0)
+		goto out;
 
-		spi->cur_comm = comm_type;
-	}
+	spi->cur_comm = comm_type;
 
 	if (spi->cfg->set_data_idleness)
 		spi->cfg->set_data_idleness(spi, transfer->len);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
