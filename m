Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1A2D14AC8
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 19:08:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA0ACC5A4CA;
	Mon, 12 Jan 2026 18:08:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4D34C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 18:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ef9uJWFZZJYJaa8UiGEDMdnQ6g9MSTSO60hpTpe7fIs=; b=izpSrphv+g8cCmqNORF0148Yeb
 50eCDsdtx36q+Et6RMgOwjx8Ft6oFxjcqGhzTJrwWEcwTJ9vDnD9YnCFlob3LL5su48dIXDE5Tgpv
 /qfryh+SCMOutF8/Z0uEeJD6c24TeG8SXCpW4qTa9i8gaDd/8YSUpDMxaTYZCJYXK57h3Ah2AVEXj
 0efXIhSXsDX+YVpbhsaPISaO65fYdvUqjoE3WUcJOKJeBR2qMj9Bg4h4hNzoTVMwGcueqlMUfh9Nl
 QrZGY+WMbYIkwmzvY0D7b3+dkvJM2b8nH28tk6DHZ6TxNuRDVsOshqTq/52CUKXNvOrHa98SzbElI
 yWR3f8Dg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57284)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vfMKk-000000006b8-3CQJ;
 Mon, 12 Jan 2026 18:08:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vfMKg-000000008GX-1EZT; Mon, 12 Jan 2026 18:08:02 +0000
Date: Mon, 12 Jan 2026 18:08:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: qcom-ethqos:
	cleanups
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

Hi,

Two changes:
1. In a previous commit, I missed that mac_base became write only.
Remove it.

2. Switch qcom-ethqos to use the set_clk_tx_rate() method rather than
setting the RGMII clock in the fix_mac_speed() method.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
