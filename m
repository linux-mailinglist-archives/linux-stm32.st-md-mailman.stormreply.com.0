Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AD622D808
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jul 2020 16:23:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73A99C36B31;
	Sat, 25 Jul 2020 14:23:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91D4DC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jul 2020 14:23:51 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F75F206F6;
 Sat, 25 Jul 2020 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595687030;
 bh=K8eQKo/ooJEYllYc1D6lrTuvaWFhKPi1kgxIPYbm6Uk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nda//3GNs5Gmu5fOmbSyeMV7crqVhat8Qa4aBtyMc5NTnJLqbIkS7ypUUbFAsAfhZ
 e4oz5AzLaLw1qMk9f0m5RhzKusTWdhrkkz5jJrh5OJDXU6nqMsDCk/GcA3NWCvxE5w
 rr0rJHBv2Qo2rG4U+tfZgEQi7ZFz3Q2iUSeyTsyY=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jzL5Y-00Er45-T2; Sat, 25 Jul 2020 15:23:49 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Cooper <jason@lakedaemon.net>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
Date: Sat, 25 Jul 2020 15:23:32 +0100
Message-Id: <159568680935.564881.9348186687295849677.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724184157.29150-1-f.fainelli@gmail.com>
References: <20200724184157.29150-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, alexandre.torgue@st.com,
 tglx@linutronix.de, f.fainelli@gmail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, marex@denx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 lkp@intel.com, justinpopo6@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 linux-mips@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: marex@denx.de, kernel test robot <lkp@intel.com>,
 "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>,
 linux-gpio@vger.kernel.org, "open list:BROADCOM BMIPS MIPS ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, Justin Chen <justinpopo6@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] irqchip/irq-bcm7038-l1: Guard uses of
	cpu_logical_map
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

On Fri, 24 Jul 2020 11:41:56 -0700, Florian Fainelli wrote:
> cpu_logical_map is only defined for CONFIG_SMP builds, when we are in an
> UP configuration, the boot CPU is 0.

Applied to irq/irqchip-5.9, thanks!

[1/1] irqchip/irq-bcm7038-l1: Guard uses of cpu_logical_map
      commit: 29a190b6a2bd9ef4282e2f73e7abd76203740150

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
