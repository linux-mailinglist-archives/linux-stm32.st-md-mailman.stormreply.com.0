Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6093890BA5
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 21:42:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A0A2C71281;
	Thu, 28 Mar 2024 20:42:09 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61822C6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 20:42:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5068ACE2CE2;
 Thu, 28 Mar 2024 20:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529E7C433F1;
 Thu, 28 Mar 2024 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711658524;
 bh=rM8n3YOTnCn+b3NkFrXziIWASxMBnWFMCbr5eWXy4fQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eCKfMmIyqhMxnN9hRe0xLCa/LyjUmNY2MvusUKazaWaaOAtQttZ2yJQppDwWNeWSY
 8/9Ls0Cj8Vifsj0NXSNo3xnwcOutw9Hagr8f/fc5U7nulSiBYAIe/NQBWgbyaA95oW
 HKVIQYpFXkB2emfilRKSPMLl5o+83DX8oI+Mtc1L1gglh25Q54dQDWr1tn6wB9YOoc
 6EKhNwVL49ZanIg67nYxH/hPGKlRctXBAr81YlKk03TsOQyzSNJvRFTRCBkP5zsxox
 w0WwuqDPSrXGdp1SYh1Oe4wYrRl7IsrX/R/x8N0IjC5ewjbCh7WHMAIJ8d5W8PB9uY
 bhjFQ8EACrNwA==
Date: Thu, 28 Mar 2024 15:42:02 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240328204202.GA308290-robh@kernel.org>
References: <20240327015750.226349-1-chunhau.tan@starfivetech.com>
 <20240327015750.226349-2-chunhau.tan@starfivetech.com>
 <31ac366d-bfa6-4c99-a04d-ab9fb029da7e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31ac366d-bfa6-4c99-a04d-ab9fb029da7e@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jee Heng Sia <jeeheng.sia@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Tan Chun Hau <chunhau.tan@starfivetech.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v5 1/1] dt-bindings: net: starfive,
 jh7110-dwmac: Add StarFive JH8100 support
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

On Wed, Mar 27, 2024 at 08:54:30AM +0100, Krzysztof Kozlowski wrote:
> On 27/03/2024 02:57, Tan Chun Hau wrote:
> > Add StarFive JH8100 dwmac support.
> > The JH8100 dwmac shares the same driver code as the JH7110 dwmac
> > and has only one reset signal.
> > 
> > Please refer to below:
> > 
> >   JH8100: reset-names = "stmmaceth";
> >   JH7110: reset-names = "stmmaceth", "ahb";
> >   JH7100: reset-names = "ahb";
> > 
> > Example usage of JH8100 in the device tree:
> > 
> > gmac0: ethernet@16030000 {
> >         compatible = "starfive,jh8100-dwmac",
> >                      "starfive,jh7110-dwmac",
> >                      "snps,dwmac-5.20";
> >         ...
> > };
> > 
> > Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
> >  .../bindings/net/starfive,jh7110-dwmac.yaml   | 29 +++++++++++++++----
> >  2 files changed, 25 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 6b0341a8e0ea..a6d596b7dcf4 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -97,6 +97,7 @@ properties:
> >          - snps,dwxgmac-2.10
> >          - starfive,jh7100-dwmac
> >          - starfive,jh7110-dwmac
> > +        - starfive,jh8100-dwmac
> 
> I think that's not needed. You have there already your fallback.
> 
> >  
> >    reg:
> >      minItems: 1
> > diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > index 0d1962980f57..5805a58c55d1 100644
> > --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > @@ -18,6 +18,7 @@ select:
> >          enum:
> >            - starfive,jh7100-dwmac
> >            - starfive,jh7110-dwmac
> > +          - starfive,jh8100-dwmac
> 
> Same here, even more obvious.

Agreed.

> 
> >    required:
> >      - compatible
> >  
> > @@ -30,6 +31,10 @@ properties:
> >        - items:
> >            - const: starfive,jh7110-dwmac
> >            - const: snps,dwmac-5.20
> > +      - items:
> > +          - const: starfive,jh8100-dwmac
> > +          - const: starfive,jh7110-dwmac
> > +          - const: snps,dwmac-5.20
> >  
> >    reg:
> >      maxItems: 1
> > @@ -116,11 +121,25 @@ allOf:
> >            minItems: 3
> >            maxItems: 3
> >  
> > -        resets:
> > -          minItems: 2
> > -
> > -        reset-names:
> > -          minItems: 2
> > +      if:
> 
> I would personally avoid nesting if within if. It gets unreadable.
> Although Rob did not comment on this one, so I guess it is fine.

I normally agree, but here I suggested it as it looked to be the 
simplest option.

With the 2 other comments addressed,

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
