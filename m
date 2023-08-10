Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6D777141
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 09:22:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FFA9C6B471;
	Thu, 10 Aug 2023 07:22:31 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46FD1C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 07:22:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AACE920004;
 Thu, 10 Aug 2023 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691652148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F8ho0ZeRgf6GcBDYycgxV6RMNmHgIqASgZeOYExlJaA=;
 b=n26apJIn/795ozqnWJ141CFV4AWyErDmkf+OaUyCNFQqGxjpFaIRyJb824nVFgMu4yDSa4
 ZsgPHNoz/XsNVu4Q1wHG/s9K3BOJ0YSbyUtFspyaDHi3qJ4/bk/tsulYwigsA3FFqCL5ps
 +5vyvADcWT0qiMqpONtfkbDwlGbrfOPT3pmVrmualHJfmkrK/5VG2sky5fLdAhW2maDJ/r
 7aLn4KZprlDINy0EDcnOtnqG/UvXHZkgNNbkaltdS3hMOJK8X0w5O1b5JzT6jAjB1ZzvoJ
 Jp76S0pP30RlSr2+pwC+eEf6vlM+chLnY6ZM8UAPdXgprdENYzkJ6CX7CH/Xqw==
Date: Thu, 10 Aug 2023 09:22:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <169165213049.964766.5251410326864889456.b4-ty@bootlin.com>
References: <20230801105932.3738430-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230801105932.3738430-1-arnd@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: remove incorrect #ifdef check
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


On Tue, 01 Aug 2023 12:59:15 +0200, Arnd Bergmann wrote:
> After a previous commit changed the driver over to
> SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(), the suspend/resume
> functions must no longer be hidden behind an #ifdef:
> 
> In file included from include/linux/clk.h:13,
>                  from drivers/rtc/rtc-stm32.c:8:
> drivers/rtc/rtc-stm32.c:927:39: error: 'stm32_rtc_suspend' undeclared here (not in a function); did you mean 'stm32_rtc_probe'?
>   927 |         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_rtc_suspend, stm32_rtc_resume)
>       |                                       ^~~~~~~~~~~~~~~~~
> include/linux/kernel.h:58:44: note: in definition of macro 'PTR_IF'
>    58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
>       |                                            ^~~
> include/linux/pm.h:329:26: note: in expansion of macro 'pm_sleep_ptr'
>   329 |         .suspend_noirq = pm_sleep_ptr(suspend_fn), \
>       |                          ^~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] rtc: stm32: remove incorrect #ifdef check
      commit: a69c610e13e2b2de8a1ed2683f13e21b3200bd7a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
