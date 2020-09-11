Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B125265B49
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Sep 2020 10:16:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75BB1C3FAFE;
	Fri, 11 Sep 2020 08:16:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38B3FC3FAE2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Sep 2020 08:16:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08B87lQR003143; Fri, 11 Sep 2020 10:15:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=tIOlnbAKWQu2aJOslivWEU73AEic3d7q5RRGup+Q4RA=;
 b=ebqbjyKTK35dpUhKhRfw0A4aX24JhezA4xX5kLmgnbb9yjSTiIIbRh3tMV5lA3ouWqJA
 ftqQKc7gJ0rXVsu/Yr42sBlp+yxWsXNPJmABNeynOaDv1JGi/HUrrlTxgslPEaJmRAm4
 v98tTM2OR66tlbAb++E+Q2/sm3a74CNZcZBPnLLQv0OXeRjg5xCfF+zSxuHlOcdCzQ31
 chPAnA+7RnfdniITyrdiAcse5LNypec/Ykxsoiv7tsU+N62zyorNrU32DskQH/wbcZFA
 FppEieofoPPzpMhQPjwYL3V3PZcI0oT+zNbVhXtXItrF0mj3xQoVxop1C0yVTsxKNyH7 MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c1jfg8ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 10:15:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B1DA10002A;
 Fri, 11 Sep 2020 10:15:10 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag6node5.st.com [10.75.127.81])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F58A21E254;
 Fri, 11 Sep 2020 10:15:10 +0200 (CEST)
Received: from localhost (10.75.127.46) by GPXDAG6NODE5.st.com (10.75.127.81)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 11 Sep 2020 10:15:09 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Fri, 11 Sep 2020 10:15:07 +0200
Message-ID: <20200911081507.7276-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To GPXDAG6NODE5.st.com
 (10.75.127.81)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_02:2020-09-10,
 2020-09-11 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ASoC: stm32: sai: add pm_runtime support
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

Enable support of pm_runtime on STM32 SAI driver to allow
SAI power state monitoring.
pm_runtime_put_autosuspend() is called from ASoC framework
on pcm device close.
The pmdown_time delay is available in runtime context, and may be set
in SAI driver to take into account shutdown delay on playback.
However, this shutdown delay is already handled in the DAPMs
of the audio codec linked to SAI CPU DAI.
So, the choice is made, not to support this delay on CPU DAI side.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3fb9513cedb2..3aa1cf262402 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <sound/asoundef.h>
@@ -1559,10 +1560,14 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
 					 &sai->cpu_dai_drv, 1);
-	if (ret)
+	if (ret) {
 		snd_dmaengine_pcm_unregister(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
 }
 
 static int stm32_sai_sub_remove(struct platform_device *pdev)
@@ -1572,6 +1577,7 @@ static int stm32_sai_sub_remove(struct platform_device *pdev)
 	clk_unprepare(sai->pdata->pclk);
 	snd_dmaengine_pcm_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
