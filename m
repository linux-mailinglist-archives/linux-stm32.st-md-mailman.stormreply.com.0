Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B78A4FEC1
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 13:37:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6BBCC78037;
	Wed,  5 Mar 2025 12:37:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E5A6CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 12:37:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1tpo0P-0003XA-U0; Wed, 05 Mar 2025 13:37:45 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tpo0O-00495a-0K;
 Wed, 05 Mar 2025 13:37:44 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tpo0N-00ERN3-37;
 Wed, 05 Mar 2025 13:37:43 +0100
Date: Wed, 5 Mar 2025 13:37:43 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <Z8hFlwK27AM4d17b@pengutronix.de>
References: <20250305102103.1194277-1-o.rempel@pengutronix.de>
 <20250305102103.1194277-2-o.rempel@pengutronix.de>
 <174117806721.1245382.8322491579922154490.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174117806721.1245382.8322491579922154490.robh@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Woojung Huh <woojung.huh@microchip.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 kernel@pengutronix.de, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v4 1/4] dt-bindings: sound: convert
 ICS-43432 binding to YAML
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

On Wed, Mar 05, 2025 at 06:34:27AM -0600, Rob Herring (Arm) wrote:
> 
> On Wed, 05 Mar 2025 11:21:00 +0100, Oleksij Rempel wrote:
> > Convert the ICS-43432 MEMS microphone device tree binding from text format
> > to YAML.
> > 
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > changes v4:
> > - add Reviewed-by: Rob...
> > changes v3:
> > - add maintainer
> > - remove '|' after 'description:'
> > changes v2:
> > - use "enum" instead "oneOf + const"
> > ---
> >  .../devicetree/bindings/sound/ics43432.txt    | 19 -------
> >  .../bindings/sound/invensense,ics43432.yaml   | 51 +++++++++++++++++++
> >  2 files changed, 51 insertions(+), 19 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/sound/ics43432.txt
> >  create mode 100644 Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml: maintainers:0: 'N/A' does not match '@'
> 	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
> 

Sorry, i picked the old version...

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
