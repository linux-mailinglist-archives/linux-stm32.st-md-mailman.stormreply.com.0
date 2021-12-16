Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0BF4771D5
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 13:31:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E21AC5E2C5;
	Thu, 16 Dec 2021 12:31:17 +0000 (UTC)
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com
 [46.235.224.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA5B9C5E2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 12:31:15 +0000 (UTC)
Received: from [81.101.6.87] (port=52570 helo=jic23-huawei)
 by haggis.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <jic23@jic23.retrosnub.co.uk>)
 id 1mxpuh-0005Cz-Dz; Thu, 16 Dec 2021 12:31:11 +0000
Date: Thu, 16 Dec 2021 12:36:27 +0000
From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20211216123615.3e311c2b@jic23-huawei>
In-Reply-To: <20211215232513.2070158-1-keescook@chromium.org>
References: <20211215232513.2070158-1-keescook@chromium.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-BlackCat-Spam-Score: 19
X-Spam-Status: No, score=1.9
Cc: Lars-Peter Clausen <lars@metafoo.de>, Yury Norov <yury.norov@gmail.com>,
 linux-iio@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: stmpe-adc: Use correctly sized
 arguments for bit field
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

On Wed, 15 Dec 2021 15:25:13 -0800
Kees Cook <keescook@chromium.org> wrote:

> The find.h APIs are designed to be used only on unsigned long arguments.
> This can technically result in a over-read, but it is harmless in this
> case. Regardless, fix it to avoid the warning seen under -Warray-bounds,
> which we'd like to enable globally:
> 
> In file included from ./include/linux/bitmap.h:9,
>                  from ./include/linux/cpumask.h:12,
>                  from ./arch/x86/include/asm/cpumask.h:5,
>                  from ./arch/x86/include/asm/msr.h:11,
>                  from ./arch/x86/include/asm/processor.h:22,
>                  from ./arch/x86/include/asm/cpufeature.h:5,
>                  from ./arch/x86/include/asm/thread_info.h:53,
>                  from ./include/linux/thread_info.h:60,
>                  from ./arch/x86/include/asm/preempt.h:7,
>                  from ./include/linux/preempt.h:78,
>                  from ./include/linux/spinlock.h:55,
>                  from ./include/linux/swait.h:7,
>                  from ./include/linux/completion.h:12,
>                  from drivers/iio/adc/stmpe-adc.c:10:
> drivers/iio/adc/stmpe-adc.c: In function 'stmpe_adc_probe':
> ./include/linux/find.h:98:23: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-Warray-bounds]
>    98 |                 val = *addr | ~GENMASK(size - 1, offset);
>       |                       ^~~~~
> drivers/iio/adc/stmpe-adc.c:258:13: note: while referencing 'norequest_mask'
>   258 |         u32 norequest_mask = 0;
>       |             ^~~~~~~~~~~~~~
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied to the togreg branch of iio.git and pushed out as testing to let
0-day have a first poke at it.

I took the view this one was trivial, but if anyone else wants to add
tags there will be a few days before this goes out in a form I'm not happy
to rebase.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stmpe-adc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
> index fba659bfdb40..d2d405388499 100644
> --- a/drivers/iio/adc/stmpe-adc.c
> +++ b/drivers/iio/adc/stmpe-adc.c
> @@ -256,6 +256,7 @@ static int stmpe_adc_probe(struct platform_device *pdev)
>  	struct stmpe_adc *info;
>  	struct device_node *np;
>  	u32 norequest_mask = 0;
> +	unsigned long bits;
>  	int irq_temp, irq_adc;
>  	int num_chan = 0;
>  	int i = 0;
> @@ -309,8 +310,8 @@ static int stmpe_adc_probe(struct platform_device *pdev)
>  
>  	of_property_read_u32(np, "st,norequest-mask", &norequest_mask);
>  
> -	for_each_clear_bit(i, (unsigned long *) &norequest_mask,
> -			   (STMPE_ADC_LAST_NR + 1)) {
> +	bits = norequest_mask;
> +	for_each_clear_bit(i, &bits, (STMPE_ADC_LAST_NR + 1)) {
>  		stmpe_adc_voltage_chan(&info->stmpe_adc_iio_channels[num_chan], i);
>  		num_chan++;
>  	}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
