Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D47A12F15
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2025 00:22:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CC9FC78F7C;
	Wed, 15 Jan 2025 23:22:55 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31B5CC78F7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 23:22:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 588C8A4264F;
 Wed, 15 Jan 2025 23:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EF8C4CED1;
 Wed, 15 Jan 2025 23:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736983373;
 bh=gDsUCcNE70y/yn8sOeA5bMJxrpQ7o8msQoyV1ERAOy4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lWVCD3Tjz7opmsSI2dw686R2teeoII75k3kdRqU4e/L7HZFOA4BwAQykQ2/zgDOKw
 bDn+u1mxL7tzWoUId5R/G2kwHMvkQs+8RKc3pRLXusVHsKleK7kB2XFYKptrIFnq1R
 tc5zEB8a/OMz7hVwD9L9rx7+Y7PM2axRG5YUEG3hBQn4M9KdGTxaiwVWB7x5IribCd
 6E86tbcznS/VpwF/uM3VFClpDlOd3QwcGs8azEPHuruGkYMK+5AQaaTH3uMI0pF7yw
 dv8QICbOvLdM+VYonvYtzxUvMKligqXsvyc6aVlwsTzoq6rXUbxPBqh2kFeIIEpY/S
 9pvgMiLPER4RA==
Message-ID: <73ad1336d9fbfa020ba666eef340f784.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
 <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:22:51 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/4] dt-bindings: clock: st,
	stm32-rcc: support spread spectrum clocking
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

Quoting Dario Binacchi (2025-01-14 10:19:47)
> The addition of DT bindings for enabling and tuning spread spectrum
> clocking generation is available only for the main PLL of stm32f{4,7}
> platforms.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
