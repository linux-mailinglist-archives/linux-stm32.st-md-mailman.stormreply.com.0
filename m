Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHqRHOIPFmojhQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 23:25:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4325DCAE1
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 23:25:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1683DC5A4C5;
	Tue, 26 May 2026 21:25:53 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47F59C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 21:25:52 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-bcc9fdc959cso1947134066b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 14:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779830751; cv=none;
 d=google.com; s=arc-20240605;
 b=eNq/Azq0GicrO6X5QfKjqhCAYdzt18lLIf3QYkFAt6rqEaSAz28kSMrFt6Com3dHtE
 ecSV7WFb0qjgEladGVe8c1b4Olmi+9PYf3mpCNmcrlDLFc4huFTx4SOvbk63n8+fSCYB
 alxskv2Y7Zx868GH+SkewhX3oEUu1XJKUX22mA9HzphdCT8dljXDhbjUKyviOu5wZmPb
 gBn/08rD9lmVY+z7D5JnbQ8Cf+4J9UX09zBKNl5mNUbTnslerdfeNauzmQPQ6aQTaX1N
 lwygUiBKQ2ob9/SCXXQy7mvHWz+Ttyl+NAD/rtsCGxmaicsumMJLNtqLW9wnbMv+yh54
 v2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:dkim-signature;
 bh=dn3CDjIt2vIiMqs+R+BPuA4q7fB48nnalDkVYsI1XXk=;
 fh=8Nl89vso5qSZVPi6MT697YdB1wGFlmbjM3PDfK/ciu8=;
 b=ZGugJnwb/sfPLiFtOTQ4mhVdm/wC1vGD4HRapsZrcJATQ4XeXFBxJZJDV/qdtL5KGR
 vvFwXjqwEO9+XAqepJ4s2tInupXbJmJdi0neUTEKQ1UlFAyg6kip7vckExHSWc4/rCWZ
 feHqUxt8Og+jMtzLklUi0QY1dCRhYRkbu1QEBjVXpQduHLwMuQsk9BYu8mcVrhsECGDu
 3sETx+LXoKtQVBonj0C0mzlUPbtT6wqMmxBytJbDtpwk7HAXgsIwWlUNLYwIF6W2QuI7
 BaQ/Hm9PRID91fZlWlP+3bHd2Jvhj7U6zHiVR6wO3rjV9ewKUYcSMZ8nCgjqh6GLAU8a
 Mm6A==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779830751; x=1780435551;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dn3CDjIt2vIiMqs+R+BPuA4q7fB48nnalDkVYsI1XXk=;
 b=HAaZjRV7eEdW0tyXD5EgSoilpk3xKWLT/QKzugS+h3+yMmbgt9d0adSGaeUc/yhwl/
 iJlknnqTL77IWOXG+Wy5JwAbplwXiOezsBpP++E4r0jEDUpgC2KochazuRwRdoeOE7Uo
 +AaXaiABjEuDFKrob4VBQPHetSIb0Shyj71DSLOIZlvBSJmtQmvKGkBbBo4IO4WCxINc
 Fzo64iX0oHxGnDbnHySEGius32BUBlLziW7h5UJgorGINWNZQ9bHQ7h/IBEuhqNFGEts
 07aP0ZdkMm+YDhHaX1ixSVnmVC60JKCWJ5PoSYUys/czhnlqYTa2WkKkRwhAYoXifoeV
 ejSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779830751; x=1780435551;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dn3CDjIt2vIiMqs+R+BPuA4q7fB48nnalDkVYsI1XXk=;
 b=lyaMDHYPxPewvNq21bYpE6Aacsskihi8H0c7jfi34a2DmVqI/IropeOwb0Ky5DjGkJ
 XJ577zy1MLCSOIinIB1fKlRNDCAOQgEBc3P/sdULhv1yWOTXTLaWw4NIVaAwmq1oP+Pn
 pOXnHd0S8q2kSlSJg28aLfoGpcIfd7JY2PVEvREQOi2vDOcAzgO9DIym6am7RCkQbfZy
 JymCT6edUBV5fQiuVvBG4e/um69TB+6Lkm8mlkE+Q+klbkrkYg8t8DTVTZX9ILBFG/WL
 VtQqMCbr3u/rAeDMkb9XsYVDBTdSmRGX/hW7nqMKaUTh66vkSo51snMiRkWmR3I4u5nH
 Q1wQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9/4TOjYwFgIFRHDkYI2sRv7AJfpK+Wy+Sv5Tgmirw19YbJ+NStOzq4ThOIVj/Ff8eDLtqFNqksYCjMYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxpLKS3sDADe5cwAgRGL+3kvoFIglDYnVN8Tyc1E8yetylsUWP+
 XOE+k33GZSDPj6RUU7G5vBcYDvERYdMpRWHeqRE8oktAbfhivozY6990AtDUWDMBPA57fGFEddV
 L5BkIUtOjbSFvTpnOVd/ARxxoUxMRHk5/yuhpPeZzfQ==
