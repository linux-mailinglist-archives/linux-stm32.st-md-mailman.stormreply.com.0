Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9A998EBF4
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2024 10:58:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1902C78023;
	Thu,  3 Oct 2024 08:58:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70129C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2024 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UFLXtPkTLY9YWYZuXI/P16YFfhLwH7LyfPFSOm6FhPE=; b=f2a3Mqy1/UmSRsEMEZEmFw98V1
 diNLZbOIBVVY8BoDG/fZ8cqJ6SZSuVJMdn8sHRWgiyZ4RMEaRy2Slj56JvXptUHX4GOIxhd5Zv+RC
 moH2xuEcEti3ftKGrPd+K+8EXFP5m/hRMW4/aeXAH2Xz9IpNXHpLq72hBqQ+YhupXuuXuqAY9PAcn
 ja4ggHIvFm/b3NXcUPbBZ8dAI2w8ETSLk8eaoion8MzHPh8UokFR35lZqzEkigfHDV+QssbXYKQrf
 oYXu0nD/paz6vYVqU23/H9TkER5gQ0an6OV1LBEhznG7EhDTUZBz4NJyqyuWkRoubFv5SqaGGY2FP
 6kqe37bQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48300)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1swHf9-0000EN-0r;
 Thu, 03 Oct 2024 09:58:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1swHf1-0008PL-23;
 Thu, 03 Oct 2024 09:58:11 +0100
Date: Thu, 3 Oct 2024 09:58:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <Zv5co5giM1AcQxD6@shell.armlinux.org.uk>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
 <E1svfMA-005ZI3-Va@rmk-PC.armlinux.org.uk>
 <fp2h6mc2346egjtcshek4jvykzklu55cbzly3sj3zxhy6sfblj@waakp6lr6u5t>
 <ZvxxJWCTD4PgoMwb@shell.armlinux.org.uk>
 <68bc05c2-6904-4d33-866f-c828dde43dff@lunn.ch>
 <pm7v7x2ttdkjygakcjjbjae764ezagf4jujn26xnk7driykbu3@hfh4lwpfuowk>
 <84c6ed98-a11a-42bf-96c0-9b1e52055d3f@lunn.ch>
 <zghybnunit6o3wq3kpb237onag2lycilwg5abl5elxxkke4myq@c72lnzkozeun>
 <acdc1443-15ca-4a35-aee0-ddf760136efa@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acdc1443-15ca-4a35-aee0-ddf760136efa@lunn.ch>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 01/10] net: pcs: xpcs: move PCS
 reset to .pcs_pre_config()
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

On Thu, Oct 03, 2024 at 02:04:36AM +0200, Andrew Lunn wrote:
> > Anyway the Russell' patch set in general looks good to me. I have no
> > more comments other than regarding the soft-reset change I described in
> > my previous message.
> 
> Sorry, i've not been keeping track. Have you sent reviewed-by: and
> Tested-by: for them?

Of course Serge hasn't. He hasn't even said he's tested them. He's more
concerned with the soft-reset change to do anything else other than
whinge about that.

After the previous debacle over the stmmac PCS cleanup (that I've given
up with) I decided later in the series of XPCS cleanups I have to touch
stmmac as little as possible because I don't want to interact with
Serge anymore. This has now been reinforced further, to the extent that
I'm now going to ask Serge to _remove_ all usage of phylink from stmmac
for this very reason - I do not wish to interact further with Serge.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
