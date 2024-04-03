Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD258968CA
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 10:34:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A83CC6B45B;
	Wed,  3 Apr 2024 08:34:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1722AC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 08:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5byGfi+YltTK32ZINcsDDBL0Ip9/fC/96w7JVL8ZAeY=; b=C9VY1w14a8zzVC+dEq1nF2CU1A
 rIwwPRYl/p95f094Bi7cXEOMsEItYe6cHITEKaIfyE3HpJjVQr7fNMyCE5dcdg90j15gmp4iyQJTD
 ifXJRoHXKdXNr/265/clVoMZSmy4Yk2Yk1F4BaUaRB54Guahe9E4C3QqvlHmX2I2URTNX3A8qcvgy
 DsPxq2cdla8S2+sm1jXnQtCiOJeQOtm5deMjU5ZoOFUPqeOETAZhEu31dOFNpF4MqBX2obdS6J/wa
 WT2vG+NoiJDg5J0Wpc6AesDG5+2Cbq+8WPqpBar5CAHqxEXmUvJ+EIjX6ehYoOliFfBCrusVDPWmA
 M2ef8e3Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51368)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rrw4Z-0007z7-0k;
 Wed, 03 Apr 2024 09:34:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rrw4W-0007mg-3j; Wed, 03 Apr 2024 09:34:16 +0100
Date: Wed, 3 Apr 2024 09:34:16 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <Zg0Uh9TvArz7tLzH@shell.armlinux.org.uk>
References: <ZgwoygldsA1V8fs9@shell.armlinux.org.uk>
 <E1rrgQO-005ZOA-KT@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1rrgQO-005ZOA-KT@rmk-PC.armlinux.org.uk>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-socfpga:
 use pcs_init/pcs_exit
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

On Tue, Apr 02, 2024 at 04:51:48PM +0100, Russell King (Oracle) wrote:
> Use the newly introduced pcs_init() and pcs_exit() operations to
> create and destroy the PCS instance at a more appropriate moment during
> the driver lifecycle, thereby avoiding publishing a network device to
> userspace that has not yet finished its PCS initialisation.
> 
> There are other similar issues with this driver which remain
> unaddressed, but these are out of scope for this patch.

Just for the record...

Digging into the history of this driver, the init-after-publish issue
was introduced by commit 3c201b5a84ed ("net: stmmac: socfpga: Remove
re-registration of reset controller") which gives information on why
calling the PHY configuration before stmmac_dvr_probe() didn't work.

This was further modified by 56868deece92 ("stmmac: dwmac-socfpga: add
PM ops and resume function").

I haven't decided what can be done about that yet - and I'm tempted to
leave it as-is for the time being until more of stmmac gets cleaned up.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
