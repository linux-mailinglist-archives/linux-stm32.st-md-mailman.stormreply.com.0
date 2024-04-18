Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFEE8A9925
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 13:57:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0BAEC6C859;
	Thu, 18 Apr 2024 11:57:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D581C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 11:57:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD03D1BF20C;
 Thu, 18 Apr 2024 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713441431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O1G2JcwttleuEX4OArtvrIC9rhjBFn4pb36VCCBIh/k=;
 b=Hy2SsbNnYmDiJbouDoQakG4O9hhGXW4f+OjvJAR3aQz8kL2s8/mbpBjipIEcykp1brgcjr
 kJ+d9gSauDycypI+PmrGrD9mrzFGc23eeqRwQYLbkzGRyeXVKEcMiWZg5hWbUgpJznFlRn
 5V7abewlK8QD2a6f8PjfAXELplvwBZP2YIPnkUR+48xmyi0cvNa/YPqRE2B2fk1ozWk2Y6
 MU2FCi0NcSbFEC7E0hWlLKOWpRrQBUDsU6a9RVthAORmx26StgefFaaICrvbzSgrLdQppE
 1ZmdlRAGxtTWxKIcm+wOGUO8UuWr6897yKZsU3eT7r8zUI5i35pKX4KaHo9c2A==
Date: Thu, 18 Apr 2024 13:57:47 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
In-Reply-To: <xp34tp5cjmdshefxjczltz2prqtiikagfspf4lobznzypvsyah@ihpmwfynwzhh>
Message-ID: <232e3b0c-ca55-2da0-1c9f-47520a1bcfbd@bootlin.com>
References: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
 <20240415-rzn1-gmac1-v3-4-ab12f2c4401d@bootlin.com>
 <xp34tp5cjmdshefxjczltz2prqtiikagfspf4lobznzypvsyah@ihpmwfynwzhh>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/5] net: stmmac: add support
 for RZ/N1 GMAC
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

Hi Serge,

On Tue, 16 Apr 2024, Serge Semin wrote:

> > +static int rzn1_dwmac_pcs_init(struct stmmac_priv *priv,
> 
> > +			       struct mac_device_info *hw)
> 
> AFAICS hw is unused, and the mac_device_info instance is reached via
> the priv pointer. What about dropping the unused argument then?

Unfortunately, this is an implementation of the pcs_init() callback, which is 
also used by socfpga (see patch 4/6 in this series). The socfpga implementations 
use the hw parameter for both pcs_init() and pcs_exit() so I can't remove it.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
