Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B0BBE1D0A
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 08:53:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC34C57192;
	Thu, 16 Oct 2025 06:53:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2236C57167
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 16:20:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 82D1C1A1361;
 Wed, 15 Oct 2025 16:20:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 487D560673;
 Wed, 15 Oct 2025 16:20:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 138CA102F22DF; 
 Wed, 15 Oct 2025 18:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760545219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=JJ6rH+xzmRM4qbGD1O8szCgtSQ2QdUeo9drcU82TAhs=;
 b=wtHq3Gd0pQyjV6eyAK7fkRd9w/l0K0lC4FEfqkfWEo6k637Nboqx9312H1X9fnaRV/2wfb
 QaZ6QKn/SgxEG7NppA04nggZ69c6MQyB2QdfPZpPZs7aRKxHJD8eY66Gr283U2WCMTmDak
 88guPcGFdZVaksfpnPKksUJJnae0T4LLkdX0RllszUHzwp8koW7AkW3d42+ZT82a7iuP7G
 nDuOFOMUrmu/iMcqebvj3mX2x8m7+8+umoL7QjmNGO4Lxs1r06oZx9uCz+/jpvM07WporL
 jqoVHJIuWENfI7kHqcyASHjuMNN1yYfK86sc1rke62SvxbTpWJvvR1KIZpJ/0g==
Message-ID: <27800f8c-eb0d-41c2-9e45-b45cf1767c23@bootlin.com>
Date: Wed, 15 Oct 2025 18:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-2-maxime.chevallier@bootlin.com>
 <aO-4hnUINpQ0JORE@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aO-4hnUINpQ0JORE@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Thu, 16 Oct 2025 06:52:59 +0000
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: Move subsecond
 increment configuration in dedicated helper
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

Hi Russell,

On 15/10/2025 17:06, Russell King (Oracle) wrote:
> On Wed, Oct 15, 2025 at 12:27:21PM +0200, Maxime Chevallier wrote:
>> +static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
>> +{
>> +	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
> 
> Just to say that I have patches that get rid of these has_xxx flags for
> the cores, and these changes (and the additional platform glue patches
> that have been posted) will conflict with them.

Fair, I was in your position not so long ago :)

For this particular series, it should be straightforward to fix the
conflict, but for the pending new glue divers we'll have to
find the sweet spot for these changes.

Maybe send it as an RFC so that people can see what to expect ?

> Given the rate of change in stmmac, at some point we're going to have
> to work out some way of stopping stmmac development to get such an
> invasive cleanup change merged

Agreed.

 - but with my variability and pressures
> on the time I can spend even submitting patches, I've no idea how that
> will work... I was going to send them right at the start of this
> cycle, but various appointments on Monday and Tuesday this week plus
> work pressures prevented that happening.

To give your more visibility, that's the only work I plan to do on
stmmac for that cycle, the rest is going to be phy_port,
and probably some netdevsim-phy.

> So, I decided instead to send out the first stmmac PCS series... which
> means I now need to wait for that to be merged before I can think about
> sending out anything else stmmac-related. (and there's more PCS patches
> to come beyond the 14 I sent today.)

Do you plan to send the next round of PCS stuff next, or the cleanups
for the has_xxx flags you were mentioning ?

In any case, I'll be happy to help testing :)

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
