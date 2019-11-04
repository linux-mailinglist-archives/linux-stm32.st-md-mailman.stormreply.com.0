Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA4EE218
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2019 15:23:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4892C36B0E;
	Mon,  4 Nov 2019 14:23:15 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 794C4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2019 14:23:15 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c22so16272360wmd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Nov 2019 06:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DlHGsHCYz6i9keGsLrYM+8DrDokVvhA17QRfhwApon4=;
 b=pformDiSnMnhGM0gWYP61EL4IsZN5i5fQ20RPhOIcGPtbvADApmq3GGz3ONVTEshHm
 wUje680PA6qM1Er/+RfRn3rLoXyJ3NpKVfmdZ8nVsuKHtCIStEltZD9vqc8Gru0cEJLj
 BBXQmTmeGmCPA0FSuvLswr1oygRQXRacmKn6mMNa7Wj5mCsqwfQ7W3jvUbNWOjsPrE5C
 +s9Tr0F8RqgF+zp6uKjx9lunA6aY0/AHe3l7bor+KvIjirdp5ndgS/qnucYbOCKyo4IN
 EoV8o3HmWJqw6Ffth7CtcZB8UJLk0rlpMe4fCx0380dohUIF1SUGT2Ksbfsdn3hdIR+b
 f/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DlHGsHCYz6i9keGsLrYM+8DrDokVvhA17QRfhwApon4=;
 b=HLUdYQ44OAZuKEYVoGK/EH1OJPuHQ+nYt+i8fWL1EHBbSduyv998A3cUWwCKcaWnlO
 5RexbioLbo+OVdgAEjiQBzo0ndBfjnxNlSGtObSfHit1VsIVE2AXPPbD28C9ENWGLey3
 7Ln+jwMEfo2XkZGvDUYVqYH9btUapoF4hx6zruNTSWy7v2n4rGL5M0XWyvllWrPbFLnD
 VejvT1Qnj+qG1XgYToy7bYt+82hLnwH7onKwbmpeW+3F3a7XFUna3HcTHrz1+zuX9Vdy
 /VVyG1kxmQyg1COrBcaq/TXWMkHldTIILgvOD2ITdfGA7Cbb5N7v40gCs4DDwODrFfLC
 uNwA==
X-Gm-Message-State: APjAAAX12CYgEHeaHHJ8p/xqbqHic+AN3oQNVazynNmop+Joxdbj4Lm6
 J/f0ZRzdII0J66Q0NQ+2R1nLUw==
X-Google-Smtp-Source: APXvYqw5dRFCT4rWakrmWngzJkmEsTf4OzwjQFejtITeq3kHdmXf626rugiPj/J78gqdopl+XXEyQw==
X-Received: by 2002:a7b:cc89:: with SMTP id p9mr21507045wma.99.1572877394844; 
 Mon, 04 Nov 2019 06:23:14 -0800 (PST)
Received: from mai.imgcgcw.net ([2a01:e34:ed2f:f020:58da:b044:f184:d281])
 by smtp.gmail.com with ESMTPSA id l18sm21692446wrn.48.2019.11.04.06.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 06:23:14 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: tglx@linutronix.de
Date: Mon,  4 Nov 2019 15:22:56 +0100
Message-Id: <20191104142257.30029-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104142257.30029-1-daniel.lezcano@linaro.org>
References: <6fd4d800-b1f8-d757-458e-23742d20884c@linaro.org>
 <20191104142257.30029-1-daniel.lezcano@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH 4/5] clocksource/drivers/renesas-ostm: Use
	unique device name instead of ostm
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

Currently all OSTM devices are called "ostm", also in kernel messages.

As there can be multiple instances in an SoC, this can confuse the user.
Hence construct a unique name from the DT node name, like is done for
platform devices.

On RSK+RZA1, the boot log changes like:

    -clocksource: ostm: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
    +clocksource: timer@fcfec000: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
     sched_clock: 32 bits at 33MHz, resolution 30ns, wraps every 64440619504ns
    -ostm: used for clocksource
    -ostm: used for clock events
    +/soc/timer@fcfec000: used for clocksource
    +/soc/timer@fcfec400: used for clock events
     ...
    -clocksource: Switched to clocksource ostm
    +clocksource: Switched to clocksource timer@fcfec000

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20191016144747.29538-5-geert+renesas@glider.be
---
 drivers/clocksource/renesas-ostm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 46012d905604..3d06ba66008c 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -64,9 +64,9 @@ static int __init ostm_init_clksrc(struct timer_of *to)
 	writeb(CTL_FREERUN, timer_of_base(to) + OSTM_CTL);
 	writeb(TS, timer_of_base(to) + OSTM_TS);
 
-	return clocksource_mmio_init(timer_of_base(to) + OSTM_CNT, "ostm",
-				     timer_of_rate(to), 300, 32,
-				     clocksource_mmio_readl_up);
+	return clocksource_mmio_init(timer_of_base(to) + OSTM_CNT,
+				     to->np->full_name, timer_of_rate(to), 300,
+				     32, clocksource_mmio_readl_up);
 }
 
 static u64 notrace ostm_read_sched_clock(void)
@@ -190,13 +190,13 @@ static int __init ostm_init(struct device_node *np)
 			goto err_cleanup;
 
 		ostm_init_sched_clock(to);
-		pr_info("ostm: used for clocksource\n");
+		pr_info("%pOF: used for clocksource\n", np);
 	} else {
 		ret = ostm_init_clkevt(to);
 		if (ret)
 			goto err_cleanup;
 
-		pr_info("ostm: used for clock events\n");
+		pr_info("%pOF: used for clock events\n", np);
 	}
 
 	return 0;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
