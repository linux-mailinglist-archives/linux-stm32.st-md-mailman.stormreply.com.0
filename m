Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F580724EEB
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 23:42:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE6F8C6905A;
	Tue,  6 Jun 2023 21:42:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C66A7C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 21:42:15 +0000 (UTC)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686087735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6PcfXqgkRAFVRmbupkXph6bVSIl668fEjh7jlXGINRk=;
 b=jJIHXvc/7cRINmR3iDHISsS4zx8ryuhgjIZOzgfVu4MiAPnJUjCPgXAicAI3aGkO3TLW/h
 b4gdgeiicQBF7fFAG850bd9/0pX6ImVOfIdRN5QLQ/RK9x5e4jAM0eh+4b8erY+pvFSDlE
 mEQask8SWaEBt5Z67/0U6OnmLliHnWx255pkBkHGgZ+kAQ+3ulHha5r4Ab3EJMIkwltOMq
 Be2EaRMg21RAI9c2uHcFb+xlBre41sBtbMAR3yr1SIsyndCN0/j6e6N7ETOBP0VzJCaPwM
 zY9nxGFW+wy/oDZyR8yo3qIPh79UInGvDwY9PS9qQDgHuTU3Joaeft9nbKo93g==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD424FF802;
 Tue,  6 Jun 2023 21:42:14 +0000 (UTC)
Date: Tue, 6 Jun 2023 23:42:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <168608768267.37577.7065576834191404106.b4-ty@bootlin.com>
References: <20230531122732.1515594-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230531122732.1515594-1-amelie.delaunay@foss.st.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: remove dedicated wakeup
	management
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


On Wed, 31 May 2023 14:27:31 +0200, Amelie Delaunay wrote:
> There is no more needs to use a dedicated wake up interrupt for RTC as
> EXTI block manages by itself now all interrupt lines.
> 
> Dedicated wakeup interrupt has been introduced with STM32 MP1 support
> commit b72252b6580c ("rtc: stm32: add stm32mp1 rtc support") because GIC &
> EXTI interrupts were not yet linked in EXTI driver.
> 
> [...]

Applied, thanks!

[1/1] rtc: stm32: remove dedicated wakeup management
      commit: 38e0689b27f8b9a0085815b2446b12f685d028aa

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
