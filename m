Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD8D15E66B
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2020 17:48:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2047C36B0B;
	Fri, 14 Feb 2020 16:48:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B342FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 16:48:07 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EGh4gr004629; Fri, 14 Feb 2020 17:47:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=FNp5VEUp2vyJtgWvaOR8hQzLMqdi1PLqDQdOv//CVm4=;
 b=Fm5MEs5JszxH/P4yoMoGZ66cmxMJN5n28ZfM9u9Q7IEGrK3MZdmL6qhHxb1Z4W9Fc07F
 409fvSJe3CpLPLY3AdgpNj8+Ey2SPEjGHWvs2mS+WvLtS1G7+3M9Sc4+Uwna7Q31BlCo
 xL+awQnL60pOZjTXsCtzxgswpgDbmGkvmuBmu9Vmceu4vG0mGq+5WgQPeqXNSfP9uTDK
 Lq+coSdr6fUqA8L4oMZcmPlSLNmPPmK7ufbtvNCqnJQ6+lCKPezucvIk/IR5nK3l5UgA
 wQ6Z9bhObhwq62sxBq6tn2dzphVlQynoysfASHsn35rKPT/jfD1ldenHhC7syFHM8tjb eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufhw6kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 17:47:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47E82100038;
 Fri, 14 Feb 2020 17:47:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 379F62C0965;
 Fri, 14 Feb 2020 17:47:43 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 14 Feb 2020 17:47:42 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <jic23@kernel.org>
Date: Fri, 14 Feb 2020 17:46:35 +0100
Message-ID: <1581698795-437-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_05:2020-02-12,
 2020-02-14 signatures=0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] iio: trigger: stm32-timer: disable master
	mode when stopping
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

Master mode should be disabled when stopping. This mainly impacts
possible other use-case after timer has been stopped. Currently,
master mode remains set (from start routine).

Fixes: 6fb34812c2a2 ("iio: stm32 trigger: Add support for TRGO2 triggers")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/iio/trigger/stm32-timer-trigger.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 2e0d32a..2f82e8c 100644
--- a/drivers/iio/trigger/stm32-timer-trigger.c
+++ b/drivers/iio/trigger/stm32-timer-trigger.c
@@ -161,7 +161,8 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 	return 0;
 }
 
-static void stm32_timer_stop(struct stm32_timer_trigger *priv)
+static void stm32_timer_stop(struct stm32_timer_trigger *priv,
+			     struct iio_trigger *trig)
 {
 	u32 ccer, cr1;
 
@@ -179,6 +180,12 @@ static void stm32_timer_stop(struct stm32_timer_trigger *priv)
 	regmap_write(priv->regmap, TIM_PSC, 0);
 	regmap_write(priv->regmap, TIM_ARR, 0);
 
+	/* Force disable master mode */
+	if (stm32_timer_is_trgo2_name(trig->name))
+		regmap_update_bits(priv->regmap, TIM_CR2, TIM_CR2_MMS2, 0);
+	else
+		regmap_update_bits(priv->regmap, TIM_CR2, TIM_CR2_MMS, 0);
+
 	/* Make sure that registers are updated */
 	regmap_update_bits(priv->regmap, TIM_EGR, TIM_EGR_UG, TIM_EGR_UG);
 }
@@ -197,7 +204,7 @@ static ssize_t stm32_tt_store_frequency(struct device *dev,
 		return ret;
 
 	if (freq == 0) {
-		stm32_timer_stop(priv);
+		stm32_timer_stop(priv, trig);
 	} else {
 		ret = stm32_timer_start(priv, trig, freq);
 		if (ret)
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
