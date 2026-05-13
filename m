Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEAxCsaFBGrVKwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 16:08:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF66A534B51
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 16:08:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 633B1C8F289;
	Wed, 13 May 2026 14:08:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA58BC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 14:08:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8AC7340BEA;
 Wed, 13 May 2026 14:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8871C19425;
 Wed, 13 May 2026 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778681282;
 bh=UcCnX+hZhQbVEDIyzBzB508ARtnF3/FoxfXkEhQY/d8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=URinv1wdoSFbocNtRMotJr7U4dQDvjLcrLhC92vrR29B7glDq9U0AXgeDBf/jNcEg
 dMNTgpdtKzh9fTDh5Wxr+Zz5ATDDsSQ49j+r154KpG3x/AhvPawlGDho/VNnk2cRBJ
 00UK+kMQzsvQI9Xn4J30J/D9k0xpixlejDbJcpWzsDD5PDHEkTsY+EJLR5klKs3yxA
 8Na3x+Yx9RfA9cKjs62qeZqe60AM9Rv0Pz7pZpXPcV1sVWtxOzU1wzx3ujV+w27B87
 URNGuBZvuh9r77jAhuwtcyMGujSZWfPIakebqVcxq4YFeM5elVV2Fd9vTFKtUHPpXy
 ffufUSuRYYSag==
Date: Wed, 13 May 2026 15:07:51 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Message-ID: <20260513150751.3305bf99@jic23-huawei>
In-Reply-To: <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
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
X-Rspamd-Queue-Id: AF66A534B51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
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
	NEURAL_SPAM(0.00)[0.164];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Wed, 13 May 2026 11:14:35 +0200
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

As for all new IIO code, Sashiko will eventually take a look at it - I think
it's running about a day behind at the moment.  Once it catches up please
take a look (so far it's not even listing the series as pending!)

Looks good to me. Some trivial stuff inline. Only one I'm that fussed about
is not having a macro for the definition of a single channel. 
Superficially looks like no compile time dependencies between this and
the rest of the series I think so once people are happy with the whole thing
I'll pick this up through the IIO tree.

Jonathan

> diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_dac.c
> new file mode 100644
> index 000000000000..e95ab6b89b17
> --- /dev/null
> +++ b/drivers/iio/dac/mcf54415_dac.c
...


> +static void mcf54415_dac_exit(void *data)
> +{
> +	struct mcf54415_dac *info = data;
> +
> +	regmap_update_bits(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_PDN,
> +			   MCF54415_DAC_CR_PDN);

regmap_set_bits() just to be a tiny bit more compact.

> +}
> +
> +#define MCF54415_DAC_CHAN \
> +{ \
> +	.type = IIO_VOLTAGE, \
> +	.output = 1, \
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
> +	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
> +}
> +
> +static const struct iio_chan_spec mcf54415_dac_iio_channels[] = {
> +	MCF54415_DAC_CHAN,

For a single channel case like this I'd skip the macro - it's just
making things a little harder to read. i.e.
	.type = IIO_VOLTAGE,
etc here

> +};
> +

> +static int mcf54415_dac_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
Given the type passed to iio_priv() is very well known this
isn't really bringing any type safety - so you could just do

	struct mcf54415_dac *info = iio_priv(dev_get_drvdata(dev));
here and in resume.
I don't really care either way!


> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +
> +	mcf54415_dac_exit(info);
> +	clk_disable_unprepare(info->clk);
> +
> +	return 0;
> +}
> +
> +static int mcf54415_dac_resume(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(info->clk);
> +	if (ret)
> +		return ret;
> +
> +	mcf54415_dac_init(info);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops,
> +				mcf54415_dac_suspend,
> +				mcf54415_dac_resume);
> +

Trivial but might as well wrap as:
static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops,
				mcf54415_dac_suspend, mcf54415_dac_resume);

And save us scrolling one line extra.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
