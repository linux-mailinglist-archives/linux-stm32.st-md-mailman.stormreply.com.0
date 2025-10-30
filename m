Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B32C1FF70
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 13:17:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1800C62D8A;
	Thu, 30 Oct 2025 12:17:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 419DFC62D88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 12:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vuv1is53BAz60PbjKMm5symKbxvv81WCacTJbFJUDyo=; b=k48QOpUwrL1gnGYVyWCCPy5di3
 OfjNwahayNTD9Qjxdp8t0BmohEcGgeA0EyIutv2alMoQ4r0mr+X1E0qF6V0rrub7u3yvOVBNLghQa
 R7saTwU7H6zHqJrF4/uh3E40i+JFwDn0VsGBRkAiN8GbcASMVfdlbb8iEuN5wjyPmkhrmhzCyNTLn
 XmIpM+9Et00fSnSsv3gSbjKSVazcKSFyKtXKXX8KhEgvohafb7GE6ZBnRLcYhadeOHUWG4XZtbyNM
 yQcArPDqV0Igo+WR2YnF3GJSQLPfGBLHOwqZN4VMu/Ce2wFI+68pOJAq9qBM8nrNbtPNBXEnIIgxY
 hJ6NUXlg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59084)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vERak-000000005fN-0h0J;
 Thu, 30 Oct 2025 12:17:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vERag-000000008S2-1qDT; Thu, 30 Oct 2025 12:17:18 +0000
Date: Thu, 30 Oct 2025 12:17:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Message-ID: <aQNXTscqFcucETEW@shell.armlinux.org.uk>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
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

Konrad, Ayaan,

Can you shed any light on the manipulation of the RGMII_IO_MACRO_CONFIG
and RGMII_IO_MACRO_CONFIG2 registers in ethqos_configure_sgmii()?

Specifically:
- why would RGMII_CONFIG2_RGMII_CLK_SEL_CFG be set for 2.5G and 1G
  speeds, but never be cleared for any other speed?

- why is RGMII_CONFIG_SGMII_CLK_DVDR set to SGMII_10M_RX_CLK_DVDR
  for 10M, but never set to any other value for other speeds?

To me, this code looks very suspicious.

If you have time, please test with a connection capable of 1000BASE-T,
100BASE-TX and 10BASE-T, modifying the advertisement to make it
negotiate each of these, and checking that packet transfer is still
possible.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
