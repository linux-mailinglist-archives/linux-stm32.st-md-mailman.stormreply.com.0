Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3588D862607
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Feb 2024 17:36:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB559C6B47A;
	Sat, 24 Feb 2024 16:36:38 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0152EC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Feb 2024 16:36:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4E3B7CE0B5B;
 Sat, 24 Feb 2024 16:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625D2C433C7;
 Sat, 24 Feb 2024 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708792595;
 bh=gM276SnHL2yQRhjWluMy72+pHXOACMKdHCyQEkwDvW0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eS2pHSNTctVqZzjxj55wZ7G7ek+cOc48r61zURdfat6qlFaGzGcVpU3AyLll0ReE8
 m687ScBjqS9ptwEn7+/GQS0vXXvQERJbTmzekOQMPsAE+Rm5l7xqdUBQsIFTpNvVan
 tGNBuon5fdADFZjSTB3syn4s8w553xVYOtAQ8lhfvCJTPMwr0QY6llrhkVCuzlKIi7
 HYNWKvi1US/l8T+p5PsbZn2jOKMLJhEF4ybzMMJboMSz5z41h1MSBhTqFKvjzRIZbj
 Suv2ANY/0FEO5GbXSBdxnIveTn4HZI1JuPPeveMFAcZvNZ39uRuR7yXC5C4kJM3+qa
 uWjP+05puz6Sg==
Date: Sat, 24 Feb 2024 16:36:22 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20240224163622.7499cdd0@jic23-huawei>
In-Reply-To: <20240219-mainline-spi-precook-message-v2-1-4a762c6701b9@baylibre.com>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
 <20240219-mainline-spi-precook-message-v2-1-4a762c6701b9@baylibre.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Jander <david@protonic.nl>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/5] spi: add spi_optimize_message()
	APIs
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

On Mon, 19 Feb 2024 16:33:18 -0600
David Lechner <dlechner@baylibre.com> wrote:

> This adds a new spi_optimize_message() function that can be used to
> optimize SPI messages that are used more than once. Peripheral drivers
> that use the same message multiple times can use this API to perform SPI
> message validation and controller-specific optimizations once and then
> reuse the message while avoiding the overhead of revalidating the
> message on each spi_(a)sync() call.
> 
> Internally, the SPI core will also call this function for each message
> if the peripheral driver did not explicitly call it. This is done to so
> that controller drivers don't have to have multiple code paths for
> optimized and non-optimized messages.
> 
> A hook is provided for controller drivers to perform controller-specific
> optimizations.
> 
> Suggested-by: Martin Sperl <kernel@martin.sperl.org>
> Link: https://lore.kernel.org/linux-spi/39DEC004-10A1-47EF-9D77-276188D2580C@martin.sperl.org/
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Very nice.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
