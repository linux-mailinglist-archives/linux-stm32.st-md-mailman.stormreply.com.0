Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D747F29E517
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 08:52:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B84CC424CB;
	Thu, 29 Oct 2020 07:52:06 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98C09C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 07:44:53 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id e15so1647152pfh.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 00:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4m44KFmOk0eNak9iaIXUK5dhQnw6EEz9bAOQ7LV+kgQ=;
 b=Z32XblI1UwfpGeY8IGKRoOCREAJBv4Wxmzx/PLQRnyG9iRBWogbO/1HMCzCTfeM0nn
 oOUKxXvcMs67QtS/qOVos3656g5Jru9a1AHxBB7pGVLZsWUcn/TZ0zZZ5Byco4SUgk0h
 vGFKD7MjWb3EH5ezFm9ywERMaTOFjjtZjCTN7NhYZE+RPKUCIMReGzXZZgNxr9CqBKMs
 WLBf3tg31g9bfiem+WrEr8Oy+AcIC95wj21pLn5u0J6QaPk92dPGhyS+JWobMgU7rCsS
 YN5VGPSvTqYgAvGoQZQgHylg7ECE9n9yJh3oNq4tF6RstGsRSVhUQn2FXlbQPw/lUoBk
 DIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4m44KFmOk0eNak9iaIXUK5dhQnw6EEz9bAOQ7LV+kgQ=;
 b=XQ8oqfESkb20+CLHR5/HXAgYkF7kYIiEFzK1hsPZVIIkVx2QyL0uywPeZrX9qVINnn
 Ei9flOtn53JoBFL/UPVz2nyDhjCmb5vHSnjV6FNHn6DtqbNpJZGdrLBGVMlrFZ6cs+sM
 ldOO0JAHMPw3OORWzLLSPFMbHuD0JV+xgZPDhuzJBDr9WzfPtPOjkxEZjUQio7K+CL5o
 bQ07SLB6AvP5XyhDvhJyf8Z8txkWw6O0MbmiflTtdReyK29BEG6/dUCCIXRV2pbJ+3G8
 fCCPvWo+jU0U92xp1HmvNY5PXIA3h0zuxW0sKtVOeih8Iph66pm8Muy+zB+5BOzEBsrS
 cuKg==
X-Gm-Message-State: AOAM530MHr9MMR/m32P664d0FdOb7OviyMl4NjfeM3GoSFzd8UtXHvMn
 mB6na7qj1pQVes1y/nFBFuU=
X-Google-Smtp-Source: ABdhPJxUStiKBOq+y2Ae/MQ+HXEPed/8Ir9KaIDXM7129LlFpnxTXtwP3ZWBQNm6V8CiZ8tUgGLDjA==
X-Received: by 2002:a63:490e:: with SMTP id w14mr2951099pga.275.1603957492230; 
 Thu, 29 Oct 2020 00:44:52 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id s11sm1960068pjm.4.2020.10.29.00.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:44:51 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Date: Thu, 29 Oct 2020 15:42:51 +0800
Message-Id: <20201029074301.226644-15-coiby.xu@gmail.com>
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
Subject: [Linux-stm32] [PATCH 15/25] ASoC: stm32: sai: remove unnecessary
	CONFIG_PM_SLEEP
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
 sound/soc/stm/stm32_sai.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index 058757c721f0..40c9e554a3d7 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -245,7 +245,6 @@ static int stm32_sai_probe(struct platform_device *pdev)
 	return devm_of_platform_populate(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * When pins are shared by two sai sub instances, pins have to be defined
  * in sai parent node. In this case, pins state is not managed by alsa fw.
@@ -280,7 +279,6 @@ static int stm32_sai_resume(struct device *dev)
 
 	return pinctrl_pm_select_default_state(dev);
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops stm32_sai_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(stm32_sai_suspend, stm32_sai_resume)
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
