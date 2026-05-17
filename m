Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJX1HnMtCmqUxQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 23:04:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA35563E96
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 23:04:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 279DEC87EDD;
	Sun, 17 May 2026 21:04:50 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 178A3C87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 21:04:49 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-bcc2b199c17so209451466b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 14:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779051888; cv=none;
 d=google.com; s=arc-20240605;
 b=T8iydu/L6HxIMWBMz7kGVdCUEAHFlvm5vN34WZ9AKzRXMAAT3mqgIWMFLBq7Kx6NAG
 ILf7u3mP77hPD5Oko/6uCDKcX4GuvcTDpG8ZyWKXhAtgHy6gJP7+3v51nzkWREC9mAl9
 uE2HhAiBzVewZXOcLeqT5u+YteepoeAbo3+XkPTprJG3caOHLBJw9Q7p0LWp1fyxVMdW
 H6SFCVeKsHnzGCHkepB3s6MCLcsBr2hN7qdfkEfNqKJktco6RXirj05kOpPzI6kZRxvs
 zi57ZL+DUSomkTRGYpWxjWASBGQ/qpihkPiljr5nXdoH1KD6gO3rWMtpYribDFnbqDO5
 YLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
 :references:esfrom:mail-followup-to:dkim-signature;
 bh=hDbYh8nveG6AJ4qGTnJ5WMHjZoY6FKTJ3XlYsYDU5zY=;
 fh=cVZSd6W/9VkGANDo+P+n2o7oF4jmyKEImcylYzOw3LI=;
 b=YuyuKlM5m2mu5MXOKiKhTzzVCpceyZCWwIIeyIJNOo1KnZuGFLW8VXIW6Zwc8O0Xd/
 R6dDHWKVIopifaXAsVv8PCKhvJXPJ6k5TOjTKff/YrCiHD3TzU/pw55fUAhFOKEyaDUW
 ue7Pw+XJ/wYJVGOrDOhg3K2JEr1fc+hTNczUrE0NvNDUFE9Q2Wl/yKcs8RBKPBEFxff8
 gnh51bMQaElB7Ji+1n7/2n+Ihnjut524D9QREN9oaCrcFXsK+XmXZTtG9VbyC80xYCZ7
 5JsbqMj+eiCj+Qr9axJqJBQx7MilNPvcYsoEJegbk5vDKEDLgllH7ut24eXD8JHSPVCs
 /xoQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779051888; x=1779656688;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
 :references:esfrom:mail-followup-to:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDbYh8nveG6AJ4qGTnJ5WMHjZoY6FKTJ3XlYsYDU5zY=;
 b=Q1nOEdpJwH6UJlPTqSbEGwCB8MFK8LBThR/FWvo6v83GUyb4ikbH+Ou5ULs/WOpSmY
 MvqHxjUNlN8Rau0HFKnhCXPStrRKHmq9TiXGnSvsIPmaiMV7CtC5D6b4XFZaVutlCApq
 jFFRH/72o4r83bPtwM6N7mFZNWakQv0AjNet5qK6nwcIPpnkBmWi648UmIMZLxpmou/m
 l3nyUHZCh/WIwhG/1F/dYtDATcXicuUVUFWsdsAWj59cnlyRdZR8gY8R2RxZrs4xVbsE
 wLQ6IzIqLBVzpS9MugKPXgYGy7zfltjt/HnydIC24t19ByVoO6uqdVGKZmQLkG8QgYll
 uCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779051888; x=1779656688;
 h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
 :references:esfrom:mail-followup-to:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hDbYh8nveG6AJ4qGTnJ5WMHjZoY6FKTJ3XlYsYDU5zY=;
 b=LNkSe2PBYqOirUSozCNcZuF6vciqMd91mYRY3FEEwkods9POmKZe0QZYPfhppB159H
 FI7XjabOYPAbxc4TfoAI5KnkAqBE32VMIcq4gvt/MM6qnWagNYKZCqK976OSRWmvslIv
 5TK3ie/BwXcps2XUQZ0YFALoeNWpy/Z/4YJC3OpiScaiRIus766pLcXo+6SORH4TJLkq
 8mpOIXy/fEYqUEpqs9dMbQ8JRzbYSbG29lPJ7oQWvPGRlLOK/9XXxaroEadrq4oNHHnp
 GlQyqQHTy5PfBkAsJG3uF4Aj7lR5zjt4NHWNtX5u8mW1W8mCxZbo5bS/NOS9wG7fcOTT
 uCZQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8OqJLv1vL6AfnC5jnarqThTVbTMvuB/xUiOvpmosi6gU+cRSVBLccKX54HF6nzdpZupQyt+jjRHdTPbw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyfDxsrqQWLGYanE4EcWfFa6MooAR1uLQefWSsgzoSEsOeIE9J8
 V0IQyMzaGb657IFrmlUqdpZgsnI+UsK4ii1bLRXWTJklNFnCPF4r+8TQLTiO/2ccJ0xlnjEE7ir
 QUMHH+HW+SvIrE4KA96LE8gFr9dmcBONI6P46s2zCEg==
X-Gm-Gg: Acq92OGfRVMwWCPtFaaeHAUZ91ZHymyH4Zx78pW7Aw8I3Uwb8TBm181ViZfM/ZgfTDE
 qura2qJwMKMFExrE3iQJFQjB0NFPpO+dZfWKVsmP29wcgySb7lYj85FiQzYZgiyJAhN/U1qtDHO
 u1EbKJtGJtCHI69DRleJVyoDlKaDSGOGEpDckIQait8hjNH6VtAuQi0VGm5T9+XWmBY+Ni0WYx0
 ay53t3UxuvFbKmwj8YaulJRW1n+kwFkcnYzxsA3syJF7ZeHKXObqThcQCmNwYO77AP0xuxY9vSS
 vog93muxvpH0A12IBdvo12X2WCCNVMDuvb8E
X-Received: by 2002:a17:907:e143:b0:bbf:74d7:1c4a with SMTP id
 a640c23a62f3a-bd51797a62amr374507666b.40.1779051888479; Sun, 17 May 2026
 14:04:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 14:04:46 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 14:04:46 -0700
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
esFrom: angelo@archlinux
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
 <agTe7vZ94DnmD4Ed@ashevche-desk.local>
MIME-Version: 1.0
In-Reply-To: <agTe7vZ94DnmD4Ed@ashevche-desk.local>
From: Angelo Dureghello <adureghello@baylibre.com>
Date: Sun, 17 May 2026 14:04:46 -0700
X-Gm-Features: AVHnY4LhOGXoyOJyplIGodv_eunK_4nruqdQdyOYVyqkdOdxsDpZTI4SCFL0VTw
Message-ID: <CALSJ-wB4=fTTTExQf2pdoQVz7v5NjaaYQgwGwE+qoZNb6uzAqA@mail.gmail.com>
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
X-Rspamd-Queue-Id: 0DA35563E96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,uclinux.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.895];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

H Andy,

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

Thanks, will look into all the above, together with sashiko, and issue
a v3 in short.

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
