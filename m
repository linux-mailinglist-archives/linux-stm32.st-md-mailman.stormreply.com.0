Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1158846009E
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Nov 2021 18:41:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E0EDC5C83D;
	Sat, 27 Nov 2021 17:41:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77495C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Nov 2021 17:41:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 399C060EC3;
 Sat, 27 Nov 2021 17:41:07 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id CF786C53FAD;
 Sat, 27 Nov 2021 17:41:01 +0000 (UTC)
Date: Sat, 27 Nov 2021 17:46:02 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Alyssa Ross <hi@alyssa.is>
Message-ID: <20211127174602.6f674d37@jic23-huawei>
In-Reply-To: <20211125182850.2645424-1-hi@alyssa.is>
References: <20211125182850.2645424-1-hi@alyssa.is>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 open list <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] iio: trigger: stm32-timer: fix
	MODULE_ALIAS
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

On Thu, 25 Nov 2021 18:28:48 +0000
Alyssa Ross <hi@alyssa.is> wrote:

> modprobe can't handle spaces in aliases.
> 
> Fixes: 93fbe91b5521 ("iio: Add STM32 timer trigger driver")
> Signed-off-by: Alyssa Ross <hi@alyssa.is>
Hi Alysaa,

Looks fine to me, but I'd like to give it a little longer on list before
taking it as a fix, particularly as this probably wants to get backported
to stable.

Thanks,

Jonathan

> ---
>  drivers/iio/trigger/stm32-timer-trigger.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> index 33083877cd19..4353b749ecef 100644
> --- a/drivers/iio/trigger/stm32-timer-trigger.c
> +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> @@ -912,6 +912,6 @@ static struct platform_driver stm32_timer_trigger_driver = {
>  };
>  module_platform_driver(stm32_timer_trigger_driver);
>  
> -MODULE_ALIAS("platform: stm32-timer-trigger");
> +MODULE_ALIAS("platform:stm32-timer-trigger");
>  MODULE_DESCRIPTION("STMicroelectronics STM32 Timer Trigger driver");
>  MODULE_LICENSE("GPL v2");

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
