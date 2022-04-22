Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CF650BBC3
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 17:37:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88EBEC6049A;
	Fri, 22 Apr 2022 15:37:28 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58E7FC6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 15:37:27 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nhvLN-0000qE-AP; Fri, 22 Apr 2022 17:37:13 +0200
Message-ID: <3d5969cc-2210-3c7c-01c8-3f5c3789e54b@pengutronix.de>
Date: Fri, 22 Apr 2022 17:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, arnd@arndb.de,
 robh+dt@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 soc@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-6-alexandre.torgue@foss.st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20220422150952.20587-6-alexandre.torgue@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 etienne.carriere@st.com, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/8] ARM: stm32: select OPTEE on MPU family
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

Hello Alex,

On 22.04.22 17:09, Alexandre Torgue wrote:
> Select CONFIG_OPTEE for STM32MP15 and STM32MP13 by default. Final
> activation will done thanks to device tree.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
> index 98145031586f..b322cf2a136f 100644
> --- a/arch/arm/mach-stm32/Kconfig
> +++ b/arch/arm/mach-stm32/Kconfig
> @@ -6,6 +6,8 @@ menuconfig ARCH_STM32
>  	select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
>  	select ARM_GIC if ARCH_MULTI_V7
>  	select ARM_PSCI if ARCH_MULTI_V7
> +	select TEE if ARCH_MULTI_V7
> +	select OPTEE if ARCH_MULTI_V7

Users may want to use OPTEE as a module without it being a SCMI provider
or not use OPTEE at all. I'd prefer you drop this patch and leave it
to users to configure their kernel appropriately.

Cheers,
Ahmad


>  	select ARM_AMBA
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select CLKSRC_STM32




-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
