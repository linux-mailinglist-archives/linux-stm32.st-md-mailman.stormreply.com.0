Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD45F2361
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Oct 2022 15:33:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 528F3C640F9;
	Sun,  2 Oct 2022 13:33:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2CB0C640EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Oct 2022 13:33:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B329F60D2D;
 Sun,  2 Oct 2022 13:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2991FC433D6;
 Sun,  2 Oct 2022 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664717581;
 bh=ip2SEwPEk79/NVSLR/aKzp9lX2c3j+xDgmd4CAEEvAc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MfjLc+nyXECLHzOijUKe92NOenb1ZvhnQKXYzLVDJHC6T9zVC3J+zo3iCcjyskjqF
 k/NOePyASmXK/x/pMlRhTUaPrXIKEnu3xjRuq5OQ4AGot1ywkF54TO/58xlxAmT0gp
 qSjqDc3Upw/IwYnQLxRIhAvSvO6PKdSi70UopjKIclFpX60UA8Nl3pIF9cxh/9RBJt
 Zz92vVPrWrvx8YpaKc3XbU4azjzhXhre3yEto8BljAj4uAwskH8xNZgvE7IHAaRcb0
 Ycym//1UGWiVY5vkciQLNcjKkyKLA18q5C8LpUH3OgI7rkdQHtaUTs7BuGCLGrBJFz
 9Pk2FmEeF7mzA==
Date: Sun, 2 Oct 2022 14:33:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20221002143315.05b867a2@jic23-huawei>
In-Reply-To: <CAHp75Vf1rJRVK5Emuwk4863DTb9JjTswJefJM-1oX+2gQvLMRg@mail.gmail.com>
References: <20220928164114.48339-1-olivier.moysan@foss.st.com>
 <20220928164114.48339-2-olivier.moysan@foss.st.com>
 <CAHp75Vf1rJRVK5Emuwk4863DTb9JjTswJefJM-1oX+2gQvLMRg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, Wan Jiabing <wanjiabing@vivo.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, nuno.sa@analog.com,
 Paul Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/8] iio: adc: stm32-adc: fix channel
	sampling time init
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

On Wed, 28 Sep 2022 19:51:04 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Wed, Sep 28, 2022 at 7:42 PM Olivier Moysan
> <olivier.moysan@foss.st.com> wrote:
> >
> > Fix channel init for ADC generic channel bindings.
> > In generic channel initialization, stm32_adc_smpr_init() is called
> > to initialize channel sampling time. The "st,min-sample-time-ns"
> > property is an optional property. If it is not defined,
> > stm32_adc_smpr_init() is currently skipped. However stm32_adc_smpr_init()
> > must always be called, to force a minimum sampling time for
> > the internal channels, as the minimum sampling time is known.
> > Make stm32_adc_smpr_init() call unconditional.  
> 
> What is the text width here? It's okay to use Up to ~72 (or slightly
> more) as a limit and format accordingly.
> 
> > Fixes: 796e5d0b1e9b ("iio: adc: stm32-adc: use generic binding for sample-time")
> >
> > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>  
> 
> Tag blocks mustn't have the blank lines.
> 
For this one, please make it clear if this is breaking current systems
or if this is more theoretical, so I can judge whether to rush it in (and
potentially slow down the rest of this patch set!)

Jonathan


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
