Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E39NcZjHGopNgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 18:37:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061B617251
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 18:37:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA2F3C8F29C;
	Sun, 31 May 2026 16:37:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5C83C8F296
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 16:37:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C4DA438B4;
 Sun, 31 May 2026 16:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB461F00893;
 Sun, 31 May 2026 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780245443;
 bh=8dPW62n88YQXm3Z36nWQvCD7sx0nKMwKDYpNZjRfzAg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=KMWtajpBY0KRKAKVL+H/b4P+QmKnJzbK8NIAENgKdrv84uTTuuCoONUfMnivH38F7
 GdjUn2ym94LkI4H7IV2bgIIHxjT080IJjKKqqx/Y1wSbYllh5PTPOUJQwGoF7cIZNh
 02cJgw/QcMM3M4jjqJG9U6DSHhsEfhZmM6hRCPDmssTTXvG1q9MiUMScF58txE+/0I
 2fxUNYHaZyrTkdJYFMYYzbmk/W9a9sDZchwGcbbfxI3XK68KekzMcgLyHMIXaaPdw0
 IUwfqdVW3JZVxPJ0hD5NAGxjB3Uc8c7R0ND9PbBnzlxCxwd1BuWHAaglUvmsI1CjkE
 EMBBTUFzNwJjA==
Date: Sun, 31 May 2026 17:37:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Message-ID: <20260531173712.4295981a@jic23-huawei>
In-Reply-To: <20260531-wip-stmark2-dac-v4-11-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
 <20260531-wip-stmark2-dac-v4-11-7e65ab4215dd@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 11/11] iio: dac: add mcf54415 DAC
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:adureghello@baylibre.com,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,gmail.com,uclinux.org,baylibre.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.956];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 7061B617251
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 31 May 2026 17:26:04 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
> DAC configuration registers are mapped in the internal IO address space.
> 
> The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> consists of a conversion unit, an output amplifier, and the associated
> digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> are respectively 0 and 0xfff, left untouched in this initial version.
> 
> This initial version of the driver is minimalistic, "output raw" only, to
> be extended in the future. DMA and external sync are disabled, default mode
> is high speed, default format is right-justified 12bit on 16bit word.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
https://sashiko.dev/#/patchset/20260531-wip-stmark2-dac-v4-0-7e65ab4215dd%40baylibre.com
Has some comments.

My assumption is the DAC registers are not going to be wiped out by
reset, so that one is wrong.

For the others they are the fun question of what do we do if resume()
fails and leaves the device effectively disabled.  I'm not that bothered
if the answer is everything fails.

So just really minor stuff inline.  

> ---
> Changes in v2:
> - remove tests from commit message, moved to patch 0
> - remove additional blank lines
> - remove dead code and unused definitions
> - use regmap
> - add limit check on raw write
> - non functional style fixes
> - add COMPILE_TEST to Kconfig
> Changes in v3:
> - add comments where needed
> - code style changes
> - remove unneeded variables
> - use regmap_set_bits where possible
> - remove macro not needed to define a single channel
> - set up regmap to big_endian accesses for next patches that will come,
>   that will adjust ColdFire readx/writex as standard LE (links in 0/x).
> - add return value check on regmap calls
> - sashiko: remove unneeded .io_port from regmap init.
> - sashiko: add select REGMAP_MMIO in Kconfig
> Changes in v4:
> - remove unused includes
> - sashiko: return "ret" as regmap_read ret value in case of error
> - sashiko: using u32 as regmap_read value
> - use local variable in mcf54415_dac_init() for better readability
> - sashiko: check mcf54415_dac_init return value also in resume()

> diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_dac.c
> new file mode 100644
> index 000000000000..474a2c327fcd
> --- /dev/null
> +++ b/drivers/iio/dac/mcf54415_dac.c

> +
> +static int mcf54415_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +	int ret;
> +	u32 reg;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret = regmap_read(info->map, MCF54415_DAC_DATA, &reg);
> +		if (ret)
> +			return ret;
> +		*val = (int)reg & 0xfff;

Given it's unsigned and the masking means it will fit, I don't see an
obvious reason for needing the cast. Compiler should be able to tell it
can always safely assign this.  Maybe GENMASK(11, 0) would be slightly
nicer than 0xfff but up to you as 3 fs isn't easy to count ;)

> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SCALE:
> +		/* Reference voltage as per ColdFire datasheet is 3.3V */
> +		*val = 3300 /* mV */;
> +		*val2 = 12;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	default:
> +		return -EINVAL;
> +	}
> +}

> +
> +static int mcf54415_dac_suspend(struct device *dev)
> +{
> +	struct mcf54415_dac *info = iio_priv(dev_get_drvdata(dev));
> +
> +	mcf54415_dac_exit(info);
> +	clk_disable_unprepare(info->clk);
> +
> +	return 0;
> +}
> +
> +static int mcf54415_dac_resume(struct device *dev)
> +{
> +	struct mcf54415_dac *info = iio_priv(dev_get_drvdata(dev));
> +	int ret;
> +
> +	ret = clk_prepare_enable(info->clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = mcf54415_dac_init(info);
> +	if (ret) {

Generally we aim for side effect free failure, so I think I agree
with sashiko that you should be turning off the clk again here.
Any failure in here should leave device suspended.  That then leaves
us with a dead clock and the shut down path may still try to access
the device. 

Anyhow, I'd add the clk_disable_unprepare() call here for consistency
even though it doesn't really help us with carrying on.

> +		dev_err(dev, "could not resume device\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops,
> +				mcf54415_dac_suspend, mcf54415_dac_resume);
> +
> +static struct platform_driver mcf54415_dac_driver = {
> +	.probe = mcf54415_dac_probe,
> +	.driver = {
> +		.name = "mcf54415_dac",
> +		.pm = pm_sleep_ptr(&mcf54415_dac_pm_ops),
> +	},
> +};
> +module_platform_driver(mcf54415_dac_driver);
> +
> +MODULE_AUTHOR("Angelo Dureghello <angelo@kernel-space.org>");
> +MODULE_DESCRIPTION("NXP MCF54415 DAC driver");
> +MODULE_LICENSE("GPL");
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
