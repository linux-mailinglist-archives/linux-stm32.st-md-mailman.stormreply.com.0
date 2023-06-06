Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1487237DE
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 08:39:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75DABC6905A;
	Tue,  6 Jun 2023 06:39:32 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22427C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 06:39:31 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686033570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3h2rz63OfzutXB59RZcgO/gJzpMB99B07DK2JRkoIg=;
 b=BHCkoLX5X22HoXzHGb8MujppnFnDTWFmr8poVY6B+5CL+Q+Z2ybX6OUWmQicxCJBRYfWoi
 9EnPsX6jCAajf7PbC/053GAthHJh0B9zPk1ZinplqxqpkvqvkrqZKmmRXuzHgVPa5444sx
 DKm3QVtUJLO7PD6G7jQDpv10RyzEUnFQcdoTEhoYL7wkV5wmyaffoZKeyKmoagdx+d4BEW
 0N5v5+OqH9VoEABYsWcGXiLaq39uOe+gRKCzxHsdFjuKCWHzp5ckilEYQwbIqvGJKcVlSt
 vxFPvuDZpAcsuyshfUg5Js/L5x47AI5MrrbGZJ1RC165WIQrh6XgwWhHOFawug==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08A1740006;
 Tue,  6 Jun 2023 06:39:26 +0000 (UTC)
Date: Tue, 6 Jun 2023 08:39:25 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20230606083925.2a543bc6@pc-7.home>
In-Reply-To: <20230605114626.188c357f@kernel.org>
References: <20230601141454.67858-1-maxime.chevallier@bootlin.com>
 <168596102478.26938.1530517069555858195.git-patchwork-notify@kernel.org>
 <20230605142039.3f8d1530@pc-7.home>
 <20230605114626.188c357f@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: andrew@lunn.ch, f.fainelli@gmail.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, ioana.ciornei@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, linux@armlinux.org.uk, edumazet@google.com,
 broonie@kernel.org, alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 vladimir.oltean@nxp.com, simon.horman@corigine.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
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

Hello Jakub,

On Mon, 5 Jun 2023 11:46:26 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Mon, 5 Jun 2023 14:20:39 +0200 Maxime Chevallier wrote:
> > Thanks for applying the patch, however as mentionned (maybe not
> > stressed enough in the cover) this series depends on a patch that went
> > through the regmap tree :
> > 
> > 
> >  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/commit/?id=e12ff28764937dd58c8613f16065da60da149048
> > 
> > How can we proceed on that matter ?  
> 
> I don't see a great solution, Mark already applied the change and 
> so did Dave. Don't think we can put them on stable branches now..
> 
> Only altera and stmmac-sogfpga are going to break?
> Maybe we're close enough to the merge window to put our heads 
> in the sand and wait?

only these two should, indeed. I'll still followup with some fixes for
kbuild issues still.

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
