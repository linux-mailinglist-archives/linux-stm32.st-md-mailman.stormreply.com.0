Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F532A7F8C7
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 11:00:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8C25C7803B;
	Tue,  8 Apr 2025 09:00:24 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEBBAC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 09:00:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1u24nS-0001k3-Nf; Tue, 08 Apr 2025 10:59:06 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1u24nR-003tta-2c;
 Tue, 08 Apr 2025 10:59:05 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1u24nR-0003e6-2L;
 Tue, 08 Apr 2025 10:59:05 +0200
Message-ID: <710569e305924a0a84e9792bc779d37a24011477.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Patrice Chotard <patrice.chotard@foss.st.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>
Date: Tue, 08 Apr 2025 10:59:05 +0200
In-Reply-To: <20250407-upstream_ospi_v6-v8-3-7b7716c1c1f6@foss.st.com>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250407-upstream_ospi_v6-v8-3-7b7716c1c1f6@foss.st.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 3/7] memory: Add STM32 Octo Memory
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

On Mo, 2025-04-07 at 15:27 +0200, Patrice Chotard wrote:
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
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  drivers/memory/Kconfig     |  17 ++
>  drivers/memory/Makefile    |   1 +
>  drivers/memory/stm32_omm.c | 474 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 492 insertions(+)
> 
[...]
> diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..db50aeffb0aa32a9d51a205d8ba30ab2299e1c34
> --- /dev/null
> +++ b/drivers/memory/stm32_omm.c
> @@ -0,0 +1,474 @@
[...]
> +static int stm32_omm_disable_child(struct device *dev)
> +{
> +	static const char * const resets_name[] = {"ospi1", "ospi2"};
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	struct reset_control *reset;
> +	int ret;
> +	u8 i;
> +
> +	ret = stm32_omm_toggle_child_clock(dev, true);
> +	if (!ret)
> +		return ret;
> +
> +	for (i = 0; i < omm->nb_child; i++) {
> +		reset = reset_control_get_exclusive(dev, resets_name[i]);
> +		if (IS_ERR(reset)) {
> +			dev_err(dev, "Can't get %s reset\n", resets_name[i]);
> +			return PTR_ERR(reset);
> +		};
> +
> +		/* reset OSPI to ensure CR_EN bit is set to 0 */
> +		reset_control_assert(reset);
> +		udelay(2);
> +		reset_control_deassert(reset);
> +
> +		reset_control_put(reset);

With this reset_control_put(), you are effectively stating that you
don't care about the state of the reset line after this point. To
guarantee the reset line stays deasserted, the driver should keep the
reset control around.

Are you requesting and dropping the reset controls here so the child
drivers can request them at some point? If so, there is an
acquire/relase mechanism for this:

https://docs.kernel.org/driver-api/reset.html#c.reset_control_acquire

Either way, reset_control_get/put() belong in probe/remove.

regards
Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
