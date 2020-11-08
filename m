Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E6F2AABC7
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Nov 2020 16:09:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40630C3FAE2;
	Sun,  8 Nov 2020 15:09:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 405D4C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Nov 2020 15:09:22 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8A1C206F4;
 Sun,  8 Nov 2020 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604848160;
 bh=+G82V53b9PyT+zW/wrnJYL5mP1AcSdZGFD2/L00uskw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iJ9BgLAp5BO+FjJ5wUnfFEbtqufgynTcWd82BqyOUura7c+NvGJpSDHFdHlsLSqe1
 eQeVKrhM/QTfI5VtOF2Oi5l17Bg4WUzLE2F0zsrloiksmRP8CXfNg2zIReMtA6jo97
 KWDiENDjM+YZQNSPQh9YdM7xMd6eVSAtg97BffUw=
Date: Sun, 8 Nov 2020 15:09:21 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20201108150921.11d9aefc@archlinux>
In-Reply-To: <1604685016-2434-1-git-send-email-fabrice.gasnier@st.com>
References: <1604685016-2434-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, mchehab+huawei@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] docs: ABI: testing: iio: stm32: remove
 re-introduced unsupported ABI
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

On Fri, 6 Nov 2020 18:50:16 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> Remove unsupported ABI that has been re-introduced due to a rebase hunk.
> This ABI has been moved in the past in commit b299d00420e2
> ("IIO: stm32: Remove quadrature related functions from trigger driver")
> 
> This also fixes a couple of warnings seen with:
> ./scripts/get_abi.pl validate 2>&1|grep iio
> 
> Fixes: 34433332841d ("docs: ABI: testing: make the files compatible with ReST output")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Hi Fabrice,

I guess this got accidentally applied given I thought we'd flagged up those
chunks in the patch as needing fixing.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  .../ABI/testing/sysfs-bus-iio-timer-stm32          | 24 ----------------------
>  1 file changed, 24 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32 b/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> index a10a4de..c4a4497 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> @@ -109,30 +109,6 @@ Description:
>  		When counting down the counter start from preset value
>  		and fire event when reach 0.
>  
> -What:		/sys/bus/iio/devices/iio:deviceX/in_count_quadrature_mode_available
> -KernelVersion:	4.12
> -Contact:	benjamin.gaignard@st.com
> -Description:
> -		Reading returns the list possible quadrature modes.
> -
> -What:		/sys/bus/iio/devices/iio:deviceX/in_count0_quadrature_mode
> -KernelVersion:	4.12
> -Contact:	benjamin.gaignard@st.com
> -Description:
> -		Configure the device counter quadrature modes:
> -
> -		channel_A:
> -			Encoder A input servers as the count input and B as
> -			the UP/DOWN direction control input.
> -
> -		channel_B:
> -			Encoder B input serves as the count input and A as
> -			the UP/DOWN direction control input.
> -
> -		quadrature:
> -			Encoder A and B inputs are mixed to get direction
> -			and count with a scale of 0.25.
> -
>  What:		/sys/bus/iio/devices/iio:deviceX/in_count_enable_mode_available
>  KernelVersion:	4.12
>  Contact:	benjamin.gaignard@st.com

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
