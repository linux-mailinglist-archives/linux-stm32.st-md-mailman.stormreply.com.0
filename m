Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A85C7962E04
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 19:00:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 709C2C6C855;
	Wed, 28 Aug 2024 17:00:31 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB9B8C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 17:00:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E909AA414F1;
 Wed, 28 Aug 2024 17:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C841C4CEC7;
 Wed, 28 Aug 2024 17:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724864428;
 bh=b1/yAhL78h8Qexpk6AQkwIxD117TkTuBxuGjc8ZTs/Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=MAMo9qGDvfnno5VtsBng//64g+l74YvpodpqJGZfDDIkAN9UbL7DXkLOPUd6WLk47
 kwoIMFMX1DQFeDFx5GDZ5795kaBNBZLa+80uJA74DMJPKgKkaVkfBKm+8aiobQjUIt
 hGWsOCvVSt2vGEkfDBGOItgkWNhY0xl+pkZWo2b5f3tFr2hjuRhCHmVxZeR5iQNhne
 9+S2QZdRfOg3EusSBVjLXf0mkwo+op0Iz/AE0gRtpWpNUqJ9DpeSiuGeaut8t5wntJ
 ZC3oQrY3d9pK51sIYoVjt+kW2KV1ELvNu0ef/vARgcqLWrDm36gBg53IbM+loYjket
 P/smIQcPZxcqg==
Message-ID: <af8009dd5ff762cbefe6453d85d07d2e.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240818173014.122073-2-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
 <20240818173014.122073-2-krzysztof.kozlowski@linaro.org>
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
Date: Wed, 28 Aug 2024 10:00:26 -0700
User-Agent: alot/0.10
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 2/5] dt-bindings: clock: cirrus,
	lochnagar: add top-level constraints
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

Quoting Krzysztof Kozlowski (2024-08-18 10:30:11)
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks.  Drop also redundant assigned-clocks properties, because
> core dtschema allows them if clocks are provided.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
