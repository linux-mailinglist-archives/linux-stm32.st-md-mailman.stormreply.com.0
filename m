Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B897B24E3
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 20:09:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCDB2C6B476;
	Thu, 28 Sep 2023 18:09:49 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C460C6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 18:09:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6BCBECE2221;
 Thu, 28 Sep 2023 18:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E394C433C8;
 Thu, 28 Sep 2023 18:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695924584;
 bh=PKCbG067dxLVfSBXY7LXY3siozP1w/bW3Ik0lSAKcHc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DPu1YZ2rL4UkOp0m0H3259f38mALHnc/dHdick1bsXfEFyYEyr9ofNxJwmYjIqw5b
 5zF8jQXPIzSfeVbQohQ3A5hP/aUUlDh7ynUvUG9IibFtXbpv2DJQfVuEZH5ZzFXBoD
 UtZjKagtK8OBfkXuzFk67WStkB+7TA9hCWe3PXxelAuq4vPNrxocFPp5FCex8XLwzG
 hy/mLT4HJAO4svKaX+tEWH7Yi74Jntotmp7eDyF8JhSnZrtf3cy+cq6zX6mDWJ7kOT
 ov6rWiYq45CpS4+6RhqtEo2ciXYC+uNdGcuVMTYBcUyt9oMc0CbkY8VTE1wIv7Qbjz
 BsB8S+j7TSJKA==
Received: (nullmailer pid 996093 invoked by uid 1000);
 Thu, 28 Sep 2023 18:09:42 -0000
Date: Thu, 28 Sep 2023 13:09:42 -0500
From: Rob Herring <robh@kernel.org>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <20230928180942.GA932326-robh@kernel.org>
References: <20230927130919.25683-1-rohan.g.thomas@intel.com>
 <20230927130919.25683-2-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230927130919.25683-2-rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] dt-bindings: net: snps,
 dwmac: Time Based Scheduling
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

On Wed, Sep 27, 2023 at 09:09:18PM +0800, Rohan G Thomas wrote:
> Add new property tbs-enabled to enable Time Based Scheduling(TBS)

That's not the property you added.

> support per Tx queues. TBS feature can be enabled later using ETF
> qdisc but for only those queues that have TBS support enabled.

This property defines capable or enabled? 

Seems like OS configuration and policy.

Doesn't eh DWMAC have capability registers for supported features? Or 
did they forget per queue capabilities?

> 
> Commit 7eadf57290ec ("net: stmmac: pci: Enable TBS on GMAC5 IPK PCI
> entry") enables similar support from the stmmac pci driver.

Why does unconditionally enabling TBS work there, but not here?

> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 5c2769dc689a..db1eb0997602 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -399,6 +399,14 @@ properties:
>              type: boolean
>              description: TX checksum offload is unsupported by the TX queue.
>  
> +          snps,tbs-enabled:
> +            type: boolean
> +            description:
> +              Enable Time Based Scheduling(TBS) support for the TX queue. TSO and
> +              TBS cannot be supported by a queue at the same time. If TSO support
> +              is enabled, then default TX queue 0 for TSO and in that case don't
> +              enable TX queue 0 for TBS.
> +
>          allOf:
>            - if:
>                required:
> -- 
> 2.26.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
