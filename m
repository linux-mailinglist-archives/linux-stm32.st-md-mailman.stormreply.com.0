Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA885FDDF4
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 18:07:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BA8AC6410A;
	Thu, 13 Oct 2022 16:07:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9DD4C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 16:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u/jFRmv5OzNBmCUqUIzeZilfpc0VoRr0v+bxhF3GJN4=; b=zww8JpHlPT5u82kZvtw8bDzdNx
 yfFgh08TI0AgJWbcC9K82AsflxUc8VoAZ3Nm7/HJR43/hzxCsvf6AX9p26ys55Vsg0Q3mO5+zIJve
 xcTwbfnx9uiNiB9/3tPLIKpuiT9325z7WSJuXivBcQXU2B7GB9g6c8im/ZRBbULBWvM8gwIXL+jhL
 9fUxSdFdS5qTpHPr//kK8xJwonNeLdarSpsKmiM8s7U7/1vldzacebFoNM8sQSGb2P8le1gexyYAc
 7ALcTi/u/GwxtceeImMliJwL0/lkbuoRODSUwX89gxqWLHggl1MxzhCasAIwk4/eAzRBmwFqj04+w
 BSKE6/tw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34708)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1oj0jz-0008WP-6C; Thu, 13 Oct 2022 17:07:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1oj0jt-0004t0-SQ; Thu, 13 Oct 2022 17:07:17 +0100
Date: Thu, 13 Oct 2022 17:07:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <Y0g3tW26qDDaxYPP@shell.armlinux.org.uk>
References: <20221013133904.978802-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221013133904.978802-1-shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v5 0/2] net: phylink: add
	phylink_set_mac_pm() helper
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

On Thu, Oct 13, 2022 at 08:39:02AM -0500, Shenwei Wang wrote:
> Per Russell's suggestion, the implementation is changed from the helper
> function to add an extra property in phylink_config structure because this
> change can easily cover SFP usecase too.

Which tree are you aiming this for - net-next or net?

You should use [PATCH net ...] or [PATCH net-next ...] to indicate which
tree you're aiming these patches for.

Please don't repost due to this unless you want it to go into the net
tree, as net-next is currently closed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
