Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CA0112ED1
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 16:44:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C25FC36B12;
	Wed,  4 Dec 2019 15:44:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1254C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2019 15:44:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4FgT5I032608; Wed, 4 Dec 2019 16:43:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=1KHVlGbdLUlS3MHsthncrt/yqL0wVHBN/1Q/sr0hK2s=;
 b=nUjjADABVBv2TZocy1HQV0Anci+89vfs6nf+tmUEpEDAAVxAOAUmFz6E/pDP6wf6tSir
 AYlGfI0KfQJB7GHJ1+Vj/KF+yQhR48jc1AA+CPJNcaHssvKTN1MRAhm+dgWHb+vE7kOd
 8JWbuJNvu31ooF3r33GVLi8zWp5YUpljgwWqmM+c15AZ3CSqMnMTGD+hnSUSrhXrtKRM
 pUGZ4YjBH2LXKGey2d4n9UdK/VqKNlPXI6sQoRdsptVepvleUd1vvKN8AOFj3amSrAsq
 Dzjgpzwjosyfqs0vOzfHIH6wYk4pxHMAs+FNaKGX1nIeUNeqt7HOJH0pThd3zCGUigKC SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wkes2wxy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 16:43:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF612100034;
 Wed,  4 Dec 2019 16:43:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3DE82C71B5;
 Wed,  4 Dec 2019 16:43:43 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 4 Dec 2019 16:43:43 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Wed, 4 Dec 2019 16:43:33 +0100
Message-ID: <20191204154333.7152-4-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191204154333.7152-1-olivier.moysan@st.com>
References: <20191204154333.7152-1-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
Subject: [Linux-stm32] [PATCH 3/3] ASoC: stm32: spdifrx: fix input pin state
	management
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

Changing input state in iec capture control is not safe,
as the pin state may be changed concurrently by ASoC
framework.
Remove pin state handling in iec capture control.

Note: This introduces a restriction on capture control,
when pin sleep state is defined in device tree. In this case
channel status can be captured only when an audio stream
capture is active.

Fixes: f68c2a682d44 ("ASoC: stm32: spdifrx: add power management")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_spdifrx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 3cb8e6db3eeb..3769d9ce5dbe 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
@@ -484,8 +483,6 @@ static int stm32_spdifrx_get_ctrl_data(struct stm32_spdifrx_data *spdifrx)
 	memset(spdifrx->cs, 0, SPDIFRX_CS_BYTES_NB);
 	memset(spdifrx->ub, 0, SPDIFRX_UB_BYTES_NB);
 
-	pinctrl_pm_select_default_state(&spdifrx->pdev->dev);
-
 	ret = stm32_spdifrx_dma_ctrl_start(spdifrx);
 	if (ret < 0)
 		return ret;
@@ -517,7 +514,6 @@ static int stm32_spdifrx_get_ctrl_data(struct stm32_spdifrx_data *spdifrx)
 
 end:
 	clk_disable_unprepare(spdifrx->kclk);
-	pinctrl_pm_select_sleep_state(&spdifrx->pdev->dev);
 
 	return ret;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
