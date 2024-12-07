Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD59E7ED6
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Dec 2024 09:00:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D14FC7802D;
	Sat,  7 Dec 2024 08:00:59 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45D31C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Dec 2024 08:00:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1tJpju-00061t-9k; Sat, 07 Dec 2024 09:00:34 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tJpjr-0028W7-1K;
 Sat, 07 Dec 2024 09:00:32 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tJpjs-002fei-0E;
 Sat, 07 Dec 2024 09:00:32 +0100
Date: Sat, 7 Dec 2024 09:00:32 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Message-ID: <Z1QAoAmXlBoixIS4@pengutronix.de>
References: <20241205125640.1253996-1-o.rempel@pengutronix.de>
 <20241205125640.1253996-2-o.rempel@pengutronix.de>
 <20241205-immortal-sneak-8c5a348a8563@spud>
 <Z1KxZmRekrYGSdd4@pengutronix.de>
 <20241206-wrought-jailbreak-52cc4a21a713@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241206-wrought-jailbreak-52cc4a21a713@spud>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Woojung Huh <woojung.huh@microchip.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v1 1/5] dt-bindings: net: Add TI DP83TD510
	10BaseT1L PHY
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

On Fri, Dec 06, 2024 at 04:57:01PM +0000, Conor Dooley wrote:
> On Fri, Dec 06, 2024 at 09:10:14AM +0100, Oleksij Rempel wrote:
> > On Thu, Dec 05, 2024 at 05:18:59PM +0000, Conor Dooley wrote:
> > > On Thu, Dec 05, 2024 at 01:56:36PM +0100, Oleksij Rempel wrote:
> > > > Introduce devicetree binding for the Texas Instruments DP83TD510
> > > > Ultra Low Power 802.3cg 10Base-T1L Single Pair Ethernet PHY.
> > > > 
> > > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > > ---
> > > >  .../devicetree/bindings/net/ti,dp83td510.yaml | 35 +++++++++++++++++++
> > > >  1 file changed, 35 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/net/ti,dp83td510.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/net/ti,dp83td510.yaml b/Documentation/devicetree/bindings/net/ti,dp83td510.yaml
> > > > new file mode 100644
> > > > index 000000000000..cf13e86a4017
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/net/ti,dp83td510.yaml
> > > > @@ -0,0 +1,35 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/net/ti,dp83td510.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: TI DP83TD510 10BaseT1L PHY
> > > > +
> > > > +maintainers:
> > > > +  - Oleksij Rempel <o.rempel@pengutronix.de>
> > > > +
> > > > +description:
> > > > +  DP83TD510E Ultra Low Power 802.3cg 10Base-T1L 10M Single Pair Ethernet PHY
> > > > +
> > > > +allOf:
> > > > +  - $ref: ethernet-phy.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - ethernet-phy-id2000.0181
> > > 
> > > There's nothing specific here, can someone remind me why the generic
> > > binding is not enough?
> > 
> > The missing binding was blamed by checkpatch. Haw should I proceed with this
> > patch?
> 
> Does dtbs_check complain when you use it in a dts? What you have here
> matches against the pattern ^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$
> so I think it won't. checkpatch might be too dumb to evaluate the regex?

dtbs_check didn't complained about it, only checkpatch.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
