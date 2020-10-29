Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDE329E515
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 08:52:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84CAFC424C4;
	Thu, 29 Oct 2020 07:52:06 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7DF3C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 07:44:31 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f21so902297plr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 00:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jpXiCRDdVAzZIis20MTViXOEmD/OZxxv4T9W35au2I=;
 b=WGv43752G20ZWCFW2dJnU7OTDDBqJHnRjacRItawB/45pQd8bZo/Jo94pL+f8Saczs
 snbxfZ5ieEjYPt7HQFA8U95p6BXyibnyHeGLF60W19Wy0K0LWCIRD5IbNyGhMrY0Wn4q
 +KBqJyu9JK0mr/RAOQJPOadPRbaz6TUL1bWqRYqGlplmQARzkl+X99F3zKItG9seZeyh
 0+JVpIl/+R+1SL+5v8GF01kxDp2UbJ+XpTmn6KVxc2XdzQPrIAi2vuIRHzGLMI51aLRh
 zBKU1vv/6fkJlRD87TIrBnW0fze3JjdKzvf4nkDTUl6ZN3OmGovDgDAAdQDk+dj2j8FK
 vtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jpXiCRDdVAzZIis20MTViXOEmD/OZxxv4T9W35au2I=;
 b=MN6nnESWEElwjZt62LXctZVoYLVkaoiwutMuFaQQYo+OVgX27KDmJt2UORDB7S3bZM
 dZDuIbM4u5KxNiM34P0gp5M0XZEmp+leJtu8tXShM/uBtI09Z5nZM5fTWS4El1LeBJuT
 T21AD6dafLrDlnvAqbPhjPBoGfMXlISm3Aproy89YkpaaybMz1OpIM2dAWU4eDqfALSM
 SFCcjMcz08N6vDl4F/bYqOxeUfkkVcrgWYADW1RMDcheJLCg4cRmNgNjY5SzYbMTIuRV
 LCHJfa+3IiF5CPAl2AiVT3w/mRSsh40nPH96VG55md82GTaEZ8TPaGHuB8RsptGJ/lBm
 tFGA==
X-Gm-Message-State: AOAM531MqNv1PLTkcLaHR9o6u2fYprv/7gqywsVyb8Rz5ZY1G+pxEvr4
 3CiQ/aTAVDHz9BJPPnSgC8M=
X-Google-Smtp-Source: ABdhPJy6bo/OOxq28BpnumOynqNEHVJ3pfP9rwwlCtI4HJlzGRADoHpABRPlFl/v/E/8HksFmQHsxA==
X-Received: by 2002:a17:902:fe07:b029:d6:88c5:f5d5 with SMTP id
 g7-20020a170902fe07b02900d688c5f5d5mr2125554plj.63.1603957470376; 
 Thu, 29 Oct 2020 00:44:30 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id n18sm1800059pff.129.2020.10.29.00.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:44:30 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Date: Thu, 29 Oct 2020 15:42:49 +0800
Message-Id: <20201029074301.226644-13-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 07:52:04 +0000
Cc: "moderated list:STM32 AUDIO ASoC DRIVERS" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH 13/25] ASoC: stm32: spdifrx: remove
	unnecessary CONFIG_PM_SLEEP
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 1bfa3b2ba974..40262ff0c588 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -1056,7 +1056,6 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 
 MODULE_DEVICE_TABLE(of, stm32_spdifrx_ids);
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32_spdifrx_suspend(struct device *dev)
 {
 	struct stm32_spdifrx_data *spdifrx = dev_get_drvdata(dev);
@@ -1075,7 +1074,6 @@ static int stm32_spdifrx_resume(struct device *dev)
 
 	return regcache_sync(spdifrx->regmap);
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops stm32_spdifrx_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(stm32_spdifrx_suspend, stm32_spdifrx_resume)
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
