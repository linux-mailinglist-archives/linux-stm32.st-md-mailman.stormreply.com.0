Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F03051050EB
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 11:58:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF750C36B0B;
	Thu, 21 Nov 2019 10:58:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06F92C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 10:58:49 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALAv0D0003536; Thu, 21 Nov 2019 11:58:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+ryPb9ETJPdsYWVGk+7MMd7fF4WRlNWEqIU9BO/5o/E=;
 b=c5n+Tu9CAwZRtKQzeN+Gk8BIJqhT8+m8ggCyptm0ywzgiRLJSE8JSbYgaf1Q74YvNe1S
 iMiCAiNSbaz3lmcSc7eZg7p//tEkJuDgffXpQK99A7AzmXj1NpBdeF19kOI/v+42rGPl
 bEavf9hTpDw/AAtrkegWrKwv+oProMFBNjv7Cc24wM/8DuOc2mv11/btkS5JYsrmFz9N
 PVqwFnPezKkLlkIvUnhvAu29qnHPVEgK2R3xSroOwu7SGUS67BONKotm7AMjZxas/4xp
 tp0CnzLLlB5iguJknqTti1mf3A7HAB2X9a5RYhaW9Q5TtcE0knB4TjmWARN19XfJQPa6 zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9usjv1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 11:58:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34550100034;
 Thu, 21 Nov 2019 11:58:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2690D2B90B8;
 Thu, 21 Nov 2019 11:58:42 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 21 Nov 2019 11:58:41 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>
Date: Thu, 21 Nov 2019 11:58:00 +0100
Message-ID: <1574333880-29339-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_02:2019-11-21,2019-11-21 signatures=0
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stm32: remove automatic output enable
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

Don't use AOE (automatic output enable) by default.
In case of break events, pwm is automatically re-enabled on next pwm
cycle otherwise.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/pwm/pwm-stm32.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index 359b085..3079818 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -374,9 +374,7 @@ static int stm32_pwm_config(struct stm32_pwm *priv, int ch,
 	else
 		regmap_update_bits(priv->regmap, TIM_CCMR2, mask, ccmr);
 
-	regmap_update_bits(priv->regmap, TIM_BDTR,
-			   TIM_BDTR_MOE | TIM_BDTR_AOE,
-			   TIM_BDTR_MOE | TIM_BDTR_AOE);
+	regmap_update_bits(priv->regmap, TIM_BDTR, TIM_BDTR_MOE, TIM_BDTR_MOE);
 
 	return 0;
 }
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
