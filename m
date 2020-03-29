Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A5197117
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2020 01:36:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5E3BC36B0B;
	Sun, 29 Mar 2020 23:36:38 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECA51C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Mar 2020 23:36:36 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rBnD51Mwz1rlhj;
 Mon, 30 Mar 2020 01:36:32 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rBnD2Smhz1qqkB;
 Mon, 30 Mar 2020 01:36:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id tu7qrZhZFbeu; Mon, 30 Mar 2020 01:36:31 +0200 (CEST)
X-Auth-Info: TuBlfyg55OdrcAq2t30Y8Fj8aDbl6+CnTBYSKAxGkzg=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 30 Mar 2020 01:36:31 +0200 (CEST)
To: Christophe Kerello <christophe.kerello@st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 tony@atomide.com
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-3-git-send-email-christophe.kerello@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a989ce31-740d-8f0f-4c55-026c65259104@denx.de>
Date: Mon, 30 Mar 2020 01:36:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584975532-8038-3-git-send-email-christophe.kerello@st.com>
Content-Language: en-US
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [02/12] mfd: stm32-fmc2: add STM32 FMC2
	controller driver
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

On 3/23/20 3:58 PM, Christophe Kerello wrote:
> The driver adds the support for the STMicroelectronics FMC2 controller
> found on STM32MP SOCs.
> 
> The FMC2 functional block makes the interface with: synchronous and
> asynchronous static memories (such as PSNOR, PSRAM or other
> memory-mapped peripherals) and NAND flash memories.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
[...]
> +static const struct of_device_id stm32_fmc2_match[] = {
> +	{.compatible = "st,stm32mp1-fmc2"},

stm32mp151.dtsi uses "st,stm32mp15-fmc2" compatible string for FMC (with
extra "5" in the string).

> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, stm32_fmc2_match);
> +
> +static struct platform_driver stm32_fmc2_driver = {
> +	.probe	= stm32_fmc2_probe,
> +	.driver	= {
> +		.name = "stm32_fmc2",
> +		.of_match_table = stm32_fmc2_match,
> +		.pm = &stm32_fmc2_pm_ops,
> +	},
> +};
> +module_platform_driver(stm32_fmc2_driver);
[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
