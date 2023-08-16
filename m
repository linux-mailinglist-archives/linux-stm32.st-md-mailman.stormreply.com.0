Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F577ED6F
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Aug 2023 00:53:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C310CC6B461;
	Wed, 16 Aug 2023 22:53:48 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78643C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 22:53:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E13431BF204;
 Wed, 16 Aug 2023 22:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692226427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZkA52x5JxaZ+AT2nw9BymX9U93LFxgF/xY18z1ou/7o=;
 b=YP8Gbc4+kQnxNs/whubTSuO1BfjExnUHrt8H2hCwLvPv9dpg9ZhsqVWSZg9pu+n6thlHfC
 jAtf/oATcAtVkDUFPxab4Swp5mACCMjPowQsKN8kjYWkaOjm8HB+mug/I242fQ+heDqnNE
 oavPMFXXBOWJVzGA0nlDWXTXUptkcYSzvUxpaoEdYugQXaOLn6aE+m66AshC5qZU95uZh8
 4Xq+/xUf1tu9e/WkvI7uSJipKsmPsYn/hXQ0lbW3zc+ZJZTqWsCe530SB7PgTZo9o4f0Hs
 EjMgpF3HRgDS8XZIXCOLgui6gwdUTJmfUXhwFVFvq8kZA7ZConmyv7BORBWtbg==
Date: Thu, 17 Aug 2023 00:53:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: a.zummo@towertech.it, Nathan Chancellor <nathan@kernel.org>
Message-ID: <169222639035.110507.11805270756093172176.b4-ty@bootlin.com>
References: <20230815-rtc-stm32-unused-pm-funcs-v1-1-82eb8e02d903@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230815-rtc-stm32-unused-pm-funcs-v1-1-82eb8e02d903@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, arnd@arndb.de, patches@lists.linux.dev,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: Use
	NOIRQ_SYSTEM_SLEEP_PM_OPS()
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


On Tue, 15 Aug 2023 15:16:41 -0700, Nathan Chancellor wrote:
> After the switch to SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() and a subsequent
> fix, stm32_rtc_{suspend,resume}() are unused when CONFIG_PM_SLEEP is not
> set because SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() is a no-op in that
> configuration:
> 
>   drivers/rtc/rtc-stm32.c:904:12: error: 'stm32_rtc_resume' defined but not used [-Werror=unused-function]
>     904 | static int stm32_rtc_resume(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~
>   drivers/rtc/rtc-stm32.c:894:12: error: 'stm32_rtc_suspend' defined but not used [-Werror=unused-function]
>     894 | static int stm32_rtc_suspend(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> [...]

Applied, thanks!

[1/1] rtc: stm32: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
      commit: 2cf2a1acc6ebdffc6363de9156db8737f33c1803

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
