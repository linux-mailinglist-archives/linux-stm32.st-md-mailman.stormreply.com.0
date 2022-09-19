Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDF55BC489
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Sep 2022 10:44:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71164C0D2C1;
	Mon, 19 Sep 2022 08:44:44 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CC5EC03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 08:44:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D1DCB816B0;
 Mon, 19 Sep 2022 08:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE61C433C1;
 Mon, 19 Sep 2022 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1663577080;
 bh=Vd83dSwOxxVSmijrL/0T0PlkhSMj1d5PUkUDnXOIUyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dlSngLTIaXTUHmuHDJgtMdbNwSHKqUJq9SLyDbvIvDthukzpSXHybBsTRhVVyFNJ2
 1qqCtuHfpcMr/GliCB6rzwJjMLC2MHRH03VKiFCffo41yXNOwwmKRS/fEC1f2Cxj7R
 DLEvYnlAXyJ2KzF8cFOljKYCXKTJeMmqp7ByoylE=
Date: Mon, 19 Sep 2022 10:45:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Olof Johansson <olof@lixom.net>
Message-ID: <YygsEtxKz8dsEstc@kroah.com>
References: <20220701012647.2007122-1-saravanak@google.com>
 <YwS5J3effuHQJRZ5@kroah.com>
 <CAOesGMivJ5Q-jdeGKw32yhjmNiYctHjpEAnoMMRghYqWD2m2tw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOesGMivJ5Q-jdeGKw32yhjmNiYctHjpEAnoMMRghYqWD2m2tw@mail.gmail.com>
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linus walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@xilinx.com>,
 Hammer Hsieh <hammerh0314@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vineet Gupta <vgupta@kernel.org>, len brown <len.brown@intel.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, pavel machek <pavel@ucw.cz>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 eric dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 sascha hauer <sha@pengutronix.de>, Saravana Kannan <saravanak@google.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Gabriel Somlo <gsomlo@gmail.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-mips@vger.kernel.org, kernel-team@android.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Andreas Farber <afaerber@suse.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Pali Rohar <pali@kernel.org>,
 heiner kallweit <hkallweit1@gmail.com>, ulf hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>,
 linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Alexander Shiyan <shc_work@mail.ru>,
 kevin hilman <khilman@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 paolo abeni <pabeni@redhat.com>, Ray Jui <rjui@broadcom.com>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-snps-arc@lists.infradead.org,
 Timur Tabi <timur@kernel.org>, hideaki yoshifuji <yoshfuji@linux-ipv6.org>,
 iommu@lists.linux-foundation.org, Laxman Dewangan <ldewangan@nvidia.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Baruch Siach <baruch@tkos.co.il>, Liviu Dudau <liviu.dudau@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, joerg roedel <joro@8bytes.org>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, jakub kicinski <kuba@kernel.org>,
 will deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>, netdev@vger.kernel.org,
 david ahern <dsahern@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Takao Orito <orito.takao@socionext.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] Fix console probe delay when
	stdout-path isn't set
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

On Sun, Sep 18, 2022 at 08:44:27PM -0700, Olof Johansson wrote:
> On Tue, Aug 23, 2022 at 8:37 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jun 30, 2022 at 06:26:38PM -0700, Saravana Kannan wrote:
> > > These patches are on top of driver-core-next.
> > >
> > > Even if stdout-path isn't set in DT, this patch should take console
> > > probe times back to how they were before the deferred_probe_timeout
> > > clean up series[1].
> >
> > Now dropped from my queue due to lack of a response to other reviewer's
> > questions.
> 
> What happened to this patch? I have a 10 second timeout on console
> probe on my SiFive Unmatched, and I don't see this flag being set for
> the serial driver. In fact, I don't see it anywhere in-tree. I can't
> seem to locate another patchset from Saravana around this though, so
> I'm not sure where to look for a missing piece for the sifive serial
> driver.
> 
> This is the second boot time regression (this one not fatal, unlike
> the Layerscape PCIe one) from the fw_devlink patchset.
> 
> Greg, can you revert the whole set for 6.0, please? It's obviously
> nowhere near tested enough to go in and I expect we'll see a bunch of
> -stable fixups due to this if we let it remain in.

What exactly is "the whole set"?  I have the default option fix queued
up and will send that to Linus later this week (am traveling back from
Plumbers still), but have not heard any problems about any other issues
at all other than your report.

thnaks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
