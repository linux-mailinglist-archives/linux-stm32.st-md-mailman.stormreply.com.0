Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IQPCRX3DmoSDwYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 21 May 2026 14:14:13 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B179D5A49D5
	for <lists+linux-stm32@lfdr.de>; Thu, 21 May 2026 14:14:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5941CC8F293;
	Thu, 21 May 2026 12:14:12 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48449C87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 May 2026 12:14:11 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-bd0209f25c1so1022837366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 May 2026 05:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779365650; cv=none;
 d=google.com; s=arc-20240605;
 b=NubiK70ClokPe97DZB4EJM6GCycYaKLbSnFbOt9JSFpFLNoDx/jPoC6aTrQjtAhxML
 G+37MvoIXhR+rrVYLwcDVIXYfxksivIIlKd3oCnrK+7q6HS0MKVaOyZAdSxNuQ+Ay9LR
 7qLmykyh+HnOzKSZ3HLoYlUoolEig7w6h9acBK/yE8uC+H+akV7rr6tRVjL1cJ9rG1Vf
 CUfcNoNjPz4KM1lg6p8UoWtlbiRz72+3yFcbRP/C+aD1o+7alU+CjyHYNCpACKckxrwu
 8Neeo44V9GqMjLNGoCU0n+fpFdm6MK3wbD1c8ZIugGdo5khu8CIYZM0jFtJi8nPLyodA
 MRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:dkim-signature;
 bh=kCAT/FSMB8tJhmNGpR3NQBa4aJk54FUzKfLnS0Vjt6c=;
 fh=CJZLlMWYhY4Ju28qRYRBwaUP1uY+Ojd8+EUZOlLpuyw=;
 b=d8+C4BImnUY8rpGGGY07Z+m1gbZjienwcrnq2KsvSUlC7B1PZ9WxH6h+rC6ujeCRMe
 dF3J1iZCWhFHQeAykFcMmN/YCoqxjti6NpdsFZ4uYjh60sUzM9ac8aT36ORSCJ2QhKjE
 1t6uC4meC25VXyybkBQzWoNG9PNwiKbrVqo7swYq1WSeNxQfEYyEJuAbYKSCxSL4JtCI
 3BXJtZ8bu/w+AFtGBQalx7bBTjvVd+7ezSY8X6yiN2+MSIDPI71po80DBq7GWV+zy4GB
 fpLpwhsFbuYJr8oVWmAx7treSqHDkHazSKM4ACBfFVAQW2QJTcIjo49nYADx0w+CASZW
 +6fQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779365650; x=1779970450;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kCAT/FSMB8tJhmNGpR3NQBa4aJk54FUzKfLnS0Vjt6c=;
 b=fvGCFK3glm+PckI2mFRslND+nzZlJSkAqynJzNPAEaN2eELKycFF0Rkre/i6sQ0EN7
 xboXrGWFLlTSvC6RReal1b8N/x5Vk4Jddn8ybr6/JZY0jRnA7V5Xxb8i7+UuMLDi+Uk4
 lL2cNbfLTvPQ7L9n5OKKrB+Gqyek6F9K8BZW2CLwO7CM1TwFZGAhlOQpl1F/mapkqwPb
 kIbRHPOP8N0eDo7jGjBI37LcptZ1Emc9OEArfWEHP6Vm0E7J7sET2zqmu6e3cDWmmQth
 tJyf0Mv7+c5CUE/JfnuV+4+eQA0+JrPFYwd/E8akJU/9BfwydNxp29VEQGMSbKYvjsHb
 3alQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779365650; x=1779970450;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kCAT/FSMB8tJhmNGpR3NQBa4aJk54FUzKfLnS0Vjt6c=;
 b=p4jDh7eUGp0x0iSq//e2x3m8Hl9r+65ZWtSftSa74gY8x81lUWqkuERkOKZ3dt9F3I
 zZk/xCEI1PPI7+18EOr2n5xCHsZOdKNIm1+YzNJgTq7y+2XZ20LlNTYzjH8Uq257vUVD
 2GDQPmP/xh19Cbu4J8AQB6avSsj+S6MRJMbHfPBhAHO7EA/OThjs5uyY8iqEf+vp3lHo
 Du+Jy/RmAAx9gRXQOjLRy9ImxRQRwglBOSLS/TalOvDqeJ+XotPWMOhX203SUX7BXUfE
 z9Db7kbkkYKJLOYX6284MHA1AnAxnPognYC2KnsJ401tKB6yItX+BmbmyO4r17Wsfx2a
 OJhA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Fsp7JvX8Mw2upu5SfpIQjIFFPS8WjJzBlVI9r+e7mzap1vKEtiovIauW/gs1q0KLidN8HGUBuy15EQQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1cwI63C2TAHP95FpRiAtkeIKtKMpC+2t4cPec7iS5+QdKkhHW
 vlmPd4QB4TwN2CwcTSu/Uuod/mUfCln/x8bnaz5j3PgVLa8HD/TUJMkJwB+6tXYk7l8o0Lp/x6i
 Z6PXvFcNPeILJhhSTrJ3geLa4OoAMgvgoH6EzjWbvsw==
X-Gm-Gg: Acq92OHJPTs8G38VSgaOPalQfGTwOr8Gy3WdBW+MD4yNOyywHPc+NVG4SeOruDgLs14
 ER4GkYBA9id0oSYxpiG44fxV0N4+Z9Lrer5MO9mzuTKX83LxW4Xu34K/TLhRwtjWuru6Wtkqp0A
 EfbxcejGCmpIiNijpYmGE0Q5UtcghPtO4ohVn1d/FyelW6Q/WWosXdXYBVvfkOJywicFLq43kMO
 5MtCFiheicXKM3/0p9lKNv+ryJZsqcVqV5/iuKRV3C7l3MX/z/K3N9B0V59clP6PGkeOodRKBBB
 bvRJ41xl+1OQl7bzQ4QroUga+418fDU8wHZb
