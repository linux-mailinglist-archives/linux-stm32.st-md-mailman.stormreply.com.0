Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CC8A20717
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 10:18:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 261FFC78032;
	Tue, 28 Jan 2025 09:18:24 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D35C3C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 09:18:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1tchjI-0002II-Ly; Tue, 28 Jan 2025 10:17:56 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tchjH-002Gpb-1q;
 Tue, 28 Jan 2025 10:17:55 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tchjH-0001lT-1Y;
 Tue, 28 Jan 2025 10:17:55 +0100
Message-ID: <3d6cfb082ef8ee0fc66c885a84f64ae0a851234b.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: patrice.chotard@foss.st.com, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Tue, 28 Jan 2025 10:17:55 +0100
In-Reply-To: <20250128081731.2284457-5-patrice.chotard@foss.st.com>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-5-patrice.chotard@foss.st.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/9] memory: Add STM32 Octo Memory
	Manager driver
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

On Di, 2025-01-28 at 09:17 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Octo Memory Manager driver (OMM) manages:
>   - the muxing between 2 OSPI busses and 2 output ports.
>     There are 4 possible muxing configurations:
>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>         output is on port 2
>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>         OSPI2 output is on port 1
>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>   - the split of the memory area shared between the 2 OSPI instances.
>   - chip select selection override.
>   - the time between 2 transactions in multiplexed mode.
>   - check firewall access.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  drivers/memory/Kconfig     |  17 ++
>  drivers/memory/Makefile    |   1 +
>  drivers/memory/stm32_omm.c | 509 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 527 insertions(+)
>  create mode 100644 drivers/memory/stm32_omm.c
> 
[...]
> diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
> new file mode 100644
> index 000000000000..6f20fe0183ec
> --- /dev/null
> +++ b/drivers/memory/stm32_omm.c
> @@ -0,0 +1,509 @@
[...]
> +static int stm32_omm_configure(struct device *dev)
> +{
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	struct reset_control *rstc;
> +	unsigned long clk_rate, clk_rate_max = 0;
> +	int ret;
> +	u8 i;
> +	u32 mux = 0;
> +	u32 cssel_ovr = 0;
> +	u32 req2ack = 0;
> +
> +	omm->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(omm->clk)) {
> +		dev_err(dev, "Failed to get OMM clock (%ld)\n",
> +			PTR_ERR(omm->clk));
> +
> +		return PTR_ERR(omm->clk);
> +	}
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* parse children's clock */
> +	for (i = 0; i < omm->nb_child; i++) {
> +		clk_rate = clk_get_rate(omm->child[i].clk);
> +		if (!clk_rate) {
> +			dev_err(dev, "Invalid clock rate\n");
> +			goto err_clk_disable;
> +		}
> +
> +		if (clk_rate > clk_rate_max)
> +			clk_rate_max = clk_rate;
> +	}
> +
> +	rstc = devm_reset_control_get_optional(dev, NULL);

Please use devm_reset_control_get_optional_exclusive() directly.

regards
Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
