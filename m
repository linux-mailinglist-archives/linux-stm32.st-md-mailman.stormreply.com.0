Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7452E3B56AE
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 03:35:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38868C58D78;
	Mon, 28 Jun 2021 01:35:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB638C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 01:35:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4828061A0F;
 Mon, 28 Jun 2021 01:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624844106;
 bh=jb1XMrhEG19AbPQTUHuWETcCQGxcfxIPzG7Tw3ZcsSw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=m46AXvGfxvbfRqpJ2DBJu1X8q3bAUWDFDEcBOqklJWqFsTafjDTVsjVNLq6wdeQe+
 ru2iPAvfjtNQv4/ZB2HI9bMZp0c1sQdC6/N824tOswaFuUd8OSRwpHVpj2HEs/BeHR
 IUKt219T+6f012lTfrLnd1pm0p5y66CEgdAJ3K6vTsxQ9c1EZsS6visGdVUxNUyJg+
 nLgfquigyv915NnMTK1zL656HI88LhtSoFCCcipb4qNeOw+klyhPsRuUPmYiBfPkOK
 y8zeSnWV8ILZe0r6ZrRSqrkKkiviYp+vG7tNWT9RgaZLo5SdXRkKLO4AxA0NL74OSk
 w1n8X38EUhpvg==
MIME-Version: 1.0
In-Reply-To: <20210617051814.12018-4-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-4-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 marex@denx.de
Date: Sun, 27 Jun 2021 18:35:05 -0700
Message-ID: <162484410515.3259633.1559491465596857173@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 03/11] clk: stm32mp1: remove
	intermediate pll clocks
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

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:06)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> This patch is to prepare STM32MP1 clocks in trusted mode.
> Integrate the mux clock into pll clock will facilitate to have a more
> coherent clock tree in no trusted / trusted mode.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
