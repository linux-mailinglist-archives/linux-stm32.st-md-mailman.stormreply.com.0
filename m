Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 008C24DC4A4
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Mar 2022 12:20:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0457C60467;
	Thu, 17 Mar 2022 11:20:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D994C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Mar 2022 11:19:59 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22H8Jqq9004865;
 Thu, 17 Mar 2022 12:19:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=w2nyXAE0VDUlZL+SxQ7bmp0Dq7df9ir8gPXG9f7twWQ=;
 b=TkIkfs+tnPeaI6+HQTT8aFqjVZzN77AwFWUzIG8b8CTv/Xmj560Csk0WpnX+pgMPGj1a
 8lNTfEEv2f1yLer4D/Jw/xoLJK+t3vdjW3WojE+FurC8vQPufOwqls5kipFBqWtTna9c
 UZgGwzbccWotZstVPN2bXlZsdC3zbDaGsjGhKW7lIZRgYUip2VFbeiAAc171IUv6mGT1
 EgTMC5oLbgeFmPLpQPRicI7hxqRCcB3g/jNovQ8it9ZBVWrsJnrHbdUL5uGdaDKsnRLm
 7dGJnwyglwkupM68XyoX54vRf7v4jTqZnxi0JLUjfMgMLnGmWzNtW6AS6EbIJfF2zyRv PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63jc89j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 12:19:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C733100034;
 Thu, 17 Mar 2022 12:19:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4536E217B69;
 Thu, 17 Mar 2022 12:19:51 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 17 Mar 2022 12:19:51
 +0100
From: Yann Gautier <yann.gautier@foss.st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 17 Mar 2022 12:19:43 +0100
Message-ID: <20220317111944.116148-2-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317111944.116148-1-yann.gautier@foss.st.com>
References: <20220317111944.116148-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-17_04,2022-03-15_01,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] mmc: mmci: stm32: correctly check all
	elements of sg list
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

Use sg and not data->sg when checking sg list elements. Else only the
first element alignment is checked.
The last element should be checked the same way, for_each_sg already set
sg to sg_next(sg).

Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 drivers/mmc/host/mmci_stm32_sdmmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 9c13f2c31365..4566d7fc9055 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -62,8 +62,8 @@ static int sdmmc_idma_validate_data(struct mmci_host *host,
 	 * excepted the last element which has no constraint on idmasize
 	 */
 	for_each_sg(data->sg, sg, data->sg_len - 1, i) {
-		if (!IS_ALIGNED(data->sg->offset, sizeof(u32)) ||
-		    !IS_ALIGNED(data->sg->length, SDMMC_IDMA_BURST)) {
+		if (!IS_ALIGNED(sg->offset, sizeof(u32)) ||
+		    !IS_ALIGNED(sg->length, SDMMC_IDMA_BURST)) {
 			dev_err(mmc_dev(host->mmc),
 				"unaligned scatterlist: ofst:%x length:%d\n",
 				data->sg->offset, data->sg->length);
@@ -71,7 +71,7 @@ static int sdmmc_idma_validate_data(struct mmci_host *host,
 		}
 	}
 
-	if (!IS_ALIGNED(data->sg->offset, sizeof(u32))) {
+	if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
 		dev_err(mmc_dev(host->mmc),
 			"unaligned last scatterlist: ofst:%x length:%d\n",
 			data->sg->offset, data->sg->length);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
