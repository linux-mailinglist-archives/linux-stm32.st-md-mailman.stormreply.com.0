Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F1AB04F95
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 05:57:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E34A4C3F931;
	Tue, 15 Jul 2025 03:57:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 382BDC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 03:57:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D20DC45D44;
 Tue, 15 Jul 2025 03:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F93C4CEE3;
 Tue, 15 Jul 2025 03:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752551852;
 bh=yNYf/5GrOEloApVhcJRWeVo8jGDjSwjPC5llKFeyqjo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IAQxvwGm7T8NCV72OekW63lZSdHOrDZ7rOLs43Md28ykY5+1th5ETo1YyxM13FG/t
 d4RCfn1PhESPtTyi8lZUrcWwF54bJKHCxfWO7UZ25//F6s2fdhCH91UuVfyZKyO1ay
 zPhpY3Vc/PrVNY3jL2v9QT+1bg8e1A/nX4Mb8t6ZPbcF31VUbL8nZjAQ7FACfv3fXp
 UnMK0tYTh+rWIpaKLNX1NdRrDmOc1/XLcruFHTrbSvJwJ4lUFsoETCBdvFFsCETNah
 Upvg9HObSABmdYJq1yL6702X18GN+kfwW+tJVfoahJjXV8Rk6ztizGxrT8IWYtTFPv
 yg+svbHcO/73w==
Date: Mon, 14 Jul 2025 22:57:31 -0500
From: Rob Herring <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Message-ID: <20250715035731.GA14648-robh@kernel.org>
References: <20250714152528.311398-1-matthew.gerlach@altera.com>
 <20250714152528.311398-2-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714152528.311398-2-matthew.gerlach@altera.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: net: altr,
 socfpga-stmmac: Add compatible string for Agilex5
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

On Mon, Jul 14, 2025 at 08:25:25AM -0700, Matthew Gerlach wrote:
> Add compatible string for the Altera Agilex5 variant of the Synopsys DWC
> XGMAC IP version 2.10.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  .../devicetree/bindings/net/altr,socfpga-stmmac.yaml     | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index ec34daff2aa0..6d5c31c891de 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> @@ -11,8 +11,8 @@ maintainers:
>  
>  description:
>    This binding describes the Altera SOCFPGA SoC implementation of the
> -  Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, and Agilex7 families
> -  of chips.
> +  Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, Agilex5 and Agilex7
> +  families of chips.
>    # TODO: Determine how to handle the Arria10 reset-name, stmmaceth-ocp, that
>    # does not validate against net/snps,dwmac.yaml.
>  
> @@ -23,6 +23,7 @@ select:
>          enum:
>            - altr,socfpga-stmmac
>            - altr,socfpga-stmmac-a10-s10
> +          - altr,socfpga-stmmac-agilex5
>  
>    required:
>      - compatible
> @@ -42,6 +43,10 @@ properties:
>            - const: altr,socfpga-stmmac-a10-s10
>            - const: snps,dwmac-3.74a
>            - const: snps,dwmac
> +      - items:
> +          - const: altr,socfpga-stmmac-agilex5

> +          - const: snps,dwxgmac-2.10
> +          - const: snps,dwxgmac

Is the distinction here useful? I doubt it, so I'd just drop the last 
one. Generally, we've moved away from any generic compatible for 
licensed IP like this because there's *always* some SoC specific 
difference. 

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
