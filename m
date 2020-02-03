Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8441503DF
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2020 11:09:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3D33C36B0F;
	Mon,  3 Feb 2020 10:09:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A7DBC36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 10:09:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0139vM0F024591; Mon, 3 Feb 2020 11:09:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=opqGRUisAUeNTFQFarkeIQS2xwkVHOyUZ4dQfSDAHe0=;
 b=wzkVCfKQgstkYyZWedkGMuhFtDHfXlchmK2VomNhoUMd8QdTo2oL3EgpuN/UnPmVByBJ
 nePsgLC02Gk5mQgVk9k6fvpESVBk1Z5vKN7rz0AIdMtNgndTIAvJ4yZHK2qBKCP3QbC9
 FWmk2OTan5xzUKtSPpR3iqVvbUzS4D2GFkuIJE9exMhyzEpH+1BdkWeZCrfStbLueX9r
 4Z1edlhgoel11mPrHyQnrBZdxknQ63/RDi7pmZvndZTvDc+asF94BPJtNRUhfJY+s1f5
 I+p6O89fGadmuC4QACtZJhnxaX/yKzL6yzj268uWxLjDrjrwa4uhcaLCdCh46H7ccfj7 Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xw13ngdpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 11:09:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B203F10002A;
 Mon,  3 Feb 2020 11:09:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A599B2BE22E;
 Mon,  3 Feb 2020 11:09:04 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 3 Feb 2020 11:09:04 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Mon, 3 Feb 2020 11:08:14 +0100
Message-ID: <20200203100814.22944-7-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200203100814.22944-1-olivier.moysan@st.com>
References: <20200203100814.22944-1-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_02:2020-02-02,
 2020-02-03 signatures=0
Cc: Etienne Carriere <etienne.carriere@st.com>
Subject: [Linux-stm32] [PATCH 6/6] ASoC: stm32: i2s: improve error
	management on probe deferral
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

Do not print an error trace when deferring probe for I2S driver.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_i2s.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index cdcc00d9a67e..2478405727c3 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -831,25 +831,33 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 	/* Get clocks */
 	i2s->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(i2s->pclk)) {
-		dev_err(&pdev->dev, "Could not get pclk\n");
+		if (PTR_ERR(i2s->pclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get pclk: %ld\n",
+				PTR_ERR(i2s->pclk));
 		return PTR_ERR(i2s->pclk);
 	}
 
 	i2s->i2sclk = devm_clk_get(&pdev->dev, "i2sclk");
 	if (IS_ERR(i2s->i2sclk)) {
-		dev_err(&pdev->dev, "Could not get i2sclk\n");
+		if (PTR_ERR(i2s->i2sclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get i2sclk: %ld\n",
+				PTR_ERR(i2s->i2sclk));
 		return PTR_ERR(i2s->i2sclk);
 	}
 
 	i2s->x8kclk = devm_clk_get(&pdev->dev, "x8k");
 	if (IS_ERR(i2s->x8kclk)) {
-		dev_err(&pdev->dev, "missing x8k parent clock\n");
+		if (PTR_ERR(i2s->x8kclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get x8k parent clock: %ld\n",
+				PTR_ERR(i2s->x8kclk));
 		return PTR_ERR(i2s->x8kclk);
 	}
 
 	i2s->x11kclk = devm_clk_get(&pdev->dev, "x11k");
 	if (IS_ERR(i2s->x11kclk)) {
-		dev_err(&pdev->dev, "missing x11k parent clock\n");
+		if (PTR_ERR(i2s->x11kclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get x11k parent clock: %ld\n",
+				PTR_ERR(i2s->x11kclk));
 		return PTR_ERR(i2s->x11kclk);
 	}
 
@@ -907,7 +915,9 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 	i2s->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "pclk",
 						i2s->base, i2s->regmap_conf);
 	if (IS_ERR(i2s->regmap)) {
-		dev_err(&pdev->dev, "regmap init failed\n");
+		if (PTR_ERR(i2s->regmap) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Regmap init error %ld\n",
+				PTR_ERR(i2s->regmap));
 		return PTR_ERR(i2s->regmap);
 	}
 
@@ -918,8 +928,11 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
 					      &stm32_i2s_pcm_config, 0);
-	if (ret)
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "PCM DMA register error %d\n", ret);
 		return ret;
+	}
 
 	/* Set SPI/I2S in i2s mode */
 	ret = regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
