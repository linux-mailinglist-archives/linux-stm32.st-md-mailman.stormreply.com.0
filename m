Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHHYD0iV+GkKwwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:47:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D54FC4BD2FA
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:47:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C166CFAC40;
	Mon,  4 May 2026 12:47:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FB6CC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2026 12:47:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A439444504
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2026 12:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7453AC2BCFC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2026 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777898820;
 bh=rqUjvxcIwiqSouVgzp0n5ZgMfAUUu7DpPnpF7Rlw/9s=;
 h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
 b=OGBJyAl1TjQZbVY5CtXGfiHBLAU1gRj8gd0FACUZB771ov0GZu+G1xoXpSR81gydI
 zpWuEd+5mnBDwON1NP21pV9a+LTy5iTL73cZVuLlG2anjTyhdh8y/WOxpmjyr1+HUt
 180dRkFoUBFPPAM9ivep+LrErcm52NMiX1bGCj7N5GUBdEgtpwFbfEqoXCoUbV2z1t
 H59g4LinNbzcftf/BN9ok7WYFF0sjqxBnD4JAF6CutxRzQrJu8dc1hKvATSq4V2ilu
 A11iwwfqpPkmg0G+6zmx0sBXaa4TFweqgwMXUlzy0DZ0Y8ts3L57hpPUlHKvjIJypF
 9zAVotyBPR41g==
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3922b35e69cso32713251fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 May 2026 05:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9+wFx7IBRTr+23Yxy2C4HfjTTFUpkdYxuQjLo+LzMjwXcPLxTF1MREzB+FPzeg0hdt9ZQsUqYVjjceEg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwmEMT6QpP05ejEVye5o5kr2AqEIIizpT/FKfhmbKenqeQpTfNg
 Dtgbiypagp+X7xvX4FbsZg+RfYc8Zn+EIBSXyKzOsD+pwJxIFw9gbQVU7d8udVvJoVMwcNegDzf
 QLoFfRasBwCBcSivhdcAp8G6VgyVXu+wwuF0ZSIbyVA==
X-Received: by 2002:a2e:bc85:0:b0:38e:dd8e:d213 with SMTP id
 38308e7fff4ca-393785df5ebmr29416331fa.27.1777898818194; Mon, 04 May 2026
 05:46:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 12:46:56 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 12:46:56 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260501155421.3329862-10-elder@riscstar.com>
MIME-Version: 1.0
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
Date: Mon, 4 May 2026 12:46:56 +0000
X-Gmail-Original-Message-ID: <CAMRc=McWXCqyv1LmWMuEMmE3HqaURx_eMD8rkDs9AJT+7W2aYw@mail.gmail.com>
X-Gm-Features: AVHnY4L8JCAMw1XcvfyTBeV19iii982i6k_b0CsUw3tYvQ3XSnjDUNr1XEgVtqw
Message-ID: <CAMRc=McWXCqyv1LmWMuEMmE3HqaURx_eMD8rkDs9AJT+7W2aYw@mail.gmail.com>
To: Alex Elder <elder@riscstar.com>
Cc: gregkh@linuxfoundation.org, me@ziyao.cc, linux-kernel@vger.kernel.org,
 daniel@riscstar.com, chenchuangyu@xiaomi.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 maxime.chevallier@bootlin.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 kuba@kernel.org, pabeni@redhat.com, konradybcio@kernel.org, linusw@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, hawk@kernel.org,
 arnd@arndb.de, brgl@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 ast@kernel.org, linux-gpio@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 wens@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 inochiama@gmail.com, andersson@kernel.org, a0987203069@gmail.com,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 09/12] gpio: tc956x: add
	TC956x/QPS615 support
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
X-Rspamd-Queue-Id: D54FC4BD2FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,kernel.org,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,lunn.ch,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:linusw@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:andersson@
 kernel.org,m:a0987203069@gmail.com,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:davem@davemloft.net,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:email,mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.715];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Fri, 1 May 2026 17:54:17 +0200, Alex Elder <elder@riscstar.com> said:
> Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially
> a small and highly-specialized SoC.  TC956x includes a GPIO block that
> can be accessed, alongside several other peripherals, via two PCIe
> endpoint functions.  The PCIe function driver creates an auxiliary
> device for the GPIO block, and that device gets bound to this auxiliary
> device driver.
>
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/gpio/Kconfig       |  11 ++
>  drivers/gpio/Makefile      |   1 +
>  drivers/gpio/gpio-tc956x.c | 209 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 drivers/gpio/gpio-tc956x.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 020e51e30317a..746cedea7e91d 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1646,6 +1646,17 @@ config GPIO_TC3589X
>  	  This enables support for the GPIOs found on the TC3589X
>  	  I/O Expander.
>
> +config GPIO_TC956X
> +	tristate "Toshiba TC956X GPIO support"
> +	depends on TOSHIBA_TC956X_PCI
> +	default m if TOSHIBA_TC956X_PCI
> +	help
> +	  This enables support for the GPIO controller embedded in the Toshiba
> +	  TC956X (and Qualcomm QPS615).  This device connects to the host
> +	  via PCIe port, which is the upstream port on an internal PCIe
> +	  switch.  On some platforms, a few of the GPIO lines are used to
> +	  manage external resets.
> +
>  config GPIO_TIMBERDALE
>  	bool "Support for timberdale GPIO IP"
>  	depends on MFD_TIMBERDALE
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index b267598b517de..c3584e7cba9b4 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -178,6 +178,7 @@ obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
>  obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
>  obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
>  obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
> +obj-$(CONFIG_GPIO_TC956X)		+= gpio-tc956x.o
>  obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
>  obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
>  obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
> diff --git a/drivers/gpio/gpio-tc956x.c b/drivers/gpio/gpio-tc956x.c
> new file mode 100644
> index 0000000000000..12221d8f812d9
> --- /dev/null
> +++ b/drivers/gpio/gpio-tc956x.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
> + */
> +
> +/*
> + * The Toshiba TC956X implements a PCIe Gen 3 switch that connects an
> + * upstream x4 port to two downstream PCIe x2 ports.  It incorporates
> + * an internal endpoint on a internal PCIe port that implements two
> + * Synopsys XGMAC Ethernet interfaces.
> + *
> + * 35 GPIOs are also implemented by an embedded GPIO controller.  Three
> + * registers control the first 32 GPIOs (other than 20 and 21, which are
> + * reserved).  Three other registers control GPIOs 32 through 36. GPIOs
> + * 22-24, 27-28, 31, and 34 are treated as "input only".
> + *
> + * There is a TC956X PCI power controller driver that accesses the
> + * direction and output value registers for GPIOs 2 and 3.  These
> + * GPIOs control the reset signal for the two downstream PCIe ports.
> + * Their values will never change during operation of this driver, and
> + * this driver reserves these two GPIOS.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/dev_printk.h>

This is implied by device.h which is guarnteed by platform_device.h. Please
drop it.

> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define DRIVER_NAME		"tc956x-gpio"
> +
> +#define TC956X_GPIO_COUNT	37	/* Number of GPIOs (20-21 reserved) */
> +
> +/* The GPIO offsets are relative to 0x1200 in TC956X SFR space */
> +#define GPIO_IN0_OFFSET		0x00		/* Input value (0-31) */
> +#define GPIO_EN0_OFFSET		0x08		/* 0: out; 1: in (0-31) */
> +#define GPIO_OUT0_OFFSET	0x10		/* Output value (0-31) */
> +
> +#define GPIO_IN1_OFFSET		0x04		/* Input value (32-36) */
> +#define GPIO_EN1_OFFSET		0x0c		/* 0: out; 1: in (32-36) */
> +#define GPIO_OUT1_OFFSET	0x14		/* Output value (32-36) */
> +
> +/*
> + * struct tc956x_gpio - Information related to the embedded GPIO controller
> + * @chip:		GPIO chip structure
> + * @regmap:		MMIO register map for SFR GPIO region access
> + * @input_only:		Bitmap indicating which GPIOs are input-only
> + */
> +struct tc956x_gpio {
> +	struct gpio_chip chip;
> +	struct regmap *regmap;
> +	DECLARE_BITMAP(input_only, TC956X_GPIO_COUNT);
> +};
> +
> +static int tc956x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
> +	u32 reg;
> +	u32 val;
> +
> +	if (test_bit(offset, gpio->input_only))
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	reg = offset < 32 ? GPIO_EN0_OFFSET : GPIO_EN1_OFFSET;
> +
> +	regmap_read(gpio->regmap, reg, &val);
> +	if (val & BIT(offset % 32))
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int tc956x_gpio_direction_input(struct gpio_chip *gc,
> +				       unsigned int offset)
> +{
> +	u32 reg = offset < 32 ? GPIO_EN0_OFFSET : GPIO_EN1_OFFSET;
> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
> +	u32 mask = BIT(offset % 32);
> +
> +	return regmap_update_bits(gpio->regmap, reg, mask, mask);
> +}
> +
> +static int tc956x_gpio_direction_output(struct gpio_chip *gc,
> +					unsigned int offset, int value)
> +{
> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
> +	u32 vreg;
> +	u32 dreg;
> +	u32 mask;
> +
> +	if (test_bit(offset, gpio->input_only))
> +		return -EINVAL;
> +
> +	if (offset < 32) {
> +		vreg = GPIO_OUT0_OFFSET;
> +		dreg = GPIO_EN0_OFFSET;
> +	} else {
> +		vreg = GPIO_OUT1_OFFSET;
> +		dreg = GPIO_EN1_OFFSET;
> +	}
> +	mask = BIT(offset % 32);
> +
> +	/* Set output value first, then direction */
> +	regmap_update_bits(gpio->regmap, vreg, mask, value ? mask : 0);
> +
> +	return regmap_update_bits(gpio->regmap, dreg, mask, 0);
> +}
> +
> +static int tc956x_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	u32 reg = offset < 32 ? GPIO_IN0_OFFSET : GPIO_IN1_OFFSET;
> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
> +	u32 val;
> +
> +	regmap_read(gpio->regmap, reg, &val);
> +
> +	return val & BIT(offset % 32) ? 1 : 0;
> +}
> +
> +static int tc956x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +	u32 reg = offset < 32 ? GPIO_OUT0_OFFSET : GPIO_OUT1_OFFSET;
> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
> +	u32 mask = BIT(offset % 32);
> +
> +	return regmap_update_bits(gpio->regmap, reg, mask, value ? mask : 0);
> +}
> +
> +static int tc956x_gpio_init_valid_mask(struct gpio_chip *gc,
> +				       unsigned long *valid_mask,
> +				       unsigned int ngpios)
> +{
> +	/*
> +	 * GPIOs 2 and 3 are used by the PCI power control driver, and
> +	 * we don't allow them to be used.  GPIOs 20 and 21 are reserved
> +	 * (and not usable).
> +	 */
> +	bitmap_fill(valid_mask, ngpios);
> +	bitmap_clear(valid_mask, 2, 2);
> +	bitmap_clear(valid_mask, 20, 2);
> +
> +	return 0;
> +}
> +
> +static int tc956x_gpio_probe(struct auxiliary_device *adev,
> +			     const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct tc956x_gpio *gpio;
> +	struct gpio_chip *gc;
> +
> +	if (!dev->platform_data)
> +		return -EINVAL;
> +
> +	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> +	if (!gpio)
> +		return -ENOMEM;

Add newline.

> +	gpio->regmap = dev->platform_data;

It's not clear whether this is an mmio regmap or a slow-bus one that can fail.
In the code above you're checking the return values of regmap operations quite
inconsistently. Could you please verify if you need it and either always check
them or not at all?

> +
> +	/* Mark GPIOs 22, 23, 24, 27, 28, 31, and 34 as input only */
> +	bitmap_set(gpio->input_only, 22, 3);
> +	bitmap_set(gpio->input_only, 27, 2);
> +	set_bit(31, gpio->input_only);
> +	set_bit(34, gpio->input_only);
> +
> +	gc = &gpio->chip;
> +
> +	gc->label = DRIVER_NAME;
> +	gc->parent = dev->parent;
> +
> +	gc->get_direction = tc956x_gpio_get_direction;
> +	gc->direction_input = tc956x_gpio_direction_input;
> +	gc->direction_output = tc956x_gpio_direction_output;
> +	gc->get = tc956x_gpio_get;
> +	gc->set = tc956x_gpio_set;
> +	gc->init_valid_mask = tc956x_gpio_init_valid_mask;
> +
> +	gc->base = -1;
> +	gc->ngpio = TC956X_GPIO_COUNT;
> +	gc->can_sleep = false;

This makes me think this is an MMIO regmap after all.

> +
> +	dev_set_drvdata(dev, gpio);

There's no corresponding dev_get_drvdata().

> +
> +	return devm_gpiochip_add_data(dev, gc, gpio);
> +}
> +
> +static const struct auxiliary_device_id tc956x_gpio_ids[] = {
> +	{ .name = "tc956x_pci.tc9564-gpio", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, tc956x_gpio_ids);
> +
> +static struct auxiliary_driver tc956x_gpio_driver = {
> +	.name		= DRIVER_NAME,
> +	.probe          = tc956x_gpio_probe,
> +	.id_table       = tc956x_gpio_ids,
> +	.driver = {
> +		.name		= DRIVER_NAME,
> +		.owner		= THIS_MODULE,
> +		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +};
> +module_auxiliary_driver(tc956x_gpio_driver);
> +
> +MODULE_DESCRIPTION("Toshiba TC956X PCIe GPIO Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("auxiliary:" DRIVER_NAME);
> --
> 2.51.0
>
>

There are a few minor issues but overall looks good!

Bart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
