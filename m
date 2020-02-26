Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A400C16F9BF
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 09:40:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62159C36B0E;
	Wed, 26 Feb 2020 08:40:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 840E8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 08:40:38 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01Q8ckpw015436; Wed, 26 Feb 2020 09:40:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=qYNCz7bGkBTTaNO03CNPss3EnrpQ6PC4YPTkV05TJOM=;
 b=Bp6LWZeUbDd9/bjJiGIWsKryeSmrlLTP2fafPjXcT7aN+tjxBggpXGZGWspFxamZ6RfQ
 m27AcW+IxkOOZNtVkOxrSAuEwpLT6MWfMYq1by0Bjz8lsFhnki+xSCo6LuruVekSUH42
 jpjl/360ynLmkp9m92Xesb9v45xZuFmosJsM+NniCidYkvAWY/6deH4Z8I6ja0xPJchg
 mqPV+6TrHaepw9Z5b+qBOT6NdoGugev5i+KaNUbgG48d8FXTxnhCeS7irPHGrlIFrVOq
 6AZBi1THuUtTsi9XwSEo4dviPrq9OxZJ9rNXucFl60kOXXebHWegQEHpYrS147GajNkD ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ydcnj2h2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 09:40:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02F9910003B;
 Wed, 26 Feb 2020 09:40:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E67DB2AC906;
 Wed, 26 Feb 2020 09:40:16 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 26 Feb 2020 09:40:16 +0100
From: Ludovic Barre <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 26 Feb 2020 09:40:10 +0100
Message-ID: <20200226084014.5242-1-ludovic.barre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_02:2020-02-25,
 2020-02-26 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] mmc: mmci_sdmmc: fixes and improvements
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

This patch series fixes some problems:
-dma api debug warning to segment size check.
-dma_unmap_sg missing on not prepared request.
-Clear busyd0end irq flag when a R1B busy is completed.
-Initialize pwr|clk|datactrl_reg with their hardware values at probe.

Ludovic Barre (4):
  mmc: mmci_sdmmc: fix DMA API warning max segment size
  mmc: mmci_sdmmc: fix DMA API warning overlapping mappings
  mmc: mmci_sdmmc: fix clear busyd0end irq flag
  mmc: mmci: initialize pwr|clk|datactrl_reg with their hardware values

 drivers/mmc/host/mmci.c             |  4 ++++
 drivers/mmc/host/mmci_stm32_sdmmc.c | 21 +++++++++++++--------
 2 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
