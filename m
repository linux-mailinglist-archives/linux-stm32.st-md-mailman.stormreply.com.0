Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7560103F
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 15:32:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DA72C640F5;
	Mon, 17 Oct 2022 13:32:09 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15C8AC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 13:32:08 +0000 (UTC)
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MrdB34gj5z686tl;
 Mon, 17 Oct 2022 21:28:59 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.31; Mon, 17 Oct 2022 15:32:04 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 14:32:03 +0100
Date: Mon, 17 Oct 2022 14:32:02 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Message-ID: <20221017143202.00003b1d@huawei.com>
In-Reply-To: <20221017121249.19061-6-amit.kumar-mahapatra@amd.com>
References: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
 <20221017121249.19061-6-amit.kumar-mahapatra@amd.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Cc: heiko@sntech.de, linus.walleij@linaro.org, eajames@linux.ibm.com,
 alim.akhtar@samsung.com, miquel.raynal@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com, stefan@datenfreihafen.org,
 tmaimon77@gmail.com, linux-samsung-soc@vger.kernel.org, samuel@sholland.org,
 khilman@baylibre.com, haibo.chen@nxp.com, mingo@redhat.com, linux-imx@nxp.com,
 linux-sunxi@lists.linux.dev, s.hauer@pengutronix.de, l.stelmach@samsung.com,
 sanju.mehta@amd.com, sbranden@broadcom.com, andrew@aj.id.au,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, yogeshgaur.83@gmail.com, michael@walle.cc,
 kernel@pengutronix.de, olteanv@gmail.com, linux-wpan@vger.kernel.org,
 claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com,
 linux-aspeed@lists.ozlabs.org, edumazet@google.com, ldewangan@nvidia.com,
 lars@metafoo.de, jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
 jbrunet@baylibre.com, andi@etezian.org, Michael.Hennerich@analog.com,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 radu_nicolae.pirea@upb.ro, haojian.zhuang@gmail.com,
 jaswinder.singh@linaro.org, clg@kaod.org, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 libertas-dev@lists.infradead.org, mcoquelin.stm32@gmail.com,
 pratyush@kernel.org, linux-rpi-kernel@lists.infradead.org,
 narmstrong@baylibre.com, linux-iio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org,
 masahisa.kojima@linaro.org, festevam@gmail.com, git@amd.com,
 f.fainelli@gmail.com, benjaminfair@google.com, jernej.skrabec@gmail.com,
 yuenn@google.com, wens@csie.org, bcm-kernel-feedback-list@broadcom.com,
 joel@jms.id.au, pabeni@redhat.com, amitrkcian2002@gmail.com, rjui@broadcom.com,
 john.garry@huawei.com, rostedt@goodmis.org, broonie@kernel.org,
 tali.perry1@gmail.com, avifishman70@gmail.com, thierry.reding@gmail.com,
 netdev@vger.kernel.org, shawnguo@kernel.org, davem@davemloft.net,
 alex.aring@gmail.com, vigneshr@ti.com, konrad.dybcio@somainline.org,
 bjorn.andersson@linaro.org, robert.jarzmik@free.fr, akumarma@amd.com,
 kdasu.kdev@gmail.com, richard@nod.at, chin-ting_kuo@aspeedtech.com,
 agross@kernel.org, kuba@kernel.org, tudor.ambarus@microchip.com,
 kvalo@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 han.xu@nxp.com, venture@google.com, nicolas.ferre@microchip.com,
 fancer.lancer@gmail.com, krzysztof.kozlowski@linaro.org, jic23@kernel.org,
 openbmc@lists.ozlabs.org, daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH 05/10] iio: imu: Replace spi->chip_select
 references to spi->chip_select[0]
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

On Mon, 17 Oct 2022 17:42:44 +0530
Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com> wrote:

> For adding multi CS support & to prevent any existing driver from
> breaking, replaced all spi->chip_select references to spi->chip_slect[0].
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

Hmm. No particular reason why that print should exist at all.
The warning above it covers the case where there is a mismatch
in IDs so this adds nothing useful.

So patch is fine, but I'd be equally happy with just dropping the
print.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/iio/imu/adis16400.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
> index 17bb0c40a149..aa7bfcee3510 100644
> --- a/drivers/iio/imu/adis16400.c
> +++ b/drivers/iio/imu/adis16400.c
> @@ -466,7 +466,7 @@ static int adis16400_initial_setup(struct iio_dev *indio_dev)
>  
>  		dev_info(&indio_dev->dev, "%s: prod_id 0x%04x at CS%d (irq %d)\n",
>  			indio_dev->name, prod_id,
> -			st->adis.spi->chip_select, st->adis.spi->irq);
> +			st->adis.spi->chip_select[0], st->adis.spi->irq);
>  	}
>  	/* use high spi speed if possible */
>  	if (st->variant->flags & ADIS16400_HAS_SLOW_MODE) {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
