Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F144952D2B2
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 14:41:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B32ABC03FE2;
	Thu, 19 May 2022 12:41:48 +0000 (UTC)
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2F47C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 12:41:45 +0000 (UTC)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1])
 by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee262863b06ce8-a7a55;
 Thu, 19 May 2022 20:41:43 +0800 (CST)
X-RM-TRANSID: 2ee262863b06ce8-a7a55
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.99])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee162863b03441-e1d79;
 Thu, 19 May 2022 20:41:43 +0800 (CST)
X-RM-TRANSID: 2ee162863b03441-e1d79
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Thu, 19 May 2022 20:42:35 +0800
Message-Id: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Tang Bin <tangbin@cmss.chinamobile.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ASoC: stm32: sai: Use
	of_device_get_match_data() to simplify code
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

Retrieve of match data, it's better and cleaner to use
'of_device_get_match_data' over 'of_match_device'.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/stm/stm32_sai_sub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index dd636af81..d300605a2 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1500,7 +1500,6 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 static int stm32_sai_sub_probe(struct platform_device *pdev)
 {
 	struct stm32_sai_sub_data *sai;
-	const struct of_device_id *of_id;
 	const struct snd_dmaengine_pcm_config *conf = &stm32_sai_pcm_config;
 	int ret;
 
@@ -1508,10 +1507,9 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 	if (!sai)
 		return -ENOMEM;
 
-	of_id = of_match_device(stm32_sai_sub_ids, &pdev->dev);
-	if (!of_id)
+	sai->id = (uintptr_t)of_device_get_match_data(&pdev->dev);
+	if (!sai->id)
 		return -EINVAL;
-	sai->id = (uintptr_t)of_id->data;
 
 	sai->pdev = pdev;
 	mutex_init(&sai->ctrl_lock);
-- 
2.20.1.windows.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
