Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 993bJn6uSWph6AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 05 Jul 2026 03:08:14 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC64708BD6
	for <lists+linux-stm32@lfdr.de>; Sun, 05 Jul 2026 03:08:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=RBkPSMZz;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91FC7C7C7E4;
	Sun,  5 Jul 2026 01:08:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C398CC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Jul 2026 01:08:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F2B8343942;
 Sun,  5 Jul 2026 01:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2BF1F000E9;
 Sun,  5 Jul 2026 01:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783213690;
 bh=3duzwyHdi6RgshCaFz1ynAPla1JdMO1NFXgABI7Eh3s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=RBkPSMZz/BRsU6kDJgLsvltCHl/7nmfEQhY9exVykMN2oKxRiBkjx0bffH+fLPUYH
 2ck3iltRsWHYzSENjgVtJrOJreGEUuUNSVj3Lw6/17RResfLk3hMjVq8SFBY9BhwDf
 sKGEtqWnoWO1tu5pP6nXAc6xmwVh8UNIja+d2sdcRPZaulrROXaGk/79+rxatMNbsr
 c2v95I5UOD7pAE9DXeaUhAJJOM+Z8Ue+In01tEjX7ZGwWogIhtIPwhvb1sf0fVcC/Q
 IwJtuFvlG/z8wx2ctp0O4Cx1DHR5NHBJURe7Lg72aFRhuLvN9Mldzb+6xKPfPOkOCm
 T0vQCQ2/MHtEg==
Date: Sun, 5 Jul 2026 02:07:58 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <20260705020758.011f4f3c@jic23-huawei>
In-Reply-To: <20260603182052.7d23c067@jic23-huawei>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
 <acBr-W2ILu9tnMyd@google.com>
 <20260603182052.7d23c067@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-phy@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 linux-mips@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Hans de Goede <hansg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] iio: inkern: Use namespaced exports
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:daniel.lezcano@linaro.org,m:claudiu.beznea.uj@bp.renesas.com,m:casey.connolly@linaro.org,m:linux-iio@vger.kernel.org,m:linus.walleij@linaro.org,m:amitk@kernel.org,m:nuno.sa@analog.com,m:paul@crapouillou.net,m:matthias.bgg@gmail.com,m:s.nawrocki@samsung.com,m:linux-phy@lists.infradead.org,m:m.szyprowski@samsung.com,m:kishon@kernel.org,m:lars@metafoo.de,m:andriy.shevchenko@intel.com,m:romain.gantois@bootlin.com,m:zhang.lyra@gmail.com,m:rafael@kernel.org,m:thomas.petazzoni@bootlin.com,m:krzk@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:cw00.choi@samsung.com,m:wens@csie.org,m:myungjoo.ham@samsung.com,m:linux-input@vger.kernel.org,m:orsonzhai@gmail.com,m:rui.zhang@intel.com,m:dlechner@baylibre.com,m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:thara.gopinath@gmail.com,m:sravanhome@gmail.com,m:Michael.Hennerich@analog.com,m:matheus@castello.eng.br,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:linux-mips@vger.ke
 rnel.org,m:broonie@kernel.org,m:eugen.hristev@linaro.org,m:baolin.wang@linux.alibaba.com,m:me@iskren.info,m:tiwai@suse.com,m:perex@perex.cz,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:angelogioacchino.delregno@collabora.com,m:andy@kernel.org,m:sebastian.reichel@collabora.com,m:support.opensource@diasemi.com,m:linux-pm@vger.kernel.org,m:sre@kernel.org,m:linux-kernel@vger.kernel.org,m:vkoul@kernel.org,m:Mariel.Tinaco@analog.com,m:mcoquelin.stm32@gmail.com,m:linux-mediatek@lists.infradead.org,m:ktsai@capellamicro.com,m:pali@kernel.org,m:peda@axentia.se,m:hansg@kernel.org,m:dmitrytorokhov@gmail.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[61];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linaro.org,bp.renesas.com,vger.kernel.org,kernel.org,analog.com,crapouillou.net,gmail.com,samsung.com,lists.infradead.org,metafoo.de,intel.com,bootlin.com,st-md-mailman.stormreply.com,csie.org,baylibre.com,roeck-us.net,castello.eng.br,linux.alibaba.com,iskren.info,suse.com,perex.cz,arm.com,collabora.com,diasemi.com,capellamicro.com,axentia.se];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FC64708BD6

On Wed, 3 Jun 2026 18:20:52 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Sun, 22 Mar 2026 15:24:21 -0700
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> > On Tue, Dec 09, 2025 at 09:25:56AM +0100, Romain Gantois wrote:  
> > > Use namespaced exports for IIO consumer API functions.
> > > 
> > > This will make it easier to manage the IIO export surface. Consumer drivers
> > > will only be provided access to a specific set of functions, thereby
> > > restricting usage of internal IIO functions by other parts of the kernel.
> > > 
> > > This change cannot be split into several parts without breaking
> > > bisectability, thus all of the affected drivers are modified at once.
> > > 
> > > Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-supply
> > > Acked-by: Guenter Roeck <linux@roeck-us.net>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>    
> > 
> > For input:
> > 
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > Thanks.
> >   
> 
> For anyone wondering what happened to this... I forgot to apply this at the
> beginning of the cycle and by the time I remembered we had too much queued up
> so it would have been messy to do an immutable branch.   Anyhow, I plan to
> sort this at start of next cycle.

Immutable branch created as: iio-inkern-namespace-ib based on v7.2-rc1
on https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git

I've merged it into the testing branch of iio.git so if anyone else does
need to merge this to avoid conflicts, perhaps wait a day or two until
I've pushed it out as togreg for linux-next to pick up.

Thanks,

Jonathan
> 
> Jonathan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
