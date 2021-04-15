Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE5736075A
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 12:43:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 479D5C57B79;
	Thu, 15 Apr 2021 10:43:16 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4209C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 10:43:12 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1lWzSn-0005Vb-Hb; Thu, 15 Apr 2021 12:43:09 +0200
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, arnd@arndb.de,
 robh+dt@kernel.org, Marek Vasut <marex@denx.de>, jagan@amarulasolutions.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-13-alexandre.torgue@foss.st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <ececc78c-4fca-bb93-ef62-5d107501d963@pengutronix.de>
Date: Thu, 15 Apr 2021 12:43:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210415101037.1465-13-alexandre.torgue@foss.st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 12/13] ARM: dts: stm32: fix DSI port node
	on STM32MP15
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

Hi,

On 15.04.21 12:10, Alexandre Torgue wrote:
> Running "make dtbs_check W=1", some warnings are reported concerning
> DSI. This patch reorder DSI nodes to avoid:
> 
> soc/dsi@5a000000: unnecessary #address-cells/#size-cells without
> "ranges" or child "reg" property

This reverts parts of commit 9c32f980d9 ("ARM: dts: stm32: preset
stm32mp15x video #address- and #size-cells"):
    
    The cell count for address and size is defined by the binding and not
    something a board would change. Avoid each board adding this
    boilerplate by having the cell size specification in the SoC DTSI.
    

The DSI can have child nodes with a unit address (e.g. a panel) and ones
without (ports { } container). ports is described in the dtsi, panels are
described in the dts if available.

Apparently, the checker is fine with
ports {
	#address-cells = <1>;
	#size-cells = <0>;
};

I think my rationale for the patch above was sound, so I think the checker
taking offense at the DSI cells here should be considered a false positive.

Thanks,
Ahmad

> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/arch/arm/boot/dts/stm32mp157.dtsi b/arch/arm/boot/dts/stm32mp157.dtsi
> index 54e73ccea446..c355fcf26ec3 100644
> --- a/arch/arm/boot/dts/stm32mp157.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157.dtsi
> @@ -24,8 +24,6 @@
>  			clock-names = "pclk", "ref", "px_clk";
>  			resets = <&rcc DSI_R>;
>  			reset-names = "apb";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> index 19ef475a48fc..763dde1dbbaf 100644
> --- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> @@ -36,6 +36,8 @@
>  &dsi {
>  	status = "okay";
>  	phy-dsi-supply = <&reg18>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  
>  	ports {
>  		port@0 {
> diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> index 6fe5b0fee7c4..4625bb58cc6d 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> @@ -102,6 +102,8 @@
>  &dsi {
>  	phy-dsi-supply = <&reg18>;
>  	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  
>  	ports {
>  		port@0 {
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
