Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kiq7FOI1Tmo0IgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 13:34:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF7B7259ED
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 13:34:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=M1CE+4V+;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F43DC8F271;
	Wed,  8 Jul 2026 11:34:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A552CC7C7E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 11:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783510496; x=1815046496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AGYgMg5Ug10S/wSIeCwDKP9iDkCMyr/A63ihhHSiwRU=;
 b=M1CE+4V+aRj9eyAF9zWp7KYK5617WyIXScm0SIyTx6nP5DBUq9qxLlFl
 JUKN8ZXZlTreUdDDRSUqGw86rHe+/C7ld4zNi3qatR+pKGtK8y0meD4pT
 SaeY49fvjv5/ViBxQ6jHVxwn9rG4hozPKWy82ockvUeXmywEDkScdOjss
 V+BxK4Bv5TWctr7p0Q+3e9/KSxJQ9vun8q+eCqMYKJkep0S7kpBoBNymH
 T1jTTY2qbtJl4vWPVR/9tOTcAtbc03ouvx8J63IvFWSx4EbshHH6OUWV+
 XqYxuIWnoz7GQIijo++bHkdCYANJhRmVJJmk352c/6whCERzLGWO0llRy A==;
X-CSE-ConnectionGUID: 9TKx3EmvSl2EVc9Fz+r8vA==
X-CSE-MsgGUID: IuxB6c0wRVKc44Sr4qofzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="109714190"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="109714190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 04:34:53 -0700
X-CSE-ConnectionGUID: 9piD6cfVSWie6SfgMzvaFQ==
X-CSE-MsgGUID: Nlf/R1UvSVO9P8OFz8tYnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278642571"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 04:34:35 -0700
Date: Wed, 8 Jul 2026 14:34:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
Message-ID: <ak41yQp3x78s4Fmx@ashevche-desk.local>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
 Sudeep Holla <sudeep.holla@kernel.org>, Sven Peter <sven@kernel.org>,
 linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Chunyan Zhang <zhang.lyra@gmail.com>,
 Lee Jones <lee@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-arm-msm@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Samuel Holland <samuel@sholland.org>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, imx@lists.linux.dev,
 =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
 Tom Rix <trix@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>,
 Krzysztof Kozlowski <krzk@kernel.org>, Fred Treven <fred.treven@cirrus.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Benson Leung <bleung@chromium.org>, Samuel Kayode <samkay014@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Andreas Werner <andreas.werner@men.de>, Linus Walleij <linusw@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, asahi@lists.linux.dev,
 Zha Qipeng <qipeng.zha@intel.com>, Neal Gompa <neal@gompa.dev>,
 Xu Yilun <yilun.xu@intel.com>, Tony Lindgren <tony@atomide.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Peter Tyser <ptyser@xes-inc.com>,
 Janne Grunau <j@jannau.net>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>, mfd@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 James Ogletree <jogletre@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Colin Foster <colin.foster@in-advantage.com>,
 Ben Bright <ben.bright@cirrus.com>, linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v2 00/23] mfd: Use named initializers for
 arrays of *_device_data
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:geert+renesas@glider.be,m:alim.akhtar@samsung.com,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:cw00.choi@samsung.com,m:luca.ceresoli@bootlin.com,m:linux-sunxi@lists.linux.dev,m:s.hauer@pengutronix.de,m:linux-sound@vger.kernel.org,m:sudeep.holla@kernel.org,m:sven@kernel.org,m:linux-omap@vger.kernel.org,m:andy@kernel.org,m:sbranden@broadcom.com,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:kernel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:david.rhodes@cirrus.com,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:magnus.damm@gmail.com,m:ckeepax@opensource.cirrus.com,m:michael.hennerich@analog.com,m:mazziesaccount@gmail.com,m:linux-arm-msm@vger.kernel.org,m:rogerq@kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,
 m:wens@kernel.org,m:mika.westerberg@linux.intel.com,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:thomas.richard@bootlin.com,m:samuel@sholland.org,m:linux-renesas-soc@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:mathieu.dubois-briand@bootlin.com,m:imx@lists.linux.dev,m:andre.draszik@linaro.org,m:trix@redhat.com,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:zhaoqunqin@loongson.cn,m:krzk@kernel.org,m:fred.treven@cirrus.com,m:festevam@gmail.com,m:jernej.skrabec@gmail.com,m:andreas@kemnade.info,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:rjui@broadcom.com,m:tharvey@gateworks.com,m:j.neuschaefer@gmx.net,m:rf@opensource.cirrus.com,m:baolin.wang@linux.alibaba.com,m:bleung@chromium.org,m:samkay014@gmail.com,m:support.opensource@diasemi.com,m:andreas.werner@men.de,m:linusw@kernel.org,m:claudiu.beznea@tuxon.dev,m:asahi@lists.linux.dev,m:qipeng.zha@intel.com,m:neal@gompa.dev,m:yilun.xu@intel.com,m:tony@atomide.com,m:liviu.dudau@arm.com,m:ptyser@xes-in
 c.com,m:j@jannau.net,m:florian.fainelli@broadcom.com,m:peter.griffin@linaro.org,m:sravanhome@gmail.com,m:mfd@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:jogletre@opensource.cirrus.com,m:patches@opensource.cirrus.com,m:nicolas.ferre@microchip.com,m:colin.foster@in-advantage.com,m:ben.bright@cirrus.com,m:linux@ew.tq-group.com,m:geert@glider.be,m:marekvasut@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[glider.be,samsung.com,st-md-mailman.stormreply.com,gmail.com,vger.kernel.org,iki.fi,baylibre.com,bootlin.com,lists.linux.dev,pengutronix.de,kernel.org,broadcom.com,cirrus.com,chromium.org,opensource.cirrus.com,analog.com,lists.infradead.org,linux.intel.com,linaro.org,sholland.org,redhat.com,nxp.com,loongson.cn,kemnade.info,gateworks.com,gmx.net,linux.alibaba.com,diasemi.com,men.de,tuxon.dev,intel.com,gompa.dev,atomide.com,arm.com,xes-inc.com,jannau.net,collabora.com,microchip.com,in-advantage.com,ew.tq-group.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[89];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	ARC_NA(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBF7B7259ED

On Wed, Jul 08, 2026 at 01:15:07PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Hello,
> =

> this series superseeds my previous patch "[PATCH v1] mfd: Use named
> initializers for arrays of i2c_device_data"
> (https://lore.kernel.org/lkml/20260515095839.4005460-2-u.kleine-koenig@ba=
ylibre.com)
> that Lee asked me to rebase and also the series "[PATCH v1 0/3] mfd:
> Initialize spi_device_id arrays using member names"
> (https://lore.kernel.org/lkml/cover.1783003256.git.u.kleine-koenig@baylib=
re.com).
> =

> The objective for this series is to prepare mfd for changing
> of_device_id etc to make driver_data a union, see
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre=
.com/
> for the idea behind it.
> =

> This series is based on yesterday's next/master and it does the
> restructuring not only for i2c and spi (as the two series mentioned
> above), but for all *_device_id structures that I intend to modify with
> a union that affect mfd. So (I hope) this is the only patch series
> affecting mfd for this quest.
> =

> I don't care much about the last few patches unifying the coding style.
> I think it's a good opportunity to do that, but if you don't like them,
> just don't apply these.

The patches bring inconsistency (or still leave it) with the terminator sty=
le
in both I=B2C and ACPI ID tables. Can you revisit that?

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
