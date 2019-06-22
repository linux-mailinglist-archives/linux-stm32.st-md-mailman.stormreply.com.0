Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619C4F56A
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 12:53:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF1B2C5AFCB
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 10:53:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2899EC5AFC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jun 2019 10:53:03 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE8552070B;
 Sat, 22 Jun 2019 10:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561200781;
 bh=XsbuTsWAoPCkGtHDg3vcdixFu29Z85KfcwCZsLv7mjk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EPAoZkeC+6QAR2EdwogfOoGFFEZE+gmxui1DPjGHrEGbnyTkDXCNB4JV4jkWgM7RU
 4ZRclW5kES0zbpu/D1sqdT/fWDk5RHUnknTH/1sQO9YErbxx61w6Vof8f60uNhjh3i
 sV3+9PRA+EAyyxE/3X1tQMsfJUVFX5BsGKVDkzeo=
Date: Sat, 22 Jun 2019 11:52:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <20190622115257.7198f8d4@archlinux>
In-Reply-To: <20190617143057.4096-1-geert+renesas@glider.be>
References: <20190617143057.4096-1-geert+renesas@glider.be>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] Documentation: ABI: Add missing newline
	at end of file
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

On Mon, 17 Jun 2019 16:30:57 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> "git diff" says:
> 
>     \ No newline at end of file
> 
> after modifying the files.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan

> ---
>  Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32 | 2 +-
>  Documentation/ABI/testing/sysfs-power                   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32 b/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32
> index da9822309f0757bd..0e66ae9b0071e80b 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32
> @@ -13,4 +13,4 @@ Description:
>  			error on writing
>  		If DFSDM input is SPI Slave:
>  			Reading returns value previously set.
> -			Writing value before starting conversions.
> \ No newline at end of file
> +			Writing value before starting conversions.
> diff --git a/Documentation/ABI/testing/sysfs-power b/Documentation/ABI/testing/sysfs-power
> index 18b7dc929234f625..3c51303550118474 100644
> --- a/Documentation/ABI/testing/sysfs-power
> +++ b/Documentation/ABI/testing/sysfs-power
> @@ -300,4 +300,4 @@ Description:
>  		attempt.
>  
>  		Using this sysfs file will override any values that were
> -		set using the kernel command line for disk offset.
> \ No newline at end of file
> +		set using the kernel command line for disk offset.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
