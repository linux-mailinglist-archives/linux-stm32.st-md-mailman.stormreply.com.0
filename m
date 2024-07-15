Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B51CE931C76
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2024 23:12:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5592FC6DD66;
	Mon, 15 Jul 2024 21:12:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9274C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2024 21:12:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27A70FF803;
 Mon, 15 Jul 2024 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1721077937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PrFsaEY3YFVMERSSxHwPf6/7rkdQhgSWQ843FPXb6VM=;
 b=ZBKx2m7QZN1wibY9E26Du5teUQrGS6KveFuXrHhyhD5Pq/PNKteH13nR6Vm6Zyc0jFXUi1
 Ac/u8zVk8E7U0h25euNwSPZKva97q6TrnO/87Wp5bxLf1xYuzdNyrvr33Sfrxc0Ua6jInH
 0W49CA1vq/OeH7PRcgK9U9asubq8oTaq/4naZR/Wk1px6FIZpF+NgESEjCkXjoNeYNlWnA
 ZsnAZMEVSk0dOo3YTq2qDPWrzaI9vXy0nS+2JAZUzUscTH8ZbXJ9HBC6ZK84xi+WoHHqxt
 WQb4Lc2807kqw4QBnUD8jcD2x2VL2jBI/SPYMaC4kDA495T6XqUeuoxI4nsTmA==
Date: Mon, 15 Jul 2024 23:12:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <2024071521121650db391a@mail.local>
References: <20240711140843.3201530-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711140843.3201530-1-valentin.caron@foss.st.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] rtc: stm32: add pinctrl interface to
	handle RTC outs
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

Hello,

On 11/07/2024 16:08:39+0200, Valentin Caron wrote:
> This series adds a pinctrl/pinmux interface to control STM32 RTC outputs.
> 
> Theses two signals output are possible:
>  - LSCO (Low Speed Clock Output) that allow to output LSE clock on a pin.
>    On STM32MPU Discovery boards, this feature is used to generate a clock
>    to Wifi/Bluetooth module.
>  - Alarm out that allow to send a pulse on a pin when alarm A of the RTC
>    expires.
> 
> First attempt [1] was based on 'st,' vendor properties, this one is based
> on pinctrl and pinmux framework.
> 
> As device-trees will be upstreamed separately, here is an example:
> 
> stm32-pinctrl {
>     rtc_rsvd_pins_a: rtc-rsvd-0 {
>         pins {
>             pinmux = <STM32_PINMUX('B', 2, AF1)>, /* OUT2 */
>                      <STM32_PINMUX('I', 8, ANALOG)>; /* OUT2_RMP */
>         };
>     };
> };
> 
> stm32-rtc {
>     pinctrl-0 = <&rtc_rsvd_pins_a &rtc_alarma_pins_a>;
> 
>     /* Enable by foo-device */
>     rtc_lsco_pins_a: rtc-lsco-0 {
>         pins = "out2_rmp";
>         function = "lsco";
>     };
> 
>     /* Enable by stm32-rtc hog */
>     rtc_alarma_pins_a: rtc-alarma-0 {
>         pins = "out2";
>         function = "alarm-a";
>     };
> };
> 
> foo-device {
>     pinctrl-0 = <&rtc_lsco_pins_a>;
> };
> 

This all seems good to me, I let you fix the various issues that have
been reported. I was just wondering whether the LSCO clock was registered
early enough to be used but I guess you tested that.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
