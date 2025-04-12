Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 291DAA86D4A
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 15:26:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98E39C78F77;
	Sat, 12 Apr 2025 13:26:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AD33C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 13:26:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 398CC43CAB;
 Sat, 12 Apr 2025 13:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9CFC4CEE3;
 Sat, 12 Apr 2025 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744464376;
 bh=1ALYRoSS13OMdV42CmJZDGrcuxFhf+AdPHTEVZVQj1w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UmjGC+SVrPZXCioxg+ooNogCzyH8KJb68+7bvldVTrKNG5l078qhhnOxjNOmVb91k
 KWC0nvj5d66ngb+smsKNsbLLI6suFk2j17tEw1F+20344M4WMjpos0HBXk5LC8UWq1
 6Fa1YvbZnulVM5cbbkwFvIl5q7w3gPuIKvGSUc2qnlmvO8bvUvxcDzmPeEc4xSrHQx
 hFeB0lzsJZ+YO9vCUOtRGCDK0eowoCxmxE6LXVxWe4TrUsBUMXSKKuikGS59d006mq
 u9pckEfFMG8Wu36R7kicT+YPq4KKH77QMtc0Z+R7Pg/cq3ZbvbsKi4B17FODJJB8B4
 KGGJSot5+EMsA==
Date: Sat, 12 Apr 2025 14:26:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20250412142606.66673634@jic23-huawei>
In-Reply-To: <20250410135836.2091238-1-olivier.moysan@foss.st.com>
References: <20250410135836.2091238-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] iio: adc: stm32: add oversampling
	support
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

On Thu, 10 Apr 2025 15:58:35 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing
> the data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution,
> a right shift is applied to keep initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2exp(n) ratio <=> n right shift)
I rewrapped this description to 75 chars  (which is roughly the maximum
we should see in a commit message).

In general I'd prefer to keep comments in code to 80 char, but in this
particular case I left the formatting you have alone as it was really fiddly
to get it looking nice at a shorter length.

I had applied this but then noticed....

> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
> 
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
This SoB sequence isn't right.  What was Fabrice's role
in this patch?   Either I'd expect the from to be set to Fabrice
(on basis Olivier was posting some work of Fabrice) or
a Co-developed-by for Fabrice to indicate it was joint work
and Olivier was the one posting it.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
