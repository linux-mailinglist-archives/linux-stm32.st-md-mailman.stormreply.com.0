Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF54A9DB66
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Apr 2025 16:16:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BA1BC78F8B;
	Sat, 26 Apr 2025 14:16:01 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3410C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Apr 2025 14:16:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C6909A4D386;
 Sat, 26 Apr 2025 14:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25313C4CEE2;
 Sat, 26 Apr 2025 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745676959;
 bh=gq8XinHjcqlcRZOej/1xdHnTuoPfOzXjgO/z4DEC6jQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=COTrvjgFkwOTT+Swfx9KhSAoZJ28/vPDZK55Zbk6uIdUp3UuSu2Dx6ZXjunBVXBnJ
 XrQ0tH6C1Eftu5rM1C+Oau8SUkldKc66L47wFeycHUoibteXtpKQMLOX396qezm9Qq
 wxT6perzW+6AzX35cMy6No17sV1msV5sXpTvyYZMEeCgqftB4KPlpVIKuuMe+jkk1Y
 TC5yrlSilYxb/VHblwCrWigvJ1N4t3VOnVtymKVWSHQNuAiu+2gsVQwKenmh0X2tOD
 XkzVvCxgVLn9o5silT4lBPqaMcjPqcwhp2yRD4LX9blCZWT0Nzh84+4skDEwMYY78V
 uXAIsbmVj0vQA==
Date: Sat, 26 Apr 2025 15:15:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20250426151552.10aaee38@jic23-huawei>
In-Reply-To: <20250424151604.626758-1-olivier.moysan@foss.st.com>
References: <20250424151604.626758-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] iio: adc: stm32: add oversampling
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

On Thu, 24 Apr 2025 17:16:03 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing the
> data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution, a right shift
> is applied to keep the initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2^n ratio <=> n right shift)
> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
>
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio
>
Applied to the togreg branch of iio.git. Initially pushed out as testing
to let 0-day have a first poke at it.

Thanks,

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
