Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C8B84715A
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 14:46:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0408DC6DD9F;
	Fri,  2 Feb 2024 13:46:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A944C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7hFvlERHieFAUVwlSVD673jXkZUakpcgcmrI0kwzE+Q=; b=ml2LZsqYjytchOT37m3ldtskih
 8BlyHKRB07xDljmVdrFSERYHH1plpteURpODM5Vq/d+IPZO+LHZlRaRUVf67OJmbhjdIiE37e+vva
 37DG9vtOcfZBmVswhST+mNnSSti+wB6eTDKAfzSbfXC7cMnpgvHtwxjCSBiGt1pk4+yc/W3JZMB4t
 TwaNeLJgUyssyER2l37LnXGrSydladNs3goAm41WVV2d50ZUmscFAzZFxE7Gq6nQFct3FRJNYIjRx
 3OxUAy2ECxEmaq1Xh3FTZI6YBJoVPUuD2b34+q4Vcsy/FYrL7N98JiP5neHHFcKpJDBcGY6Y37G50
 swML5u6g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59704)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rVtrW-00063T-0c;
 Fri, 02 Feb 2024 13:45:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rVtrP-0008Mp-Lz; Fri, 02 Feb 2024 13:45:39 +0000
Date: Fri, 2 Feb 2024 13:45:39 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZbzyAy7Nc7vf+BD9@shell.armlinux.org.uk>
References: <Zby24IKSgzpvRDNF@shell.armlinux.org.uk>
 <E1rVpvm-002Pe0-TV@rmk-PC.armlinux.org.uk>
 <011cb523-0561-436a-9f64-4479648b4770@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <011cb523-0561-436a-9f64-4479648b4770@lunn.ch>
Cc: Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 bcm-kernel-feedback-list@broadcom.com, Shenwei Wang <shenwei.wang@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Byungho An <bh74.an@samsung.com>, g@lunn.ch,
 Wei Fang <wei.fang@nxp.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: fec: remove
 eee_enabled/eee_active in fec_enet_get_eee()
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

On Fri, Feb 02, 2024 at 02:22:02PM +0100, Andrew Lunn wrote:
> On Fri, Feb 02, 2024 at 09:33:54AM +0000, Russell King (Oracle) wrote:
> > fec_enet_get_eee() sets edata->eee_active and edata->eee_enabled from
> > its own copy, and then calls phy_ethtool_get_eee() which in turn will
> > call genphy_c45_ethtool_get_eee().
> > 
> > genphy_c45_ethtool_get_eee() will overwrite eee_enabled and eee_active
> > with its own interpretation from the PHYs settings and negotiation
> > result.
> > 
> > Therefore, setting these members in fec_enet_get_eee() is redundant.
> > Remove this, and remove the setting of fep->eee.eee_active member which
> > becomes a write-only variable.
> 
> I _think_ p->eee_enabled becomes write only as well?

Thanks for spotting, I'll remove it in v2!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
