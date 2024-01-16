Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C6A82F23F
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jan 2024 17:18:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65F90C6B476;
	Tue, 16 Jan 2024 16:18:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47C03C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 16:18:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9751E0009;
 Tue, 16 Jan 2024 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1705421889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bwW1R0N0aeihLh2IgYe6QDQbFMA5/uEI9u6zAxldBWw=;
 b=HrWo1WonVjqjbbyKmQlqRqBSyB+lFhXvICHLHVV6FHLDeyhwtRDsKXYSf0EsXEWoX/DHTt
 Ce2sZTI2UxiVQ9Aoy+f/QEkZqdsjIAgqdu6G036v2c44wK0JelNt3DDajvP6i0opdTyVPt
 2vVfK9+DK4UY4yDJsKcrWYvLrTTf8P4iFcacYrpenP6vaF6dgCEPapvUxQfIBplnpJldw7
 9OWoGvICzdumA9+Zz4IU5USG+hzsSnK/0kIOgFcEvaf7YQwviAOgR79qUXLa8Srnw7ihiW
 46Tw3h4jyNZeEJWHSq6jYjKMDpROPghCIqMbZKApr/OQQ0BR8iOAoVn8RuY+aw==
Date: Tue, 16 Jan 2024 17:18:30 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
In-Reply-To: <20240116072300.3a6e0dbe@kernel.org>
Message-ID: <d844c643-16bd-6f9d-1d39-a4f93b3fcf87@bootlin.com>
References: <20240111-prevent_dsa_tags-v5-1-63e795a4d129@bootlin.com>
 <20240112181327.505b424e@kernel.org>
 <fca39a53-743e-f79d-d2d1-f23d8e919f82@bootlin.com>
 <20240116072300.3a6e0dbe@kernel.org>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v5] net: stmmac: Prevent DSA tags from
	breaking COE
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

On Tue, 16 Jan 2024, Jakub Kicinski wrote:

> Hm, the comment in enh_desc_coe_rdes0() says:
> 
> 	/* bits 5 7 0 | Frame status
> 	 * ----------------------------------------------------------
> 	 *      0 0 0 | IEEE 802.3 Type frame (length < 1536 octects)
> 	 *      1 0 0 | IPv4/6 No CSUM errorS.
> 	 *      1 0 1 | IPv4/6 CSUM PAYLOAD error
> 	 *      1 1 0 | IPv4/6 CSUM IP HR error
> 	 *      1 1 1 | IPv4/6 IP PAYLOAD AND HEADER errorS
> 	 *      0 0 1 | IPv4/6 unsupported IP PAYLOAD
> 	 *      0 1 1 | COE bypassed.. no IPv4/6 frame
> 	 *      0 1 0 | Reserved.
> 	 */
> 
> which makes it sound like bit 5 will not be set for a Ethernet II frame
> with unsupported IP payload, or not an IP frame. Does the bit mean other
> things in different descriptor formats?

The description of this bit in my datasheet is:

```
b5 FT Frame Type
When set, this bit indicates that the Receive Frame is an Ethernet-type frame 
(the Length/Type field is greater than or equal to 1,536). When this bit is 
reset, it indicates that the received frame is an IEEE 802.3 frame. This bit is 
not valid for Runt frames less than 14 bytes
```

There is no mention of a more subtle check to detect non-IP Ethernet II frames. 
I ran some tests on my hardware and EDSA-tagged packets consistently come in 
with status 0b100, so the MAC sets the frame type bit even for frames that don't 
have an IP ethertype.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
