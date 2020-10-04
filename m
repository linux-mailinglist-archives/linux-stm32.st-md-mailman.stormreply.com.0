Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6264282BBC
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Oct 2020 18:15:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D309C32EA7;
	Sun,  4 Oct 2020 16:15:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEACDC32EA4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Oct 2020 16:15:32 +0000 (UTC)
Received: from localhost (unknown [171.61.67.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61CEB2068D;
 Sun,  4 Oct 2020 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601828131;
 bh=ipIbwBDHbGx7U/nYVtWvwEV/y7/NQhikV5Ng+1S41wo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BkrFjq5pesVDCZqCgigvVGnAkYU3kAenXEVcy0C+EYf4QSa7nY/PHBghx8c3UJ+K0
 V7wA5EiZjeOgOA1F0vSfPpr62TK79z4/hmO6HvTvKyMEs+fXYkKqMHx+Zl0SJ9Rz3x
 kkipw8CWwDYt7zwpufpGFZLd9NoEY63vruFFDBV0=
Date: Sun, 4 Oct 2020 21:45:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20201004161526.GA2968@vkoul-mobl>
References: <20201002234143.3570746-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002234143.3570746-1-robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 openipmi-developer@lists.sourceforge.net,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org, netdev@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: Another round of adding
 missing 'additionalProperties'
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

On 02-10-20, 18:41, Rob Herring wrote:

>  .../phy/amlogic,meson-g12a-usb2-phy.yaml      |  2 ++
>  .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml |  2 ++
>  .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml |  2 ++
>  .../bindings/phy/qcom,qusb2-phy.yaml          |  1 +
>  .../bindings/phy/qcom-usb-ipq4019-phy.yaml    |  2 ++

For phy changes:

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
