Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A634EAC0B
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 13:15:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 677C2C5EC56;
	Tue, 29 Mar 2022 11:15:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F920C5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648552498; x=1680088498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WW7g88rQ37IyUYcFgRuJ0tHqtRy6l/Sd1url/SgYtxc=;
 b=URwn4KzpKEQDgC07ZpEU0iZtobPvy+J8UBqfYutkelx7sRz1jUBjCdm6
 WmXbGxCaaCOiqNMmsU/mCHFRUGYHs7ENahLT449ek0C+B7r74f5z2PeqR
 fCKeKDRmbxfmSNU7K1HJ6UHx7jwLCsRw8nzTkhboh3IHZ6abILyjCputW
 RQ2h0pwft2eLwqIiq/3w74y+oxKN8QAsXeS0b0+VsrubAbv0u66ZoJzn7
 hzbk3ZNUKdse+kUI1XETGF4USaOmQLhD++q0ZcwyIvz6ra/+Zb/G8gOus
 NPdalE1U91bdmq0J5qAksu5M++U4Z9XQvkSwZ35LAv1e54kSkfq3yeqer Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="239155671"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="239155671"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 04:14:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="787559197"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 04:14:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZ9nb-008hp9-9H; Tue, 29 Mar 2022 14:14:07 +0300
Date: Tue, 29 Mar 2022 14:14:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Fabien DESSENNE <fabien.dessenne@foss.st.com>
Message-ID: <YkLp//IFvgohHycw@smile.fi.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-2-andriy.shevchenko@linux.intel.com>
 <44057328-2454-4f4d-cc90-b0ca35ba1e5a@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44057328-2454-4f4d-cc90-b0ca35ba1e5a@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-amlogic@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v1 2/5] pinctrl: stm32: Replace custom
 code by gpiochip_count() call
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

On Tue, Mar 29, 2022 at 09:59:32AM +0200, Fabien DESSENNE wrote:
> On 25/03/2022 21:03, Andy Shevchenko wrote:

Thanks for review, my answers below.

> > -	for_each_available_child_of_node(np, child)
> 
> Here we look for "available" child, while the new generic helper
> gpiochip_count() looks for any child, available or not.
> Would it be possible to hav gpiochip_count() looking for available child as
> well?

It's done already that way. The fwnode loop is done against available children.

> It looks like there is '_available_' version of
> 'device_for_each_child_node', maybe this shall be added too.

No need.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
