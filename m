Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7AC5302AB
	for <lists+linux-stm32@lfdr.de>; Sun, 22 May 2022 13:36:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2341C08D1F;
	Sun, 22 May 2022 11:36:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2647C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 May 2022 11:36:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69303B80B33;
 Sun, 22 May 2022 11:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A286C385AA;
 Sun, 22 May 2022 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653219373;
 bh=fBMFnBqiOGAN81A9MlWNSeOZT2JHUUQYFi9G9tUejEw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YEaq327qkK9QJ7ad+CMNuwjvp8tX5/V1S+PtLRCZew5/f+G+pL3Z/1EMDv86xrMIg
 LuLFC4UyxRBKfFmi5DD+UPz3ahh01GnfGb8vMxtW1FmFfPsB5SBABGPRcsZ77eH9o+
 LqFp2cCxI5Kawb8AZhPpQ56MeE2Ef9gzPfSXWnK/LJJk2LFfK5RXjUqlmzvEe8wwy8
 FkASzoBTXgDeChym7sdL6Og3T1v2T+71LEw8cxKoc4XaLD3CawjpSL4Q1Q1BRvsdZo
 fQvA0SyhN1Ure8EFw6nVWgH/+pGfnA6VtuEFj48w2AGhETp/zzkzsSpmybtaZx6iHI
 EWY9u2MAh5MsQ==
Date: Sun, 22 May 2022 12:44:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Yannick Brosseau <yannick.brosseau@gmail.com>
Message-ID: <20220522124457.3546c9c8@jic23-huawei>
In-Reply-To: <20220516203939.3498673-1-yannick.brosseau@gmail.com>
References: <20220516203939.3498673-1-yannick.brosseau@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] iio: adc: stm32: Fix ADC IRQ
	handling on STM32F4
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

On Mon, 16 May 2022 16:39:37 -0400
Yannick Brosseau <yannick.brosseau@gmail.com> wrote:

> Changes to the STM32 ADC irq handling broke the STM32F4 platforms
> These two patches bring it back to a working state.
Applied to the fixes-togreg branch of iio.git and marked for stable.

Thanks,

Jonathan

> 
> Changes:
>  * Removed spurious IRQs detection
>  * Updated comments and commit messages
> 
> Yannick Brosseau (2):
>   iio: adc: stm32: Fix ADCs iteration in irq handler
>   iio: adc: stm32: Fix IRQs on STM32F4 by removing custom spurious IRQs
>     message
> 
>  drivers/iio/adc/stm32-adc-core.c |  7 ++++++-
>  drivers/iio/adc/stm32-adc.c      | 10 ----------
>  2 files changed, 6 insertions(+), 11 deletions(-)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
