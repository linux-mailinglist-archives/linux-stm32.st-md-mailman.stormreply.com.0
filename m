Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C16A12F1C
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2025 00:23:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC7DBC78F7C;
	Wed, 15 Jan 2025 23:23:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26141C78F7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 23:23:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 31B015C5EAC;
 Wed, 15 Jan 2025 23:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91373C4CED1;
 Wed, 15 Jan 2025 23:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736983391;
 bh=CXIOzY822ZbNj6Zi0lXst7TJoBz0pxnoTDtcL7T3MoE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=EP0NUy+PlrO9mL2q+KmyUaDXGhAHDEt1C605a2XWvc+sQ44xay7Yhtnm4LpeWImGr
 XJhq9HRdISRK4rTqfq+VtM/3LUnoOlHoLqH/WB6fqWGaM4b0XT6whDwV+RMXhN6qdV
 RjjnMFmoZ1M6gy4qMNAVGUZbPwzNZccediyx1hp7rLU15QFpvkv4PAbEAGcUGHyWbK
 ceJ/JYdve1Ee8ENRE2gy+PySLsO3FBGeZjXXNC9E7nMC12fb2gp2ImgzA5p9L7Njv2
 NCmgSyVWJLTa122EJtNYAiGGuwqYRb0qU0uQRo4qQt9OMezpmhVgfTcNHH1UX/ApCn
 YjrKxwx8Lqxpw==
Message-ID: <4af9d643e1f0d3b291d7cbe7445bfd2b.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250114182021.670435-5-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
 <20250114182021.670435-5-dario.binacchi@amarulasolutions.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:23:09 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 4/4] clk: stm32f4: support spread
	spectrum clock generation
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

Quoting Dario Binacchi (2025-01-14 10:19:49)
> Support spread spectrum clock generation for the main PLL, the only one
> for which this functionality is available.
> 
> Tested on the STM32F469I-DISCO board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
