Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1F816389
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 00:53:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 095B5C6DD6F;
	Sun, 17 Dec 2023 23:53:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62AF7C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Dec 2023 23:53:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 453BF60C94;
 Sun, 17 Dec 2023 23:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EEEC433C7;
 Sun, 17 Dec 2023 23:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702857214;
 bh=0bExTtZ+AFUEv9qhiNeUzHa2Awe6uWq0MksJYM0Uvz4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=i9i0K6/mEsgNlw0Q7SWFdL3BBZTgciM0RyQ+sy535u0TIzMxY5SxwB3nkJO5dzh97
 W6JOswAzH0ksAgwjbEEOutNQaBzV9rwVek+iA9z3lbwNlgqWTf8vNUVTxHhYmhGsB2
 3h+SK4vIO8gKCe/pSsL6WWkW5SFMdlfKUxnKTViWWneQ6hYm4HQNtmXsmZ2sydeJhA
 TBGanDFDCrQSBAFz7x6yPjurC+BpPhqqsPtssPKquzJR+oLKheQ4qF9LX7Zr/7d175
 Z0i8rHgCPJa4n8udN3mIAjoljatnS5XfDi+BTfaP05fujhIuc6jjRYrEYzDE+yIgxz
 Vn6t8Oo3tqFIw==
Message-ID: <b4151a2bb19f18fbeb83dc872b3f1deb.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231208143700.354785-3-gabriel.fernandez@foss.st.com>
References: <20231208143700.354785-1-gabriel.fernandez@foss.st.com>
 <20231208143700.354785-3-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Sun, 17 Dec 2023 15:53:32 -0800
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 2/5] clk: stm32mp1: use stm32mp13 reset
	driver
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

Quoting gabriel.fernandez@foss.st.com (2023-12-08 06:36:57)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> STM32MP15 is now using the same reset driver as STM32MP13 as they
> have the same binding requirement.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
