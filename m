Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BE429D1AD
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Oct 2020 20:21:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51FADC3FAD5;
	Wed, 28 Oct 2020 19:21:33 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C27E4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 19:21:30 +0000 (UTC)
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7BCB2200002;
 Wed, 28 Oct 2020 19:21:28 +0000 (UTC)
Date: Wed, 28 Oct 2020 20:21:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Message-ID: <20201028192128.GF12276@piout.net>
References: <20201005203451.9985-1-post@lespocky.de>
 <160391135997.385141.5554228268638639718.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160391135997.385141.5554228268638639718.b4-ty@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 00/12] leds: pwm: Make automatic labels
	work
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

On 28/10/2020 19:56:14+0100, Alexandre Belloni wrote:
> On Mon, 5 Oct 2020 22:34:39 +0200, Alexander Dahl wrote:
> > Hei hei,
> > 
> > for leds-gpio you can use the properties 'function' and 'color' in the
> > devicetree node and omit 'label', the label is constructed
> > automatically.  This is a common feature supposed to be working for all
> > LED drivers.  However it did not work until recently for the 'leds-pwm'
> > driver.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] ARM: dts: at91: smartkiz: Reference led node directly
>       commit: 02e46262af5db410da5a27783833d68e2bdfb352
> [2/2] ARM: dts: at91: Fix schema warnings for pwm-leds
>       commit: 997ebd64df39f3916c37ca67a6eff58e79a13c73

This was obviously 04/12 and 05/12.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
