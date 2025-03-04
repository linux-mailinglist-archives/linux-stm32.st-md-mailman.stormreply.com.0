Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C978DA4EDD9
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 20:50:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79C70C78F6A;
	Tue,  4 Mar 2025 19:50:40 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C5FFC78F61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 19:50:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4B424A45C40;
 Tue,  4 Mar 2025 19:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEEDC4CEE5;
 Tue,  4 Mar 2025 19:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741117837;
 bh=fwSFelqnv16O3Z5CfuJeHvjUeDPCoeSC6mIkfvyX/co=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=HIkd9Ij2H85qYKpF0MGi3HY94MySHtt+hjxDsSYKSNYnV+0uG1M8K0JtFT34w91f8
 ZFlFXdeybOfg2N1SYlxOjz11OAUt5MIQllkzSmR/Qu9F6uq72JMkouYukJpLbB/K06
 KGU1xzb0hHmjiLAYATZTbeIVuZEBPR+hBpS7YpZkx5+u/UHgZtrcV81FAW4/3YjKug
 vSIs0f70ziIk/CBnoc8OprIJaVCrAC1v31vrOE3Iaef7wWNVfAGzWZSS53EFfeWjjF
 Q3hUZ8iFAu+Ya9G+w1TrqASpOCbcfpVJket5PMDdGiGoV/6Y3LlTi4Pf4sgyRQykP5
 D1fudmyYA+Oyw==
Message-ID: <2e9b95d5ac648daf07101cc0da77d20a.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250124111711.1051436-1-dario.binacchi@amarulasolutions.com>
References: <20250124111711.1051436-1-dario.binacchi@amarulasolutions.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Date: Tue, 04 Mar 2025 11:50:35 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] clk: stm32f4: fix an uninitialized
	variable
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

Quoting Dario Binacchi (2025-01-24 03:16:54)
> The variable s, used by pr_debug() to print the mnemonic of the modulation
> depth in use, was not initialized. Fix the output by addressing the correct
> mnemonic.
> 
> Fixes: 65b3516dbe50 ("clk: stm32f4: support spread spectrum clock generation")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
