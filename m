Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F359EA65B41
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Mar 2025 18:45:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A48F0C78F62;
	Mon, 17 Mar 2025 17:45:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFA31C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 17:45:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2DD413D5;
 Mon, 17 Mar 2025 10:45:31 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A758B3F694;
 Mon, 17 Mar 2025 10:45:22 -0700 (PDT)
Date: Mon, 17 Mar 2025 17:45:18 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20250317174518.GJ2487211@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-7-james.clark@linaro.org>
 <20250314095025.GW9682@e132581.arm.com>
 <9d06b27a-c2ce-41b8-9657-151000c0b244@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d06b27a-c2ce-41b8-9657-151000c0b244@linaro.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, lcherian@marvell.com,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 6/7] coresight: Remove inlines from static
 function definitions
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

On Mon, Mar 17, 2025 at 03:26:42PM +0000, James Clark wrote:
> On 14/03/2025 9:50 am, Leo Yan wrote:
> > On Tue, Feb 11, 2025 at 10:39:42AM +0000, James Clark wrote:
> > > 
> > > These are all static and in one compilation unit so the inline has no
> > > effect on the binary.
> > 
> > I read the doc coding-style.rst, the section "15) The inline disease",
> > my understanding is though the inline is not encouraged, I prefer we can
> > follow up the rule:
> > 
> >    A reasonable rule of thumb is to not put inline at functions that have more
> >    than 3 lines of code in them. An exception to this rule are the cases where
> >    a parameter is known to be a compile time constant, and as a result of this
> >    constantness you *know* the compiler will be able to optimize most of your
> >    function away at compile time. For a good example of this later case, see
> >    the kmalloc() inline function.
> > 
> 
> Isn't this advice about whether to make an inline function in a header file
> or do definition + declaration?

Maybe it is not about where defines inline functions.  It is about
how these inline functions are invoked.  E.g., in a single C file, a
inline function can be invoked in multiple places, and it is possible
the incline function can optimized by compiler case by case.

To be honest, I don't really understand how compiler works :)

[...]

> I think it can be useful, I've used it a little bit. Might as well make it
> easier to use for someone if it exists.

Sure.  This patch is fine for me.  I verified this patch with default
kernel configuration (-O2, -g), it does works as expected (no code and
data section's size change between with and without this patch).

Thanks,
Leo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
