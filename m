Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C2681A195
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Dec 2023 15:58:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A37E2C6C841;
	Wed, 20 Dec 2023 14:58:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44721C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Dec 2023 14:58:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BKAmXS2012278; Wed, 20 Dec 2023 15:57:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=d0/rsgmO/GK6El7aXTcbV+jmBIbAy5RKIXMeVlFeF38=; b=8J
 7Y6tqkzguM7UnkU895zdVpGCTD78yZkw4YZeesU4wSK28IT6jGCbVIUej0Eyw1sO
 mCTl1vUrMimKUh9BS7iLm5QUdOVzCZFBqnsk78Ca1jjiQqHFPJkXShvUVGDqHow6
 G28x2s0R4XC3cIMJhzxKlu16RJ+Doh689NzUTIoSH45WtY0dhgG/j5pRf/mXHbs6
 DtLiZNey5t5NlHJtZiPx58ePa2C6er+eXQH+xYoBROZjO1hqjNT8ADN04GLP73Zy
 NUUGXdP9p7/8AtNDmznda0NDpLlRPs2ArPQOp9AqU9SAt52uiglnxG8oJqNhYlQm
 mYNRS+7OSER3d+8kUHig==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v13nhhqt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Dec 2023 15:57:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 524C7100059;
 Wed, 20 Dec 2023 15:57:55 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A07721B511;
 Wed, 20 Dec 2023 15:57:55 +0100 (CET)
Received: from localhost (10.201.20.59) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Dec
 2023 15:57:54 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <william.gray@linaro.org>
Date: Wed, 20 Dec 2023 15:57:17 +0100
Message-ID: <20231220145726.640627-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.59]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-20_08,2023-12-20_01,2023-05-22_02
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 01/10] counter: stm32-timer-cnt: rename
	quadrature signal
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

Drop the Quadrature convention in the signal name. On stm32-timer:
- Quadrature A signal corresponds to timer input ch1, hence "Channel 1"
- Quadrature B signal corresponds to timer input ch2, hence "Channel 2".
So name these signals after their channel. I suspect it referred to the
(unique) quadrature counter support earlier, but the physical input
really is CH1/CH2. This will be easier to support other counter modes.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- Drop the "Quadrature" convention from the signal name, as suggested by
  William
---
 drivers/counter/stm32-timer-cnt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 6206d2dc3d47..36d812ddf162 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -279,11 +279,11 @@ static const struct counter_ops stm32_timer_cnt_ops = {
 static struct counter_signal stm32_signals[] = {
 	{
 		.id = 0,
-		.name = "Channel 1 Quadrature A"
+		.name = "Channel 1"
 	},
 	{
 		.id = 1,
-		.name = "Channel 1 Quadrature B"
+		.name = "Channel 2"
 	}
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
