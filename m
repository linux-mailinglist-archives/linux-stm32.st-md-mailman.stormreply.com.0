Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B084CD57E
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 14:52:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F3B4C60496;
	Fri,  4 Mar 2022 13:52:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F110C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 13:52:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 224C7LfC026984;
 Fri, 4 Mar 2022 14:51:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=9JE03u4sfdT0zvRoo95MCiqvaB33/YInHqU6AdtpVKc=;
 b=dk7XRLbqWXKacTDClup5Bgfmh3YJc5ZrIRf2U3JOp5LzHZ9H45c7s5M+YjJ4JqEyOBv+
 FVjYeOSsJ03uxz16/x/fzLRtIRldCRwsIoWSdBnIbfjIq+wqBrUYmMNgh6LYrgan8AVs
 rbX8MEZVM2cO+PC/R7GRSwJ3xZolrf+f8ST9oe3HkMHJbUbAnJYoQ7S8bgrtcUyQ+Pe+
 2JNUIoofngkeb/orgBeAZ6O8CF97wUvKNWtfbmpCCAC7l6jei2mZv6d28R9+C4VwKb08
 4kENr9i9/P/kjRIcO4WYCHOwH2D0Xus8KcnvsTzMSBPIEXelEe0s2DeXaou14tXjxTrf pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ek4jxd558-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 14:51:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01BF610002A;
 Fri,  4 Mar 2022 14:51:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D4A96222CBE;
 Fri,  4 Mar 2022 14:51:42 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 4 Mar 2022 14:51:42
 +0100
From: Yann Gautier <yann.gautier@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Mar 2022 14:51:31 +0100
Message-ID: <20220304135134.47827-1-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_06,2022-03-04_01,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, devicetree@vger.kernel.org,
 Marek Vasut <marex@denx.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] mmc: mmci: stm32: updates for SDIO
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

To properly manage SDIO on STM32 variant of PL18x, we cannot have DMA
Linked Lists enable. As it has to be disabled during probe sequence,
we cannot wait until we have communicated with the SDIO chip. This
should then be done through a DT property.
The MMC_PM_KEEP_POWER should also be disabled on STM32MP157x-DK2 board
as the clock used for wifi is not always-on.

Yann Gautier (3):
  dt-bindings: mmc: mmci: add a property to disable DMA LLI
  mmc: mmci: stm32: manage st,disable-dma-lli property
  mmc: mmci: manage MMC_PM_KEEP_POWER per variant config

 Documentation/devicetree/bindings/mmc/arm,pl18x.yaml |  5 +++++
 drivers/mmc/host/mmci.c                              |  5 ++++-
 drivers/mmc/host/mmci.h                              |  1 +
 drivers/mmc/host/mmci_stm32_sdmmc.c                  | 10 ++++++++--
 4 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
