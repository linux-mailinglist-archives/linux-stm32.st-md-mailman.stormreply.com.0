Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE08A2693
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 08:28:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E9B1C6DD66;
	Fri, 12 Apr 2024 06:28:13 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2870C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 06:28:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1C4E1CE319F;
 Fri, 12 Apr 2024 06:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405FDC2BBFC;
 Fri, 12 Apr 2024 06:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712903289;
 bh=zgUjpYLth8c3Bov77A49CZpA8m7933+tVeBvXp/8wOY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=mcD9oVlH4scQ0n8FoGrPsd+Wh/j9+FrlK3kD+wBSEvJRwiB2l3BmDvsbJfmQ8YsCg
 bgUu5iA9baeH3R3QfZh9bYBuBVqPG9rsn2EOGxf+97lT+G0H9mnbQ9FhBpqzdW2oXh
 0d3j7/KzvaMREQOA8mkfLJRlpWVgFjvV/IgeKTv86yArvOytXcFl0n1QKUoQ2Vimo4
 Li9mZ/OQHPNMRB8mCmQW3Z84qs+wcf8MHRO9/YmmlkHqJFhW3ELj+diPpTsmzDFW/R
 ADRW15Nbxqr78VwBKSXFS1A3kUUgWZam+5Jt4yAOV5fJtg0nTh4P4w8QQyUXtqUl+n
 RhFDBtVGuR2Wg==
Message-ID: <3d6d34c5075559f3df506d14e38a9c0c.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZaG2ZDCLP34jcI6Y@dell-precision-5540>
References: <20231002180854.1603452-1-ben.wolsieffer@hefring.com>
 <20231002180854.1603452-2-ben.wolsieffer@hefring.com>
 <883a61872f94c972cc410da84eaf7b97.sboyd@kernel.org>
 <ZaG2ZDCLP34jcI6Y@dell-precision-5540>
From: Stephen Boyd <sboyd@kernel.org>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Date: Thu, 11 Apr 2024 23:28:07 -0700
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] clk: stm32: initialize syscon after
	clocks are registered
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

Quoting Ben Wolsieffer (2024-01-12 14:00:04)
> On Sun, Dec 17, 2023 at 03:05:01PM -0800, Stephen Boyd wrote:
> > Quoting Ben Wolsieffer (2023-10-02 11:08:53)
> > > The stm32-power-config syscon (PWR peripheral) is used in this driver
> > > and the STM32 RTC driver to enable write access to backup domain
> > > registers. The syscon's clock has a gate controlled by this clock
> > > driver, but this clock is currently not registered in the device tree.
> > > This only happens to work currently because all relevant clock setup and
> > > RTC initialization happens before clk_disabled_unused(). After this
> > > point, all syscon register writes are ignored.
> > 
> > Seems like we should mark those clks as CLK_IGNORE_UNUSED and add a
> > comment to that fact.
> 
> That seems like a worse solution than specifying the clock dependency in
> the device tree.
> 
> > 
> > > 
> > > If we simply add the syscon clock in the device tree, we end up with a
> > > circular dependency because the clock has not been registered at the
> > > point this driver requests the syscon.
> > > 
> > > This patch avoids this circular dependency by moving the syscon lookup
> > > after the clocks are registered. This does appear to create a possible
> > > race condition where someone could attempt to perform an operation on a
> > > backup domain clock before the syscon has been initialized. This would
> > > result in the operation having no effect because backup domain writes
> > > could not be enabled. I'm not sure if this is a problem or if there is
> > > a way to avoid it.
> > 
> > There's no comment in the code that says the regmap must be set there
> > instead of earlier. What's to stop someone from tripping over this
> > problem later? At the least, please add a comment.
> 
> Yeah, I'll fix that. Do you have any thoughts on the race condition I
> described? Should I add some kind of locking to block
> enable/disable_power_domain_write_protection() until stm32f4_rcc_init()
> attempts to initialize the syscon?

Maybe. I don't really know and it's probably because I don't really
understand the problem. Maybe you can solve it by turning on the backup
domain clock manually when the driver probes via direct register writes
and then only publish the syscon once the backup domain clock is
registered?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
