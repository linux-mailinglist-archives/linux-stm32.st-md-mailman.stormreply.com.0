Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 885A53B56B1
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 03:35:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ADEBC59781;
	Mon, 28 Jun 2021 01:35:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBB21C58D7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 01:35:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 297AA61A1D;
 Mon, 28 Jun 2021 01:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624844112;
 bh=mo0a5EHGTZydLuZ4bq+W7XUfGfXmUmf19EHcWrqP9/I=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=vICWJoA7kSTRqLzmf2ixgZPhX0EaDuOh48FPduY0HOgiI9Omr3O9jajlnkD+2F+7i
 RPmD+fD/K5CNkqYinByBnl+uoZEl6hz8UmkFkLL3fYBNdVGy2K+idI6fJJQjlQN7Je
 KFp37Y2FKOOYNOfIcWiL0R8FpOoD8YHkWfYUGWc+b1rph4WqhLjTjZG2leK4VAfWog
 eucyvtCKYdCLlUc2w4rEEz3TnQS2jV2CJuCG9SQq846a6SpUNQQoHoQurj8blGEv0x
 ZG4KDGbOjvfqXvu+DboFAxYbRGuf4EGhheF46v0dGDwieNVs/zVgr8pnLMRgs6KKMO
 9lCPkbUX8Aspg==
MIME-Version: 1.0
In-Reply-To: <20210617051814.12018-5-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-5-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 marex@denx.de
Date: Sun, 27 Jun 2021 18:35:11 -0700
Message-ID: <162484411101.3259633.4335030443605638144@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 04/11] clk: stm32mp1: convert to
	module driver
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

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:07)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Adds support for  probe deferral in way to prepare
> integration of the security in RCC clock and reset
> drivers.
> Some kernel clocks will be provided by the SCMI drivers.
> Since RCC clock driver create clocks which parents
> are SCMI clocks, RCC clock driver probe can be deferred.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
