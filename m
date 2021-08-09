Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D13E4D06
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 21:23:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7155CC57B51;
	Mon,  9 Aug 2021 19:23:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC263C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 19:23:51 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C65C260FDA;
 Mon,  9 Aug 2021 19:23:45 +0000 (UTC)
Date: Mon, 9 Aug 2021 20:26:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210809202637.4aac5c81@jic23-huawei>
In-Reply-To: <43b4acab9e238638c7067dd4a363a42f94c94ccb.1628511445.git.vilhelm.gray@gmail.com>
References: <cover.1628511445.git.vilhelm.gray@gmail.com>
 <43b4acab9e238638c7067dd4a363a42f94c94ccb.1628511445.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v15 01/13] counter: 104-quad-8: Describe
 member 'lock' in 'quad8'
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

On Mon,  9 Aug 2021 21:37:26 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> This adds a kernel-doc comment line describing the 'lock' member of the
> 'quad8' structure.
> 
> Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
Initially I was confused as to when Syed had acked a new patch, but
then realised you have pulled it out of the later spinlock conversion
patch which Syed had indeed acked, so fair enough.

Applied to the togreg branch of iio.git and (unlike yesterday)
pushed out as testing for 0-day to poke at it.
> ---
>  drivers/counter/104-quad-8.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index 5283ff128c17..0caa60537b14 100644
> --- a/drivers/counter/104-quad-8.c
> +++ b/drivers/counter/104-quad-8.c
> @@ -28,6 +28,7 @@ MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
>  
>  /**
>   * struct quad8 - device private data structure
> + * @lock:		lock to prevent clobbering device states during R/W ops
>   * @counter:		instance of the counter_device
>   * @fck_prescaler:	array of filter clock prescaler configurations
>   * @preset:		array of preset values

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
