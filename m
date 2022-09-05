Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 138C95AD58D
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 16:55:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1F88C55596;
	Mon,  5 Sep 2022 14:55:06 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84B5EC0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 14:55:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDF49B8119E;
 Mon,  5 Sep 2022 14:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55311C433D6;
 Mon,  5 Sep 2022 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662389702;
 bh=KP3EocuoUIX0AopCG1aLZXX8OYIQkU7XDQRdtjESgfQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FdxBqiI3p6ZeO4T+XjgQ9CZ/qt69KGDmMaAKKfHX9rJZ8Jk2TFPVgg1SqnsdqhkRa
 WdDaWxcTHblfVGvoG78rdGhCY73SymRtwQ5E/O1+kJIRSFwSWC0iH+WVUYcuf4J/9I
 kQ4DrYany8AlhFZ13jcgU8XtxHsAoxcrTSwCZVrc48ljSqB9o/UKBtoojYJQze+tiV
 fvGYoDbk0jy7TuqUrjjHekuf1hzLJkMS/QgninQfO1rY7Se8Wee7G0k3IhatOzVCte
 WkV36G3IYztJIvQ66OoflpORRaQbBmetX5gw4GgXfwKRTNy74S54TTBmoN34wl7/kT
 uSzb6UrdEavlg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel@ffwll.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marc Zyngier <maz@kernel.org>, Krzysztof Wilczyński <kw@linux.com>,
 Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>, Pali Rohár <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
Message-Id: <166238969501.661295.8416403465203041511.b4-ty@kernel.org>
Date: Mon, 05 Sep 2022 15:54:55 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
Cc: linux-watchdog@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v1 00/11] Get rid of
	[devm_]gpiod_get_from_of_node() public APIs
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

On Sun, 4 Sep 2022 23:30:52 -0700, Dmitry Torokhov wrote:
> I would like to stop exporting OF-specific [devm_]gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit. We can do that by switching drivers
> to use generic fwnode API ([devm_]fwnode_gpiod_get()). By doing so we open
> the door to augmenting device tree and ACPI information through secondary
> software properties (once we teach gpiolib how to handle those).
> 
> I hope that relevant maintainers will take patches through their trees and
> then we could merge the last one some time after -rc1.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[08/11] regulator: bd71815: switch to using devm_fwnode_gpiod_get()
        commit: 97c9278ec624a0d5d7c56aa20e16afc8aaa96557
[09/11] regulator: bd9576: switch to using devm_fwnode_gpiod_get()
        commit: 587bfe3f7a270f0a4076e624d318292324bdead8

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
