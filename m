Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E639D3C4C6
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 11:14:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07027C36B3C;
	Tue, 20 Jan 2026 10:14:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E748C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Yv+dpRQRMN5qyhSBXjej37h+nZntknJMic+/TUR9+o=; b=VJlC1K2gyJ9/otBfB1zskPXFfG
 W24edyx/d7uS+k2Lr5Px/mwPserfDD0u0ythB0g/la0lT0fiK/XOl6VikBxGutkeQz8Dr1DAdlZm6
 nhCCtkJSBoSPzlzDbLoSnAsEMSvsTR1l3dzC0zT9U3rTjWQCUDGJBixA6hMRwoHi4+9J+97gE0EI8
 q4wrj32W+vmtiKrQ0S3BRAaqfJO+6dQIgjDK+jDV4RVMnrojaFCPLJzwFqNl78mW3Yw5Ah6fyc1ib
 7q7kehaZ0n6exkqc7VXbWW5Z76+ZyUrodOlwZGR25zdXb8d/Mse00/lPaGbZdCJcxg9f6RAnCEE6l
 0eSB3V7A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42602)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vi8kz-0000000064a-0tA1;
 Tue, 20 Jan 2026 10:14:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vi8kw-000000007RQ-3W81; Tue, 20 Jan 2026 10:14:38 +0000
Date: Tue, 20 Jan 2026 10:14:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <aW9VjieyiZCNbb-G@shell.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120084227.j2wgbmjsrpmycpgn@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120084227.j2wgbmjsrpmycpgn@skbuf>
Cc: neil.armstrong@linaro.org, mohd.anwar@oss.qualcomm.com, vkoul@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, andrew@lunn.ch,
 mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next,
	05/14] net: stmmac: add stmmac core serdes support
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

On Tue, Jan 20, 2026 at 10:42:27AM +0200, Vladimir Oltean wrote:
> More to the point, if dwmac_integrated_pcs_enable() fails at
> dwmac_serdes_power_on() (thus, the SerDes is _not_ powered on), by your
> own admission of this PCS calling convention, sooner or later
> dwmac_integrated_pcs_disable() -> dwmac_serdes_power_off() will still be
> called, leading to a negative phy->power_count.
> 
> That is to say, if the model is "irrespective of whether pcs_enable()
> succeeds or fails mid way, pcs_disable is called anyway()", then these
> methods are not prepared to handle that reliably.

That's the way it currently is, and it's been this way in the
major_config path for a very long time. If anything fails in that
path, we can't report the error back up to anyone, and the netdev
is effectively dead.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
