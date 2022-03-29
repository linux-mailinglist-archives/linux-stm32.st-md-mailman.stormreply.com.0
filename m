Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D868E4EAD19
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 14:25:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98130C5EC6B;
	Tue, 29 Mar 2022 12:25:55 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 175A8C5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 12:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648556753; x=1680092753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B4gfQZ727rl7OXibsvWflHV4WHOqBqSX/MZ7Umzjj+U=;
 b=UHl5mw7u0HaxZSczwUgIOUYYXigdjqpCCnL1ZEff+fl/4RCip9x/SP/g
 xH0GmxfI03R6PM9lXf8IaQ5loQA13D/XvqixL70OxP0bNtFaor2vnnxU3
 LzU8vsUOmtpcVINBdiLSWant8dqoEyUUCoLy+ZyjpEhOU7GRABw3k3+Co
 gI17XjM85p3lIOOpu/7O+EKOGhAuZqC/frg2tS1UeH0YwC//ViDxZWPJK
 Fa5CFQCdqKkDX6EPox0Sn3GN61Vwnvj9aYcyAS8+C2MjvJVlI6Qg0xkoD
 XjJ6OZpJmDYG5oQG1daSPbrKzdLumtwStp+jQalTHbmPF1WFBqJwogRr9 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="258065889"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="258065889"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 05:25:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="518900483"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 05:25:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZAuN-008jlQ-PL; Tue, 29 Mar 2022 15:25:11 +0300
Date: Tue, 29 Mar 2022 15:25:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Fabien DESSENNE <fabien.dessenne@foss.st.com>
Message-ID: <YkL6p89LpPS4kLHo@smile.fi.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-2-andriy.shevchenko@linux.intel.com>
 <ca54534d-9752-44fc-7341-a8b45e1a00d7@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca54534d-9752-44fc-7341-a8b45e1a00d7@foss.st.com>
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

On Tue, Mar 29, 2022 at 02:07:01PM +0200, Fabien DESSENNE wrote:
> Hi Andy
> 
> Thank you for your the clarification.

> Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Thanks!

In v2 I'm going to add another patch and the first (against gpiolib) will be
split to two. This patch will be almost unchanged: I've decided to rename
gpiochip_count() to gpiochip_node_count(), otherwise it's the same. So, I'll
keep your tag.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
