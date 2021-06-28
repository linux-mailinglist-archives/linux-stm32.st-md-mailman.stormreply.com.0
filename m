Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD603B56BC
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 03:35:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CBD8C59784;
	Mon, 28 Jun 2021 01:35:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B936C59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 01:35:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDA7661A0F;
 Mon, 28 Jun 2021 01:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624844147;
 bh=rZ+5WwkZx5O4yRYvr3i8zKSijKaHQfsSfeu1ljgWxRE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=UhnT8e9Am9Pb4KMupWyr8am8q/hM9gl/itgDX6MhHNmjh3W/tFBIVXe1j0885NDYy
 F009R8UAh7oXnk75Iv1p8KV2WnwTyxgWWQa0rX7V4LiiGBAFcWppHH2IF0eVZVzpjk
 kAgdC8Ey1qKy/qxv+g+q3uiRLz/0iB4OfiP4arnRpmCKCFVAZNixE72Q9EeFq5gERz
 vW7fZX2OZiPei4Ac0O5bOKSOoXGDddPpXTrJb79/jKQxvwYL1rRdXHF0k/dtPm0znE
 RkW2G2v5/v7mcLAjIKNy7+eOpBlIJzjTMCnBfdlDsAezKiwZHqR/3rj56SJiWjCBTH
 YTjO3fonkOaNg==
MIME-Version: 1.0
In-Reply-To: <20210617051814.12018-7-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-7-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 marex@denx.de
Date: Sun, 27 Jun 2021 18:35:46 -0700
Message-ID: <162484414661.3259633.15807994186850314510@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 06/11] reset: stm32mp1: remove
	stm32mp1 reset
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

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:09)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> st32mp1 RCC reset driver was moved into stm32mp1 RCC clock driver.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next although it would be nice to get Philipp's ack
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
