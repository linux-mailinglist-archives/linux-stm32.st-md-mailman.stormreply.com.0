Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCA33B56B6
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 03:35:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 539A3C597AE;
	Mon, 28 Jun 2021 01:35:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 190BEC59783
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 01:35:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA8546144B;
 Mon, 28 Jun 2021 01:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624844117;
 bh=lXKI3Tc7F9js0VIjjh3xPOSfMOxCjjva2xk10rU5otw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qVve3izKSA0wRvMCJo0u6AvDPMWr8rRqaJXAFL9t8QQbEOB8bJTOYD+D/cTy6Fgze
 qR6Q8iwGdka3FtFikoS2Ehnqa26A/ucPVQZbe3Jvz8iJ8LTfDh3OFaZowRuGhnmb1/
 P00xOeY3YjEVUDMZY8Kla5P19L7sclvOurtmLihEvh2OVyIHu4k/UXvOXzkgKDqUfF
 +5eZzng1z2IBqKQV3W0UePlJgGbCcJubXdP6TJgYiMq9DsThYKSL76oxDELm3RmYh4
 YgdiLrI3LXfgn30YBXkjfGzmGgqJdKog+UE4d+ZamA9h6P60FADZ1tr5GHHQWPcopl
 HqZCqvvGSnXcw==
MIME-Version: 1.0
In-Reply-To: <20210617051814.12018-6-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-6-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 marex@denx.de
Date: Sun, 27 Jun 2021 18:35:16 -0700
Message-ID: <162484411661.3259633.16032716391656538380@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 05/11] clk: stm32mp1: move RCC
	reset controller into RCC clock driver
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

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:08)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> RCC clock and reset controller shared same memory mapping.
> As RCC clock driver is now a module, the best way to register clock
> and reset controller is to do it in same driver.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
