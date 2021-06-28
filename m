Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBD23B56CB
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 03:36:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 813A4C59784;
	Mon, 28 Jun 2021 01:36:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAC84C59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 01:36:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7804361A1D;
 Mon, 28 Jun 2021 01:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624844178;
 bh=MCMV5T4CiHNIHgNwFS6RX6GLtK+F9KsNNlH0RjBQbUc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Rk6aW9fcleOWVfvDbtrkJ2m6ozYkqD9bJKn7a2Cj0rPWv4DdT4/gl8Ms8q5S/UAnI
 IdXm4nX0CPYiYmZIdLAmne5EGnwmvkJ+tvfHGuYJ7GIHFDdpF66SbcSRMwfRsaZ7EX
 uy/4DCOqlxiYu7KQkK/BAzRE9t/JgLG61RU9d/hnwLZjtx79qZ1b2TO3/kr2+SQPKD
 9mZ7zm0dfnufRiLeOV3WfJZckeFbTr0QIRBqD7HfsaUEIh5VyImS/v8YsFdh19eOjb
 K+Hhjlr/AsypBWLbCcLlz+tIqeqzBKs1KrRFMtqzees+KacMx+IFyljozDJBIkJIbL
 u8Eu55Q1GFL4g==
MIME-Version: 1.0
In-Reply-To: <20210617051814.12018-12-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-12-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 marex@denx.de
Date: Sun, 27 Jun 2021 18:36:17 -0700
Message-ID: <162484417735.3259633.16206197575374461808@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 11/11] clk: stm32mp1: new
	compatible for secure RCC support
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

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:14)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Platform STM32MP1 can be used in configuration where some clock
> resources cannot be accessed by Linux kernel when executing in non-secure
> state of the CPU(s).
> In such configuration, the RCC clock driver must not register clocks
> it cannot access.
> They are expected to be registered from another clock driver such
> as the SCMI clock driver.
> This change uses specific compatible string "st,stm32mp1-rcc-secure"
> to specify RCC clock driver configuration where RCC is secure.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
