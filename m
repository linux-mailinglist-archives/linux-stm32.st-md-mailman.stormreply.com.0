Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4796977F2
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89FA0C6B457;
	Wed, 15 Feb 2023 08:18:44 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D48A6C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Feb 2023 03:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676171640; x=1707707640;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8Ee53bw0HTAKCWMxXPAJRBW6Y+YE/qZmXr9sA0iMSzM=;
 b=ZFoHsRTyf9oERL6i774nFIavRqGW3S2MjKqKcmK15hdogd/xOaL0o2NY
 JjBZKtXqxVnW3lXhE1G7ufDyNaePbne8zDs4JCqZHP2YeQbzMhlulMkqD
 Iq2MV/zDhByMiEHfw2T9ZXGIZjlM5Qq73HpT3FcTZ+M2t/IDX9Ibenwko
 Cva/EuMzf1lkyYl+a5sw60n4MkOueTUbek7MC6tQ5MZnEhRqKLskwazZT
 hWYawIH0SCfVnNPllfQsjmk5afOJQregEjkzyDHRuZLrXgkAU+QEkuj26
 mjxirQ+za9AhUuLWTNpRo8N+dDSaYkPeLXRvGnUowtHAvA18JavnLQGXQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="332824352"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; d="scan'208";a="332824352"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2023 19:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="842406476"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; d="scan'208";a="842406476"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga005.jf.intel.com with ESMTP; 11 Feb 2023 19:13:56 -0800
Date: Sat, 11 Feb 2023 19:23:45 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Message-ID: <20230212032345.GA17062@ranerica-svr.sc.intel.com>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
 <20230211021023.GA13306@ranerica-svr.sc.intel.com>
 <9a121d43-b6d9-fe99-1e4c-498dac2e6b17@linaro.org>
 <258dedb542d4dcb73e9ec903d205ba64639c9f0a.camel@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <258dedb542d4dcb73e9ec903d205ba64639c9f0a.camel@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:40 +0000
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Haowen Bai <baihaowen@meizu.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, rafael.j.wysocki@intel.com,
 Minghao Chi <chi.minghao@zte.com.cn>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] thermal: Remove core header inclusion
	from drivers
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Sat, Feb 11, 2023 at 08:32:48AM -0800, srinivas pandruvada wrote:
> On Sat, 2023-02-11 at 08:53 +0100, Daniel Lezcano wrote:
> > On 11/02/2023 03:10, Ricardo Neri wrote:
> > > On Mon, Feb 06, 2023 at 04:34:29PM +0100, Daniel Lezcano wrote:
> > > > As the name states "thermal_core.h" is the header file for the
> > > > core
> > > > components of the thermal framework.
> > > > =

> > > > Too many drivers are including it. Hopefully the recent cleanups
> > > > helped to self encapsulate the code a bit more and prevented the
> > > > drivers to need this header.
> > > > =

> > > > Remove this inclusion in every place where it is possible.
> > > > =

> > > > Some other drivers did a confusion with the core header and the
> > > > one
> > > > exported in linux/thermal.h. They include the former instead of
> > > > the
> > > > latter. The changes also fix this.
> > > > =

> > > > The tegra/soctherm driver still remains as it uses an internal
> > > > function which need to be replaced.
> > > > =

> > > > The Intel HFI driver uses the netlink internal framework core and
> > > > should be changed to prevent to deal with the internals.
> > > =

> > > I don't see any of the thermal netlink functionality exposed. Is
> > > there any work in progress?
> > =

> > commit bd30cdfd9bd73b68e4977ce7c5540aa7b14c25cd
> > Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > =

> > =A0=A0=A0=A0 thermal: intel: hfi: Notify user space for HFI events
> > =

> This is already exposed and we use it in user space.
> thermal_genl_cpu_capability_event() is called from intel_hfi driver to
> send the cpu capabilities.
> =

> Not sure what do you mean by  "don't see netlink functionality
> exposed"?
> =

> thermal_genl_cpu_caps struct and thermal_genl_cpu_capability_event()
> are defined in drivers/thermal/thermal_netlink.h.

Yes, I mean exactly this. The HFI code uses this functionality, but it is
declared in "../thermal_netlink.h". I just wondered if that is OK or also
needs to be declared somewhere in include/linux/

Thanks and BR,
Ricardo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
