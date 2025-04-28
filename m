Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB8A9EB93
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 11:17:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 599A6C78011;
	Mon, 28 Apr 2025 09:17:34 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8CABC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 09:17:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 015F9A4AA9C;
 Mon, 28 Apr 2025 09:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCEEC4CEEC;
 Mon, 28 Apr 2025 09:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745831851;
 bh=rVoSXr4jghjdCMyJc/6II40yfja/uHfb4SXOJ3XhWyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qa6umChSdPLZ3KSNEbFHIbUpDSPBvEFVU8GSDUKva7coZw7Mt3E2w0lFkx5XwSHXl
 1rn42r/+Tm5M1vMlImdr9YrdJleJp5+H6gr+cBuQlbjR2OsgGr5JnannNkj3geC5sB
 gV7eLE4rj0CZoYLQNcDl8K4tfSPtJyUBX99xxhLuOqcb18ri+MjYgtzIVMzzC7Or26
 jeM1wxFq5fUfNQKOcyuhyzmuVQ0ggliAP+tTtXBenKw5m7ZK3loHNE+RpsposFsTqw
 z26aJqqq6GxXmYanrQfJmUpbN+slofEEynpUM4o2YUvZKdPGmYuqqp2FJy337fBwGR
 ZrYm1kPWBDfrA==
Date: Mon, 28 Apr 2025 11:17:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20250428-hysterical-smoky-mongoose-f6dde6@kuoka>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
 <20250427074404.3278732-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250427074404.3278732-5-dario.binacchi@amarulasolutions.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/8] clk: stm32h7: rename USART{7,
	8}_CK to UART{7, 8}_CK
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

On Sun, Apr 27, 2025 at 09:43:23AM GMT, Dario Binacchi wrote:
> As stated in the reference manual RM0433, the STM32H743 MCU has
> USART1/2/3/6, UART4/5/7/8, and LPUART1. The patches make all the clock
> macros for the serial ports consistent with the documentation.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  include/dt-bindings/clock/stm32h7-clks.h | 4 ++--

dt-bindings subject prefix

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
