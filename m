Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B525E962E02
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 19:00:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6438AC6C855;
	Wed, 28 Aug 2024 17:00:28 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F36BC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 17:00:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 89FEDA414F1;
 Wed, 28 Aug 2024 17:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B98C4CEDA;
 Wed, 28 Aug 2024 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724864418;
 bh=wvcCw/u2DHmQjZ+lBFZsEG5m3ALmQ5p1JIzRH0qd2OY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YXJ/6JlS49eKre5/7JLOUjrfR2hvDTzcLLYUdHxEG51KRx369KPbzsP27VUzIVKuy
 CUJf5q3YAe7O3XIDhuew9We81iY6C0xrfPGCz8ZDDu9qzBO3ZHopPQxVgzsZk5OpK4
 DPD5SU22ZUuXmXbREb85PpvPY/b0G1fv664vdzHu9NatA18kmK+YyblqSpod2PjNYu
 NnzirXjAtxU7e7bUoxYb5Uxe3jVDf2QKYnSgswYULp2UkiWZZb+5pciHzrz/goGi4E
 lyPvgQhF7OiIG/H9SrHl5NtWRdxRLP2Melm25mxupRtN+26v4szyx2l/M8lYQaLd7j
 uMxMk2BZvtBtw==
Message-ID: <4a441f73cea283e694465d5a7c4bef6d.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Conor Dooley <conor+dt@kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Rob Herring <robh@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Date: Wed, 28 Aug 2024 10:00:16 -0700
User-Agent: alot/0.10
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: clock: baikal,
	bt1-ccu-div: add top-level constraints
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

Quoting Krzysztof Kozlowski (2024-08-18 10:30:10)
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
