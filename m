Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC36E5FF0D9
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 17:11:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76ECBC65042;
	Fri, 14 Oct 2022 15:11:46 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B7B3C65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665760304; x=1697296304;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N/njfTWM92urhDh1tc8kt06mInCQV3hTHb5sdf7xqk0=;
 b=MMA8Fubc6u3n0BCb0rrX9HvFb0tGiS0W0nU/v/M2GKao/wOdkZhXi2DZ
 MKMW4HYPzQUsJbpUty+gr9JVY6Rau1sInm6WYkL39pgX61mWHvXhWfUvT
 20t6GWte+wzhArw2q5S+a/npxkgz8OtajDsZ5uerqTCCkqu1/JgyPFA+t
 vL1jbMx7JNarO9AlXNtNQy9w6BcfTSo7sIjy2p2XiMemaWzEmAsg1Ixns
 vPYu4qvp55Pdtefy0xeeNGyv6Bp+K+uRrorn93pfnVhykUra5szCyQSmn
 yaSh/6LwZxMoLH2sTi1SsFQNa6pUTqWUyFd/QkhmSjE4oQWsL/rp3XNck w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="285787693"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="285787693"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 08:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="660758830"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="660758830"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001.jf.intel.com with ESMTP; 14 Oct 2022 08:11:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ojMLW-006yCQ-0e; Fri, 14 Oct 2022 18:11:34 +0300
Date: Fri, 14 Oct 2022 18:11:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Message-ID: <Y0l8JTQQvLzRejk1@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <0684f480-2092-d520-2c8e-bd9a2dca47e3@gmail.com>
 <CAHp75VdDjyUAZBTaoPOe5oA3f_5xRznAooq08=Eff4F1AZyVOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VdDjyUAZBTaoPOe5oA3f_5xRznAooq08=Eff4F1AZyVOQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Kent Gibson <warthog618@gmail.com>, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [rft,
	PATCH v2 00/36] pinctrl: Clean up and add missed headers
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

On Wed, Oct 12, 2022 at 01:04:10PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 11:56 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > On 10/10/2022 1:14 PM, Andy Shevchenko wrote:
> > > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > > than logical. This series is basically out of two parts:
> > > - add missed headers to the pin control drivers / users
> > > - clean up the headers of pin control subsystem
> > >
> > > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > > pin control subsystems, so all new drivers will utilize cleaned up headers
> > > of the pin control.
> > >
> > > Please, review and comment.
> >
> > Did you really need to split this on a per-driver basis as opposed to
> > just a treewide drivers/pinctrl, drivers/media and drivers/gpiolib patch
> > set?
> >
> > 36 patches seems needlessly high when 4 patches could have achieve the
> > same outcome.
> 
> I can combine them if maintainers ask for that, nevertheless for Intel
> pin control and GPIO drivers, which I care more about, I would like to
> leave as separate changes (easy to see in history what was done).

I can now tell why I don't like to combine. While doing a revert (it's not
related to GPIO nor to pin control), it appears that I reverted extra bits
as merge conflict resolution. This is per se is not an issue, but when
I tried to find and reapply that missed piece I can't, because the patch
is combined and Git simply ignores to have
`git cherry-pick _something in the past_` done.

But again, up to maintainers.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
