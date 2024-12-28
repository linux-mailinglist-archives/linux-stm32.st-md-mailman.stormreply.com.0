Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BF59FD9CC
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2024 11:10:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 276B1C78032;
	Sat, 28 Dec 2024 10:10:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABB5EC78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 10:10:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D9191BF203;
 Sat, 28 Dec 2024 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735380648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ncWYXnUi6mk+o8Emqu4x+YEeix+m7qnAVflQKfWOvnU=;
 b=XCIDTksVVP4MKIPW77YWhn5eQnvC48fM7XT38sMO4GL+S2x3Df1Ewj/szBh5xIFIqsA2Z5
 ZilzcEnS0ob4kPcYJWo88q53OLtd7SamktyTld8/ykS5ad9aHtO7ShlIBUvjk+nBt0QW5J
 myFBF+iN4oCB0jXlbMsfqtkMizt/w77iQVe9W7M9LtSxoo6OTA5KHxrcgkphpt8L5CByY1
 xg+gw54EfF9RaAE9czfc7Nlyb3vjZjVSG0fNA9q0UQtOtz8AnyO7G5irHp4pYROlBGSfmn
 c0RlJWVwKaPGic630SqefQTeKf9SJuvfmVmrN1Vmevo6n6oweZ6GjhiunOcb6w==
Date: Sat, 28 Dec 2024 11:10:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Message-ID: <20241228101046e64adfb2@mail.local>
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, Len Brown <len.brown@intel.com>,
 Peng Fan <peng.fan@nxp.com>, Pavel Machek <pavel@ucw.cz>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/12] pm: Introduce devm_pm_set_wake_irq
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

On 28/12/2024 09:14:36+0800, Peng Fan (OSS) wrote:
> This was a retry to address [1][2], to let common code handle
> dev_pm_clear_wake_irq. Then no need to call dev_pm_clear_wake_irq
> in each driver.remove() hook and error handling path.
> 
> In this patchset, I include input and rtc patches to show the usage
> to avoid that introducing an API without users. There are still
> other places using dev_pm_clear_wake_irq. If this patchset is
> good for you, I could start to clean up other drivers such as mmc and
> etc.
> 
> [1] https://lore.kernel.org/all/20241111092131.1693319-1-peng.fan@oss.nxp.com/
> [2] https://lore.kernel.org/all/ZymxvLMkkktRoCXZ@google.com/

It seems your patchset depends on devm_device_init_wakeup which did not
make it yet.

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (12):
>       PM: sleep: wakeirq: Introduce device-managed variant of dev_pm_set_wake_irq
>       input: keyboard: ep93xx_keypad: Use devm_pm_set_wake_irq
>       input: keyboard: omap4_keypad: Use devm_pm_set_wake_irq
>       input: misc: nxp-bbnsm-pwrkey: Use resource managed API to simplify code
>       input: touchscreen: ti_am335x_tsc: Use resource managed API to simplify code
>       rtc: stm32: Use resource managed API to simplify code
>       rtc: nxp-bbnsm: Use resource managed API to simplify code
>       rtc: ds1343: Use devm_pm_set_wake_irq
>       rtc: pm8xxx: Use devm_pm_set_wake_irq
>       rtc: ab8500: Use resource managed API to simplify code
>       rtc: mpfs: Use devm_pm_set_wake_irq
>       rtc: pl031: Use resource managed API to simplify code
> 
>  drivers/base/power/wakeirq.c              | 25 ++++++++++++++++++
>  drivers/input/keyboard/ep93xx_keypad.c    |  8 +-----
>  drivers/input/keyboard/omap4-keypad.c     |  8 +-----
>  drivers/input/misc/nxp-bbnsm-pwrkey.c     | 15 ++++-------
>  drivers/input/touchscreen/ti_am335x_tsc.c | 43 ++++++++++---------------------
>  drivers/rtc/rtc-ab8500.c                  | 11 ++------
>  drivers/rtc/rtc-ds1343.c                  |  8 +-----
>  drivers/rtc/rtc-mpfs.c                    |  8 +-----
>  drivers/rtc/rtc-nxp-bbnsm.c               | 29 +++++++--------------
>  drivers/rtc/rtc-pl031.c                   |  6 ++---
>  drivers/rtc/rtc-pm8xxx.c                  | 12 +--------
>  drivers/rtc/rtc-stm32.c                   | 10 ++-----
>  include/linux/pm_wakeirq.h                |  6 +++++
>  13 files changed, 70 insertions(+), 119 deletions(-)
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20241227-wake_irq-b68d604dd902
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
