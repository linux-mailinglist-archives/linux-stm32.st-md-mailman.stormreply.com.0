Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA278B6332
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 22:07:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C559C71285;
	Mon, 29 Apr 2024 20:07:03 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79A4FC71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 20:07:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4A139CE01FF;
 Mon, 29 Apr 2024 20:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C298EC4AF14;
 Mon, 29 Apr 2024 20:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714421219;
 bh=4A88CtFhO9g0Vm1pMTxYoO6IBnLwMZJMkAtxvaB8yTQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d2Eu+bDcB2VBGxzdNS8FaG+wTdSF6EoPn0gvxQjza1D737089iPlbg0X3lOuJ7qth
 yva0Bwg83ykirUtT774C38MB8baxZTN7nAsmiaI4FJKiv2i9/gmHixZUCEOw9MeQ1h
 zg6AbK4mBXTHZT+4Cvu/os75HZWacf7PReftRCBMhYTrKwp2XbiaubHfGdTuvfZ5rg
 BONtufjopg6ZlMGGhKRZppD2XFeHXoXqHwen53ezbgea/Cg+w9UpW2hDxgRMTqxJC+
 07vhFpg9Xe221vL8ol/WQGRNXarUta0VmHYfVOgReolABJxkH5ps5kZNfzH3AFlg8w
 9NFnqEt6HKlLQ==
Date: Mon, 29 Apr 2024 21:06:48 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <20240429210648.4b429d31@jic23-huawei>
In-Reply-To: <20240429113313.68359-1-wsa+renesas@sang-engineering.com>
References: <20240429113313.68359-1-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/8] iio: use 'time_left' instead of
 'timeout' with wait_for_*() functions
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

On Mon, 29 Apr 2024 13:33:03 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_*() functions causing patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> obvious and self explaining.
> 
> This is part of a tree-wide series. The rest of the patches can be found here
> (some parts may still be WIP):
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left
> 
> Because these patches are generated, I audit them before sending. This is why I
> will send series step by step. Build bot is happy with these patches, though.
> No functional changes intended.

Nice improvement.  Applied

> 
> Wolfram Sang (8):
>   iio: adc: ad_sigma_delta: use 'time_left' variable with
>     wait_for_completion_timeout()
>   iio: adc: exynos_adc: use 'time_left' variable with
>     wait_for_completion_timeout()
>   iio: adc: fsl-imx25-gcq: use 'time_left' variable with
>     wait_for_completion_interruptible_timeout()
>   iio: adc: intel_mrfld_adc: use 'time_left' variable with
>     wait_for_completion_interruptible_timeout()
>   iio: adc: stm32-adc: use 'time_left' variable with
>     wait_for_completion_interruptible_timeout()
>   iio: adc: stm32-dfsdm-adc: use 'time_left' variable with
>     wait_for_completion_interruptible_timeout()
>   iio: adc: twl6030-gpadc: use 'time_left' variable with
>     wait_for_completion_interruptible_timeout()
>   iio: pressure: zpa2326: use 'time_left' variable with
>     wait_for_completion_interruptible_timeout()
> 
>  drivers/iio/adc/ad_sigma_delta.c  |  6 +++---
>  drivers/iio/adc/exynos_adc.c      | 16 ++++++++--------
>  drivers/iio/adc/fsl-imx25-gcq.c   | 10 +++++-----
>  drivers/iio/adc/intel_mrfld_adc.c | 12 ++++++------
>  drivers/iio/adc/stm32-adc.c       | 10 +++++-----
>  drivers/iio/adc/stm32-dfsdm-adc.c | 12 ++++++------
>  drivers/iio/adc/twl6030-gpadc.c   |  8 ++++----
>  drivers/iio/pressure/zpa2326.c    | 10 +++++-----
>  8 files changed, 42 insertions(+), 42 deletions(-)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
