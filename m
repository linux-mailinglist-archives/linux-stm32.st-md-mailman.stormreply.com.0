Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7815EC256
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 14:18:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E6D8C63326;
	Tue, 27 Sep 2022 12:18:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D53FDC03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664281094; x=1695817094;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OFIxxBkiaCDaU7hdmWCgva7sjv3x1WGTNlqGM1oQtNQ=;
 b=bbrvX5BLmm3n8JNekY/YAn+Kws8rVe583vzPH+6sdbQ54AZZYxVSJrrc
 Mepags5+6hDzcv7IZf9UbKyXT5hknF3Omwy19P2YlQ4UM95lo0IVW9X0a
 JTQl0GhBflW8W3gW0THhFDhyLKbsb6AiHVwkvkSulEw3o50seJjwDWw1Q
 r1srAJAi31LODzPB1liFikBLP0MO1BCh1jGwgT0ViYvJjYkhueV0sqpKG
 jVOywu3oDWHF3YAMOm4y8uCGNqqpgpOP8j7JRs4wDbTA+2BZjnKwPWgV/
 O7s4uTBzylydlDRoJC6zIkdJigyGvbJ8pf/3hPZ6pKWziMlgMvmSV18u2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="300021541"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="300021541"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 05:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="599160114"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="599160114"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006.jf.intel.com with ESMTP; 27 Sep 2022 05:18:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1od9XD-008RHv-1p; Tue, 27 Sep 2022 15:17:59 +0300
Date: Tue, 27 Sep 2022 15:17:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Message-ID: <YzLp9yXgoJmy5YU8@smile.fi.intel.com>
References: <20220701012647.2007122-1-saravanak@google.com>
 <YwS5J3effuHQJRZ5@kroah.com>
 <CAOesGMivJ5Q-jdeGKw32yhjmNiYctHjpEAnoMMRghYqWD2m2tw@mail.gmail.com>
 <YygsEtxKz8dsEstc@kroah.com>
 <CAOesGMh5GHCONTQ9M1Ro7zW-hkL_1F7Xt=xRV0vYSfPY=7LYkQ@mail.gmail.com>
 <CAL_JsqK7auA8coB3DCqSDKw1ept_yQihVs-Me3bvU923os23xg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqK7auA8coB3DCqSDKw1ept_yQihVs-Me3bvU923os23xg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, pavel machek <pavel@ucw.cz>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 eric dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 sascha hauer <sha@pengutronix.de>, Saravana Kannan <saravanak@google.com>,
 will deacon <will@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Gabriel Somlo <gsomlo@gmail.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-mips@vger.kernel.org, kernel-team@android.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Olof Johansson <olof@lixom.net>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Andreas Farber <afaerber@suse.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Pali Rohar <pali@kernel.org>,
 heiner kallweit <hkallweit1@gmail.com>, ulf hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>,
 linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-aspeed@lists.ozlabs.org, Florian Fainelli <f.fainelli@gmail.com>,
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
 Manivannan Sadhasivam <mani@kernel.org>, linux-mediatek@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
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

On Mon, Sep 26, 2022 at 01:25:05PM -0500, Rob Herring wrote:
> On Mon, Sep 19, 2022 at 5:56 PM Olof Johansson <olof@lixom.net> wrote:
> >
> > On Mon, Sep 19, 2022 at 1:44 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sun, Sep 18, 2022 at 08:44:27PM -0700, Olof Johansson wrote:
> > > > On Tue, Aug 23, 2022 at 8:37 AM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Thu, Jun 30, 2022 at 06:26:38PM -0700, Saravana Kannan wrote:
> > > > > > These patches are on top of driver-core-next.
> > > > > >
> > > > > > Even if stdout-path isn't set in DT, this patch should take console
> > > > > > probe times back to how they were before the deferred_probe_timeout
> > > > > > clean up series[1].
> > > > >
> > > > > Now dropped from my queue due to lack of a response to other reviewer's
> > > > > questions.
> > > >
> > > > What happened to this patch? I have a 10 second timeout on console
> > > > probe on my SiFive Unmatched, and I don't see this flag being set for
> > > > the serial driver. In fact, I don't see it anywhere in-tree. I can't
> > > > seem to locate another patchset from Saravana around this though, so
> > > > I'm not sure where to look for a missing piece for the sifive serial
> > > > driver.
> > > >
> > > > This is the second boot time regression (this one not fatal, unlike
> > > > the Layerscape PCIe one) from the fw_devlink patchset.
> > > >
> > > > Greg, can you revert the whole set for 6.0, please? It's obviously
> > > > nowhere near tested enough to go in and I expect we'll see a bunch of
> > > > -stable fixups due to this if we let it remain in.
> > >
> > > What exactly is "the whole set"?  I have the default option fix queued
> > > up and will send that to Linus later this week (am traveling back from
> > > Plumbers still), but have not heard any problems about any other issues
> > > at all other than your report.
> >
> > I stand corrected in this case, the issue on the Hifive Unmatched was
> > a regression due to a PWM clock change -- I just sent a patch for that
> > (serial driver fix).
> >
> > So it seems like as long as the fw_devlink.strict=1 patch is reverted,
> > things are back to a working state here.
> >
> > I still struggle with how the fw_devlink patchset is expected to work
> > though, since DT is expected to describe the hardware configuration,
> > and it has no knowledge of whether there are drivers that will be
> > bound to any referenced supplier devnodes. It's not going to work well
> > to assume that they will always be bound, and to add 10 second
> > timeouts for those cases isn't a good solution. Seems like the number
> > of special cases will keep adding up.
> 
> Since the introduction of deferred probe, the kernel has always
> assumed if there is a device described, then there is or will be a
> driver for it. The result is you can't use new DTs (if they add
> providers) with older kernels.
> 
> We've ended up with a timeout because no one has come up with a better
> way to handle it. What the kernel needs is userspace saying "I'm done
> loading modules", but it's debatable whether that's a good solution
> too.

In my opinion the deferred probe is a big hack and that is the root
cause of the issues we have here and there. It has to be redesigned
to be mathematically robust. It was an attempt by Andrzej Hajda to
solve this [1].

[1]: https://events19.linuxfoundation.org/wp-content/uploads/2017/12/Deferred-Problem-Issues-With-Complex-Dependencies-Between-Devices-in-Linux-Kernel-Andrzej-Hajda-Samsung.pdf

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
