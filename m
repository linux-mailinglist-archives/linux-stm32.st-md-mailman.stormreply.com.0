Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KyonBHGSKmqhsgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 12:48:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA32670FA6
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 12:48:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=gp8xOUoJ;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 437A3C46D45;
	Thu, 11 Jun 2026 10:48:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65A0BC424DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 10:48:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2A87E44195;
 Thu, 11 Jun 2026 10:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FB01F00893;
 Thu, 11 Jun 2026 10:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781174893;
 bh=crmNupD7hZaxlPv3WiFM5BGDGkQfFm+0iK/KcjZ0EVc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=gp8xOUoJw7DR55PdOTHPoduThWtKOCaI4yUYsuybdRvLig8x4hic9KEcJFBkqLYy3
 eTqqGarae18Vwav/snfztbmDhU+Cxr5i6UTyDs6R0xuYfQbUwVBsV7IX1xxdAxXAf2
 mfLjqBhyZz4AwS5Stq/9XCHGyHYfsDf5rVGsjrGGASuzlBm4BDyswgtZasxxYty/l7
 tFq7XC72F/SS63YJqo7dvJb2GPSkHvpCAVa8f9w91cKaQ4ekZ/NfQ83hkuS2TxXhA+
 OYFqceyOb0vPJsGcu8i/mz0xDWEZZUJNxgMq3CQmV0kf7BUGpFwqmrDN4lN1o6OB2A
 MFl2vU6TPSBlQ==
Date: Thu, 11 Jun 2026 11:48:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Message-ID: <20260611114800.009d9797@jic23-huawei>
In-Reply-To: <20260610-wip-stmark2-dac-v5-9-b76b83366d5c@baylibre.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
 <20260610-wip-stmark2-dac-v5-9-b76b83366d5c@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Brian Masney <bmasney@redhat.com>,
 Steven King <sfking@fdwdc.com>, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 09/10] iio: dac: add mcf54415 DAC
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:adureghello@baylibre.com,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mturquette@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:bmasney@redhat.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:sboyd@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,baylibre.com,st-md-mailman.stormreply.com,analog.com,redhat.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,gmail.com,uclinux.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,jic23-huawei:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DA32670FA6

On Wed, 10 Jun 2026 22:35:14 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add basic version of mcf54415 DAC driver. DAC is embedded in the SoC and
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
> is high speed, default format is right-justified 12-bit on 16-bit word.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
I'm lazy so didn't check earlier versions but assume the two bits
of feedback from Sashiko are false positives:
https://sashiko.dev/#/patchset/20260610-wip-stmark2-dac-v5-0-b76b83366d5c%40baylibre.com

The one about clock underflow if resume fails, and then devm cleanup happens later
is a bit nasty.

I did a bit of digging and maybe it is better to just leave the clock on?
The status dev.power.is_suspended is set to false whether or not resume succeeded
and I believe a following suspend will not take into account that resume failed.

I'm not set up to poke the combinations but it might be worth trying that.
+CC common clk people who may immediately know what the right answer is.

Otherwise just a few minor style comments inline.

Thanks,

Jonathan

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
> Changes in v5:
> - commit syntax fixes
> - minor code style fixes
> - use include <linux/type.h>
> - removed unneeded cast
> - disable clock in case of DAC init error
> - use unsigned int for regmap_read and GENMASK for masking 12 bits
> - add id table to match "mcfdac" platform device name
> ---
>  drivers/iio/dac/Kconfig        |  11 +++
>  drivers/iio/dac/Makefile       |   1 +
>  drivers/iio/dac/mcf54415_dac.c | 216 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 228 insertions(+)
> 
> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index cd4870b65415..b1a578076188 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -516,6 +516,17 @@ config MAX5821
>  	  Say yes here to build support for Maxim MAX5821
>  	  10 bits DAC.
>  
> +config MCF54415_DAC
> +	tristate "NXP MCF54415 DAC driver"
> +	depends on M5441x || COMPILE_TEST
> +	select REGMAP_MMIO
> +	help
> +	  Say yes here to build support for NXP MCF54415
> +	  12bit DAC.

Rewrap this.

> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called mcf54415_dac.
> +
> diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_dac.c
> new file mode 100644
> index 000000000000..f223aa80aabf
> --- /dev/null
> +++ b/drivers/iio/dac/mcf54415_dac.c

> +
> +static int mcf54415_dac_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct iio_dev *indio_dev;
> +	struct mcf54415_dac *info;
> +	void __iomem *regs;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	info = iio_priv(indio_dev);
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return dev_err_probe(dev, PTR_ERR(regs), "failed to get io regs\n");
> +
> +	info->map = devm_regmap_init_mmio(dev, regs, &mcf54415_dac_regmap_config);
> +	if (IS_ERR(info->map))
> +		return PTR_ERR(info->map);
> +
> +	info->clk = devm_clk_get_enabled(dev, "dac");
> +	if (IS_ERR(info->clk))
> +		return dev_err_probe(dev, PTR_ERR(info->clk), "failed getting clock\n");
> +
> +	platform_set_drvdata(pdev, indio_dev);
> +
> +	indio_dev->name = "mcf54415";
> +	indio_dev->info = &mcf54415_dac_iio_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = &mcf54415_dac_iio_channel;
> +	indio_dev->num_channels = 1;
> +
> +	ret = mcf54415_dac_init(info);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev, mcf54415_dac_exit, info);
> +	if (ret)
> +		return ret;
> +
> +	return devm_iio_device_register(dev, indio_dev);
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
> +		dev_err(dev, "could not resume device\n");
> +		clk_disable_unprepare(info->clk);
> +	}
> +
> +	return ret;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops,
> +				mcf54415_dac_suspend, mcf54415_dac_resume);
> +
> +static const struct platform_device_id mcf54415_dac_ids[] = {
> +	{ .name = "mcfdac", .driver_data = 0 },

Don't set .driver_data if you aren't using it.  Given very strong
preference for always using a pointer for that (rather than a numeric
value) this line will change if you ever add support for more devices
anyway, so no value in having that there now.

> +	{ }, /* sentinel */
	{ }

No comma and I don't see value in the sentinel marking given that is
fairly obvious.

> +};
> +
No blank line here.  Intent is to keep the macro and the function closely
coupled.

> +MODULE_DEVICE_TABLE(platform, mcf54415_dac_ids);


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
