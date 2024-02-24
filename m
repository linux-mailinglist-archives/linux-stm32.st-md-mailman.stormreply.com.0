Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E2086262E
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Feb 2024 17:57:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22577C6B47A;
	Sat, 24 Feb 2024 16:57:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 138B8C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Feb 2024 16:57:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E4C5E60B2F;
 Sat, 24 Feb 2024 16:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09E2C433C7;
 Sat, 24 Feb 2024 16:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708793843;
 bh=b1/O19NtIgvo/C+lW8h+C0KQWgkOYejs2p1WPoFlrhQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o0SNdABSZnstzIU5Tkf/2awpLbq6irmAkpVOB826tfoe+pTjmSkJv7cWfXBql67Cy
 2ykl6W0SfHuZQKaM7IDFV4s0rolTsZlDVJD6weRIv1T2x5EEmbpa+ACLQScmDPEYcu
 YKhO5EHBaxgAeMKVyF788hgYzJIuqnLPfH9frtZS/zJm1jJ59LlFsXXNja5y+60Rlw
 Dbzo/da4Zum8Sdp/+fuiXvZAkU3ultlDRy0pZMZaWWcCpdfnMGdoJ7ys4tBN1LYXnC
 NG5yZTgqyODzmpC773fHbt+nCY6qm4yGyx44JMj6nxrI3QXhybydAkPiZhFnnVVrUg
 GgCeUxwIy2yMg==
Date: Sat, 24 Feb 2024 16:57:06 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20240224165706.18cc0d7e@jic23-huawei>
In-Reply-To: <20240219-mainline-spi-precook-message-v2-5-4a762c6701b9@baylibre.com>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
 <20240219-mainline-spi-precook-message-v2-5-4a762c6701b9@baylibre.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>,
 David Jander <david@protonic.nl>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/5] iio: adc: ad7380: use
	spi_optimize_message()
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

On Mon, 19 Feb 2024 16:33:22 -0600
David Lechner <dlechner@baylibre.com> wrote:

> This modifies the ad7380 ADC driver to use spi_optimize_message() to
> optimize the SPI message for the buffered read operation. Since buffered
> reads reuse the same SPI message for each read, this can improve
> performance by reducing the overhead of setting up some parts the SPI
> message in each spi_sync() call.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Looks good to me.

As this is the driver you asked me to drop earlier this cycle,
how do we plan to merge this series?

If Mark is fine taking 1-4 with the user following along that's
fine by me, if not I guess we are in immutable tree territory for
next cycle?

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
