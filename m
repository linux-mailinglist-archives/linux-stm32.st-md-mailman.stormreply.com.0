Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC7929E514
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 08:52:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3F26C424C1;
	Thu, 29 Oct 2020 07:52:05 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2EC5C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 07:44:25 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c20so1637169pfr.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVqH6ZdDZsxjhz6ACxTIa4F9n2pNeqLVCfy2un8GTaA=;
 b=TkJ1akdfIG0oF27sYc+gc8WT0yjtsPijZW5V4jOCBNoMk3VeHalSL2CyeLWeT2FEL8
 I6Q1Cj2eSEz4INHzkIZuePaC7S86drVW9TDaVxNS2PWkqc5eckuuAWzdTxpSp3yzfV6i
 5nbuNAJQB5dSfCGWywWkWo+j36Mvdt1UpiDiLfGFEOCcX0PMKUBpngEqIKDSP06MtHQi
 1FPCuRdZjfcV8VHzvRerkB6Kqq2D91okuEuDNWXX8nmXfVCMULqI6HcDujDqOqVEteqE
 Cov05UKf9ZngGAHfEGIljZ/T0AQcjjlzfX0zQwW1mv9SL5fcEx63QNS2Q0++I6J7gYVc
 VtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVqH6ZdDZsxjhz6ACxTIa4F9n2pNeqLVCfy2un8GTaA=;
 b=p8gUgiOGcGRJJoMJhV26a1HqvLLHiNhu7vPmb7KvY0+x0dMEf92lGnpSgLM9YBWdsj
 pXI0lE0bgfiEf9dhAer8eaAcd7jt+OCxioJFBIS2xWUGYxIavkQnDEr9HjxkmY0fXtA6
 mZpFMCA5cdmv9UEMry1Y7p5PQH0kUHNHUsPBM+GLF0kPRPilPRAfz+BprlrrFm/qMT3G
 Zcr3BBIvHcsCg3lc9M7fTKCapaGYt/hETnsqYRkRkLbYz+r4er4UqrwsXY0iC5yCHGy8
 90lBKDaS8PYa76sW/OLgiDFRkfS9UHhV3FUSQ5Hvmd1+nu9HPDeD147Ja1+4UMbwJKSv
 CF7Q==
X-Gm-Message-State: AOAM5328NYAgebYC2hcyb2djOayG5kLlT3MxZ5UAvGRA3D+jfuiaCsL4
 rJOPd1f52B1P4WACCQAC73k=
X-Google-Smtp-Source: ABdhPJzXC8sP+c39Xx1NVeZuvBhUppi3iLLlmqr3BQXMvhyTNMf7wD/5G8LbipRnbyxWoNz0D3NnRQ==
X-Received: by 2002:a17:90a:784b:: with SMTP id
 y11mr2950425pjl.165.1603957464479; 
 Thu, 29 Oct 2020 00:44:24 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id o4sm1855935pjj.38.2020.10.29.00.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:44:24 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Date: Thu, 29 Oct 2020 15:42:48 +0800
Message-Id: <20201029074301.226644-12-coiby.xu@gmail.com>
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
Subject: [Linux-stm32] [PATCH 12/25] ASoC: stm32: sai: remove unnecessary
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
 sound/soc/stm/stm32_sai_sub.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3aa1cf262402..38dd7e30af1b 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1582,7 +1582,6 @@ static int stm32_sai_sub_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32_sai_sub_suspend(struct device *dev)
 {
 	struct stm32_sai_sub_data *sai = dev_get_drvdata(dev);
@@ -1616,7 +1615,6 @@ static int stm32_sai_sub_resume(struct device *dev)
 
 	return ret;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops stm32_sai_sub_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(stm32_sai_sub_suspend, stm32_sai_sub_resume)
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
