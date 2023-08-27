Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E1789FB0
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Aug 2023 15:59:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2832DC6B44D;
	Sun, 27 Aug 2023 13:59:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B93CCC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JVvm7fYZ5VOK8prRPe7vWiswKOsY/Xrn4DbAyJv08DE=; b=blS9u+03U+DRRvi7hm21XlM3e7
 jIeTjieA1Ygwew0uEhAWoM5fwMeoLP9JQzFdcMWw50IosMfbGiUixW4x14+oezpz0bIDclAfDpatp
 6tYDEILCgxVH98uuSohS4ecTtSrPsj55rxc0E1Intxpj0vwk1q67bO+kSGA66lAguXKt5pqnZoSv/
 6ROtW203TwgoiJ0E4EefRvryEwMWPduUjarUX6+Fp1ti9raeKwW6HTar9vyAncD6M2WZVDghdjKxM
 NVi5eUxX+QATiCkNDIaIfaqnmKuotb1PPs4MMre+yy+4OV0adtPlWbbJMneiiJ3mLPTHyzHzhGSk9
 tDQ+0rCA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44638)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qaGI1-0006xW-0x;
 Sun, 27 Aug 2023 14:58:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qaGHx-0002ZZ-Gq; Sun, 27 Aug 2023 14:58:49 +0100
Date: Sun, 27 Aug 2023 14:58:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <ZOtWmedBsa6wQQ6+@shell.armlinux.org.uk>
References: <20230827134150.2918-1-jszhang@kernel.org>
 <20230827134150.2918-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827134150.2918-2-jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: dwmac-starfive:
 improve error handling during probe
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

On Sun, Aug 27, 2023 at 09:41:49PM +0800, Jisheng Zhang wrote:
> After stmmac_probe_config_dt() succeeds, when error happens later,
> stmmac_remove_config_dt() needs to be called for proper error handling.

Have you thought about converting to use devm_stmmac_probe_config_dt()
which will call stmmac_remove_config_dt() if the probe fails or when
the device is unbound?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
