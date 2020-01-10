Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C58E0136ACC
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2020 11:16:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DA88C36B0D;
	Fri, 10 Jan 2020 10:16:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 255FBC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 10:16:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00AAE3Yq031197; Fri, 10 Jan 2020 11:16:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=AAD/GToJl17SoA/ncPjv8bRydogH2ZBtCfUpPZ40ub0=;
 b=zpzL2mKRX3XGn9bOo1I7gmQD4k8aW36S5+loLQuhg/U2FX8Zy9tx3LU9PvGDkccAfS3L
 nMQyx8AO/LbrSHjrFvlp8s5SWocc15VluEjiN6j9OZM5WHGW81paA0Qtd4pUuiCn188w
 ZPsF7j0IWLJgh3SYnzlfDisKc0MG/+p6WSOnaHQNUpn0w+iEA2fiSm9dkvQowp1/1rMs
 GG6k3bPmUujVOdYPXcrvMOJhCC9cxc1lehVrKdV1k/GqRSZ7Krj9aCTtpBXy5kGcMs5t
 iSZR1hTQRBc1OphTho7YI3NKeg8ouiv6/FYHeH+pDuu/ky3AtbrGiWWtD47VNKC6eXoA 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xepyt83ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2020 11:16:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BFA92100038;
 Fri, 10 Jan 2020 11:16:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B1AFE2A7907;
 Fri, 10 Jan 2020 11:16:12 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 Jan 2020 11:16:12 +0100
From: Pascal Paillet <p.paillet@st.com>
To: <rui.zhang@intel.com>, <edubezval@gmail.com>, <daniel.lezcano@linaro.org>, 
 <amit.kucheria@verdurent.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <p.paillet@st.com>,
 <david.hernandezsanchez@st.com>, <horms+renesas@verge.net.au>,
 <wsa+renesas@sang-engineering.com>, <linux-pm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 10 Jan 2020 11:16:05 +0100
Message-ID: <20200110101605.24984-7-p.paillet@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110101605.24984-1-p.paillet@st.com>
References: <20200110101605.24984-1-p.paillet@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_01:2020-01-10,
 2020-01-09 signatures=0
Subject: [Linux-stm32] [PATCH_V3 6/6] thermal: stm32: fix low threshold
	interrupt flood
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

With the STM32 thermal peripheral, it is not possible to dump the
temperature that has caused the interrupt.
When the temperature reaches the low threshold, we generally read
a temperature that is a little bit higher than the low threshold.
This maybe due to sampling precision, and also because the CPU becomes
hotter when it quits WFI mode.
In that case, the framework does not change the trip points. This leads
to a lot of low threshold interrupts.

The fix is to set the low threshold value 0.5 degrees Celsius
below the actual request.

The problem is not so frequent with the high threshold and it would
no be a good idea to set the threshold value higher than the request.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
 drivers/thermal/st/stm_thermal.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index aaf25ca2f118..1cc5e6c5709e 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -321,7 +321,8 @@ static int stm_thermal_set_trips(void *data, int low, int high)
 
 	if (low > -INT_MAX) {
 		sensor->low_temp_enabled = 1;
-		ret = stm_thermal_calculate_threshold(sensor, low, &th);
+		/* add 0.5 of hysteresis due to measurement error */
+		ret = stm_thermal_calculate_threshold(sensor, low - 500, &th);
 		if (ret)
 			return ret;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
