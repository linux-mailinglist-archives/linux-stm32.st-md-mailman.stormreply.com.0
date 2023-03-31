Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D65546D2214
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 16:10:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8299BC6A5E7;
	Fri, 31 Mar 2023 14:10:49 +0000 (UTC)
Received: from fudo.makrotopia.org (fudo.makrotopia.org [185.142.180.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F52FC6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 13:51:20 +0000 (UTC)
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.96) (envelope-from <daniel@makrotopia.org>)
 id 1piF8o-00039R-1c; Fri, 31 Mar 2023 15:50:06 +0200
Date: Fri, 31 Mar 2023 14:50:02 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <ZCblCsKMHYDZI-H9@makrotopia.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <df218abb-fa83-49d2-baf5-557b83b33670@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df218abb-fa83-49d2-baf5-557b83b33670@app.fastmail.com>
X-Mailman-Approved-At: Fri, 31 Mar 2023 14:10:48 +0000
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pm@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Netdev <netdev@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Olof Johansson <olof@lixom.net>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC 00/20] ARM: oxnas support removal
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

On Fri, Mar 31, 2023 at 03:42:15PM +0200, Arnd Bergmann wrote:
> On Fri, Mar 31, 2023, at 10:34, Neil Armstrong wrote:
> > With [1] removing MPCore SMP support, this makes the OX820 barely usable,
> > associated with a clear lack of maintainance, development and migration to
> > dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
> >
> > In addition, the OX810 hasn't been booted for years and isn't even present
> > in an ARM config file.
> >
> > For the OX820, lack of USB and SATA support makes the platform not usable
> > in the current Linux support and relies on off-tree drivers hacked from the
> > vendor (defunct for years) sources.
> >
> > The last users are in the OpenWRT distribution, and today's removal means
> > support will still be in stable 6.1 LTS kernel until end of 2026.
> >
> > If someone wants to take over the development even with lack of SMP, I'll
> > be happy to hand off maintainance.
> >
> > The plan is to apply the first 4 patches first, then the drivers
> > followed by bindings. Finally the MAINTAINANCE entry can be removed.
> >
> > I'm not sure about the process of bindings removal, but perhaps the bindings
> > should be marked as deprecated first then removed later on ?
> >
> > It has been a fun time adding support for this architecture, but it's time
> > to get over!
> >
> > Patch 2 obviously depends on [1].
> >
> > [1] https://lore.kernel.org/all/20230327121317.4081816-1-arnd@kernel.org/
> >
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thanks a lot for going through this and preparing the patches!
> 
> I've discussed this with Daniel Golle on the OpenWRT channel as well,
> and he indicated that the timing is probably fine here, as there are
> already close to zero downloads for oxnas builds, and the 6.1 kernel
> will only be part of a release in 2024.
> 
> For the dependency on my other patch, I'd suggest you instead
> remove the SMP files here as well, which means we can merge either
> part independently based on just 6.3-rc. I can do that change
> myself by picking up patches 1-4 of your RFC series, or maybe you
> can send resend them after rebase to 6.3-rc1.
> 
> For the driver removals, I think we can merge those at the same
> time as the platform removal since there are no shared header files
> that would cause build time regressions and there are no runtime
> regressions other than breaking the platform itself. Maybe
> just send the driver removal separately to the subsystem
> maintainers with my
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Sounds reasonable, so also

Acked-by: Daniel Golle <daniel@makrotopia.org>

(but I am a bit sad about it anyway. without SMP it doesn't make sense
to keep ox820 though)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
