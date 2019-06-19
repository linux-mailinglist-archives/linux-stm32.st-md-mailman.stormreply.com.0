Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F276D4B586
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 11:52:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDFE9C593E2
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 09:52:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 108F9C593DC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 09:52:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5J9l43Z004729; Wed, 19 Jun 2019 11:52:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KZn7FsdsSW1lS9pTNM3TaxOO4OLqesB+hYagQc2H2rc=;
 b=Yo2dlOMPAcKUiV44zajT0RykRR5Ezi2KNnXo8q7RiDm3AT2OuIowwG9rxxEVV2A9p2Xn
 gccNsEdXCiT+/ZnF9uvYQvVJMKpxQvjNz/YFOTVICXGEgL8/CDQLmuV9gNazywidsvkr
 0iOqvbQsy/iRZ2qXb4cDLtj4trQM1RwPTDAKz7ETcTNlyYF7oY8GbuXVqG96JGXjCcPE
 QK2Z/KKid51T60PBNvhRAJFvaCf/4VXaH6a86Zx1vWCUZxFogYPO2afL8nr17P5YR3mq
 QUMa7TKgvx4qdAXbrQdGR8PsAe/yEapGxfn5RcbA4IzRnJNYbJv/nPQ38tn5n0hktZHF VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t7812u73g-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 11:52:15 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C69031;
 Wed, 19 Jun 2019 09:52:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB0BD24C7;
 Wed, 19 Jun 2019 09:52:14 +0000 (GMT)
Received: from localhost (10.75.127.47) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 19 Jun 2019 11:52:14 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <thierry.reding@gmail.com>, <robh+dt@kernel.org>, <alexandre.torgue@st.com>
Date: Wed, 19 Jun 2019 11:52:02 +0200
Message-ID: <1560937925-8990-3-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560937925-8990-1-git-send-email-fabrice.gasnier@st.com>
References: <1560937925-8990-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_05:, , signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjamin.gaignard@st.com,
 linux-pwm@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/5] pwm: stm32: use 3 cells ->of_xlate()
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

STM32 Timers support generic 3 cells PWM to encode PWM number, period and
polarity.

Fixes: 7edf7369205b ("pwm: Add driver for STM32 plaftorm")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/pwm/pwm-stm32.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index 4f84255..740e2de 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -608,6 +608,8 @@ static int stm32_pwm_probe(struct platform_device *pdev)
 	priv->regmap = ddata->regmap;
 	priv->clk = ddata->clk;
 	priv->max_arr = ddata->max_arr;
+	priv->chip.of_xlate = of_pwm_xlate_with_flags;
+	priv->chip.of_pwm_n_cells = 3;
 
 	if (!priv->regmap || !priv->clk)
 		return -EINVAL;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
