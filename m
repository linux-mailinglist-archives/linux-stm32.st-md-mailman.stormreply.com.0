Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24576AD5C5B
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 18:36:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9138C32E8E;
	Wed, 11 Jun 2025 16:36:25 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7FDDC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 16:36:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E6DD6A516A8;
 Wed, 11 Jun 2025 16:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B13C4CEE3;
 Wed, 11 Jun 2025 16:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749659782;
 bh=sclz4982E4WzBN3+77UXueLPKjZaQ8E9dIo5KXXJhDU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gr9Tkr4C3a+q0tp1tV/MbnrtfnQ54lTT+lFIVz+Um9u/CfxGTiBksQGPeaBSNpcuL
 QHf0m6u+Qkq1y3uabTQOAYtq50kt77CYoQI6606AjD2jLqXpQvuQ+tk91sH2VX1CQt
 ZOmg2O4qjTc3U7fYpeqcwn2hSBZlXknZbFI/goyKaXuYMuxAggboykF7fVxYjeJcEU
 WqAtS2FEyKpRHvME+bIzdi5fQBPft3FHAPo6yrSlzutch9g582P1FA7SKuUupHK9pH
 4n4oFIQaYt0dmEW1yQWah7Lse9ooe1Iyax/nnJBQ4nFIwiM76SLS9nBJr/M+rofH64
 Daez8pQNQSlgw==
Date: Wed, 11 Jun 2025 17:36:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250611173613.492b7fc5@jic23-huawei>
In-Reply-To: <f8b1adef-10f3-4cff-9e11-10c1a16f6ec5@foss.st.com>
References: <20250610124855.269158-1-antonio.borneo@foss.st.com>
 <20250610124855.269158-4-antonio.borneo@foss.st.com>
 <f8b1adef-10f3-4cff-9e11-10c1a16f6ec5@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, David
 Lechner <dlechner@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/5] iio: trigger: stm32-timer: Fix build
 warnings about export.h
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

On Tue, 10 Jun 2025 15:05:36 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 6/10/25 14:48, Antonio Borneo wrote:
> > After commit a934a57a42f6 ("scripts/misc-check: check missing #include
> > <linux/export.h> when W=1") and commit 7d95680d64ac ("scripts/misc-check:
> > check unnecessary #include <linux/export.h> when W=1") we get the build
> > warning with W=1:
> > 
> > drivers/iio/trigger/stm32-timer-trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> > 
> > Fix it.
> > 
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>  
> 
> Hi Antonio,
> 
> You can add my:
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Applied to the togreg branch of iio.git - initially pushed out as testing
as I have some other stuff queued today that needs 0-day to look at it.

Thanks,

J
> 
> Thanks,
> Fabrice
> 
> > ---
> >  drivers/iio/trigger/stm32-timer-trigger.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> > index 925b864facca1..3b9a3a6cbb25c 100644
> > --- a/drivers/iio/trigger/stm32-timer-trigger.c
> > +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> > @@ -6,6 +6,7 @@
> >   *
> >   */
> >  
> > +#include <linux/export.h>
> >  #include <linux/iio/iio.h>
> >  #include <linux/iio/sysfs.h>
> >  #include <linux/iio/timer/stm32-timer-trigger.h>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
