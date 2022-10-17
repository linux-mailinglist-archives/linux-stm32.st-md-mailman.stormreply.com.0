Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAA2600A96
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 11:27:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EEF2C63325;
	Mon, 17 Oct 2022 09:27:21 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E860C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 09:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665998839; x=1697534839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uMXEjdYfJ4AJV1TGc6N3Z98FaBO6KSM8lYZW5Txc/+Q=;
 b=S8JwWJIv5DwDNI8MSlnjE1Ary1YgW/ucXwhEhjJMwOMTxuUFeMWuPENF
 08Tc1xKe42UxqQ5sK44mwff4EoRFzDwlR43zLQlZff/uGhusexQwGcmYP
 lr697LrHTf49aDPq821QTmb0Oz2IhIZDozj0pdJo8UPzlvjgQqAMmp/EY
 0pSJnT1P8qKYU+7f65OTrfvFt6azugFgzGVfgb4OFww/hg0kfXn0uqi1d
 tFMbz9ZFPj+0At7QZMXwi51/gW9xfGpdi9iqQzfrpihUcg+jGvFhg9159
 yCeHMQc9dJHSSyaC9ZzdHfU9yEXwSJzCgJVyMWfzJYYcz25i3PIuBkk/O A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="286141733"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="286141733"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 02:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="630619961"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="630619961"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 17 Oct 2022 02:27:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1okMOj-008i6R-2u; Mon, 17 Oct 2022 12:27:01 +0300
Date: Mon, 17 Oct 2022 12:27:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <Y00f5exY2fM6IwZ+@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ1M3ckw+jFgvMqG4jvR-t_44GPoZ6ZDXszwZCJr-cDpg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZ1M3ckw+jFgvMqG4jvR-t_44GPoZ6ZDXszwZCJr-cDpg@mail.gmail.com>
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

On Mon, Oct 17, 2022 at 11:02:09AM +0200, Linus Walleij wrote:
> On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > than logical. This series is basically out of two parts:
> > - add missed headers to the pin control drivers / users
> > - clean up the headers of pin control subsystem
> >
> > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > pin control subsystems, so all new drivers will utilize cleaned up headers
> > of the pin control.
> 
> Aha I see you want to send a pull request so I backed out the applied patches
> from the series for now.

Can I consider all that you answered to as Rb tag?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
