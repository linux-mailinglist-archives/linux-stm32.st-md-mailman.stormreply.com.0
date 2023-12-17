Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3681633F
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 00:05:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0918EC6DD6F;
	Sun, 17 Dec 2023 23:05:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92861C6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Dec 2023 23:05:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47D0D60BC3;
 Sun, 17 Dec 2023 23:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A8FC433C7;
 Sun, 17 Dec 2023 23:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702854303;
 bh=C31/vdIwlOG4/RQpDKhURj/OwqcINur5NKr6OP5ZcBY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=caqjKKMZzNHtUE0k7JGP35K97SrxPimgNRsRVIJWxbjG1a00XoKn/0+6ZnN89afve
 PIBAxXW8bxMrKeUs+DTNEf5gXZnCr4QZvlvWU+9uYUhn8hDW3nyYmQlTQJ1YpG36zn
 CUYH4ZjWdNwIOt9h2GICr9xgmZVbfoG1VW+kPLf96DYm3hE9cwBJ+pU/5Dn4tJjUN+
 9y0OpSVS4eBouTH5fVXb7cBzIiM2xBIa/GQq2jsqRrdhewFJG6oU5Zz/opuLCgtrt0
 lr0ISwKr0/aUkOPgwzNWluAXdwOsnl/IBG7obL957qQpuvRPCK76VaMuKUJU2BFe0b
 vEooQ6HNn55/w==
Message-ID: <883a61872f94c972cc410da84eaf7b97.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231002180854.1603452-2-ben.wolsieffer@hefring.com>
References: <20231002180854.1603452-1-ben.wolsieffer@hefring.com>
 <20231002180854.1603452-2-ben.wolsieffer@hefring.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 17 Dec 2023 15:05:01 -0800
User-Agent: alot/0.10
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
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

Quoting Ben Wolsieffer (2023-10-02 11:08:53)
> The stm32-power-config syscon (PWR peripheral) is used in this driver
> and the STM32 RTC driver to enable write access to backup domain
> registers. The syscon's clock has a gate controlled by this clock
> driver, but this clock is currently not registered in the device tree.
> This only happens to work currently because all relevant clock setup and
> RTC initialization happens before clk_disabled_unused(). After this
> point, all syscon register writes are ignored.

Seems like we should mark those clks as CLK_IGNORE_UNUSED and add a
comment to that fact.

> 
> If we simply add the syscon clock in the device tree, we end up with a
> circular dependency because the clock has not been registered at the
> point this driver requests the syscon.
> 
> This patch avoids this circular dependency by moving the syscon lookup
> after the clocks are registered. This does appear to create a possible
> race condition where someone could attempt to perform an operation on a
> backup domain clock before the syscon has been initialized. This would
> result in the operation having no effect because backup domain writes
> could not be enabled. I'm not sure if this is a problem or if there is
> a way to avoid it.

There's no comment in the code that says the regmap must be set there
instead of earlier. What's to stop someone from tripping over this
problem later? At the least, please add a comment.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
