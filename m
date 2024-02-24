Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501B862620
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Feb 2024 17:51:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA1BFC6B47A;
	Sat, 24 Feb 2024 16:51:50 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0064AC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Feb 2024 16:51:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 326C8CE0C48;
 Sat, 24 Feb 2024 16:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A65C433F1;
 Sat, 24 Feb 2024 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708793506;
 bh=nihirJ4RZALZuGoBNINSTW4VKZsU1WnAfv17CGmeF8o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dNTtK/Li5PCR0Sg1Ccnvl305yJ56h4eFbwZCT7S7n1lLZ44JKhTtzX9SjlZDIoF+M
 VzoYFmO0d729WgRzmEG8T7dR6pWU6QvAB3gExw33F9y3z4k8Nmmeue1M5uQn7+7DkV
 dplA7SXAHj84+JiuBT0Cu1xnBbjODy4qb+78Nv8AgRZJa2vMr/mBENpHY2l/mKzc0P
 7CKFBpvcUs2atEmOYo9zrRl0/By0CzNPPdmsMuGnBpwFG87CrlqoW+ilCi3NPLeucx
 5EAC4DBB7Q4N/VWNH24Jy1M+bFi7n3T4PzkWQ5ztdWgmoRagc8zgxe9RHx8F8jATlh
 zUwlfl6/C8hIQ==
Date: Sat, 24 Feb 2024 16:51:33 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20240224165133.33a6ad94@jic23-huawei>
In-Reply-To: <20240219-mainline-spi-precook-message-v2-4-4a762c6701b9@baylibre.com>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
 <20240219-mainline-spi-precook-message-v2-4-4a762c6701b9@baylibre.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>,
 David Jander <david@protonic.nl>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/5] spi: axi-spi-engine: move message
 compile to optimize_message
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

On Mon, 19 Feb 2024 16:33:21 -0600
David Lechner <dlechner@baylibre.com> wrote:

> In the AXI SPI Engine driver, compiling the message is an expensive
> operation. Previously, it was done per message transfer in the
> prepare_message hook. This patch moves the message compile to the
> optimize_message hook so that it is only done once per message in
> cases where the peripheral driver calls spi_optimize_message().
> 
> This can be a significant performance improvement for some peripherals.
> For example, the ad7380 driver saw a 13% improvement in throughput
> when using the AXI SPI Engine driver with this patch.
> 
> Since we now need two message states, one for the optimization stage
> that doesn't change for the lifetime of the message and one that is
> reset on each transfer for managing the current transfer state, the old
> msg->state is split into msg->opt_state and spi_engine->msg_state. The
> latter is included in the driver struct now since there is only one
> current message at a time that can ever use it and it is in a hot path
> so avoiding allocating a new one on each message transfer saves a few
> cpu cycles and lets us get rid of the prepare_message callback.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Whilst I'm not familiar with this driver, from a quick look at this
patch and the driver code, looks fine to me. So FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