X-Gm-Gg: Acq92OGo+TAOj6JHHEZ7ExzMz8yjb/3a9o7Y9+t0ZurY7gxB2JADO79rh69UqieYwU8
 dJUNwQfSF1NlzKDdpaEs10Q2uFB8IINFaeNbIX7Vu+TWtrIlaibK9T4Qe4AelmuCgH106mrmlhe
 KcB+/FMVuKjieCri3sNduxVCteccj/fgIk35lYU+jdHTfnHv8KMPjkygs17xWp3ZmI3JldscZ/n
 gQU0947vo0eySdSN52GkSLzmiq8sxlnBRBZxilR0S6+eeQq8zVJokcesBcXXXxQmrs0NyINGdhb
 0Q5zAlK/xSMXI3CWfYYOFg1TZ2r1VvK5qMb5
X-Received: by 2002:a17:907:fd8a:b0:bd5:18ee:a54a with SMTP id
 a640c23a62f3a-bdd2293ec75mr1247285466b.8.1779830751354; Tue, 26 May 2026
 14:25:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 23:25:50 +0200
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 23:25:50 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Jonathan Cameron <jic23@kernel.org>, 
 Angelo Dureghello <adureghello@baylibre.com>,
 Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 David Lechner <dlechner@baylibre.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
 <20260522-wip-stmark2-dac-v3-11-16be0ad35a67@baylibre.com>
 <20260526143050.5fca6514@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20260526143050.5fca6514@jic23-huawei>
Date: Tue, 26 May 2026 23:25:50 +0200
X-Gm-Features: AVHnY4K4EVRlMYVfttR7ggQcjq5xwYPhtPTl_I0B1Kvzgy2_6s0yq2t2OwfFyUw
Message-ID: <CALSJ-wAqOkQ0j-rKb7Oju9BVqWuE1_Y-D5WQSHeaiV6JPQngRQ@mail.gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 11/11] iio: dac: add mcf54415 DAC
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:andy@kernel.org,m:adureghello@baylibre.com,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,gmail.com,uclinux.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.869];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sashiko.dev:url,baylibre.com:email]
X-Rspamd-Queue-Id: 0B4325DCAE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jonathan,

On Tue, May 26, 2026 at 02:30:50PM +0100, Jonathan Cameron wrote:
> On Fri, 22 May 2026 23:20:39 +0200
> Angelo Dureghello <adureghello@baylibre.com> wrote:
>
> > From: Angelo Dureghello <adureghello@baylibre.com>
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
> >
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> https://sashiko.dev/#/patchset/20260522-wip-stmark2-dac-v3-0-16be0ad35a67%40baylibre.com
>
> Given there were only a couple of comments I've included them below alongside
> my review.  All minor stuff.
>
> Thanks,
>
> Jonathan
>
> > ---
> > Changes in v2:
> > - remove tests from commit message, moved to patch 0
> > - remove additional blank lines
> > - remove dead code and unused definitions
> > - use regmap
> > - add limit check on raw write
> > - non functional style fixes
> > - add COMPILE_TEST to Kconfig
> > Changes in v3:
> > - add comments where needed
> > - code style changes
> > - remove unneeded variables
> > - use regmap_set_bits where possible
> > - remove macro not needed to define a single channel
> > - set up regmap to big_endian accesses for next patches that will come,
> >   that will adjust ColdFire readx/writex as standard LE (links in 0/x).
> > - add return value check on regmap calls
> > - sashiko: remove unneeded .io_port from regmap init.
> > - sashiko: add select REGMAP_MMIO in Kconfig
>
> Looks like you missed or disagreed with the previous sashiko comment on v2 about
> type passed to regmap_read()
>

Sahiko asks if regmap_read produces a compiler watning.
I don't see any,

> > ---
> >  drivers/iio/dac/Kconfig        |  11 +++
> >  drivers/iio/dac/Makefile       |   1 +
> >  drivers/iio/dac/mcf54415_dac.c | 207 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 219 insertions(+)
> >
> > diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> > index cd4870b65415..b1a578076188 100644
> > --- a/drivers/iio/dac/Kconfig
> > +++ b/drivers/iio/dac/Kconfig
> > @@ -516,6 +516,17 @@ config MAX5821
> >  	  Say yes here to build support for Maxim MAX5821
> >  	  10 bits DAC.
> >
> > +config MCF54415_DAC
> > +	tristate "NXP MCF54415 DAC driver"
> > +	depends on M5441x || COMPILE_TEST
> > +	select REGMAP_MMIO
> > +	help
> > +	  Say yes here to build support for NXP MCF54415
> > +	  12bit DAC.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called mcf54415_dac.
> > +
>
> > diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_dac.c
> > new file mode 100644
> > index 000000000000..c8c87572d43d
> > --- /dev/null
> > +++ b/drivers/iio/dac/mcf54415_dac.c
> > @@ -0,0 +1,207 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * NXP mcf54415 DAC driver
> > + *
> > + * Copyright 2026 BayLibre - adureghello@baylibre.com
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/compiler_types.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
>
> not seeing any use of this. I guess it 'evolved' away.
> Anyhow, please sanity check these all one more time for v4.
>

