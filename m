Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5AFAD5C40
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 18:34:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A949BC32E8E;
	Wed, 11 Jun 2025 16:34:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07BCAC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 16:34:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F3ED46154F;
 Wed, 11 Jun 2025 16:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8C1C4CEEA;
 Wed, 11 Jun 2025 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749659682;
 bh=WBdEf0/HZqkhDmCcxbwgGvvd9cOJk0qwHZjEEgt/ZCg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R9CJ9dpp9w5VDPPesK/5/rpC4lTAgov0Lz0m5tWPIwOM1a8pucz2AQJ+RuXpVd+8e
 eZ6LuqHLGtrCoDUyNmTpcDWZ5ccxi8xLL2VyhxtUaQaxz9ZL95NpwedI9bbEVyBaH3
 lI/i8QKLVE+L9hwXgUMLBUC589xACUwMBSGRO+c5vZdvnHOg2Pa/GijMw2RgcTYDy+
 0p8ZFhYrPxPQ6E9FaFC2nnBS5/+Y0G/qGfWs4MmauaK5rrGxb6tSaknwNxLXdUmb1o
 +xgBPkQci1eGdMYHTMdfX3VQce/ZOi5dvkf2zOu44OuvtgHnnGpw+2Axs5DpJFhsKS
 eqxai+HX0/7Qg==
Date: Wed, 11 Jun 2025 17:34:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250611173433.430c8eb4@jic23-huawei>
In-Reply-To: <7600b151-0487-4cb9-ab6e-3cc9c6012bdf@foss.st.com>
References: <20250610124855.269158-1-antonio.borneo@foss.st.com>
 <20250610124855.269158-3-antonio.borneo@foss.st.com>
 <7600b151-0487-4cb9-ab6e-3cc9c6012bdf@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, David
 Lechner <dlechner@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] iio: adc: stm32-dfsdm: Fix build
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

On Tue, 10 Jun 2025 15:05:16 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 6/10/25 14:48, Antonio Borneo wrote:
> > After commit a934a57a42f6 ("scripts/misc-check: check missing #include
> > <linux/export.h> when W=1") and commit 7d95680d64ac ("scripts/misc-check:
> > check unnecessary #include <linux/export.h> when W=1") we get the build
> > warnings with W=1:
> > 
> > drivers/iio/adc/stm32-dfsdm-adc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> > drivers/iio/adc/stm32-dfsdm-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> > 
> > Fix them.
> > 
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>  
> 
> Hi Antonio,
> 
> You can add my:
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Applied to the togreg branch of iio.git.

Ta.

> 
> Thanks,
> Fabrice
> > ---
> >  drivers/iio/adc/stm32-dfsdm-adc.c  | 1 +
> >  drivers/iio/adc/stm32-dfsdm-core.c | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> > index f583924eb16bb..c2d21eecafe79 100644
> > --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> > +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/dmaengine.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/export.h>
> >  #include <linux/iio/adc/stm32-dfsdm-adc.h>
> >  #include <linux/iio/backend.h>
> >  #include <linux/iio/buffer.h>
> > diff --git a/drivers/iio/adc/stm32-dfsdm-core.c b/drivers/iio/adc/stm32-dfsdm-core.c
> > index 041dc9ebc0482..47e2d1338e9e6 100644
> > --- a/drivers/iio/adc/stm32-dfsdm-core.c
> > +++ b/drivers/iio/adc/stm32-dfsdm-core.c
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> > +#include <linux/export.h>
> >  #include <linux/iio/iio.h>
> >  #include <linux/iio/sysfs.h>
> >  #include <linux/interrupt.h>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
