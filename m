Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4E729E516
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 08:52:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9161EC424C7;
	Thu, 29 Oct 2020 07:52:06 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71580C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 07:44:37 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j18so1666780pfa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UiWE1BDnMzq0w4cStIBBDPtKZjCua/B3Fm6Q5y7KxII=;
 b=dpXSOm0JyRrfZu6jwKKjBwt+khOLjMt/zuXhuZ0xq+dcyzm90bzcocd647Isfuz5yt
 SRyjBEVneC8nsATMpp6ZusV+e1rFTKDZXxXsTiZtXBAqQPPAfeToEDNfksUQoeZ51S5C
 icfesQUgvmiDyFqv25rtw8jFbZGX0EaLxpY7WHJT5bLTepargjKHO3ZchaQzYzUBwKke
 +FnYKpRUzjSg5chE747eSDPNkLdORqDYKhCzD7Lv1zqc0vuMLw/wapZvyACTqdI3i1pT
 to4pkCiBwEro1T1gUu5i6Mf3DI0Cs6DFpCDq/924BHimW8HMhDjZu57JhmnYN9Q1j1YE
 K5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UiWE1BDnMzq0w4cStIBBDPtKZjCua/B3Fm6Q5y7KxII=;
 b=hiUL3JMhKiqWSZFxCSTinBi5WbnXz7phDuusFIHkUyo4OnhmjKUOIfg9MoP0HLwkAs
 rOczjYgSkGQnkG76FUE6PpbngXblGNjYfSYl4USGB+7hX/hS+Gh0vb/X95VotlYJ5N3c
 sl8v8MfPAuHklYHHJhlB3MaGtja6rCQas6AVOQu8mxBJAzJ2FdKHFnQJ5CxCnkrWmFGq
 zvST8lDieOlCq1zyEHj5O+pTw9XxdD7MxfUfAiQTgSYGCDrv8HxEpAi107/a4fMn/JeL
 Uc9LPN0v6YUIcT5+wjFWClVkSNONIzvBJ5uhxnWcu4uVpRm8lHWYSViQAtNbz8/qarGz
 xykQ==
X-Gm-Message-State: AOAM533LqSrnpt7hhyqH4xatgt5/iC4VOOlJQP26PMN0Cnhg5XOM/gg+
 sNVcWa2zKA6iA+JQjVBWVR0=
X-Google-Smtp-Source: ABdhPJw+g/uyNSWUT43pQjWbmj0HYrQtDyg3buKh1aC7FdNCWaAB7PGuvClSfB5HBIPm6hc6PiDxOw==
X-Received: by 2002:a63:7c56:: with SMTP id l22mr264873pgn.19.1603957476052;
 Thu, 29 Oct 2020 00:44:36 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id w6sm1560937pgr.71.2020.10.29.00.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:44:35 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Date: Thu, 29 Oct 2020 15:42:50 +0800
Message-Id: <20201029074301.226644-14-coiby.xu@gmail.com>
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
Subject: [Linux-stm32] [PATCH 14/25] ASoC: stm32: i2s: remove unnecessary
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
 sound/soc/stm/stm32_i2s.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 7c4d63c33f15..138acfb26882 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -984,7 +984,6 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 
 MODULE_DEVICE_TABLE(of, stm32_i2s_ids);
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32_i2s_suspend(struct device *dev)
 {
 	struct stm32_i2s_data *i2s = dev_get_drvdata(dev);
@@ -1002,7 +1001,6 @@ static int stm32_i2s_resume(struct device *dev)
 	regcache_cache_only(i2s->regmap, false);
 	return regcache_sync(i2s->regmap);
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops stm32_i2s_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(stm32_i2s_suspend, stm32_i2s_resume)
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
