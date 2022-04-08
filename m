Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F9A4F99C0
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Apr 2022 17:43:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E386C628AC;
	Fri,  8 Apr 2022 15:43:48 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DC7FC60479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Apr 2022 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649432626; x=1680968626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gcJtOPIX2/0B3YxiUGz/EyzDxp0SAsqb/v7kxf3M3BU=;
 b=jL75dfHpXUaCBt5B2J3iWUUWmtmnWUKkuTWy2ZzZqjLgWwhRMO8EBmiK
 YsDm/63ujRsvURvVUH/7aEBXBLWJ1k14XEwqAoBe1TzA82alnebmrhFPD
 lfJkG2jUB8+r1z1Wmr2oF+oXbpPGZ26TbYpdVLZxE0qDd/1tnUxL9RD+i
 jBjyDN7mWBN9ZzyAXxCIYXQ3UOHdrxreiZOADIE+w7NhbH5Kyb09bRFAz
 T0gluRtgrMNUSrMpw2teRqDdTD774gQQmuG/GLvBHEmg+ldWLV1V3pigc
 V8yvXz/YmbZhCrUqDk/3D3hvSat4ky3/jOkiJpb0ubOvSOy/xrHAmdb0B g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="260460281"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="260460281"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 08:43:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="589257568"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 08:43:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ncqiH-000Lsk-PD; Fri, 08 Apr 2022 18:39:53 +0300
Date: Fri, 8 Apr 2022 18:39:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <YlBXSVyj88CqjGj4@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
 <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 Marc Zyngier <maz@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>,
 Nancy Yuen <yuenn@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
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

On Fri, Apr 08, 2022 at 05:22:21PM +0200, Krzysztof Kozlowski wrote:
> On 01/04/2022 12:35, Andy Shevchenko wrote:
> > Switch the code to use for_each_gpiochip_node() helper.

(...)

> >  /*
> >   * Iterate over all driver pin banks to find one matching the name of node,
> >   * skipping optional "-gpio" node suffix. When found, assign node to the bank.
> >   */
> > -static void samsung_banks_of_node_get(struct device *dev,
> > -				      struct samsung_pinctrl_drv_data *d,
> > -				      struct device_node *node)
> > +static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_drv_data *d)
> 
> This is worth simplification anyway, so please split it to separate patch.

Not sure what to do and why it worth an additional churn.

> >  {
> >  	const char *suffix = "-gpio-bank";
> >  	struct samsung_pin_bank *bank;
> > -	struct device_node *child;
> > +	struct fwnode_handle *child;
> >  	/* Pin bank names are up to 4 characters */
> >  	char node_name[20];
> >  	unsigned int i;
> > @@ -1038,17 +1037,17 @@ static void samsung_banks_of_node_get(struct device *dev,
> >  			continue;
> >  		}
> >  
> > -		for_each_child_of_node(node, child) {
> > -			if (!of_find_property(child, "gpio-controller", NULL))
> > -				continue;
> 
> This does not look equivalent. There are nodes without this property.

Not sure I understand why not. The macro checks for the property and
iterates over nodes that have this property.

Can you elaborate, please?

> > -			if (of_node_name_eq(child, node_name))
> > +		for_each_gpiochip_node(dev, child) {
> > +			struct device_node *np = to_of_node(child);
> > +
> > +			if (of_node_name_eq(np, node_name))
> >  				break;
> > -			else if (of_node_name_eq(child, bank->name))
> > +			if (of_node_name_eq(np, bank->name))
> >  				break;
> >  		}
> 
> This patch has to wait till someone provides you a tested-by. I might do
> it around next week.

Fine with me, I will drop it from my repo for now.

Thanks for review!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
