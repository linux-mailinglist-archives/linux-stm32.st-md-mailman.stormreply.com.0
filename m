Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E9B223B97
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jul 2020 14:49:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53713C36B2D;
	Fri, 17 Jul 2020 12:49:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1784AC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 12:48:57 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF41120768;
 Fri, 17 Jul 2020 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594990135;
 bh=F6eEgVp0U4T1SirH3j5XNkxHKxWH25GXK+ol/tUBod0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rgBLivDNtaFi8UBruKjJEjKbAkOYpU0MmhU5ikrjEZsHfru/d1LxjuOUA6T/GYAsQ
 ps+VxKdUfxeto/Ubw/4fJE31A81ojxPgd88rSEiuHbfB+By0mtczTGZhEDPAT7UmNQ
 zZfP9010at2XK/8Yber/8DNkHP9AO+2BWJfUrK9g=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jwPnK-00Ccsm-DG; Fri, 17 Jul 2020 13:48:54 +0100
From: Marc Zyngier <maz@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 17 Jul 2020 13:48:44 +0100
Message-Id: <159499001591.546505.10547196907819467000.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709234141.4901-1-f.fainelli@gmail.com>
References: <20200709234141.4901-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net,
 tglx@linutronix.de, linux-kernel@vger.kernel.org, f.fainelli@gmail.com,
 marex@denx.de, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: marex@denx.de,
 "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>,
 linux-gpio@vger.kernel.org, "open list:BROADCOM BMIPS MIPS ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] irqchip/irq-bcm7038-l1: Allow building on
	ARM 32-bit
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

On Thu, 9 Jul 2020 16:41:41 -0700, Florian Fainelli wrote:
> We need to have a definition for cpu_logical_map[] which on ARM
> platforms is provided by asm/smp_plat.h. This header is not
> automatically included from linux/smp.h and untangling it is a bit
> difficult.

Applied to irq/irqchip-5.9, thanks!

[1/1] irqchip/irq-bcm7038-l1: Allow building on ARM 32-bit
      commit: 52b350cbc94721d87f087d1a5800f9531c2d682c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
