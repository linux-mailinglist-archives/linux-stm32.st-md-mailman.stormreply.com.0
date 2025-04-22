Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045CA970FB
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 17:32:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F0C1C78034;
	Tue, 22 Apr 2025 15:32:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DF46C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gt7L3h/h6JftjK7S6HBLGWArLASFLVo4SYarGabL1Sk=; b=ERX6sxypfDytXPK6JY1ybh0dep
 fWUaOf7LKQKP0oDx0asAHaPa1mlqj21OQAIm4wYUH4QL/pMZuI2fpI/jKmcizCooHta3UGi/ndYbz
 gdVAYVsdaH5pOB07HPPshfAC0mrMpf+I3EAi2VbUUpMNYkpardHsKFB+hh/sxfqgdA1x1+S5COQLV
 v6sxsZ0/Irb+3xGMzghdK3Y/Nesg6HcmLDneD7/o2wfJeJDE71P/Pnne/jIwFIxUX1M/IM9ZJm4dw
 WP2F+JbYlvNReGJvc4KSTff6qJK8LHjbFM1tzlsMjg+DN40gnlkZ2UccF5C78kyoubRzD4gLZDCzp
 dWDC+11w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52312)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u7Fbo-0004e6-2Y;
 Tue, 22 Apr 2025 16:32:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u7Fbl-0007a9-1U;
 Tue, 22 Apr 2025 16:32:25 +0100
Date: Tue, 22 Apr 2025 16:32:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>
Message-ID: <aAe2iULNthghEEEt@shell.armlinux.org.uk>
References: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
 <20250422-stmmac_ts-v1-2-b59c9f406041@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422-stmmac_ts-v1-2-b59c9f406041@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Daniel Machon <daniel.machon@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 2/2] net: stmmac: fix multiplication
 overflow when reading timestamp
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, Apr 22, 2025 at 05:07:23PM +0200, Alexis Lothor=E9 wrote:
>  	ns =3D readl(ptpaddr + GMAC_PTP_ATNR);
> -	ns +=3D readl(ptpaddr + GMAC_PTP_ATSR) * NSEC_PER_SEC;
> +	ns +=3D (u64)(readl(ptpaddr + GMAC_PTP_ATSR)) * NSEC_PER_SEC;

I'm not sure what the extra parens around readl() are actually trying to
do. Please drop them if they're not useful.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