X-Received: by 2002:a17:907:6d27:b0:bd2:e940:db38 with SMTP id
 a640c23a62f3a-bdc17d23987mr141007766b.28.1779365650245; Thu, 21 May 2026
 05:14:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 05:14:07 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 05:14:07 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Angelo Dureghello <adureghello@baylibre.com>,
 Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
 <agTe7vZ94DnmD4Ed@ashevche-desk.local>
MIME-Version: 1.0
In-Reply-To: <agTe7vZ94DnmD4Ed@ashevche-desk.local>
Date: Thu, 21 May 2026 05:14:07 -0700
X-Gm-Features: AVHnY4KQ9snIXNmFVw7beAhQpkjp4lsWxF_SmKnG6LJVzoen_-CkRZHjCww1Cio
Message-ID: <CALSJ-wBbjwrhTEpfKm-JHox7-E1YRQ=kTj1JN+KyiucTTu7c3A@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 11/11] iio: dac: add mcf54415 DAC
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
X-Spamd-Result: default: False [4.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,uclinux.org];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: B179D5A49D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy,

just few points below, the rest has been fixed:

On Wed, May 13, 2026 at 11:28:30PM +0300, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 11:14:35AM +0200, Angelo Dureghello wrote:
> >
> > Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
> > DAC configuration registers are mapped in the internal IO address space.
> >
> > The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> > analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> > consists of a conversion unit, an output amplifier, and the associated
> > digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> > are respectively 0 and 0xfff, left untouched in this initial version.
> >
> > This initial version of the driver is minimalistic, "output raw" only, to
> > be extended in the future. DMA and external sync are disabled, default mode
> > is high speed, default format is right-justified 12bit on 16bit word.
>
> ...
>
> > +#include <linux/array_size.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/compiler_types.h>
> > +#include <linux/delay.h>
>
> + err.h
>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
>
> ...
>
> > +struct mcf54415_dac {
> > +	struct clk *clk;
> > +	struct regmap *map;
>
> I believe that regmap pointer is used more often, can you check with
> bloat-o-meter that swapping these two (by the order) gives any benefit in
> object size?
>

checking size in ColdFire arch with last kernel.org gcc had no benefit,
anyway put regmap before

> > +};
>
> ...
>
> > +	.max_register = 0x1F,
>
> No definition? What datasheet says about this? Perhaps define the MAX as per
> last defined register in the datasheet?
>
> > +};
>
> ...
>
> > +static void mcf54415_dac_init(struct mcf54415_dac *info)
> > +{
> > +	/* Keeping defaults and enable DAC (bit 0 set to 0) */
> > +	regmap_write(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_FILT |
> > +		     FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1));
>
> Seems the whole driver ignores IO errors, why?
>
> > +	/* DAC is ready after 12us, from RM table 40-3  */
> > +	fsleep(12);
> > +}
>
> ...
>
> > +static void mcf54415_dac_exit(void *data)
> > +{
> > +	struct mcf54415_dac *info = data;
> > +
> > +	regmap_update_bits(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_PDN,
> > +			   MCF54415_DAC_CR_PDN);
>
> regmap_set_bits()
>
> > +}
>
> ...
>
> > +static int mcf54415_write_raw(struct iio_dev *indio_dev,
> > +			      struct iio_chan_spec const *chan,
> > +			      int val, int val2, long mask)
> > +{
> > +	struct mcf54415_dac *info = iio_priv(indio_dev);
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		if (val < 0 || val > 4095)
>
> Do we have a definition for the resolution? I'm fine with the plain numbers,
> but it's better to add a short comment to say that this is "based on the
> resolution of XXX register per datasheet".
>
> > +			return -EINVAL;
> > +		regmap_write(info->map, MCF54415_DAC_DATA, val);
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
>
> ...
>
> > +static int mcf54415_dac_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct iio_dev *indio_dev;
> > +	struct mcf54415_dac *info;
> > +	void __iomem *regs;
> > +	int ret;
> > +
> > +	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
> > +	if (!indio_dev)
> > +		return -ENOMEM;
> > +
> > +	info = iio_priv(indio_dev);
> > +
> > +	regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(regs))
> > +		return dev_err_probe(dev, PTR_ERR(regs),
> > +				     "failed to get io regs\n");
>
> One line.
>

i decided to stay inside 80 in all the file, is it ok ?

> > +
> > +	info->map = devm_regmap_init_mmio(dev, regs,
> > +					  &mcf54415_dac_regmap_config);
> > +	if (IS_ERR(info->map))
> > +		return PTR_ERR(info->map);
> > +
> > +	info->clk = devm_clk_get_enabled(dev, "dac");
> > +	if (IS_ERR(info->clk))
> > +		return dev_err_probe(dev, PTR_ERR(info->clk),
> > +				     "failed getting clock\n");
>
> Also can be a single line, but this one a bit longer than above, gives
> 88 characters.

same as above

>
> > +	platform_set_drvdata(pdev, indio_dev);
> > +
> > +	indio_dev->name = "mcf54415";
> > +	indio_dev->info = &mcf54415_dac_iio_info;
> > +	indio_dev->modes = INDIO_DIRECT_MODE;
> > +	indio_dev->channels = mcf54415_dac_iio_channels;
> > +	indio_dev->num_channels = ARRAY_SIZE(mcf54415_dac_iio_channels);
> > +
> > +	mcf54415_dac_init(info);
> > +
> > +	ret = devm_add_action_or_reset(dev, mcf54415_dac_exit, info);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return devm_iio_device_register(dev, indio_dev);
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Regards,
angelo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
