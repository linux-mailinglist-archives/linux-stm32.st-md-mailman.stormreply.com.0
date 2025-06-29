Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9621AECED7
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Jun 2025 19:00:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB35CC36B31;
	Sun, 29 Jun 2025 17:00:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F697C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Jun 2025 17:00:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F3E9B6115E;
 Sun, 29 Jun 2025 17:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5139C4CEEB;
 Sun, 29 Jun 2025 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751216423;
 bh=MU4Z9EP7bSO53KKFn9ULIwyc9M5DssKRkSghJ8ajuTY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SIW/YDhYp+dpeJI6fDZLC+l+fg8EN6BOop61PFeSyT5y0PuKlkin3yrLEBJDKzdAn
 EynVJnYZcE4utivRrmcctCTB7OC8OmDabS7bCz68Xb/momLydHr9Rk/3ggDWJo/XlC
 Nad3mtxazC8VZbnfZOtjRwOpZLIevC0fmXOUJIpdQH58I3biCFmIqtokWOi9kX08hb
 juuXkmm3Pp1NT0mFNOH8EZ2dAQCybmxo+7DoZfzUDjEz+UGru841b5FLvo3FmwznEX
 +XRfJy+3bUC1tiy0zZxiN12+Bzh6UQNpIf5VxcAY05nzmVCzgY103NBHldoxzdk7VZ
 7ZWQC9FxPr2pg==
Date: Sun, 29 Jun 2025 18:00:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20250629180015.4aa4375e@jic23-huawei>
In-Reply-To: <20250628-iio-const-data-10-v1-1-0ba93ac792c8@baylibre.com>
References: <20250628-iio-const-data-10-v1-1-0ba93ac792c8@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: make
	stm32_adc_trig_info const
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

On Sat, 28 Jun 2025 11:39:33 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Add const qualifier to struct stm32_adc_trig_info. This is read-only
> data so it can be made const.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Seems to be in the 'obviously correct' category so I've applied it to the testing
branch of iio.git.  Thanks

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
