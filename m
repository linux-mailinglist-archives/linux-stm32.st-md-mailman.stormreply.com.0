Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8199112D9A
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 15:41:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 634B7C36B0B;
	Wed,  4 Dec 2019 14:41:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD32DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2019 14:41:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4EbKn0030002; Wed, 4 Dec 2019 15:41:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=msnzT3bQjxBXfDW7XN2FR7skV/AYmG1hk4DFFqU0wpc=;
 b=pOs7dczTKvqC/9Du7x6CWF3YZJjgeeprVGuLq5y7kGfb+KdJM6uD7592+tr+Cuh/hJW/
 GxddjcjJ72MRUfvbOpYLrxCwJTK0pd//apX1VOOmjUsKlipWY+mj4wJMnbNQvC8nZWDG
 /vMhMFnyS0Mst6PSMoBcj6viPuAQ0+AmxkUoMSqJ6iTiAwX9qm9p/jo8LhiRLQQP3bWn
 JDvCyLQpfJ5xpQTbDptwhz62EQO0F2nC99IF5TzfCpDDtdRH1mQMLtGl5ByE9QRDmvp9
 uT5ZVoN8uTeJyZlIT9UqrfqYwJJcnklsWcepzzJj4rTkuDW7U8Mq6O3motHUlzLE23so vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wkes2wmqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 15:41:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 293E210003D;
 Wed,  4 Dec 2019 15:41:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 193A42BEC77;
 Wed,  4 Dec 2019 15:41:07 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 4 Dec 2019 15:41:06
 +0100
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2019 15:41:06 +0100
Message-ID: <20191204144106.10876-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] pinctrl: pinmux: fix a possible null pointer
	in pinmux_can_be_used_for_gpio
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

This commit adds a check on ops pointer to avoid a kernel panic when
ops->strict is used. Indeed, on some pinctrl driver (at least for
pinctrl-stmfx) the pinmux ops is not implemented. Let's assume than gpio
can be used in this case.

Fixes: 472a61e777fe ("pinctrl/gpio: Take MUX usage into account")

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index e914f6efd39e..9503ddf2edc7 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -85,7 +85,7 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned pin)
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
 
 	/* Can't inspect pin, assume it can be used */
-	if (!desc)
+	if (!desc || !ops)
 		return true;
 
 	if (ops->strict && desc->mux_usecount)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
