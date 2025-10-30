Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51061C1F7AE
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 11:17:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1B68C62D88;
	Thu, 30 Oct 2025 10:17:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAEB5C62D87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 10:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T3J3PZ9sZgj309/9WKHqysIytic0WUh2G18+w7Qekg4=; b=IoRXrcFRaFvVL7yx4rn28Pyyv4
 /oxQjShGlkiqn1aLKuTSkN2WMdzHrB6Jn/g1UjHlhaI6PaVCV4aVvmsmf9akOkqZSDGgnrAx8pW7d
 9nxPzk0tkrG+qVZmfswvl3izhs8gUUClescS8svZhzsavm+XN4w744XdDNBF8NAIaAqSYC6JX5hdu
 jitqfBmXesDgPRHGOBomWxLLROXXjxShFPGN+yJhiKMTNNgacg7UeQzyTEA8I4oB+QuFKDcIXIwYf
 U6PepcdtlSl8QMJqPnNf23LO7lYCD8GfTMXkIioVp3oIqwmkZMV6Ah4TEp+lxyi4dCAmXzmDdpnZ4
 uX7rCuow==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60374)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vEPiG-000000005VC-3Ry1;
 Thu, 30 Oct 2025 10:17:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vEPiE-000000008NB-08sQ; Thu, 30 Oct 2025 10:16:58 +0000
Date: Thu, 30 Oct 2025 10:16:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Message-ID: <aQM7GVhaK2fhckKF@shell.armlinux.org.uk>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: remove
 MAC_CTRL_REG modification
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

On Thu, Oct 30, 2025 at 11:01:48AM +0100, Konrad Dybcio wrote:
> On 10/29/25 11:18 AM, Russell King (Oracle) wrote:
> > Whereas ethqos_configure_sgmii():
> > 2500: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> > 1000: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> > 100: sets ETHQOS_MAC_CTRL_PORT_SEL |            B14=1 B15=1
> >           ETHQOS_MAC_CTRL_SPEED_MODE
> > 10: sets ETHQOS_MAC_CTRL_PORT_SEL               B14=0 B15=1
> >     clears ETHQOS_MAC_CTRL_SPEED_MODE
> > 
> > Thus, they appear to be doing very similar, with the exception of the
> > FES bit (bit 14) for 1G and 2.5G speeds.
> 
> Without any additional knowledge, the register description says:
> 
> 2500: B14=1 B15=0
> 1000: B14=0 B15=0
>  100: B14=1 B15=1
>   10: B14=0 B15=1
> 
> (so the current state of this driver)
> 
> and it indeed seems to match the values set in dwmac4_setup()
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks Konrad. I've included an extract from your reply in the commit
description as well, thanks for referring back to the documentation.

Note that B14 is not explicitly configured by ethqos_configure_sgmii()
for 1G and 2.5G speeds which is a harmless bug in this glue driver,
and an additional reason to get rid of this code!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
