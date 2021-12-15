Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03217475A7B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 15:18:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 693C4C5F1F1;
	Wed, 15 Dec 2021 14:18:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82FE8C5E2C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 14:18:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BF9DUax011325;
 Wed, 15 Dec 2021 15:17:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=YyNwvIlhQ54K6BfHJlIZ/f2Pz7aIwge6Xq8yYR8CYh4=;
 b=mgi+gfZjF0mC0/1JZyeYJR/dLlXwEqdcnlpcUhONxDxNgMno8kIfts32tdLe9pIvLuCH
 0PK5njxbcY1zmBQiL7Gc+UIpIbYKVdymC8xd3N4UFmpc/3Aa18ZdK0SwMzW/rarrwgRc
 DV6DdF40hDrwUs8n2c+fSYrHHRg1H6KW9wy/u1V9X49eBe5e3qdZ+Fpu2cbF8udCejTa
 4yQALaqpcYlR6qEFECxTnbMReCWiHGADZrw1Y8O+Cyby4sBFAcsje3PAY2wM3QHW1tsa
 JSLauNObpNpL25SkfjjzFuFSnZWdfULQwAD5XXwJdhTILZ9236nyweXpfP5HqfMvU9ap UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cy79j42k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 15:17:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F7D510002A;
 Wed, 15 Dec 2021 15:17:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A8C521EB8F;
 Wed, 15 Dec 2021 15:17:54 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 15:17:53
 +0100
From: Yann Gautier <yann.gautier@foss.st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 Vladimir Zapolskiy <vz@mleia.com>, <u.kleine-koenig@pengutronix.de>,
 Marek Vasut <marex@denx.de>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Ludovic
 Barre <ludovic.barre@foss.st.com>,
 <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 15 Dec 2021 15:17:23 +0100
Message-ID: <20211215141727.4901-1-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_09,2021-12-14_01,2021-12-02_01
Subject: [Linux-stm32] [PATCH 0/4] mmc: mmci: updates for STM32MP13
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

The new STmicroelectronics STM32MP13 SoC embeds a new version
of the SDMMC peripheral (v2.2).
It supports SDR104 and HS200 modes.

Yann Gautier (4):
  mmc: mmci: Add support for sdmmc variant revision v2.2
  mmc: mmci: increase stm32 sdmmcv2 clock max freq
  mmc: mmci: stm32: clear DLYB_CR after sending tuning command
  mmc: mmci: add hs200 support for stm32 sdmmc

 drivers/mmc/host/mmci.c             | 7 ++++++-
 drivers/mmc/host/mmci_stm32_sdmmc.c | 7 +++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
