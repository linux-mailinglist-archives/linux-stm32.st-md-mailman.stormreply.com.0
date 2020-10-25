Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE9B298190
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Oct 2020 13:06:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CF5DC32EB6;
	Sun, 25 Oct 2020 12:06:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A008FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Oct 2020 12:06:30 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACF3F22202;
 Sun, 25 Oct 2020 12:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603627588;
 bh=nUS2kYGYuhzsne/r04hu9MAGBT2diuzU21HdRmbbVqg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PYj+khaNLYyL3OTVke9xc2SyeZgh8R0qQFdpGJRvgnqu1fKnl4aXO9GIFN9MbC72H
 4czmgTFqOpn36EB/108Kg4Eikqx9YJpBiIebtuNE2m9usdO9Y+clR9SsmwA5nPZLtE
 OVG/DTfU9xGYDbZJOAKLwsU5yaEPC07WVOOZikbw=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kWen4-0043Ku-Sg; Sun, 25 Oct 2020 12:06:26 +0000
From: Marc Zyngier <maz@kernel.org>
To: tglx@linutronix.de, alexandre.torgue@st.com,
 Fabrice Gasnier <fabrice.gasnier@st.com>, jason@lakedaemon.net
Date: Sun, 25 Oct 2020 12:06:23 +0000
Message-Id: <160362752949.263598.6286411876181120842.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1602859219-15684-1-git-send-email-fabrice.gasnier@st.com>
References: <1602859219-15684-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tglx@linutronix.de, alexandre.torgue@st.com,
 fabrice.gasnier@st.com, jason@lakedaemon.net, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/3] Add STM32 LP timer EXTI interrupts
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

On Fri, 16 Oct 2020 16:40:16 +0200, Fabrice Gasnier wrote:
> STM32 LP timer that's available on STM32MP15x can wakeup the platform
> using EXTI interrupts.
> 
> This series add:
> - LP timer EXTI - GIC interrupt events to EXTI driver and device-tree
> - LP timer wakeup-source to device-tree
> 
> [...]

Applied to irq/irqchip-next, thanks!

[1/3] irqchip/stm32-exti: Add all LP timer exti direct events support
      commit: a00e85b581fd5ee47e770b6b8d2038dbebbe81f9

Please route the last two patches via arm-soc.

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
