Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E347CCA76
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Oct 2019 16:29:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A3BEC36B0B;
	Sat,  5 Oct 2019 14:29:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFC0CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Oct 2019 14:29:51 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8756720867;
 Sat,  5 Oct 2019 14:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570285790;
 bh=gTTOXZzJ7SZUwzYSIK7oby/7p3yeI1CkELSTEhee4cM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BHmXTlF4+DYLAxXhoKZ7K2WthP1055bfqWZcafwpN51LftwPicjUHlqNNzdaDN//X
 ljeL9lw44bRUEhLyXVzfedzS8VlqAE7gy0nqSi0XYefaTl354dJomJzl5yHzv4SeH6
 9c3V/trApYfmXIyH5lycz+DMl1Q70bP9sTbpSK4M=
Date: Sat, 5 Oct 2019 15:29:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20191005152933.7920455d@archlinux>
In-Reply-To: <20190925235112.GC14133@icarus>
References: <1568809361-26157-1-git-send-email-fabrice.gasnier@st.com>
 <20190925235112.GC14133@icarus>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-lptimer-cnt: fix a
	kernel-doc warning
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

On Wed, 25 Sep 2019 19:51:12 -0400
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> On Wed, Sep 18, 2019 at 02:22:41PM +0200, Fabrice Gasnier wrote:
> > Fix the following warnings when documentation is built:
> > drivers/counter/stm32-lptimer-cnt.c:354: warning: cannot understand
> > function prototype: 'enum stm32_lptim_cnt_function'
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > ---
> >  drivers/counter/stm32-lptimer-cnt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
> > index bbc930a..28b6364 100644
> > --- a/drivers/counter/stm32-lptimer-cnt.c
> > +++ b/drivers/counter/stm32-lptimer-cnt.c
> > @@ -347,7 +347,7 @@ static const struct iio_chan_spec stm32_lptim_cnt_channels = {
> >  };
> >  
> >  /**
> > - * stm32_lptim_cnt_function - enumerates stm32 LPTimer counter & encoder modes
> > + * enum stm32_lptim_cnt_function - enumerates LPTimer counter & encoder modes
> >   * @STM32_LPTIM_COUNTER_INCREASE: up count on IN1 rising, falling or both edges
> >   * @STM32_LPTIM_ENCODER_BOTH_EDGE: count on both edges (IN1 & IN2 quadrature)
> >   */
> > -- 
> > 2.7.4  
> 
> Fixes: 597f55e3f36c ("counter: stm32-lptimer: add counter device")
> 
> Jonathan, please pick this fix up through IIO.
> 
> Thanks,
> 
> William Breathitt Gray
Applied to the togreg branch of iio.git and pushed out as testing.

thanks,

Jonathan


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
