Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFD5387A47
	for <lists+linux-stm32@lfdr.de>; Tue, 18 May 2021 15:43:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 679BEC5978A;
	Tue, 18 May 2021 13:43:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C32BC58D5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:43:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IDX56q023702; Tue, 18 May 2021 15:43:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=ClUM44THHlL1BycyMOmRsN86GSk4mDnz+xXOf8XGX8s=;
 b=TgMdYdTRkPqqRW4B2K8CKt6ybV8q+0Huq+i9A+RJIz544JJ72F7Ng8gVVbQwKR17AIIS
 Cd3xo+ZgdBXxM8NYneGLheRqpcndSWvtAjjpI8RS0CCF8+Y3NzP9V0HU8NevpU+dSJ+K
 qjKpLggiSh4y4Jv87bu2l+5pksxiRAnY4jaf7Clb0LfCuc3R13Rrw6+MQ2H4Anoy8J0b
 el94qfjAj62MuGTzS1hjkdoMlbdKYWHUHkJRhHkXBZ9kJTgAMjkAzMkUOH5DT306JFnt
 7KQ/nrxn2kyrWSR6Cjspn4QUPo+U1PZ0Vu6rLLpPWm6Sk75fheAVpJlR0sfa707Nyy4X Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38maunsgw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:43:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3260610002A;
 Tue, 18 May 2021 15:43:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BCB4227D8B;
 Tue, 18 May 2021 15:43:34 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:43:33
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 18 May 2021 15:43:29 +0200
Message-ID: <20210518134332.17826-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Subject: [Linux-stm32] [PATCH v4 0/3] MTD: spinand: Add
	spi_mem_poll_status() support
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

This series adds support for the spi_mem_poll_status() spinand
interface.
Some QSPI controllers allows to poll automatically memory 
status during operations (erase, read or write). This allows to 
offload the CPU for this task.
STM32 QSPI is supporting this feature, driver update are also
part of this series.

Changes in v4:
  - Remove init_completion() from spi_mem_probe() added in v2.
  - Add missing static for spi_mem_read_status().
  - Check if operation in spi_mem_poll_status() is a READ.
  - Update patch 2 commit message.
  - Add comment which explains how delays has been calculated.
  - Rename SPINAND_STATUS_TIMEOUT_MS to SPINAND_WAITRDY_TIMEOUT_MS.

Chnages in v3:
  - Add spi_mem_read_status() which allows to read 8 or 16 bits status.
  - Add initial_delay_us and polling_delay_us parameters to spi_mem_poll_status().
    and also to poll_status() callback.
  - Move spi_mem_supports_op() in SW-based polling case.
  - Add delay before invoquing read_poll_timeout().
  - Remove the reinit/wait_for_completion() added in v2.
  - Add initial_delay_us and polling_delay_us parameters to spinand_wait().
  - Add SPINAND_READ/WRITE/ERASE/RESET_INITIAL_DELAY_US and
    SPINAND_READ/WRITE/ERASE/RESET_POLL_DELAY_US defines.
  - Remove spi_mem_finalize_op() API added in v2.

Changes in v2:
  - Indicates the spi_mem_poll_status() timeout unit
  - Use 2-byte wide status register
  - Add spi_mem_supports_op() call in spi_mem_poll_status()
  - Add completion management in spi_mem_poll_status()
  - Add offload/non-offload case management in spi_mem_poll_status()
  - Optimize the non-offload case by using read_poll_timeout()
  - mask and match stm32_qspi_poll_status()'s parameters are 2-byte wide
  - Make usage of new spi_mem_finalize_op() API in
    stm32_qspi_wait_poll_status()

Patrice Chotard (3):
  spi: spi-mem: add automatic poll status functions
  mtd: spinand: use the spi-mem poll status APIs
  spi: stm32-qspi: add automatic poll status feature

 drivers/mtd/nand/spi/core.c  | 45 +++++++++++++------
 drivers/spi/spi-mem.c        | 85 ++++++++++++++++++++++++++++++++++++
 drivers/spi/spi-stm32-qspi.c | 83 +++++++++++++++++++++++++++++++----
 include/linux/mtd/spinand.h  | 22 ++++++++++
 include/linux/spi/spi-mem.h  | 14 ++++++
 5 files changed, 228 insertions(+), 21 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
