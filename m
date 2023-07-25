Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AB1761D48
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 17:24:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B35ABC6A61A;
	Tue, 25 Jul 2023 15:24:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AED2AC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 15:24:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 753AF617B4;
 Tue, 25 Jul 2023 15:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF6FC433C8;
 Tue, 25 Jul 2023 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690298655;
 bh=+MfVjB/wjdps2ovrI3oDMNYk7WQRpUGIc0K5gkQDUIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gPq8eVoFZT6gk5cJ4o3gDvI8uBvnJ6TORQWk/GOfQzPjuE9rZvceL+zOQYNP7fUh2
 fNDsDS/AaOFWe1KSsuQQcW39LJyqTn240qTgogqgJNy6jkTj/jdc1o+gVHiOwqkANA
 oDc6Eabr7/YJw5+lNZA4pDAO/S/bI4VYTouqQBJ2d209+JwGdpicCKYueCP2ykjzMK
 zPTnnFqMHLVkXymEQNIu/9MjJCK09GEpowCDOMtrIxDAYGpqqz+hp6rwa7VoK0Ycul
 7ZImFTWJ3mCi329bhEx2C9ALC9ntpS47htqEfnmNa3U4GjX1v9rq0JEA7QGb4e//9T
 E44CiymAS7qMw==
Date: Tue, 25 Jul 2023 23:12:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <ZL/mZiLQFLv1rpib@xhacker>
References: <20230723161029.1345-1-jszhang@kernel.org>
 <20230723161029.1345-8-jszhang@kernel.org>
 <20230724-cleat-tricolor-e455afa60b14@spud>
 <20230724232624.GA1112850-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724232624.GA1112850-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 07/10] dt-bindings: net: snps,
 dwmac: add safety irq support
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

On Mon, Jul 24, 2023 at 05:26:24PM -0600, Rob Herring wrote:
> On Mon, Jul 24, 2023 at 06:23:13PM +0100, Conor Dooley wrote:
> > On Mon, Jul 24, 2023 at 12:10:26AM +0800, Jisheng Zhang wrote:
> > > The snps dwmac IP support safety features, and those Safety Feature
> > > Correctible Error and Uncorrectible Error irqs may be separate irqs.
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > index ddf9522a5dc2..bb80ca205d26 100644
> > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > @@ -107,6 +107,8 @@ properties:
> > >        - description: Combined signal for various interrupt events
> > >        - description: The interrupt to manage the remote wake-up packet detection
> > >        - description: The interrupt that occurs when Rx exits the LPI state
> > > +      - description: The interrupt that occurs when Safety Feature Correctible Errors happen
> > > +      - description: The interrupt that occurs when Safety Feature Uncorrectible Errors happen
> > >  
> > >    interrupt-names:
> > >      minItems: 1
> > > @@ -114,6 +116,8 @@ properties:
> > >        - const: macirq
> > >        - enum: [eth_wake_irq, eth_lpi]
> > >        - const: eth_lpi
> > > +      - const: sfty_ce_irq
> > > +      - const: sfty_ue_irq
> > 
> > Putting _irq in an interrupt name seems rather redundant to me although,
> > clearly not the first time for it here.
> 
> It's already inconsistent, so don't follow that pattern. Drop '_irq'.

Thanks for the suggestion, will wait a bit to get more feedbacks before
sending out v2.
> 
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Thanks,
> > Conor.
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
