Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F10249A5D3C
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 09:37:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91FFAC78035;
	Mon, 21 Oct 2024 07:37:33 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7807DC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 07:37:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 47EC3A41B7B;
 Mon, 21 Oct 2024 07:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5693BC4CEC3;
 Mon, 21 Oct 2024 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729496245;
 bh=2gy3du6vsKAJ+C9iOq3ZQ9oB1KOFdx7EruIwXtjFbKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nR/GULq/+kGrI0Fv7mYTKOVQ46vxfvEI40yJL7e5Y4YTVk114dLmmXRkMfSMvlaCR
 jm/AZdEUwHMvpq16IG2LtxPx0XPUPadQkx4hs7KFD1dcgtrGAk4KxZNvUtr5G6ATYt
 IzYlpv6Dx6yHHVfT39ni80lFapHZcVaeqckYZSUjYgudsEzuUAQ0U89Onr3P9z2SY/
 ZFD2sy/o5pf+DGgj3ZPpqk255+EpxbmExaksbrK0jGq2Zcg4hIrrozf/aO3A0qefT5
 fuiXwVnEBbZOOOt9kGN9BIFlWjZzP36rs2TeCYlLSgxW18YgdchDgR3AflfX2PcK0q
 0+y21zYamQkSw==
Date: Mon, 21 Oct 2024 09:37:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Message-ID: <bv2ao6oxrpbg3hihe6lb66h7bf2d47pg3dcv4c7mrfue26s7br@hsnqynh2ujyj>
References: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
 <20241020-th1520-dwmac-v4-1-c77acd33ccef@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241020-th1520-dwmac-v4-1-c77acd33ccef@tenstorrent.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Drew Fustini <drew@pdp7.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/3] dt-bindings: net: Add
 T-HEAD dwmac support
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

On Sun, Oct 20, 2024 at 07:36:00PM -0700, Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Add documentation to describe the DesginWare-based GMAC controllers in
> the T-HEAD TH1520 SoC.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: rename compatible, add apb registers as second reg of gmac node,
>        add clocks and interrupts poroperties]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>

...

> +  interrupts:
> +    items:
> +      - description: Combined signal for various interrupt events
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names

I asked to drop these, because referenced schema already requires these.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
