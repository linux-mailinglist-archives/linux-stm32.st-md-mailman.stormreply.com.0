Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4631B5ACF2B
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 11:50:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA2CBC640FE;
	Mon,  5 Sep 2022 09:50:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3CA0C04003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 07:19:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E5BB61041;
 Mon,  5 Sep 2022 07:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A82C433C1;
 Mon,  5 Sep 2022 07:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662362344;
 bh=19nxD2OgHF2QVoth2PFq3CxZH5zVFIqpZyEzuI/YHbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A5IVl+JOjFxfodqmnjA5/iplAcU9jdP05wWuvEqZCUxiPZuyoNor7xgxpbYXB6NVK
 7DcajL5+Q4Jwv4XR1AvPOAXkUgrwSH/Ov7HM3KXUEl/b4BKQG5MdZ5GTO8igdjjVEV
 HR2BrWQ7cSeUZcnhf0SNpLKhbJC0AEjYvFObLKGjaI4ohnPRXMXtOd+2eSUbXERAnn
 Wt+aJ6+72CZQwxjMiKfr0QzSL2qh96wXclEVsX5h4ma+908Zyb6OVtZsD0AEGTokvq
 Z4gsx2A9lpZW+2kJWomwEZtX41BXuoB9ZUs+w+vRDjrWEAYqK9IYV1wftZ4A4k/PEn
 RnEC8ylDHE6IA==
Received: by pali.im (Postfix)
 id 32DB27D7; Mon,  5 Sep 2022 09:19:02 +0200 (CEST)
Date: Mon, 5 Sep 2022 09:19:02 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <20220905071902.fv4uozrsttk3mosu@pali>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Mon, 05 Sep 2022 09:50:40 +0000
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-watchdog@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 01/11] PCI: tegra: switch to using
 devm_fwnode_gpiod_get
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

On Sunday 04 September 2022 23:30:53 Dmitry Torokhov wrote:
> I would like to limit (or maybe even remove) use of
> [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> a bit, so let's switch to the generic device property API. It may even
> help with handling secondary fwnodes when gpiolib is taught to handle
> gpios described by swnodes.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 8e323e93be91..929f9363e94b 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2202,10 +2202,11 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
>  		 * and in this case fall back to using AFI per port register
>  		 * to toggle PERST# SFIO line.
>  		 */
> -		rp->reset_gpio = devm_gpiod_get_from_of_node(dev, port,
> -							     "reset-gpios", 0,
> -							     GPIOD_OUT_LOW,
> -							     label);
> +		rp->reset_gpio = devm_fwnode_gpiod_get(dev,
> +						       of_fwnode_handle(port),
> +						       "reset",
> +						       GPIOD_OUT_LOW,
> +						       label);

Why in pci-aardvark.c for PERST# reset-gpio you have used
devm_gpiod_get_optional() and here in pci-tegra.c you have used
devm_fwnode_gpiod_get()? I think that PERST# logic is same in both
drivers.

>  		if (IS_ERR(rp->reset_gpio)) {
>  			if (PTR_ERR(rp->reset_gpio) == -ENOENT) {
>  				rp->reset_gpio = NULL;
> 
> -- 
> b4 0.10.0-dev-fc921
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
