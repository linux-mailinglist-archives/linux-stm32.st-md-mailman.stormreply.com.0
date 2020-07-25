Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1522D805
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jul 2020 16:23:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BBE2C36B27;
	Sat, 25 Jul 2020 14:23:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90286C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jul 2020 14:23:51 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0680206C1;
 Sat, 25 Jul 2020 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595687029;
 bh=gHxfx7OPA5x5BkafsPOgmHBkYQoEY8AtzlacoZATrgI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mIY3s6DgqCJR2qfz8vcX2kJNJyqa2lni/ckRLWoCpJnVdyurtu2fhvgfsEcaSNMQB
 Ol3h0U3qH+GlX8O6Pjjac6BEDawEUChJ2GdTt6TZ76Udy654eqiOud+XfR5Qe9kMe9
 /5vpJDxMeqLeQYM8P52aY++l+FmyAkuaMihkkE4Y=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jzL5Y-00Er45-96; Sat, 25 Jul 2020 15:23:48 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Cooper <jason@lakedaemon.net>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Thomas Gleixner <tglx@linutronix.de>
Date: Sat, 25 Jul 2020 15:23:31 +0100
Message-Id: <159568680935.564881.645108348883393903.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717140717.29606-1-alexandre.torgue@st.com>
References: <20200717140717.29606-1-alexandre.torgue@st.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, alexandre.torgue@st.com,
 tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 marex@denx.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: marex@denx.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] irqchip/stm32-exti: map direct event
	to irq parent
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

On Fri, 17 Jul 2020 16:07:17 +0200, Alexandre Torgue wrote:
> EXTI lines are mainly used to wake-up system from CStop low power mode.
> Currently, if a device wants to use a EXTI (direct) line as wakeup line,
> it has to declare 2 interrupts:
>  - one for EXTI used to wake-up system (with dedicated_wake_irq api).
>  - one for GIC used to get the wake up reason inside the concerned IP.
> 
> This split is not really needed as each EXTI line is actually "linked " to
> a GIC. So to avoid this useless double interrupt management in each
> wake-up driver, this patch lets the STM32 EXTI driver abstract it by
> mapping each EXTI line to his corresponding GIC.

Applied to irq/irqchip-5.9, thanks!

[1/1] irqchip/stm32-exti: map direct event to irq parent
      commit: 99e05524bc722c8d3c1ab9c817afcb6829dbded3

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
