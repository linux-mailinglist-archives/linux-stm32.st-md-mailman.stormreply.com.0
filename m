Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC623B599C
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 09:17:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DF7DC5719E;
	Mon, 28 Jun 2021 07:17:23 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B1BAC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 07:17:21 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lxlW7-0000AE-Gh; Mon, 28 Jun 2021 09:17:15 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lxlW6-0006iW-24; Mon, 28 Jun 2021 09:17:14 +0200
Message-ID: <2eaeace20028aade8b6206c42fcc7123813fd8a2.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Etienne Carriere
 <etienne.carriere@foss.st.com>,  Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, marex@denx.de
Date: Mon, 28 Jun 2021 09:17:13 +0200
In-Reply-To: <162484414661.3259633.15807994186850314510@swboyd.mtv.corp.google.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-7-gabriel.fernandez@foss.st.com>
 <162484414661.3259633.15807994186850314510@swboyd.mtv.corp.google.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 06/11] reset: stm32mp1: remove
	stm32mp1 reset
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

On Sun, 2021-06-27 at 18:35 -0700, Stephen Boyd wrote:
> Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:09)
> > From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> > 
> > st32mp1 RCC reset driver was moved into stm32mp1 RCC clock driver.
> > 
> > Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> > ---
> 
> Applied to clk-next although it would be nice to get Philipp's ack

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
