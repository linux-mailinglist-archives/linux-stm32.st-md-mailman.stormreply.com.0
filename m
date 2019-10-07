Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7DACDCE6
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 10:11:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46DADC36B0C;
	Mon,  7 Oct 2019 08:11:55 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51A09C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 08:11:54 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y91so11495263ede.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Oct 2019 01:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Snb3N5jBGTny2lV0Bq/REXN2i4LAg5y7Btj+sL3kJn0=;
 b=C2qNaPwcCdDe3H6NyrJ0yd+BKtYXlo2xO81ar7XQwWQVrVJSXwGk/NiILiAl1Jfsbs
 MbtOOfdkSalnQFtM0V0t81ARxq0kWmT5nbKcP7Fu48TaHzJ30dT/7KIXA8uUfbQCeIDw
 YlwJJoK1tosKC7NNIz2ECqYd3uTv7fgtquk/PseGkTKN1Pvuk9DP9a4oJZ19AlfezHk3
 0yJf7x3DHEMp+abSAqJO/dvBAWjHAYFpoXNUKTrlY6BN9rms20QKcd2cCOtW1Twu75NN
 kO/4y10xUqUVn/W/CZVTjXUhn/LXAA0qjFjiH6bxZ1GDhbd/KhXWs62leX/P+2eNWGKQ
 5uZA==
X-Gm-Message-State: APjAAAXw46qJJdVRsDM3n34jUqKLqus3BfdYg9ii6RcLZlkO1Mwfe2AF
 HWyy9ThESsNTgB//RLok5EuZ69nimTQ=
X-Google-Smtp-Source: APXvYqxNfs6NdS3XioYatYAGnQIr93dDHLBup2Mrj/JiCydYTjXcdCtJYz4Zl5bUwlS7PdRHCarfgg==
X-Received: by 2002:a17:906:cf82:: with SMTP id
 um2mr22827326ejb.254.1570435913608; 
 Mon, 07 Oct 2019 01:11:53 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id i30sm3220446ede.32.2019.10.07.01.11.50
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2019 01:11:53 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id j11so8261268wrp.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Oct 2019 01:11:50 -0700 (PDT)
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr16979718wrr.23.1570435909394; 
 Mon, 07 Oct 2019 01:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191006102953.57536-1-yuehaibing@huawei.com>
 <20191006102953.57536-30-yuehaibing@huawei.com>
In-Reply-To: <20191006102953.57536-30-yuehaibing@huawei.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Oct 2019 16:11:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64hUaddO-29=ZP53HDrrOUKqfa52Qk9Q2dGf_RkfwZfyA@mail.gmail.com>
Message-ID: <CAGb2v64hUaddO-29=ZP53HDrrOUKqfa52Qk9Q2dGf_RkfwZfyA@mail.gmail.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 Baruch Siach <baruch@tkos.co.il>, paul@crapouillou.net,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, jonathanh@nvidia.com,
 ludovic.desroches@microchip.com,
 "open list:BROADCOM BCM281XX..." <bcm-kernel-feedback-list@broadcom.com>,
 joel@jms.id.au, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Maxime Ripard <mripard@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 gregory.0xf0@gmail.com, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 eddie.huang@mediatek.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alessandro Zummo <a.zummo@towertech.it>, andrew@aj.id.au,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Tony Prisk <linux@prisktech.co.nz>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [Linux-stm32] [PATCH -next 29/34] rtc: sunxi: use
 devm_platform_ioremap_resource() to simplify code
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

On Sun, Oct 6, 2019 at 6:39 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
