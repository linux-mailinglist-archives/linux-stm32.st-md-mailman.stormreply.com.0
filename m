Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50794909F
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 15:16:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5863FC71290;
	Tue,  6 Aug 2024 13:16:12 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 054F0C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 13:16:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1sbK2d-0000GH-3S; Tue, 06 Aug 2024 15:15:55 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1sbK2b-004xsB-NF; Tue, 06 Aug 2024 15:15:53 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1sbK2b-0051Ir-1q;
 Tue, 06 Aug 2024 15:15:53 +0200
Date: Tue, 6 Aug 2024 15:15:53 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <ZrIiCX89nRDLvXtC@pengutronix.de>
References: <20240806120332.405064-1-o.rempel@pengutronix.de>
 <ae46118f-a692-4362-8e6b-4ef8c6369541@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae46118f-a692-4362-8e6b-4ef8c6369541@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Jander <david@protonic.nl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] arm: dts: st: Add MECIO1 and MECT1S
	board variants
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

On Tue, Aug 06, 2024 at 02:39:31PM +0200, Krzysztof Kozlowski wrote:
> On 06/08/2024 14:03, Oleksij Rempel wrote:
> > From: David Jander <david@protonic.nl>
> > 
> > Introduce device tree support for the MECIO1 and MECT1S board variants.
> > MECIO1 is an I/O and motor control board used in blood sample analysis
> > machines. MECT1S is a 1000Base-T1 switch for internal machine networks
> > of blood sample analysis machines.
> > 
> > Signed-off-by: David Jander <david@protonic.nl>
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  .../devicetree/bindings/arm/stm32/stm32.yaml  |   8 +
> >  arch/arm/boot/dts/st/Makefile                 |   3 +
> >  arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts |  48 ++
> >  arch/arm/boot/dts/st/stm32mp151c-mect1s.dts   | 297 ++++++++++
> >  arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts |  48 ++
> >  .../arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi | 533 ++++++++++++++++++
> >  6 files changed, 937 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts
> >  create mode 100644 arch/arm/boot/dts/st/stm32mp151c-mect1s.dts
> >  create mode 100644 arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts
> >  create mode 100644 arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > index 58099949e8f3a..703d4b574398d 100644
> > --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.

Ack, I see. stm32.yaml should be in separate patch.

> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.

What should be done with "ethernet-phy-id2000.a284" appears
un-documente warnings? Should it be handled by
Documentation/devicetree/bindings/net/ethernet-phy.yaml?

Best regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
