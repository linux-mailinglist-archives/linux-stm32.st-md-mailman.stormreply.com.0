Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA689592F
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 18:03:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A1AEC6B45B;
	Tue,  2 Apr 2024 16:03:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEA81C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 16:03:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06BC9FF805;
 Tue,  2 Apr 2024 16:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712073826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lB0l3EgmoR6B4x67AYdVJyikUkYe+1vfYgUCVxFlTi4=;
 b=FHeCl4Ye91VysIY97+9CuN2lZTq+z+sDUDrrKaLQ6WGxlD7jJDCWWe6Qzyn1LiOuvTirKv
 DtUTV0DNxOUroUmyrf3CRGsIojegvluEPLIK6r8qOKjh10BVGyz3rQcJhtTbf3MBOPoe/G
 8bkNo07L7FF0ygnG9Oo4FJsXUvwIGsuPgZxDhtwyPL0O8XxbVD9JMdk0lXIC5OvPa+32V3
 uPqqLiaMMQEbHn9p2xMcQthSudzmC7GgSufy2qdZvrgib5PA8gRHJjBiuRno61pjz2+iY+
 6m/MTNKSS6ioZaOUtCrqL8ZuuQjPGwFBo05f2btGBm9974bd/xuHiyUJISF53g==
Date: Tue, 2 Apr 2024 18:04:20 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
In-Reply-To: <ZgwoygldsA1V8fs9@shell.armlinux.org.uk>
Message-ID: <36a4a94f-494f-2fef-11e1-8b45011c1263@bootlin.com>
References: <20240402-rzn1-gmac1-v1-0-5be2b2894d8c@bootlin.com>
 <20240402-rzn1-gmac1-v1-2-5be2b2894d8c@bootlin.com>
 <ZgwM/FIKTuN4vkQA@shell.armlinux.org.uk>
 <ZgwoygldsA1V8fs9@shell.armlinux.org.uk>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: add support for
	RZ/N1 GMAC
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

Hello Russell,

On Tue, 2 Apr 2024, Russell King (Oracle) wrote:

> > I'm afraid that this fails at one of the most basic principles of kernel
> > multi-threaded programming. stmmac_dvr_probe() as part of its work calls
> > register_netdev() which publishes to userspace the network device.
> > 
> > Everything that is required must be setup _prior_ to publication to
> > userspace to avoid races, because as soon as the network device is
> > published, userspace can decide to bring that interface up. If one
> > hasn't finished the initialisation, the interface can be brought up
> > before that initialisation is complete.
...
> 
> I'm not going to say that the two patches threaded to this email are
> "sane" but at least it avoids the problem. socfpga still has issues
> with initialisation done after register_netdev() though.

Thanks a lot for providing a fix to this issue, introducing new pcs_init/exit() 
hooks seems like the best solution at this time, I'll make sure to integrate 
those patches in the v2 for this series.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
