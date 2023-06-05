Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8ED72256D
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jun 2023 14:20:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2DB4C6A5FA;
	Mon,  5 Jun 2023 12:20:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A21B6C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jun 2023 12:20:43 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1685967643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMy8jOn3QwsSSA0c+m8gW2VcF2TjCe8+rIvNflPEe5k=;
 b=Bbjt27xU7k12RxSL8+07oLlYoRcikhvnrVDE5aZOhSaz1GdvhkP2zA/wu+rokBrIgtSFaM
 pYZINe36JMe+jVf40wve8mh1Jly7o1wkPMRg1/RAlFuLa1w7tZHP+o24TYkQoDqom/bFdA
 DaJ9zp7qgfYrzUaaS1p5CO58HIJxaLSJuKFJhEeJixkN6nKsF2CbF2dO+y2DEPb8RezTgb
 dXwKsoOz6awL5ovsMiD/JvzRpMosXOKoVYoQp4tDtBNxq240+cggA5uRm2UBxif7zd650x
 xlA6Oocq5hnD9szrTh5IFatkBkVWDAw/dgbgTn1jq2HePcsaFO7Gss883c9Pmg==
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7079B24000A;
 Mon,  5 Jun 2023 12:20:40 +0000 (UTC)
Date: Mon, 5 Jun 2023 14:20:39 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: patchwork-bot+netdevbpf@kernel.org
Message-ID: <20230605142039.3f8d1530@pc-7.home>
In-Reply-To: <168596102478.26938.1530517069555858195.git-patchwork-notify@kernel.org>
References: <20230601141454.67858-1-maxime.chevallier@bootlin.com>
 <168596102478.26938.1530517069555858195.git-patchwork-notify@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: andrew@lunn.ch, vladimir.oltean@nxp.com, edumazet@google.com,
 thomas.petazzoni@bootlin.com, ioana.ciornei@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 linux@armlinux.org.uk, joabreu@synopsys.com, simon.horman@corigine.com,
 kuba@kernel.org, pabeni@redhat.com, broonie@kernel.org,
 alexis.lothore@bootlin.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, davem@davemloft.net,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/4] net: add a regmap-based
 mdio driver and drop TSE PCS
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

Dear Maintainers,

Thanks for applying the patch, however as mentionned (maybe not
stressed enough in the cover) this series depends on a patch that went
through the regmap tree :


 https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/commit/?id=e12ff28764937dd58c8613f16065da60da149048

How can we proceed on that matter ?

Thanks,

Maxime

On Mon, 05 Jun 2023 10:30:24 +0000
patchwork-bot+netdevbpf@kernel.org wrote:

> Hello:
> 
> This series was applied to netdev/net-next.git (main)
> by David S. Miller <davem@davemloft.net>:
> 
> On Thu,  1 Jun 2023 16:14:50 +0200 you wrote:
> > Hello everyone,
> > 
> > This is the V4 of a series that follows-up on the work [1] aiming
> > to drop the altera TSE PCS driver, as it turns out to be a version
> > of the Lynx PCS exposed as a memory-mapped block, instead of living
> > on an MDIO bus.
> > 
> > One step of this removal involved creating a regmap-based mdio
> > driver that translates MDIO accesses into the actual underlying bus
> > that exposes the register. The register layout must of course match
> > the standard MDIO layout, but we can now account for differences in
> > stride with recent work on the regmap subsystem [2].
> > 
> > [...]  
> 
> Here is the summary with links:
>   - [net-next,v4,1/4] net: mdio: Introduce a regmap-based mdio driver
>     https://git.kernel.org/netdev/net-next/c/642af0f92cbe
>   - [net-next,v4,2/4] net: ethernet: altera-tse: Convert to
> mdio-regmap and use PCS Lynx
> https://git.kernel.org/netdev/net-next/c/db48abbaa18e
>   - [net-next,v4,3/4] net: pcs: Drop the TSE PCS driver
>     https://git.kernel.org/netdev/net-next/c/196eec4062b0
>   - [net-next,v4,4/4] net: stmmac: dwmac-sogfpga: use the lynx pcs
> driver https://git.kernel.org/netdev/net-next/c/5d1f3fe7d2d5
> 
> You are awesome, thank you!

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