thanks,
removed it and also linux/array_size.h that's unused now.

> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <linux/iio/iio.h>
> > +
> > +#define MCF54415_DAC_CR			0x00
> > +#define MCF54415_DAC_CR_PDN		BIT(0)
> > +#define MCF54415_DAC_CR_HSLS		BIT(6)
> > +#define MCF54415_DAC_CR_WMLVL		GENMASK(9, 8)
> > +#define MCF54415_DAC_CR_FILT		BIT(12)
> > +
> > +#define MCF54415_DAC_DATA		0x02
> > +
> > +struct mcf54415_dac {
> > +	struct regmap *map;
> > +	struct clk *clk;
> > +};
> > +
> > +static const struct regmap_config mcf54415_dac_regmap_config = {
> > +	.reg_bits = 16,
> > +	.reg_stride = 2,
> > +	.val_bits = 16,
> > +	.max_register = 0x0c, /* DACX_FILTCNT,  R.M. Table 30-2 */
> > +	.val_format_endian = REGMAP_ENDIAN_BIG,
> > +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> > +};
> > +
> > +static int mcf54415_dac_init(struct mcf54415_dac *info)
> > +{
> > +	int ret;
> > +
> > +	/* Keeping defaults and enable DAC (bit 0 set to 0) */
> > +	ret = regmap_write(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_FILT |
> > +			   FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1));
>
> Perhaps use a local variable. It is a tiny bit too easy to miss that
> parameter being split over two lines.
>
> 	u16 val = MCF54415_DAC_CR_FILT | FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);
>
> would avoid that.

ack, done.

>
> Alternatively perhaps just reflowing as:
> 	ret = regmap_write(info->map, MCF54415_DAC_CR,
> 			   MCF54415_DAC_CR_FILT |
> 			   FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1));
>
> avoids that reading issue (I read it wrong ;)
>
>
>
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* DAC is ready after 12us, from RM table 40-3  */
> > +	fsleep(12);
> > +
> > +	return 0;
> > +}
>
> > +
> > +static int mcf54415_read_raw(struct iio_dev *indio_dev,
> > +			     struct iio_chan_spec const *chan,
> > +			     int *val, int *val2, long mask)
> > +{
> > +	struct mcf54415_dac *info = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		ret = regmap_read(info->map, MCF54415_DAC_DATA, val);
>
> Sashiko pointed out that regmap_read() expects a u32* so this should use
> a local variable for the read.
>

Sashiko asked if this is causing a warning. I don't see any.
Register read is a 16bit reg, and the valid 12bits are masked just after
to ensure returned value is always correct.

So can stay as is, or to make sashiko happy i can do something as:

	struct mcf54415_dac *info = iio_priv(indio_dev);
	int ret;
	u32 reg;

	switch (mask) {
	case IIO_CHAN_INFO_RAW:
		ret = regmap_read(info->map, MCF54415_DAC_DATA, &reg);
		if (ret)
			return -EIO;
		*val = reg & 0xfff;
		return IIO_VAL_INT;

> > +		if (ret)
> > +			return -EIO;
>
> Another one sashiko got. Why is this eating the possibly more useful error
> code from regmap_read()?
>

fixed with return ret

> > +		*val &= 0xfff;
> > +		return IIO_VAL_INT;
> > +	case IIO_CHAN_INFO_SCALE:
> > +		/* Reference voltage as per ColdFire datasheet is 3.3V */
> > +		*val = 3300 /* mV */;
> > +		*val2 = 12;
> > +		return IIO_VAL_FRACTIONAL_LOG2;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
>
> > +static int mcf54415_dac_resume(struct device *dev)
> > +{
> > +	struct mcf54415_dac *info = iio_priv(dev_get_drvdata(dev));
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(info->clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	mcf54415_dac_init(info);
> If this fails should we report it?  I think you'd at least want
> some print to help with debug. (Sashiko got this)
>

Ok, so doing


	ret = mcf54415_dac_init(info);

	if (ret) {
		dev_err(dev, "could not resume device\n");
		return ret;
	}



> > +
> > +	return 0;
> > +}
>
>

Regards,
angelo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
