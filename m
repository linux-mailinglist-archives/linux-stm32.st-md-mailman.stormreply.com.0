Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5103F51E1AD
	for <lists+linux-stm32@lfdr.de>; Sat,  7 May 2022 01:05:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03460C628AA;
	Fri,  6 May 2022 23:05:13 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AC17C6049F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 23:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1651878310; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bGhwf4sYiYCYD5eWpzxgTupVNYyX9SJesdBqmCbRwqw=;
 b=i90xn6oynU4xRZMiQ4i+NyI2KzJSk8b6ivKryUam3OxPRFhVgYSZmcU3Sj0wS4Egqa3Jnh
 pYsaN+56BjFyNlRrLiNZbq0pQ2SLkI+Jxbc8reqhQ4MLiJXyTJcSAyHR4sP/68JcodSIce
 m5aNY1TwE8cA+gOzJmbyfflMyLjcthI=
Date: Sat, 07 May 2022 00:05:00 +0100
From: Paul Cercueil <paul@crapouillou.net>
To: Yannick Brosseau <yannick.brosseau@gmail.com>
Message-Id: <CGHHBR.49W7GPLHSYOE@crapouillou.net>
In-Reply-To: <20220506225617.1774604-1-yannick.brosseau@gmail.com>
References: <20220506225617.1774604-1-yannick.brosseau@gmail.com>
MIME-Version: 1.0
Cc: lars@metafoo.de, mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/2] iio: adc: stm32: Fix ADC IRQ handling
	on STM32F4
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Yannick,

Le ven., mai 6 2022 at 18:56:15 -0400, Yannick Brosseau =

<yannick.brosseau@gmail.com> a =E9crit :
> Recent changes to the STM32 ADC irq handling broke the STM32F4 =

> platforms
> These two patches bring it back to a working state.

If the STM32 ADC was broken recently, and these two patches fix it, =

then I'd expect to see a Fixes: tag on both commits and Cc: =

linux-stable.

Cheers,
-Paul

> Yannick Brosseau (2):
>   iio: adc: stm32: Iterate through all ADCs in irq handler
>   iio: adc: stm32: Fix check for spurious IRQs on STM32F4
> =

>  drivers/iio/adc/stm32-adc-core.c | 7 ++++++-
>  drivers/iio/adc/stm32-adc.c      | 9 ++++++---
>  2 files changed, 12 insertions(+), 4 deletions(-)
> =

> --
> 2.36.0
> =



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
