Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D2CA8747B
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 00:40:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B88B0C78F8B;
	Sun, 13 Apr 2025 22:40:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79F00C78F7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Apr 2025 22:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yZKPPgLOnaA6LtXNLTqGU/0863A2eFjmUO8YRdkWJA4=; b=MIKCdwdTxzfm3nfeLK8y3tQrPx
 GMWv72wuecKr72/MAFovpO4qbGD8I8Cg87KO745HF+Dl2ZGdoRMUpfuvoSf6yXBRRTe2iQkYFgt5N
 gTgOojG7ShUf0rqNK0xgzGqV98HMv0Wt5sUzlFYynzlhBnuxaPq71cYgyT1uzoplz+w3uIh01v9l4
 Hf2qzDPOtxo34Of4kFQtbMgRdoq3O3qk5twXCMkm/hToxF3aPri/nuuO9fb0Jj1t/0F2VYhb9hTVd
 Hb/QX10GHmk4NCgEVTuuwwgMFo4aVF5HPtRgGMvY1wZFwnOZFqbArFnPzIXNymN4kx2OdP1MDtbnB
 RlZiSjtA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42456)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u460K-0005hA-0X;
 Sun, 13 Apr 2025 23:40:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u460G-00072n-0w;
 Sun, 13 Apr 2025 23:40:40 +0100
Date: Sun, 13 Apr 2025 23:40:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <Z_w9aE62dqOdr4w9@shell.armlinux.org.uk>
References: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
 <E1u3bfU-000Em3-Mh@rmk-PC.armlinux.org.uk>
 <acd537c9-51f2-4d5c-a07d-032ea628d241@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acd537c9-51f2-4d5c-a07d-032ea628d241@lunn.ch>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: anarion: use
 devm_stmmac_pltfr_probe()
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

On Sun, Apr 13, 2025 at 11:10:24PM +0200, Andrew Lunn wrote:
> On Sat, Apr 12, 2025 at 03:17:12PM +0100, Russell King (Oracle) wrote:
> > Convert anarion to use devm_stmmac_pltfr_probe() which allows the
> > removal of an explicit call to stmmac_pltfr_remove().
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks - but nipa found an error in the patch - s/&pdev->dev/pdev/
with the new call. Ditto for "net: stmmac: anarion: use
stmmac_pltfr_probe()" so I'll be sending a v2 for both. Do you
want me to keep your r-b with that change for both patches?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
