Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1546A0A25D
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jan 2025 10:35:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD69BC78F75;
	Sat, 11 Jan 2025 09:35:58 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6080C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jan 2025 09:35:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5CDB3A401D3;
 Sat, 11 Jan 2025 09:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFB7C4CED2;
 Sat, 11 Jan 2025 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736588150;
 bh=b1v5az9Rhjck/8X+15gw7h4MM9uVSzGc2DvIDCHaoPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VoT8UlOqW/eF6WkeivwAzK7CEJSWobEBtU7lQ+uojeo0Z2P74DrATmYQCWCcWw3Sd
 2uL1S2pZhBOTj1AlVj2S6jZixHaCRlJAy5y2uFldByYRPvg3MGsb4oOL0kg8pe68Uz
 I9U8aFI8exnV1VohPv5WKaLtoo33kFFT74/HobjSMZWFCbyEtZh0sjdJ+2h6pubaE8
 Y3sZgQFaPJU5a1AZYZ9kuEoTVTBqWKN/Mnia8GaOg+SzQaCYegvktDgJEaNtP7geZP
 AUm9+vurZ213pryTKQsqR1rlGvlZ1mk7O8d9mdVfZvVcolDDnLWrIPNANmd31ZRpKf
 IaHpXVsQPfKnw==
Date: Sat, 11 Jan 2025 10:35:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <qz74fbq57yhhqywhge3fiqcbduias2hib7rmpyieoylass4ei6@tee6nwzl4lto>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
 <20250109211908.1553072-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250109211908.1553072-3-dario.binacchi@amarulasolutions.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: clock: st,
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

On Thu, Jan 09, 2025 at 10:18:29PM +0100, Dario Binacchi wrote:
> The addition of DT bindings for enabling and tuning spread spectrum
> clocking generation is available only for the main PLL of stm32f{4,7}
> platforms.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
