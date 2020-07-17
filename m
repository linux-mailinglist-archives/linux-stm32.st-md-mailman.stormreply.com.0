Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DED0A223B9A
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jul 2020 14:49:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80EB9C36B37;
	Fri, 17 Jul 2020 12:49:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 637F1C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 12:48:59 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23D9120829;
 Fri, 17 Jul 2020 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594990138;
 bh=+V25eAigqJyAqO3qU/I8EgowzZWhl5WGU8izIKEiQ9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LbwEQxU9cdujhtKlnV1pohpNhS1NKLX8UzTqFIE28aoEIc3vlYCZlhpj712m3fQq1
 HuRQJcmCyOgC6eM2fekBmtsvbo4GLTkzlVZPx69M0dq2g4qfThKit1PXOATE3ke0wZ
 Cm6ypytpMHx7JtChNKi4+Oq8HNecbNQ7HY1ulOVM=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jwPnM-00Ccsm-MR; Fri, 17 Jul 2020 13:48:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>,
 Wei Yongjun <weiyongjun1@huawei.com>, Hulk Robot <hulkci@huawei.com>
Date: Fri, 17 Jul 2020 13:48:47 +0100
Message-Id: <159499001592.546505.12368103656173164713.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714142245.16124-1-weiyongjun1@huawei.com>
References: <20200714142245.16124-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net,
 tglx@linutronix.de, weiyongjun1@huawei.com, hulkci@huawei.com,
 linux-kernel@vger.kernel.org, marex@denx.de,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: marex@denx.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH -next] irqchip: mips-gic: Make some
	symbols static
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

On Tue, 14 Jul 2020 22:22:45 +0800, Wei Yongjun wrote:
> The sparse tool complains as follows:
> 
> drivers/irqchip/irq-mips-gic.c:49:1: warning:
>  symbol '__pcpu_scope_pcpu_masks' was not declared. Should it be static?
> drivers/irqchip/irq-mips-gic.c:620:6: warning:
>  symbol 'gic_ipi_domain_free' was not declared. Should it be static?
> drivers/irqchip/irq-mips-gic.c:634:5: warning:
>  symbol 'gic_ipi_domain_match' was not declared. Should it be static?
> 
> [...]

Applied to irq/irqchip-5.9, thanks!

[1/1] irqchip/mips-gic: Make local symbols static
      commit: 63bf3444359c94d647c2afa79b5e732585469581

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
