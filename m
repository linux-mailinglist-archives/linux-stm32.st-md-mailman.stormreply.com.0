Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C231108B
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 20:00:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D006BC57B60;
	Fri,  5 Feb 2021 18:59:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 994FAC57B52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 18:59:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115IrNAr001142; Fri, 5 Feb 2021 19:59:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=0uuaDVuF5/T12efyt8yM5xTo3BeRGMfGxhiT7EoQ6Ec=;
 b=u7SBFh0flkgFtFH7hl+XIy6sCOgkIxHOD+X9SLkJEpxzX5wW9djwr6FJPOEhWT+DX8OG
 Jdaqlm/1ulN3HboqQh+0MOBBXQhl71wkQwwfomjO0yq04BtG/9VFLudwvaWuJbX0bOEo
 79G6MpeSeEe5F41LhLnn6bH2vvyjnq0zDXtxfFFOu81lR872PN0qMHZLXAXjpy9I6qFP
 73uutczvHPJz9N5eVAbXSJnpWRUtrCYn4U+ZZjqNwR1aAOkDfFQStbmI7OrHUrlC1sau
 rBKI9VFAITvshoccuzvOvxDAkvmA9lBCzMI2mKrwCVHRHMbdo4OtdiTkgOUrPcIlFtK+ IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36h1kebvnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 19:59:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AEB7100034;
 Fri,  5 Feb 2021 19:59:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 401D72C38D3;
 Fri,  5 Feb 2021 19:59:48 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 19:59:47
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <broonie@kernel.org>, <amelie.delaunay@foss.st.com>
Date: Fri, 5 Feb 2021 19:59:31 +0100
Message-ID: <1612551572-495-8-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612551572-495-1-git-send-email-alain.volmat@foss.st.com>
References: <1612551572-495-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_10:2021-02-05,
 2021-02-05 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/8] spi: stm32h7: replace private
	SPI_1HZ_NS with NSEC_PER_SEC
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

Replace SPI_1HZ_NS private constant with NSEC_PER_SEC, which is easier
to read and understand.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
v2: identical to v1

 drivers/spi/spi-stm32.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 54196cecfe2e..f3a4ff60ac4b 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -162,8 +162,6 @@
 #define SPI_3WIRE_TX		3
 #define SPI_3WIRE_RX		4
 
-#define SPI_1HZ_NS		1000000000
-
 /*
  * use PIO for small transfers, avoiding DMA setup/teardown overhead for drivers
  * without fifo buffers.
@@ -1525,7 +1523,7 @@ static void stm32h7_spi_data_idleness(struct stm32_spi *spi, u32 len)
 
 	cfg2_clrb |= STM32H7_SPI_CFG2_MIDI;
 	if ((len > 1) && (spi->cur_midi > 0)) {
-		u32 sck_period_ns = DIV_ROUND_UP(SPI_1HZ_NS, spi->cur_speed);
+		u32 sck_period_ns = DIV_ROUND_UP(NSEC_PER_SEC, spi->cur_speed);
 		u32 midi = min_t(u32,
 				 DIV_ROUND_UP(spi->cur_midi, sck_period_ns),
 				 FIELD_GET(STM32H7_SPI_CFG2_MIDI,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
