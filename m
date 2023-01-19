Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A96526737DE
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jan 2023 13:06:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57B3EC6904C;
	Thu, 19 Jan 2023 12:06:33 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F2FEC69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 12:06:31 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1pITgU-0001is-CQ; Thu, 19 Jan 2023 13:06:22 +0100
Message-ID: <729c4be6-00f7-4b88-235e-0e9bdeed3e5f@pengutronix.de>
Date: Thu, 19 Jan 2023 13:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20230118172940.841094-1-patrick.delaunay@foss.st.com>
 <20230118182856.v6.1.I167a5efc1f8777cce14518c6fa38400ac684de3e@changeid>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20230118182856.v6.1.I167a5efc1f8777cce14518c6fa38400ac684de3e@changeid>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Etienne CARRIERE <etienne.carriere@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 1/3] ARM: dts: stm32mp13: fix
 compatible for BSEC
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

On 18.01.23 18:29, Patrick Delaunay wrote:
> Use the correct compatible for stm32mp13 support.
> 
> The BSEC driver for STM32MP15x is not compatible with STM32MP13x. For
> example the proprietary's smc STM32_SMC_BSEC is not supported in
> STM32MP13x OP-TEE, it is replaced by SM32MP BSEC Pseudo Trusted
> Application in OP-TEE to access to the secured IP BSEC on STM32MP13X SoC.
> 
> The correct compatible is already used in U-Boot and in upstream is in
> progress for OP-TEE device tree.
> 
> As the SoC STM32MP13X is not yet official and it is not available
> outside STMicroelectronics, it is the good time to break the DTS
> compatibility and to correct the error done in the introduction of
> STM32MP131.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
> This patch is already sent separately in:
> https://lore.kernel.org/all/20221017134437.1.I167a5efc1f8777cce14518c6fa38400ac684de3e@changeid/
> https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=685815
> 
> I create a serie for more efficient review.
> 
> Patrick.
> 
> (no changes since v1)
> 
> Changes in v1:
> - update commit message to indicate DTS break reason.
> 
>  arch/arm/boot/dts/stm32mp131.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
> index accc3824f7e9..0b79380cc627 100644
> --- a/arch/arm/boot/dts/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/stm32mp131.dtsi
> @@ -520,7 +520,7 @@ rtc: rtc@5c004000 {
>  		};
>  
>  		bsec: efuse@5c005000 {
> -			compatible = "st,stm32mp15-bsec";
> +			compatible = "st,stm32mp13-bsec";
>  			reg = <0x5c005000 0x400>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
