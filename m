Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 159319B2069
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Oct 2024 21:36:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD8BCC6DD94;
	Sun, 27 Oct 2024 20:36:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47891C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2024 20:36:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 646A45C4D01;
 Sun, 27 Oct 2024 20:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D846DC4CEC3;
 Sun, 27 Oct 2024 20:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730061359;
 bh=6Pmsfn3UxhCWmSXYNuTtCkIJ/1rryCxBFsSk1I6wK2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GdvjmXHBclQ+H8qDqDMxr5h/OZYeOxS82/fn0aRZvoXukCGft7x+1LDtIQUayJ/hs
 aO5+GssudxAnfBqG4biD7EdXt4Jm6YMCb/CW8qi0GKkJfEJJnom0yhuzQbl3SRp7IB
 DbajJdz3LcCQ/Y6RaUbWKFnC1dy4JOrZnGoqBW4JLqMQPiWebtF/n2xq8ZAp91afbU
 BWI+cUyQ0bfW4HllsfTAQrhdQ4upyKhCx41mZFuxSkyO1vZt5ZIMNnM+mcu1J9TZEx
 hrNRM1YcwCKjgd12r3Zd0qkxfGq03GZFokyls7HNHDhUI6Qp/z1OapcYekJzcroe6j
 rE0uJrB+65LBA==
Date: Sun, 27 Oct 2024 21:35:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <c7ue72h3wvzgpcr3joqrtchoy4352ibsp63cpqps2y77oek6k4@5nd54nyk6mpx>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025011000.244350-2-inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 1/4] dt-bindings: net: snps,
 dwmac: Add dwmac-5.30a version
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

On Fri, Oct 25, 2024 at 09:09:57AM +0800, Inochi Amaoto wrote:
> Add compatible string for dwmac-5.30a IP.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 4e2ba1bf788c..3c4007cb65f8 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -31,6 +31,7 @@ select:
>            - snps,dwmac-4.20a
>            - snps,dwmac-5.10a
>            - snps,dwmac-5.20
> +          - snps,dwmac-5.30a

Same as for Enclustra patchset... this is incomplete approach. These are
just fallbacks, visible by "contains" keyword and you should come with
proper specific compatible. Look how other compatibles are arranged.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
