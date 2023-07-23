Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8F475E1E9
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jul 2023 14:39:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A402AC6A615;
	Sun, 23 Jul 2023 12:39:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42CB0C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jul 2023 12:39:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D064660C1F;
 Sun, 23 Jul 2023 12:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11D6C433C7;
 Sun, 23 Jul 2023 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690115939;
 bh=DqMrwul8Z+Kp+FVoVrlZHdVil5ffk4Br9Pj1Hqbnxm4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ob77RBPFBoVTTNibSWxMjo0wYIwPaVtL0+Hj7xKLbn+8iwdFiEl306vNqyY02UYoL
 jPYeKJ+MmA8RU2waU4uBNAvx+/k8LWhw1LvDiwwxOYcT8A1N61ZbBJwn2kgvupboS1
 BS/Ly2Fwldf5uZurcjDRKOMfZVR+pXchkx2F9ETNpzNFputSU9qCWgDPTK3ficVtVB
 hkKcaRcnMnpipcBvew2sRWfQD5EKlTmzr9CfzlxoWvfTNZGhet4PsFi1FmXGnXleMF
 gtaTvOuB9gZlAqFWvC0RyHGmfCN2287EnLmncsKSc1B6d50Aw/+XGT9xje7oGzxj+G
 JP70unohiRQRQ==
Date: Sun, 23 Jul 2023 13:38:48 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230723133848.5dc96150@jic23-huawei>
In-Reply-To: <20230715182510.3d09970c@jic23-huawei>
References: <20230714174628.4057920-1-robh@kernel.org>
 <20230715182510.3d09970c@jic23-huawei>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Crt Mori <cmo@melexis.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, Alexandru Tachici <alexandru.tachici@analog.com>,
 devicetree@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] iio: adc: Explicitly include correct DT
	includes
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

On Sat, 15 Jul 2023 18:25:10 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 14 Jul 2023 11:46:26 -0600
> Rob Herring <robh@kernel.org> wrote:
> 
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those include
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>  
> 
> Hi Rob,
> 
> Just one in here that I noticed isn't quite right. I'd have fixed it 
> up (and can still do so if nothing else comes up) but I want to give
> this more time on list anyway so won't pick it up today.

Fixed up whilst applying.

Applied to the togreg branch of iio.git and pushed out as testing to see
if 0-day can find anything we missed.

Thanks,

Jonathan

> 
> Jonathan
> 
> > diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
> > index 67518e460e05..55e36b40fdf5 100644
> > --- a/drivers/iio/adc/stmpe-adc.c
> > +++ b/drivers/iio/adc/stmpe-adc.c
> > @@ -14,9 +14,10 @@
> >  #include <linux/kernel.h>
> >  #include <linux/mfd/stmpe.h>
> >  #include <linux/module.h>
> > -#include <linux/of_platform.h>
> > +#include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/device.h>
> > +#include <linux/of.h>  
> 
> Duplicate include.
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
