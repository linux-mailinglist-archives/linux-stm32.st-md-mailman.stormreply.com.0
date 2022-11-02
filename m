Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F66616E86
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Nov 2022 21:23:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 133BEC04003;
	Wed,  2 Nov 2022 20:23:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27FFDC03FD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Nov 2022 20:23:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD25461BF7;
 Wed,  2 Nov 2022 20:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31530C433C1;
 Wed,  2 Nov 2022 20:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667420634;
 bh=SoPxowNL2wQMY8yb7AJeEyGxnbtrkZim847pUvBQbwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LfjPqEtYXiCdkBLiD6Mb9K3XA51IVPUzGRUTvms6p8otl6PuFvxWJt1eNfolnsfMh
 8dOIiVYrNAvWUbc0eNesbhfxuTxND9PyOfr87g31Ntyy1O1D+CTiL0Ie98zFKhuL6L
 pQ6P5NPg9O9EYdY94YsL2yXqg36H/b9HAt0cdMS0OgSSvy64YmI0vtfYhObAcu3zvz
 dNfsvy2LS2sTnLtx58wwVQmNFpMeTJG42JD4GtztqHso9Ufxk1sH8tTONFs9g9eRjR
 Xm+yRgTchmBGh4Sk8fbw4WKFDXV+G1cCqTlkngWQBtrxjrVSY5vsGgYa9I9w0HKA3v
 fRU/uLjxEBNqQ==
Date: Wed, 2 Nov 2022 13:23:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <Y2LR13xrrauVmeXP@dev-arch.thelio-3990X>
References: <20221102172217.2860740-1-nathan@kernel.org>
 <202211021216.FF49E84C69@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202211021216.FF49E84C69@keescook>
Cc: linux-omap@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>,
 William Breathitt Gray <william.gray@linaro.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Julien Panis <jpanis@baylibre.com>, David Lechner <david@lechnology.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH 1/4] counter: Adjust final parameter type
 in function and signal callbacks
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

On Wed, Nov 02, 2022 at 12:21:23PM -0700, Kees Cook wrote:
> On Wed, Nov 02, 2022 at 10:22:14AM -0700, Nathan Chancellor wrote:
> > The ->signal_u32_read(), ->count_u32_read(), and ->count_u32_write()
> > callbacks in 'struct counter_comp' expect the final parameter to have a
> > type of 'u32' or 'u32 *' but the ops functions that are being assigned
> > to those callbacks have an enumerated type as the final parameter. While
> > these are compatible from an ABI perspective, they will fail the
> > aforementioned CFI checks.
> > 
> > Adjust the type of the final parameter in the ->signal_read(),
> > ->function_read(), and ->function_write() callbacks in 'struct
> > counter_ops' and their implementations to match the prototypes in
> > 'struct counter_comp' to clear up these warnings and CFI failures.
> 
> I don't understand these changes. Where do 'struct counter_comp'
> and 'struct counter_ops' get confused? I can only find matching
> ops/assignments/calls, so I must be missing something. This looks like
> a loss of CFI granularity instead of having wrappers added if there is
> an enum/u32 conversion needed somewhere.

Right, I am not the biggest fan of this change myself and it is entirely
possible that I am misreading the warnings from the commit message but I
do not see how

        comp_node.comp.signal_u32_read = counter->ops->signal_read;

and

        comp_node.comp.count_u32_read = counter->ops->function_read;

in counter_add_watch(),

        comp.signal_u32_read = counter->ops->signal_read;

in counter_signal_attrs_create(), and

        comp.count_u32_read = counter->ops->function_read;
        comp.count_u32_write = counter->ops->function_write;

in counter_count_attrs_create() are currently safe under kCFI, since the
final parameter type of the prototypes in 'struct counter_ops' does not
match the final parameter type of the prototypes in 'struct
counter_comp'. I would expect the indirect calls in counter_get_data()
and counter_comp_u32_show() to fail currently.

I briefly looked at making the 'struct counter_comp' callbacks match the
'struct counter_ops' ones but the COUNTER_COMP macros in
include/linux/counter.h made it seem like these callbacks might be used
by implementations that might use different enumerated types as the
final parameter. I can look a little closer to see if we can make
everything match.

I am not sure how wrappers would work here, I can take a look into how
feasible that is.

Cheers,
Nathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
