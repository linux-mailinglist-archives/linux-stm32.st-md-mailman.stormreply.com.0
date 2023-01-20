Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA70675211
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Jan 2023 11:09:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 252C0C6904C;
	Fri, 20 Jan 2023 10:09:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7923CC6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Jan 2023 10:09:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4CF861EFE;
 Fri, 20 Jan 2023 10:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA804C433D2;
 Fri, 20 Jan 2023 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1674209387;
 bh=QQh8ShqbKc4vcCYjUJJI+sW3w3r+3sanu/vPZ2IyzTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rMYgPKw1pGl3FwPpK4PFmTlmFnpTnyZ7ux/Z8gB+BTQu8ad2dbnHGdmqSUUh9QAo3
 C+u0IUTCPhPJwzafpGLLSfvLo60WsvNwXWf3AIb1nv8SUA+shDrhHnhPjsEK+wxt8Q
 HF3ooQ8AjjaEe2zCmeFagpTzLf/Qp8lQOOmYtGYc=
Date: Fri, 20 Jan 2023 11:09:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Message-ID: <Y8poZ1wN8/dAO3H/@kroah.com>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-7-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230119185342.2093323-7-amit.kumar-mahapatra@amd.com>
Cc: heiko@sntech.de, linus.walleij@linaro.org, eajames@linux.ibm.com,
 dri-devel@lists.freedesktop.org, alim.akhtar@samsung.com,
 miquel.raynal@bootlin.com, sumit.semwal@linaro.org, stefan@datenfreihafen.org,
 tmaimon77@gmail.com, linux-samsung-soc@vger.kernel.org, samuel@sholland.org,
 khilman@baylibre.com, haibo.chen@nxp.com, mingo@redhat.com, linux-imx@nxp.com,
 linux-sunxi@lists.linux.dev, s.hauer@pengutronix.de, l.stelmach@samsung.com,
 sanju.mehta@amd.com, elder@kernel.org, sbranden@broadcom.com, andrew@aj.id.au,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, yogeshgaur.83@gmail.com, michael@walle.cc,
 skomatineni@nvidia.com, kernel@pengutronix.de, olteanv@gmail.com,
 linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com,
 alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, edumazet@google.com, thierry.reding@gmail.com,
 lars@metafoo.de, vireshk@kernel.org, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, jbrunet@baylibre.com,
 linux-media@vger.kernel.org, andi@etezian.org, Michael.Hennerich@analog.com,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 radu_nicolae.pirea@upb.ro, haojian.zhuang@gmail.com,
 jaswinder.singh@linaro.org, clg@kaod.org, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 greybus-dev@lists.linaro.org, libertas-dev@lists.infradead.org,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, jic23@kernel.org,
 linux-rpi-kernel@lists.infradead.org, narmstrong@baylibre.com,
 linux-iio@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mtd@lists.infradead.org, masahisa.kojima@linaro.org, festevam@gmail.com,
 git@amd.com, f.fainelli@gmail.com, benjaminfair@google.com,
 linux-staging@lists.linux.dev, jernej.skrabec@gmail.com, yuenn@google.com,
 wens@csie.org, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 pabeni@redhat.com, amitrkcian2002@gmail.com, rjui@broadcom.com,
 john.garry@huawei.com, j.neuschaefer@gmx.net, rostedt@goodmis.org,
 broonie@kernel.org, tali.perry1@gmail.com, avifishman70@gmail.com,
 ldewangan@nvidia.com, netdev@vger.kernel.org, shawnguo@kernel.org,
 christian.koenig@amd.com, alex.aring@gmail.com, vigneshr@ti.com,
 konrad.dybcio@somainline.org, bjorn.andersson@linaro.org,
 linux-riscv@lists.infradead.org, robert.jarzmik@free.fr, kdasu.kdev@gmail.com,
 richard@nod.at, chin-ting_kuo@aspeedtech.com, agross@kernel.org,
 kuba@kernel.org, tudor.ambarus@microchip.com, kvalo@kernel.org,
 johan@kernel.org, rmfrfs@gmail.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, han.xu@nxp.com, venture@google.com,
 nicolas.ferre@microchip.com, fancer.lancer@gmail.com,
 krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, pratyush@kernel.org,
 openbmc@lists.ozlabs.org, daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH v2 06/13] staging: Replace all
 spi->chip_select and spi->cs_gpiod references with function call
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

On Fri, Jan 20, 2023 at 12:23:35AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
