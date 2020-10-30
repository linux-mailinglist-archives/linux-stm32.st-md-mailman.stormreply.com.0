Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7243B2A253F
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Nov 2020 08:32:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2222FC36B35;
	Mon,  2 Nov 2020 07:32:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43267C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 07:46:31 +0000 (UTC)
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EF0320719;
 Fri, 30 Oct 2020 07:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604043989;
 bh=XbzJCs+1Vbu1sG68hX1A1BQWrwJAMbx09Z0EixXEc0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mVO09EOEVQDhIxqmOhZvn3m9RP1yKZhwB2NqZzP00ErBPlqSxU8VLeGJL+iVw4kbj
 DewkGZl/M3Nti9Ore8fBGWeevRbV3MJC+iGEhas49jvcEG/fLOnj8t5ple5dCiw5BW
 P1ipVg/apt56gRauVDsYN2Vz7SHtae83kdV+RQZ8=
Date: Fri, 30 Oct 2020 15:46:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20201030074616.GI28755@dragon>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-9-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-9-post@lespocky.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 02 Nov 2020 07:32:20 +0000
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, Alexander Dahl <ada@thorsis.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 08/12] ARM: dts: imx: Fix schema
	warnings for pwm-leds
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

On Mon, Oct 05, 2020 at 10:34:47PM +0200, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     arch/arm/boot/dts/imx53-ppd.dt.yaml
>   CHECK   arch/arm/boot/dts/imx53-ppd.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx53-ppd.dt.yaml: leds-brightness: 'alarm-brightness' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml: pwmleds: 'blue', 'green', 'red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>

Applied, thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
