Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E51E989D
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2020 17:40:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B5AEC36B22;
	Sun, 31 May 2020 15:40:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70081C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2020 15:40:27 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB41620659;
 Sun, 31 May 2020 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590939626;
 bh=ZihwhZLxsqzhnXkpIKIJp7j0qhmfl7QS0mKBa+pmKOg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tp1Sv1rUKr6NrKiTwxlXF4s0pdEoq4kByy9NBdZGnj+otXZHgL3vPTm3kV/UlDZcy
 IR70NT10/iVsHYN4bHayiWg2mM/gVhkFaHgFv23m99x35bH7xvtwmDNpiWgetRj8lO
 EKkSDV4lAJJImd26X+G1XZaAVuYfJvZc8FKw6Yfo=
Date: Sun, 31 May 2020 16:40:20 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Message-ID: <20200531164020.765822dc@archlinux>
In-Reply-To: <20200525113855.178821-3-alexandru.ardelean@analog.com>
References: <20200525113855.178821-1-alexandru.ardelean@analog.com>
 <20200525113855.178821-3-alexandru.ardelean@analog.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linus.walleij@linaro.org, Lars-Peter Clausen <lars@metafoo.de>,
 linux-iio@vger.kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, songqiang1304521@gmail.com,
 mcoquelin.stm32@gmail.com, lorenzo.bianconi83@gmail.com, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] iio: remove
 iio_triggered_buffer_postenable()/iio_triggered_buffer_predisable()
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

On Mon, 25 May 2020 14:38:55 +0300
Alexandru Ardelean <alexandru.ardelean@analog.com> wrote:

> From: Lars-Peter Clausen <lars@metafoo.de>
> 
> This patch should be squashed into the first one, as the first one is
> breaking the build (intentionally) to make the IIO core files easier to
> review.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---

Friend poke.  Version log?

Other than the wistful comment below (which I'm not expecting you to
do anything about btw!) whole series looks good to me.

These are obviously no functional changes (I think) so it's only really patch 2 that
could do with more eyes and acks.

Far as I can tell that case is fine as well because of the protections
on being in the right mode, but more eyes on that would be great.

So assuming that's fine, what commit message do you want me to use for
the fused single patch?

Thanks,

Jonathan

>  static const struct iio_trigger_ops atlas_interrupt_trigger_ops = {
> diff --git a/drivers/iio/dummy/iio_simple_dummy_buffer.c b/drivers/iio/dummy/iio_simple_dummy_buffer.c
> index 17606eca42b4..8e13c53d4360 100644
> --- a/drivers/iio/dummy/iio_simple_dummy_buffer.c
> +++ b/drivers/iio/dummy/iio_simple_dummy_buffer.c
> @@ -99,20 +99,6 @@ static irqreturn_t iio_simple_dummy_trigger_h(int irq, void *p)
>  }
>  
>  static const struct iio_buffer_setup_ops iio_simple_dummy_buffer_setup_ops = {
> -	/*
> -	 * iio_triggered_buffer_postenable:
> -	 * Generic function that simply attaches the pollfunc to the trigger.
> -	 * Replace this to mess with hardware state before we attach the
> -	 * trigger.
> -	 */
> -	.postenable = &iio_triggered_buffer_postenable,
> -	/*
> -	 * iio_triggered_buffer_predisable:
> -	 * Generic function that simple detaches the pollfunc from the trigger.
> -	 * Replace this to put hardware state back again after the trigger is
> -	 * detached but before userspace knows we have disabled the ring.
> -	 */
> -	.predisable = &iio_triggered_buffer_predisable,
>  };
>  
Hmm. Guess we should probably 'invent' a reason to illustrate the bufer
ops in the dummy example.  Anyone feeling creative?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
