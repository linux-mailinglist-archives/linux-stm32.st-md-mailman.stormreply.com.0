Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA28ADDFE
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 09:08:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D45E6C7128A;
	Tue, 23 Apr 2024 07:08:26 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F24FC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 07:08:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1rzAG2-0004PC-Fe; Tue, 23 Apr 2024 09:08:02 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1rzAG0-00Dppn-33; Tue, 23 Apr 2024 09:08:00 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1rzAFz-009lmk-3C;
 Tue, 23 Apr 2024 09:08:00 +0200
Date: Tue, 23 Apr 2024 09:07:59 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Richard Cochran <richardcochran@gmail.com>
Message-ID: <ZideTxpOcPTbR9yt@pengutronix.de>
References: <20240417164316.1755299-1-o.rempel@pengutronix.de>
 <20240417164316.1755299-3-o.rempel@pengutronix.de>
 <c8e3f5d0-832b-4ab1-a65f-52f983ff110a@lunn.ch>
 <ZiAtREiqPuvXkB4S@pengutronix.de>
 <b44a4aee-f76f-4472-9b5c-343a09ed0d33@lunn.ch>
 <ZiITWEZgTx9aPqIy@hoboy.vegasvil.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZiITWEZgTx9aPqIy@hoboy.vegasvil.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 Arun Ramadoss <arun.ramadoss@microchip.com>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, UNGLinuxDriver@microchip.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 2/4] net: phy: micrel:
 lan8841: set default PTP latency values
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

Hi Richard,

On Thu, Apr 18, 2024 at 11:46:48PM -0700, Richard Cochran wrote:
> On Wed, Apr 17, 2024 at 10:23:07PM +0200, Andrew Lunn wrote:
> > I suggest you go read older messages from Richard. It was a discussion
> > with Microchip about one of their PHYs.
> 
> My 2 cents:
> 
> User space has all of the hooks needed to configure corrections for a
> given setup.
> 
> Hard coding corrections in device drivers is bound to fail, based on
> prior experience with Vendors not knowing or caring how their products
> actually work.  Vendors will publish value X one year, then delete the
> info (to avoid embarrassment), then publish the new value Y, once
> customers have forgotten about X.
> 
> So, prudent users will always calibrate their beloved systems, not
> trusting the Vendors to provide anything close to reasonable.
> 
> Ergo, adding new magical correction in a kernel release causes
> regressions for prudent users.
> 
> But, in the end, that doesn't matter, because prudent users are used
> to being abused by well-meaning yet misguided device driver authors.
> 
> Prudent users are wise, and they will re-calibrate their systems
> before rolling out an updated kernel.

Ok, i see. Thank you for your feedback.

Are the recommended FOSS projects managing calibration values per-
linkmode/port/device in user space?

What is recommended way for calibration? Using some recommended device?

Regards,
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
