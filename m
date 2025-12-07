Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F5CAB5B4
	for <lists+linux-stm32@lfdr.de>; Sun, 07 Dec 2025 15:01:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5571FC57A52;
	Sun,  7 Dec 2025 14:01:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DD7AC1A97A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Dec 2025 14:01:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C0E276001D;
 Sun,  7 Dec 2025 14:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD22C4CEFB;
 Sun,  7 Dec 2025 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765116073;
 bh=XIPzPHGdu9MVAiWYzmLVkJFzpk/+VDBaaF5v6Z7S21s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EsCx8mM87A8HyrcrJI3CQaCEoWdzjxwjyxeqqWomtZPKX5oKnNhnVYczlV7yr+api
 h1nrsAZDZtwq8anuESeyBIikhqAGux8Sco7E2Rn/vfqVt3PrLc2LEXvN4NSCJv8VNd
 QVVaCfRbNh41EPha2La8wU9XYpzaRw5oeg/WKfl2DGoA8/1tRRDfQAYNuQDEo9c9yk
 dqBAsLPZNDc43gMPXaP5nnzCsVtGWyKsl2w7so4uosQ6fq9FfMfKiMuPsd2YnYkyMA
 RKvB9A/O4JQAg0lFIEGn3i1jJw/CzAX645QjvGuZeOKfDEgbv9poaPspTv29soMaUq
 UJU9YlFfffWtg==
Date: Sun, 7 Dec 2025 14:00:46 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20251207140046.56322d6f@jic23-huawei>
In-Reply-To: <5948030.DvuYhMxLoT@fw-rgant>
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
 <78240755-44dc-4835-aca5-99540cca0304@baylibre.com>
 <5948030.DvuYhMxLoT@fw-rgant>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-phy@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 linux-mips@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Hans de Goede <hansg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] iio: inkern: Use namespaced exports
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

On Tue, 02 Dec 2025 08:30:58 +0100
Romain Gantois <romain.gantois@bootlin.com> wrote:

> On Monday, 1 December 2025 18:15:54 CET David Lechner wrote:
> > On 12/1/25 4:59 AM, Romain Gantois wrote:  
> > > Use namespaced exports for IIO consumer API functions.
> > > 
> > > Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> > > ---  
> > 
> > ...
> >   
> > > diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
> > > index a8198ba4f98a..33d6692f46fe 100644
> > > --- a/drivers/iio/dac/ds4424.c
> > > +++ b/drivers/iio/dac/ds4424.c
> > > @@ -14,7 +14,6 @@
> > > 
> > >  #include <linux/iio/iio.h>
> > >  #include <linux/iio/driver.h>
> > >  #include <linux/iio/machine.h>
> > > 
> > > -#include <linux/iio/consumer.h>  
> > 
> > Unrelated change?  
> 
> Indeed, I'll leave that out in v2.

Please spin a precursor patch that makes that change.
That way we can easily check all files either both include that header
and have the namespace enabled, or neither.

I might merge this is a slightly funny way that leave it initially
not meeting that rule so that the precursor isn't in the immutable branch
for other subsystems but lets keep it logical in the patch set!

Jonathan

> 
> > >  #define DS4422_MAX_DAC_CHANNELS		2
> > >  #define DS4424_MAX_DAC_CHANNELS		4
> > > 
> > > @@ -321,3 +320,4 @@ MODULE_AUTHOR("Ismail H. Kose
> > > <ismail.kose@maximintegrated.com>");> 
> > >  MODULE_AUTHOR("Vishal Sood <vishal.sood@maximintegrated.com>");
> > >  MODULE_AUTHOR("David Jung <david.jung@maximintegrated.com>");
> > >  MODULE_LICENSE("GPL v2");
> > > 
> > > +MODULE_IMPORT_NS("IIO_CONSUMER");  
> > 
> > Is this actually needed if we don't use anything from consumer.h?  
> 
> No, it's not.
> 
> Thanks,
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
