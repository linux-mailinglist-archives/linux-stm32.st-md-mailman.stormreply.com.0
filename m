Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF4C6B60E9
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Mar 2023 22:17:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52CB8C6A60C;
	Sat, 11 Mar 2023 21:17:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5C86C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 21:17:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8AE6CB80B47;
 Sat, 11 Mar 2023 21:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B025C433A8;
 Sat, 11 Mar 2023 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678569432;
 bh=nxjIZb2lDBuKK2G4lNzbnKP45y5UoeG95pRVo5INiRE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bvzKGPqJVg2bAaBl8LvuSNq4FE4F8OHaj0dxY1RmvBRvrUteeh49EnCBFgpLpsimi
 X9QjmQX5ru5ARgvQanZf4uxwTdtbSXJBvWNRv/d86I7owOd9TPANApjMIEt8UOom/V
 rlpKM3DSWdmGVC5sTOOGKI7C35EJY3xqnU9SQBlbwRy+sPkyfeO2xcIoXPdhr3KG5S
 maSO5XBX1iOLzTj27xMUWw1Z5Arz1xysQ8bAZkDXGqorBZ3q1BRVnKovYh/ImB0NqZ
 5jPOxe6cAx/K/KlowItsOB1tQgOaqn0wX00B/jAga6Qsnzqoh25kwlapaLa6EQAQNP
 eT/NzyqjKOROw==
From: Mark Brown <broonie@kernel.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 jic23@kernel.org, pratyush@kernel.org, Sanju.Mehta@amd.com, 
 chin-ting_kuo@aspeedtech.com, clg@kaod.org, kdasu.kdev@gmail.com, 
 f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, 
 eajames@linux.ibm.com, olteanv@gmail.com, han.xu@nxp.com, 
 john.garry@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 khilman@baylibre.com, matthias.bgg@gmail.com, haibo.chen@nxp.com, 
 linus.walleij@linaro.org, daniel@zonque.org, haojian.zhuang@gmail.com, 
 robert.jarzmik@free.fr, agross@kernel.org, heiko@sntech.de, 
 krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, masahisa.kojima@linaro.org, jaswinder.singh@linaro.org, 
 rostedt@goodmis.org, mingo@redhat.com, l.stelmach@samsung.com, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
 pabeni@redhat.com, alex.aring@gmail.com, stefan@datenfreihafen.org, 
 kvalo@kernel.org, james.schulman@cirrus.com, david.rhodes@cirrus.com, 
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com, perex@perex.cz, 
 tiwai@suse.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
 mpe@ellerman.id.au, oss@buserror.net, windhl@126.com, 
 yangyingliang@huawei.com, william.zhang@broadcom.com, 
 kursad.oney@broadcom.com, jonas.gorski@gmail.com, anand.gore@broadcom.com, 
 rafal@milecki.pl, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
In-Reply-To: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
References: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
Message-Id: <167856940280.964268.10660159170818600511.b4-ty@kernel.org>
Date: Sat, 11 Mar 2023 21:16:42 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-2eb1a
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 konrad.dybcio@somainline.org, alsa-devel@alsa-project.org,
 tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org,
 alim.akhtar@samsung.com, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com,
 linux-samsung-soc@vger.kernel.org, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org, jonathanh@nvidia.com,
 yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 radu_nicolae.pirea@upb.ro, linuxppc-dev@lists.ozlabs.org, lars@metafoo.de,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 avifishman70@gmail.com, venture@google.com, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au,
 michael@walle.cc, thierry.reding@gmail.com, palmer@dabbelt.com,
 kernel@pengutronix.de, netdev@vger.kernel.org, patches@opensource.cirrus.com,
 linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Subject: Re: [Linux-stm32] (subset) [PATCH V6 00/15] Add support for
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

On Fri, 10 Mar 2023 23:02:02 +0530, Amit Kumar Mahapatra wrote:
> This patch is in the continuation to the discussions which happened on
> 'commit f89504300e94 ("spi: Stacked/parallel memories bindings")' for
> adding dt-binding support for stacked/parallel memories.
> 
> This patch series updated the spi-nor, spi core and the spi drivers
> to add stacked and parallel memories support.
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[01/15] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: 9e264f3f85a56cc109cc2d6010a48aa89d5c1ff1
[02/15] net: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: 25fd0550d9b9c92288a17fb7d605cdcdb4a65a64
[03/15] iio: imu: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: 0183f81fce154ae1d4df2bb28d22ad6612317148
[04/15] mtd: devices: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: 0817bcef53e4e3df23c023eddaa2b35b7288400e
[05/15] staging: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: caa9d3475b1c5566f0272273c147cc9b72f2be28
[06/15] platform/x86: serial-multi-instantiate: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: e20451f44ca33ec40422e9868775e117ef2da935
[07/15] powerpc/83xx/mpc832x_rdb: Replace all spi->chip_select references with function call
        commit: 3aba06a9fee04f6fefa9df71d3ee27dd4c464ad5
[08/15] ALSA: hda: cs35l41: Replace all spi->chip_select references with function call
        commit: 06b5e53c8b2b016e06a53ab6f01006ca7bbfa5df

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
