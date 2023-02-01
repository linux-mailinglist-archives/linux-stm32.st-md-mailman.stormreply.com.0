Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB65686C3E
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Feb 2023 17:57:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D460DC6904D;
	Wed,  1 Feb 2023 16:57:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2794BC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Feb 2023 16:57:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D32761883;
 Wed,  1 Feb 2023 16:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4DFC433D2;
 Wed,  1 Feb 2023 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675270673;
 bh=wgoFWDzet3MEnQEk+UbM8HUIOsFtAK8npPJ49HGAO1o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=u9X4Gr7TjZ6UkgVwjSehC9yfCUt//67EjPYTXTHnJ+aTE6aXNoDaG/fZz03jXnElM
 c315hFd6D+lNgE3Ekgg0QaNB3z7pxxWqm4plvstpHb14GQ0FGDiib2q7//3OZr4/JT
 i0jWp+SqAe/OVftlr6AN17B1kIJdLkIF0i/EuIo2IVSpqxiD6qKmMLkB+1ogV6NLc6
 JidEOiKwk15fIiFO+dc5Qsvoe66Y0tsqMeopIu++n7efbaGm5W5Uc31U7fqGait52w
 WnE8sOF8lc6h19Dd3hynSSTPWQGh4Vapzj+sPUAC+hBsgiEQz8Z/aI5T8L99Afd+Hr
 1f40qveSqB9TQ==
From: Mark Brown <broonie@kernel.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 jic23@kernel.org, tudor.ambarus@microchip.com, pratyush@kernel.org, 
 sanju.mehta@amd.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org, 
 kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com, 
 sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com, 
 han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, khilman@baylibre.com, matthias.bgg@gmail.com, 
 haibo.chen@nxp.com, linus.walleij@linaro.org, daniel@zonque.org, 
 haojian.zhuang@gmail.com, robert.jarzmik@free.fr, agross@kernel.org, 
 heiko@sntech.de, krzysztof.kozlowski@linaro.org, andi@etezian.org, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, masahisa.kojima@linaro.org, 
 jaswinder.singh@linaro.org, rostedt@goodmis.org, mingo@redhat.com, 
 l.stelmach@samsung.com, davem@davemloft.net, edumazet@google.com, 
 kuba@kernel.org, pabeni@redhat.com, alex.aring@gmail.com, 
 stefan@datenfreihafen.org, kvalo@kernel.org, thierry.reding@gmail.com, 
 jonathanh@nvidia.com, skomatineni@nvidia.com, sumit.semwal@linaro.org, 
 christian.koenig@amd.com, j.neuschaefer@gmx.net, vireshk@kernel.org, 
 rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org, 
 gregkh@linuxfoundation.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
In-Reply-To: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
Message-Id: <167527065195.537421.10361370461620477483.b4-ty@kernel.org>
Date: Wed, 01 Feb 2023 16:57:31 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.0
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 konrad.dybcio@somainline.org, dri-devel@lists.freedesktop.org,
 tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org,
 alim.akhtar@samsung.com, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com,
 linux-samsung-soc@vger.kernel.org, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org,
 linux-staging@lists.linux.dev, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 radu_nicolae.pirea@upb.ro, greybus-dev@lists.linaro.org, lars@metafoo.de,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 avifishman70@gmail.com, venture@google.com, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au,
 michael@walle.cc, palmer@dabbelt.com, kernel@pengutronix.de,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Subject: Re: [Linux-stm32] (subset) [PATCH v2 00/13] spi: Add support for
 stacked/parallel memories
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

On Fri, 20 Jan 2023 00:23:29 +0530, Amit Kumar Mahapatra wrote:
> This patch is in the continuation to the discussions which happened on
> 'commit f89504300e94 ("spi: Stacked/parallel memories bindings")' for
> adding dt-binding support for stacked/parallel memories.
> 
> This patch series updated the spi-nor, spi core and the spi drivers
> to add stacked and parallel memories support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[01/13] spi: Add APIs in spi core to set/get spi->chip_select and spi->cs_gpiod
        commit: 303feb3cc06ac0665d0ee9c1414941200e60e8a3
[02/13] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
        (no commit info)
[03/13] net: Replace all spi->chip_select and spi->cs_gpiod references with function call
        (no commit info)
[04/13] iio: imu: Replace all spi->chip_select and spi->cs_gpiod references with function call
        (no commit info)
[05/13] mtd: devices: Replace all spi->chip_select and spi->cs_gpiod references with function call
        (no commit info)
[06/13] staging: Replace all spi->chip_select and spi->cs_gpiod references with function call
        (no commit info)
[07/13] platform/x86: serial-multi-instantiate: Replace all spi->chip_select and spi->cs_gpiod references with function call
        (no commit info)

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
