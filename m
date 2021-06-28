Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8E43B56A7
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 03:34:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1560C5662F;
	Mon, 28 Jun 2021 01:34:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E619C06B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 01:34:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE5A86144B;
 Mon, 28 Jun 2021 01:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624844095;
 bh=3yR5nD/gPU/VLZNU7b+VN3/NS1CVXEfXWBL+i1IW7WI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hs8gBLrYjsCcQBIfHoBq+tLPXI3K/IbiiUiZycNnwSKdGsOrpsd/E0bZchfOPeX4b
 /7ViLD4zyY9zVUvx6vv95iWQGY/02PJqSJnWYYFpgxJcFP+06iF/visf15W2TCzibd
 r5ogAgOwEpTZlmgbBRUjzs2u9Kk+hh2skJnEbOIragZH6wpzxHSiOOGGsDLbJQ5RGA
 j/6MpAMWs0i/i22pXYP16vFJJ8nHW1MVmw6NyBqEjYtnVeorrGIpH7YRHgNgYDmlza
 Sdo9RkgHmRHOpgrD5o13m2peWwD7WgGLjwafDrJbr+hZ4J2knsAQdX4WC+9EramcHq
 OKGaFLn8z5gSA==
MIME-Version: 1.0
In-Reply-To: <20210617051814.12018-2-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-2-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 marex@denx.de
Date: Sun, 27 Jun 2021 18:34:53 -0700
Message-ID: <162484409358.3259633.13950277429027098956@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 01/11] clk: stm32mp1: merge
	'clk-hsi-div' and 'ck_hsi' into one clock
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

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:04)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> This patch is to prepare STM32MP1 clocks in trusted mode.
> This Merge will facilitate to have a more coherent clock tree
> in no trusted / trusted world.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
