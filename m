Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3220A848D58
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Feb 2024 13:02:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0CC5C6C858;
	Sun,  4 Feb 2024 12:02:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98120C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Feb 2024 12:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AD+IVUHMa3dw9w4MF7Be3IiiFcnBNwHoY6xljGZOJKM=; b=zThtl2JYDIKy1ZxaplyiFGGYjx
 AVdesRkik9VBjoUP+J2Yofbu1kkroUFDrPwPFrvSeDM0L735yGGANTBuDyQF+X0Q0JCkyCM9Q3Bit
 y6s9IvCbe7X7RYSeYbyGi1KUk20OOEQN8SRdFEyRcgOwvSjce/n7AMMGDWs7zMcU63hRbFJTMb7Ye
 Da4eHsYX0gnUwC0l1EIkrWY2DNdSlbFIFjIO8dw7B7T2Nf7+yiKNWd/POk51sPN8jd/aBmR19oyip
 dUsNfkN4r/QB+7BCTgIsvJoZqET/CyGOVQkh7gPmiwULqUqh18Afcd5OpI5q1TjMJNcRtS3SFS+FS
 mlzTzAsA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33984)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rWbCk-0007uZ-2d;
 Sun, 04 Feb 2024 12:02:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rWbCe-0001jb-Kc; Sun, 04 Feb 2024 12:02:28 +0000
Date: Sun, 4 Feb 2024 12:02:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Message-ID: <Zb981J0wwFYhXPEo@shell.armlinux.org.uk>
References: <Zby24IKSgzpvRDNF@shell.armlinux.org.uk>
 <E1rVpvs-002Pe6-1w@rmk-PC.armlinux.org.uk>
 <e04888df-adba-49fc-b7f3-3b930e80af81@broadcom.com>
 <4586d004-a7b7-4e60-9493-0a1bbe7d79ba@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4586d004-a7b7-4e60-9493-0a1bbe7d79ba@broadcom.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Doug Berger <opendmb@gmail.com>, Byungho An <bh74.an@samsung.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Shenwei Wang <shenwei.wang@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 4/6] net: bcmgenet: remove
 eee_enabled/eee_active in bcmgenet_get_eee()
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

On Fri, Feb 02, 2024 at 05:21:57PM -0800, Florian Fainelli wrote:
> 
> 
> On 2/2/2024 5:17 PM, Florian Fainelli wrote:
> > 
> > 
> > On 2/2/2024 1:34 AM, Russell King (Oracle) wrote:
> > > bcmgenet_get_eee() sets edata->eee_active and edata->eee_enabled from
> > > its own copy, and then calls phy_ethtool_get_eee() which in turn will
> > > call genphy_c45_ethtool_get_eee().
> > > 
> > > genphy_c45_ethtool_get_eee() will overwrite eee_enabled and eee_active
> > > with its own interpretation from the PHYs settings and negotiation
> > > result.
> > > 
> > > Therefore, setting these members in bcmgenet_get_eee() is redundant,
> > > and can be removed. This also makes priv->eee.eee_active unnecessary,
> > > so remove this and use a local variable where appropriate.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > 
> > Is not there an opportunity for no longer overriding eee_enabled as well
> > since genphy_c45_ethtool_get_eee() will set that variable too?
> 
> Scratch that comment, you are doing it in the getter.

Also, priv->eee.eee_enabled is used in bcmmii.c, so we can't get rid of
it in the setter.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
