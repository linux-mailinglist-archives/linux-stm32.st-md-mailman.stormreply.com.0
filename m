Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDE139E596
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 19:37:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 841FBC58D7B;
	Mon,  7 Jun 2021 17:37:04 +0000 (UTC)
Received: from mail-wr1-f98.google.com (mail-wr1-f98.google.com
 [209.85.221.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43104C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jun 2021 17:37:03 +0000 (UTC)
Received: by mail-wr1-f98.google.com with SMTP id c9so9868733wrt.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Jun 2021 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flowbird.group; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=cQ0HCecLBzhbySylNjeEx08B0uL27TMXk9h3b7u59u8=;
 b=IKZ39F3MtKcHSODjiGeVlgghGWdYJpIvhLIwqnMiLNI2IAME2p1/clgRDOsLBARP3o
 I/QMQVZHsvccukjM/ZCqNoQJivLFJat8c2KXlE/2Jr5t8RPMoYJJiY8yTv5qVK8rKwn7
 /JWPKj3yOWf4S5Enu4EqGOgOUyib6I9TON9n3yElHpZ1a/ek/elsfaPTAf8jFQpeXFGZ
 4EFbt+RvanRD17t185mxnlFYQ6Pb25QPoXR7YO9aCAIA4dKyI+pB/hLhZdokppTUCIol
 gd4yhcFqyyYrBRyhQJ9xXrAGjvsQTBifWAyA9ON5H5f1peURrYLBwuyyCknUmJ6CxNnD
 gryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cQ0HCecLBzhbySylNjeEx08B0uL27TMXk9h3b7u59u8=;
 b=Dl6UxCH2k5+88fFOyCMy/pEp7Jo8HipsfAnLDdWSqYKSDREb84Tif3JqqeWYrFcaGN
 CXwE1S067+ypo6GD/H5ZH55wQvtZq2HjGSdyQVGXkPyCeN9zB4CDiimFJD8NyD1+JTbD
 l10Ab6/6CUUKAKXQOBwM5e3aponADuQ01dfYJ/FLEfwpZLljVeq33osuY3S0VCg0wRJe
 /INtdABRgwKYzYES3MdBeIRYHhjc68amdGylnWDiYOXr06hyIKRRMqEFdBkM4OmOuYj9
 mv+lhtAyARb5gmROMLbGpFwhwsvSKwBF7Wra18xR1KV59H2ltgKAKHhu6knQoIfBLuNp
 6gDw==
X-Gm-Message-State: AOAM531lXs28BPhaQEvwdNCKVa1xqJnBrp7FYAzdVBqMt96GUbDLG8Uz
 tie5rLqpjUqiC3arsq8eXL+tJW9Yv7qJWflpgaM0jkXzglRB
X-Google-Smtp-Source: ABdhPJz/FE6FN3pJLi6cmrgl515irLBG83lTgyOd3htyaW4LLOC1eozKZN2fgQXMpbtxmtiMenJRLmx2yMdP
X-Received: by 2002:adf:c392:: with SMTP id p18mr18476789wrf.373.1623087422760; 
 Mon, 07 Jun 2021 10:37:02 -0700 (PDT)
Received: from mta1.parkeon.com ([185.149.63.251])
 by smtp-relay.gmail.com with ESMTPS id s4sm1131512wrv.91.2021.06.07.10.37.02
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 07 Jun 2021 10:37:02 -0700 (PDT)
X-Relaying-Domain: flowbird.group
Received: from [172.16.14.190] (port=40436
 helo=PC12445-BES.dynamic.besancon.parkeon.com)
 by mta1.parkeon.com with esmtp (Exim 4.71)
 (envelope-from <martin.fuzzey@flowbird.group>)
 id 1lqJBO-0004zR-EB; Mon, 07 Jun 2021 19:37:02 +0200
From: Martin Fuzzey <martin.fuzzey@flowbird.group>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Mon,  7 Jun 2021 19:36:40 +0200
Message-Id: <1623087421-19722-1-git-send-email-martin.fuzzey@flowbird.group>
X-Mailer: git-send-email 1.9.1
Cc: linux-rtc@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Martin Fuzzey <martin.fuzzey@flowbird.group>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] rtc: stm32: Fix unbalanced
	clk_disable_unprepare() on probe error path
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The STM32MP1 RTC may have 2 clocks, the pclk and the rtc_ck.

If clk_prepare_enable() fails for the second clock (rtc_ck) we must only
call clk_disable_unprepare() for the first clock (pclk) but currently we
call it on both leading to a WARN:

[   15.629568] WARNING: CPU: 0 PID: 146 at drivers/clk/clk.c:958 clk_core_disable+0xb0/0xc8
[   15.637620] ck_rtc already disabled
[   15.663322] CPU: 0 PID: 146 Comm: systemd-udevd Not tainted 5.4.77-pknbsp-svn5759-atag-v5.4.77-204-gea4235203137-dirty #2413
[   15.674510] Hardware name: STM32 (Device Tree Support)
[   15.679658] [<c0111148>] (unwind_backtrace) from [<c010c0b8>] (show_stack+0x10/0x14)
[   15.687371] [<c010c0b8>] (show_stack) from [<c0ab3d28>] (dump_stack+0xc0/0xe0)
[   15.694574] [<c0ab3d28>] (dump_stack) from [<c012360c>] (__warn+0xc8/0xf0)
[   15.701428] [<c012360c>] (__warn) from [<c0123694>] (warn_slowpath_fmt+0x60/0x94)
[   15.708894] [<c0123694>] (warn_slowpath_fmt) from [<c053b518>] (clk_core_disable+0xb0/0xc8)
[   15.717230] [<c053b518>] (clk_core_disable) from [<c053c190>] (clk_core_disable_lock+0x18/0x24)
[   15.725924] [<c053c190>] (clk_core_disable_lock) from [<bf0adc44>] (stm32_rtc_probe+0x124/0x5e4 [rtc_stm32])
[   15.735739] [<bf0adc44>] (stm32_rtc_probe [rtc_stm32]) from [<c05f7d4c>] (platform_drv_probe+0x48/0x98)
[   15.745095] [<c05f7d4c>] (platform_drv_probe) from [<c05f5cec>] (really_probe+0x1f0/0x458)
[   15.753338] [<c05f5cec>] (really_probe) from [<c05f61c4>] (driver_probe_device+0x70/0x1c4)
[   15.761584] [<c05f61c4>] (driver_probe_device) from [<c05f6580>] (device_driver_attach+0x58/0x60)
[   15.770439] [<c05f6580>] (device_driver_attach) from [<c05f6654>] (__driver_attach+0xcc/0x170)
[   15.779032] [<c05f6654>] (__driver_attach) from [<c05f40d8>] (bus_for_each_dev+0x58/0x7c)
[   15.787191] [<c05f40d8>] (bus_for_each_dev) from [<c05f4ffc>] (bus_add_driver+0xdc/0x1f8)
[   15.795352] [<c05f4ffc>] (bus_add_driver) from [<c05f6ed8>] (driver_register+0x7c/0x110)
[   15.803425] [<c05f6ed8>] (driver_register) from [<c01027bc>] (do_one_initcall+0x70/0x1b8)
[   15.811588] [<c01027bc>] (do_one_initcall) from [<c01a1094>] (do_init_module+0x58/0x1f8)
[   15.819660] [<c01a1094>] (do_init_module) from [<c01a0074>] (load_module+0x1e58/0x23c8)
[   15.827646] [<c01a0074>] (load_module) from [<c01a0860>] (sys_finit_module+0xa0/0xd4)
[   15.835459] [<c01a0860>] (sys_finit_module) from [<c01011e0>] (__sys_trace_return+0x0/0x20)

Signed-off-by: Martin Fuzzey <martin.fuzzey@flowbird.group>
Fixes: 4e64350f42e2 ("rtc: add STM32 RTC driver")
Cc: stable@vger.kernel.org
---
 drivers/rtc/rtc-stm32.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 75a8924..ac9e228 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -754,7 +754,7 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(rtc->rtc_ck);
 	if (ret)
-		goto err;
+		goto err_no_rtc_ck;
 
 	if (rtc->data->need_dbp)
 		regmap_update_bits(rtc->dbp, rtc->dbp_reg,
@@ -830,10 +830,12 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 	}
 
 	return 0;
+
 err:
+	clk_disable_unprepare(rtc->rtc_ck);
+err_no_rtc_ck:
 	if (rtc->data->has_pclk)
 		clk_disable_unprepare(rtc->pclk);
-	clk_disable_unprepare(rtc->rtc_ck);
 
 	if (rtc->data->need_dbp)
 		regmap_update_bits(rtc->dbp, rtc->dbp_reg, rtc->dbp_mask, 0);
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
