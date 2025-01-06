Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61921A02E34
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 17:49:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F39FCC78011;
	Mon,  6 Jan 2025 16:49:30 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91F6BC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 16:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=qna5S093nBbRkl20/MOVRPodP8BDCikiUJuROyhXVgI=; b=gzbu6GThbiT1OZ4tfL4yvjvSKf
 mTUjX5xfuWPGLoSDw4ewW8YQDy4XTPD5JVHgboHzTQdO73hMlgpiXwh/oNGN4gSAYDFBqUL1bliOl
 6Iobp8uc+VOR8Bh/zjVK64ZDPdhF8Z2YiVvB06QFtk8kAHiuOfcBhW825t3oTEsZ87+o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tUqI5-001vyd-ME; Mon, 06 Jan 2025 17:49:21 +0100
Date: Mon, 6 Jan 2025 17:49:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <1b9bf0ad-a929-45b2-901a-b997d7686dec@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAP-007VX7-5s@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tUmAP-007VX7-5s@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 05/17] net: stmmac: remove
 redundant code from ethtool EEE ops
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

On Mon, Jan 06, 2025 at 12:25:09PM +0000, Russell King (Oracle) wrote:
> Setting edata->tx_lpi_enabled in stmmac_ethtool_op_get_eee() gets
> overwritten by phylib, so there's no point setting this.
> 
> In stmmac_ethtool_op_set_eee(), now that stmmac is using the result of
> phylib's evaluation of EEE, there is no need to handle anything in the
> ethtool EEE ops other than calling through to the appropriate phylink
> function, which will pass on to phylib the users request.
> 
> As stmmac_disable_eee_mode() is now no longer called from outside
> stmmac_main.c, make it static.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
