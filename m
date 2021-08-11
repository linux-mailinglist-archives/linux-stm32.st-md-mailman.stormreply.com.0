Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4F23E8FDB
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Aug 2021 13:55:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D04A0C5A4CD;
	Wed, 11 Aug 2021 11:55:03 +0000 (UTC)
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7784CC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Aug 2021 11:54:59 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56113ba856ac-647b9;
 Wed, 11 Aug 2021 19:54:47 +0800 (CST)
X-RM-TRANSID: 2ee56113ba856ac-647b9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.112.105.130])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66113ba81a7c-3dfcf;
 Wed, 11 Aug 2021 19:54:47 +0800 (CST)
X-RM-TRANSID: 2ee66113ba81a7c-3dfcf
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, olivier.moysan@foss.st.com,
 arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com
Date: Wed, 11 Aug 2021 19:55:23 +0800
Message-Id: <20210811115523.17232-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Cc: Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 Tang Bin <tangbin@cmss.chinamobile.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ASoC: stm32: spdifrx: Delete unnecessary
	check in the probe function
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

The function stm32_spdifrx_parse_of() is only called by the function
stm32_spdifrx_probe(), and the probe function is only called with
an openfirmware platform device. Therefore there is no need to check
the device_node in probe function.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/stm/stm32_spdifrx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 48145f553..8fe822903 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -908,13 +908,9 @@ static const struct of_device_id stm32_spdifrx_ids[] = {
 static int stm32_spdifrx_parse_of(struct platform_device *pdev,
 				  struct stm32_spdifrx_data *spdifrx)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *of_id;
 	struct resource *res;
 
-	if (!np)
-		return -ENODEV;
-
 	of_id = of_match_device(stm32_spdifrx_ids, &pdev->dev);
 	if (of_id)
 		spdifrx->regmap_conf =
-- 
2.20.1.windows.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
