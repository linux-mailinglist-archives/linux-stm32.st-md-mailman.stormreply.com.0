Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A1B15FBD
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 13:48:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EBA4C3F942;
	Wed, 30 Jul 2025 11:48:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8A65C35E3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 18:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b0ZxO4zaTBDiZ70aFZFCdiOcnI2dippFCSPeeEmtK4A=; b=ZE21ZVYPFB2jAHQsq8YihIXAYh
 FH+BI3PDBCZslICCC7CKweHWy7PdUAm3UtMvyFtuEfJyfGbqSWApdp4cMM0jfL5zeM9Gr2W6Ifxek
 wqd233XaxmNsMdVvrzh15z19q0PCGgWB/vlfOoyY5sslW+Iw2oXZCVZ0v/pRcRocG/WtPjXDyO4cM
 G9Ee3BS1udYhI9EAECfxCZFt71y7bN750e8a5RUeS9cafyDXrZnvYNpC1aagzH09LhxKyXAVq2lUo
 KuCa/FTLGu0zCu6x5eFNuCv7XEpQ/+KtKbvF31+aq/5XbEMKlZUwqZo+bHpMpXyR/SaZ1cI3RP+FK
 cLO9fegA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46032)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ugovb-0002KX-21;
 Tue, 29 Jul 2025 19:19:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ugovW-0007cp-1f;
 Tue, 29 Jul 2025 19:19:50 +0100
Date: Tue, 29 Jul 2025 19:19:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aIkQxlqmg9_EFqsI@shell.armlinux.org.uk>
References: <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
 <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
 <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
 <aIjCg_sjTOge9vd4@shell.armlinux.org.uk>
 <d300d546-09fa-4b37-b8e0-349daa0cc108@foss.st.com>
 <aIjePMWG6pEBvna6@shell.armlinux.org.uk>
 <186a2265-8ca8-4b75-b4a2-a81d21ca42eb@foss.st.com>
 <aIj4Q6WzEQkcGYVQ@shell.armlinux.org.uk>
 <b88160a5-a0b8-4a1a-a489-867b8495a88e@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b88160a5-a0b8-4a1a-a489-867b8495a88e@lunn.ch>
X-Mailman-Approved-At: Wed, 30 Jul 2025 11:48:10 +0000
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
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

On Tue, Jul 29, 2025 at 07:27:11PM +0200, Andrew Lunn wrote:
> And i did notice that the Broadcom code is the only one doing anything
> with enable_irq_wake()/disable_irq_wake(). We need to scatter these
> into the drivers.

It's better to use devm_pm_set_wake_irq() in the probe function, and
then let the core code (drivers/base/power/wakeup.c and
drivers/base/power/wakeirq.c) handle it. This is what I'm doing for
the rtl8211f.

IRQ wake gets enabled/disabled at suspend/resume time, rather than
when the device wakeup state changes, which I believe is what is
preferred.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
