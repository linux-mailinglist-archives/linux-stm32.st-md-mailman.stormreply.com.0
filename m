Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C0475A7C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 15:18:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 756D5C5F1F4;
	Wed, 15 Dec 2021 14:18:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA36AC5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 14:18:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFAOooD015669;
 Wed, 15 Dec 2021 15:17:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=aLTUQlWYfOHOTGX+dtGdyYLjVVle0utawp5ro00t3MM=;
 b=TWAiTlmutrUw51v6/3okVtvRChAVlgaN4yWhDbTo8YCBKIQ40H5yEeO17FR0oRLkMqi7
 owYDfUpjql5M27LUqckYZXlZZTPmyQ/IRDrZa+zF47D6BuTVJdcgX9LtcruGVaJ9aYIM
 m9cT2kE42qoA9bPi4boWCJrU4Wt6bhLMRBC71Ed7BiQT1VOhVhW0MVghdq2YvDrlY1vz
 y0LkZE7oBDj8LbfTYAvMS03mMxMxH9MkhaOeTXiMrvhC/VZxJXY4mYk5T3oRTq0G9hAn
 wyCrKCMcNwG/axFFEbOkaKxiRK50KXZz+nku3xwJbJOQb1NTrO4nyhrRDRKzifWniUoW 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cyeka95m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 15:17:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99E22100039;
 Wed, 15 Dec 2021 15:17:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 91E2A21EB8F;
 Wed, 15 Dec 2021 15:17:55 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 15:17:55
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
Date: Wed, 15 Dec 2021 15:17:25 +0100
Message-ID: <20211215141727.4901-3-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211215141727.4901-1-yann.gautier@foss.st.com>
References: <20211215141727.4901-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_09,2021-12-14_01,2021-12-02_01
Subject: [Linux-stm32] [PATCH 2/4] mmc: mmci: increase stm32 sdmmcv2 clock
	max freq
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

The variant->f_max is dependent on the IP, not on the SoC where it is
embedded. Set the max frequency of its source clock to 267MHz.
The frequency used will be limited by the IOs max frequency, set in the
SoC device tree.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 drivers/mmc/host/mmci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index c0478dfa61b9..45b8608c935c 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -280,7 +280,7 @@ static struct variant_data variant_stm32_sdmmc = {
 static struct variant_data variant_stm32_sdmmcv2 = {
 	.fifosize		= 16 * 4,
 	.fifohalfsize		= 8 * 4,
-	.f_max			= 208000000,
+	.f_max			= 267000000,
 	.stm32_clkdiv		= true,
 	.cmdreg_cpsm_enable	= MCI_CPSM_STM32_ENABLE,
 	.cmdreg_lrsp_crc	= MCI_CPSM_STM32_LRSP_CRC,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
