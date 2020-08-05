Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B68623C669
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 09:04:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9451C3F92D;
	Wed,  5 Aug 2020 07:04:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ABCFC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 07:04:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07573OeV002381; Wed, 5 Aug 2020 09:04:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=mHOJKnHJsQsECWgBa5P5GNhTZcl6XdpIPJZycY/1lZM=;
 b=rD65W27qxYGdWWTDzTRmZJMM2bqLIFw4x8BSuWy0KXuWfC138B3xMS/UuhAo3iEpsznd
 HHwu6BXDSRCWJNza+vLWq3T7kDrvfH3tOKazLh/Z/KjEDEr8UGT/jDP4Mi+4sgaEeI2E
 tb1oL3l0S1rzBYKPrxSSkmYc4o9c30I5heGEHFML8Vsn0W0sI382imLYsoO/ktbwAq3m
 YqqLxcOINTAexGhIxvof0YYwqTLufAMpreK2RoAoNCrTwtH1DolcM3g+n68yD9P6+fcv
 M+jzRZRVmEfy47ZxbZXEX3K5S4f9g3/G4e/O5B37DUSxJe1zaN2vvIzClsbQ054H4eF0 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32n6knf7dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 09:04:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9AC2410002A;
 Wed,  5 Aug 2020 09:04:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A7AE2A4D8E;
 Wed,  5 Aug 2020 09:04:13 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug 2020 09:04:13
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <broonie@kernel.org>, <amelie.delaunay@st.com>
Date: Wed, 5 Aug 2020 09:01:55 +0200
Message-ID: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_04:2020-08-03,
 2020-08-05 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 alain.volmat@st.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/18] spi: stm32: various driver enhancements
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

This serie provides spi-stm32 driver enhancements in various area such as:
  - code simplification
  - race condition fix
  - fixes in case of usage of SPI with DMA
  - suspend/resume fixes
  - issues triggered by spi-loopback-test

Alain Volmat (4):
  spi: stm32-spi: defer probe for reset
  spi: stm32: always perform registers configuration prior to transfer
  spi: stm32: properly handle 0 byte transfer
  spi: stm32h7: ensure message are smaller than max size

Amelie Delaunay (10):
  spi: stm32: use bitfield macros
  spi: stm32h7: replace private SPI_1HZ_NS with NSEC_PER_SEC
  spi: stm32h7: fix irq handler
  spi: stm32h7: rework rx fifo read function
  spi: stm32h7: fix dbg/warn/err conditions in irq handler
  spi: stm32: wait for completion in transfer_one()
  spi: stm32: fix fifo threshold level in case of short transfer
  spi: stm32h7: fix handling of dma transfer completed
  spi: stm32: improve suspend/resume management
  spi: stm32: fix stm32_spi_prepare_mbr in case of odd clk_rate

Antonio Borneo (3):
  spi: stm32h7: remove unused mode fault MODF event handling
  spi: stm32h7: fix race condition at end of transfer
  spi: stm32: move spi disable out of irq handler

Etienne Carriere (1):
  spi: stm32-spi: driver uses reset controller only at init

 drivers/spi/spi-stm32.c | 425 ++++++++++++++++++++++++++++--------------------
 1 file changed, 247 insertions(+), 178 deletions(-)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
