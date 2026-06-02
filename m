Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI/9Lc2kHmq3IwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 11:39:25 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB9E62BB29
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 11:39:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1562DC8F271;
	Tue,  2 Jun 2026 09:39:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11444C57A50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2026 09:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780393164; x=1811929164;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5oC8ksAHTf+xBVKyW06yVS5MRSz5ZtAoCm0qkxSJeZQ=;
 b=cMZzgW4fLgenczWyNLm1XfXbyGzViZl73dbE1Ycd5CBXPwlsl7JEyb1W
 XZyyO52wYFP1p7WjaDV2IYkYCSJ6aqbh0gzA9VpZkThFuqJGB1jepvZTw
 hYgzGWGXkcqqxETCjlisMP6lkuurdHpnlJzfWiHuV/mrGpgVNfhgUKk2g
 YeziXhtH4XoScsNzPvv43yYfeGsuPk8hrdYdyUrp1dy6P6MwbDJo9odGo
 AbdQ63fXOFphINAXWk+DvV7Ma5JPWqGR6jwvodo9zUqKJnSa37n7V8NVc
 DhgUiTXicbJzhZ5WXu9h2y40NdiygKX4QRIoznPmtLcKmjq+0hiqKKPMx w==;
X-CSE-ConnectionGUID: fLBM2zMsRYGp5JDMZA7wyg==
X-CSE-MsgGUID: inqG/tPsSbWA0B5Koth7eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="84797703"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="84797703"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 02:39:22 -0700
X-CSE-ConnectionGUID: gSzDEjBvT1axWlMMHfCJ4A==
X-CSE-MsgGUID: N47fI6AOTuSPh76YjMJXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="267722861"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 02:39:18 -0700
Date: Tue, 2 Jun 2026 12:39:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Message-ID: <ah6kw-oTM9jgkWBL@ashevche-desk.local>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
 <20260531-wip-stmark2-dac-v4-11-7e65ab4215dd@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260531-wip-stmark2-dac-v4-11-7e65ab4215dd@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Steven King <sfking@fdwdc.com>, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Cameron <jic23@kernel.org>
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
X-Rspamd-Queue-Id: 5FB9E62BB29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:adureghello@baylibre.com,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,uclinux.org,baylibre.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,ashevche-desk.local:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Sun, May 31, 2026 at 05:26:04PM +0200, Angelo Dureghello wrote:

> Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and

CPU

(or maybe you wanted use 'SoC' acronym)

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

Be consistent: 12-bit on 16-bit

...

> Changes in v4:
> - remove unused includes
> - sashiko: return "ret" as regmap_read ret value in case of error

> - sashiko: using u32 as regmap_read value

Why? regmap API uses 'unsigned int'. Then you can take out any bits, fields,
et cetera from it into fixed-width type of variables.

> - use local variable in mcf54415_dac_init() for better readability
> - sashiko: check mcf54415_dac_init return value also in resume()

...

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>

> +#include <linux/compiler_types.h>

Drop this (see below).

> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

+ types.h (it also guarantees compile_types.h).

...

> +static int mcf54415_dac_init(struct mcf54415_dac *info)
> +{
> +	int ret;
> +	u16 val = MCF54415_DAC_CR_FILT | FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);

Can we move towards reversed xmas tree order?

	u16 val = MCF54415_DAC_CR_FILT | FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);
	int ret;

> +	/* Fixed defaults and enable DAC (bit 0 set to 0) */
> +	ret = regmap_write(info->map, MCF54415_DAC_CR, val);
> +	if (ret)
> +		return ret;
> +
> +	/* DAC is ready after 12us, from RM table 40-3  */
> +	fsleep(12);
> +
> +	return 0;
> +}

...

> +static int mcf54415_write_raw(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan,
> +			      int val, int val2, long mask)
> +{
> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		/* Check based on RM 30.3.2 (DACn_DATA) reg. resolution */
> +		if (val < 0 || val > 4095)
> +			return -EINVAL;
> +		return regmap_write(info->map, MCF54415_DAC_DATA, val);

So, for example, -1 will be written as 0xffffffff (with the respective bits
taken into account). Is it a problem?

> +	default:
> +		return -EINVAL;
> +	}
> +}

...

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
> +		return dev_err_probe(dev, PTR_ERR(regs),
> +				     "failed to get io regs\n");

One line. It's more than decade that checkpatch stopped complaining on
the trailing string literals.

> +	info->map = devm_regmap_init_mmio(dev, regs,
> +					  &mcf54415_dac_regmap_config);

One line (yes, 82 characters).

> +	if (IS_ERR(info->map))
> +		return PTR_ERR(info->map);
> +
> +	info->clk = devm_clk_get_enabled(dev, "dac");
> +	if (IS_ERR(info->clk))
> +		return dev_err_probe(dev, PTR_ERR(info->clk),
> +				     "failed getting clock\n");

Also one line.

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

...

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
> +		return ret;
> +	}
> +
> +	return 0;

> +

Besides stray blank line the above can be

	ret = mcf54415_dac_init(info);
	if (ret)
		dev_err(dev, "could not resume device\n");

	return ret;

> +}

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
