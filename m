Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BD7712B61
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 19:07:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ADE9C6A615;
	Fri, 26 May 2023 17:07:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3CB1C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 17:07:11 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1685120831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLtQUPZvC6LXco0Vx6AbaJ5HU7nv5vKBXlxIPke6z2Y=;
 b=CECpw3jEVwuuKSlFLCkzKlgJtZIWmEHnjED4pWNOGYwHBJrqO6sf5p7UDG690IZ1rQOkIk
 uccVNqiMPwntgpaPwZrWVQISP02SBSYaGartrfM6cueTkfN9GMtZEqEANkdiQYdd+5Wog9
 kI2MVxiSKMClhk5O75rUDMNkZwLbkIGwyuJu2/UgBjfcbkX2uMZBJ7uWfIJFr49mDsDB/p
 O1UsRMlMM8oQnUc2zpDPMgz2Hvo3ide+77FwvMNanOSpJq11QPQuu18vB12u6mvsxlpr64
 T3hXEE75kq4tTx2hKBRUXFNCH0bnF+GwYi76S2yoJuQBlOxNM0LAgzOKdvZ3yg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD8A860006;
 Fri, 26 May 2023 17:07:08 +0000 (UTC)
Date: Fri, 26 May 2023 19:07:07 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Simon Horman <simon.horman@corigine.com>
Message-ID: <20230526190707.217c5bde@pc-7.home>
In-Reply-To: <ZHBxH/O/NtssUZTF@corigine.com>
References: <20230526074252.480200-1-maxime.chevallier@bootlin.com>
 <20230526074252.480200-4-maxime.chevallier@bootlin.com>
 <ZHBxH/O/NtssUZTF@corigine.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/4] net: pcs: Drop the TSE
	PCS driver
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

On Fri, 26 May 2023 10:43:11 +0200
Simon Horman <simon.horman@corigine.com> wrote:

> On Fri, May 26, 2023 at 09:42:51AM +0200, Maxime Chevallier wrote:
> > Now that we can easily create a mdio-device that represents a
> > memory-mapped device that exposes an MDIO-like register layout, we
> > don't need the Altera TSE PCS anymore, since we can use the Lynx
> > PCS instead.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> > V2->V3 : No changes
> > V1->V2 : No changes
> > 
> >  MAINTAINERS                      |   7 --
> >  drivers/net/pcs/Kconfig          |   6 --
> >  drivers/net/pcs/Makefile         |   1 -
> >  drivers/net/pcs/pcs-altera-tse.c | 160
> > ------------------------------- include/linux/pcs-altera-tse.h   |
> > 17 ---- 5 files changed, 191 deletions(-)  
> 
> Less is more.
> 
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> 

Thanks ! Also kudos to Russell who spotted the similarities between the
TSE and Lynx PCS in the first place, allowing for this driver to be
dropped :)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
