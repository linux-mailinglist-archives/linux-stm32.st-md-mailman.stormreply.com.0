Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8361223FF90
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Aug 2020 19:41:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B531C36B26;
	Sun,  9 Aug 2020 17:41:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 179B1C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Aug 2020 17:41:06 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1k4pJh-00024Q-Fk; Sun, 09 Aug 2020 19:41:05 +0200
To: Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200809164450.289731-1-marcin.sloniewski@gmail.com>
 <20200809164450.289731-3-marcin.sloniewski@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <73c2439a-0250-4010-ad5d-601ac9f4b7df@pengutronix.de>
Date: Sun, 9 Aug 2020 19:40:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200809164450.289731-3-marcin.sloniewski@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: robh@kernel.org, kuninori.morimoto.gx@renesas.com, arnd@arndb.de,
 mani@kernel.org, allen.chen@ite.com.tw, linus.walleij@linaro.org,
 daniel@0x0f.com, linux-kernel@vger.kernel.org, lkundrak@v3.sk,
 devicetree@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 mcoquelin.stm32@gmail.com, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v7 3/3] ARM: dts: stm32: add initial
 support for stm32mp157-odyssey board
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

Hello Marcin,

On 8/9/20 6:44 PM, Marcin Sloniewski wrote:
> Add support for Seeed Studio's stm32mp157c odyssey board.
> Board consists of SoM with stm32mp157c with 4GB eMMC and 512 MB DDR3 RAM
> and carrier board with USB and ETH interfaces, SD card connector,
> wifi and BT chip AP6236.
> 
> In this patch only basic kernel boot is supported and interfacing
> SD card and on-board eMMC.
> 
> Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---

> +
> +&rng1 {
> +	status = "okay";
> +};

I think we should put this into the SoC dtsi instead.

Cheers
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
