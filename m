Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 031FCAD5C61
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 18:37:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 041F9C32E8E;
	Wed, 11 Jun 2025 16:37:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15725C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 16:37:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1B5D95C336A;
 Wed, 11 Jun 2025 16:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA57FC4CEE3;
 Wed, 11 Jun 2025 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749659850;
 bh=8f17JNCbmwhQzy5mD6f+45j2FzwIQnJv0xmMlafqAEg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E93oMAjLUPLSwW/zg0PztdZ7pXCSfwsLe9jNH0prZN9k4mHzriJxiuTnLEoUSUJ9Y
 ycRzveSJshLaFIP+pC5gjH6ibNnVfyl9DoNz/n/rGl5EHmO8aY/tgzRHD0Afhb/Pkc
 pZyRMPmOrK1o73d3S7vW9xPzekTYYAzR+E9YuTAEBe0rCmqXVDssRvJn0R1sE3rxSG
 AF6X0370JwFK8uGCzzYJfMjev3Y7rAnaDD3rIcnbH1re9Z71jy1Nb7Kx70QTOeu40U
 YQfEY8hqzDIRh6hKqYujacFnrn5Sx835DZL2FASOyPk7HhA/gk2j8+muKZKMed4Pd5
 7Xx3A6Qjhwvtw==
Date: Wed, 11 Jun 2025 17:37:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250611173722.1f78b841@jic23-huawei>
In-Reply-To: <ccde5e45-9541-499f-b248-08cd6fad9a19@foss.st.com>
References: <20250610124855.269158-1-antonio.borneo@foss.st.com>
 <20250610124855.269158-5-antonio.borneo@foss.st.com>
 <ccde5e45-9541-499f-b248-08cd6fad9a19@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, David
 Lechner <dlechner@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] iio: trigger: stm32-lptimer: Fix
 build warnings about export.h
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

On Tue, 10 Jun 2025 15:05:50 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 6/10/25 14:48, Antonio Borneo wrote:
> > After commit a934a57a42f6 ("scripts/misc-check: check missing #include
> > <linux/export.h> when W=1") and commit 7d95680d64ac ("scripts/misc-check:
> > check unnecessary #include <linux/export.h> when W=1") we get the build
> > warning with W=1:
> > 
> > drivers/iio/trigger/stm32-lptimer-trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> > 
> > Fix it.
> > 
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>  
> 
> Hi Antonio,
> 
> You can add my:
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 
Applied.

> Thanks,
> Fabrice
> 
> > ---
> >  drivers/iio/trigger/stm32-lptimer-trigger.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
> > index 2505ace440b46..c7bab18221c70 100644
> > --- a/drivers/iio/trigger/stm32-lptimer-trigger.c
> > +++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
> > @@ -9,6 +9,7 @@
> >   * Inspired by Benjamin Gaignard's stm32-timer-trigger driver
> >   */
> >  
> > +#include <linux/export.h>
> >  #include <linux/iio/timer/stm32-lptim-trigger.h>
> >  #include <linux/mfd/stm32-lptimer.h>
> >  #include <linux/mod_devicetable.h>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
