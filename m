Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B71D29F920B
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 13:22:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67429C78027;
	Fri, 20 Dec 2024 12:22:06 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 629F8C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 12:21:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EBEE4A41B25;
 Fri, 20 Dec 2024 12:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B3BC4CECD;
 Fri, 20 Dec 2024 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1734697316;
 bh=JduFaswRmxN5tGLStvzwUiaywMEIItZVTSmKsVx9nOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yq+tb1psbAD0EEaGVo62BeRkwh9Xj1zwGjU1RnX9bPc3zuKVZ+vFaKjzZirLF0O5Q
 cWqZTrj/8oUOashMDH0in9idt9Jf9pCN3xfKSbuna7zWsHJDYmyLi1Jgqy+04F5+b+
 WkFCtRLWZn13uCsuIFDP/5NAmVeHVQ3OLBfdEu0A=
Date: Fri, 20 Dec 2024 13:21:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <2024122018-groove-glitzy-f3bc@gregkh>
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241220103825.3509421-1-kever.yang@rock-chips.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, heiko@sntech.de,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, linux-phy@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jisheng Zhang <jszhang@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Shresth Prasad <shresthprasad7@gmail.com>, Jamie Iles <jamie@jamieiles.com>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Simon Xue <xxm@rock-chips.com>, devicetree@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Andy Yan <andyshrk@163.com>, Tim Lunn <tim@feathertop.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 Jose Abreu <joabreu@synopsys.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-pm@vger.kernel.org,
 Frank Wang <frank.wang@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Johan Jonker <jbx6244@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-spi@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 FUKAUMI Naoki <naoki@radxa.com>, Jonathan Cameron <jic23@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Wu <david.wu@rock-chips.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Diederik de Haas <didi.debian@cknow.org>,
 "David S. Miller" <davem@davemloft.net>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/38] rockchip: Add rk3562 support
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

On Fri, Dec 20, 2024 at 06:37:46PM +0800, Kever Yang wrote:
> 
> This patch set adds rk3562 SoC and its evb support.
> 
> The patch number is a little bit too big, some of them may need to split
> out for different maintainers, please let me know which patch need to
> split out.

I recommend you doing the split-apart as you know the dependencies here
the best, right?  Otherwise we all will just probably ignore them
assuming someone else is going to review/accept them...

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
