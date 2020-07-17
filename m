Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A7D223B96
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jul 2020 14:49:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48B52C36B29;
	Fri, 17 Jul 2020 12:49:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78F4EC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 12:48:56 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B97620775;
 Fri, 17 Jul 2020 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594990135;
 bh=oveUsRxE3s8oXYlG1x5cDW1hlCLkwDVYSrD4BqPqSFk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vpNpTMTzpGWGrYrt95Jx2Ul+jVSw/2ns4oGtH2ArDJV5sFfTY+L5ZG8UnreK2snAN
 jsKvjS4RcW9BDL1vMCJdhHfiOqmoGRs4KZRZ8xip3FLibEEUvPlCRWONxoh+MZCWHP
 bjZ0+sP08pROk+Uq7oCBCktebS+oGLFmDqD8bjVo=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jwPnJ-00Ccsm-L7; Fri, 17 Jul 2020 13:48:53 +0100
From: Marc Zyngier <maz@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 17 Jul 2020 13:48:43 +0100
Message-Id: <159499001591.546505.10421625541842835450.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709223016.989-1-f.fainelli@gmail.com>
References: <20200709223016.989-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net,
 tglx@linutronix.de, linux-kernel@vger.kernel.org, f.fainelli@gmail.com,
 marex@denx.de, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: marex@denx.de, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/6] irqchip: Broadcom STB interrupt
	controller updates
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

On Thu, 9 Jul 2020 15:30:10 -0700, Florian Fainelli wrote:
> This patch series contains a number of updates for Broadcom STB L2
> interrupt controllers to enable them as wake-up interrupt controllers,
> and add missing compatible strings that should be matched.
> 
> Thanks!
> 
> Florian Fainelli (3):
>   dt-bindings: interrupt-controller: Document Broadcom STB HIF L2
>   dt-bindings: interrupt-controller: Document UPG auxiliary L2
>   irqchip/brcmstb-l2: Match UPG_AUX_AON_INTR2 compatible
> 
> [...]

Applied to irq/irqchip-5.9, thanks!

[1/6] irqchip/bcm7120-l2: Set controller as wake-up source
      commit: f4ccb74569aaf839c2830382e902dd50d564df55
[2/6] irqchip/brcmstb-l2: Set controller as wake-up source
      commit: c8d8d6fc478a30f3e8ea5372664dd2a808c4311e
[3/6] dt-bindings: interrupt-controller: Document Broadcom STB HIF L2
      commit: 90b06e2dc4d1e8e9311a5275d53f61d90b61efdc
[4/6] irqchip/brcmstb-l2: Match HIF_SPI_INTR2 compatible
      commit: 9ac793dc5c97691152818305974299604c67e110
[5/6] dt-bindings: interrupt-controller: Document UPG auxiliary L2
      commit: 03a7ac47c14c7ef50742a34b3cfba1a47a578a03
[6/6] irqchip/brcmstb-l2: Match UPG_AUX_AON_INTR2 compatible
      commit: 240e176a96187ee84e63626ca0d1aac92da503aa

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
