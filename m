Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A563435A
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 19:11:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ACBFC6504B;
	Tue, 22 Nov 2022 18:11:42 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8AEEC03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=9wL3DrReumJnIpFip3mqETIzbbZ50/FTBOkqMi0gBBA=; b=5joZOybnGGPJ5wv+TYwwnM26YS
 ona4UaPG05JTABx7GUPPR92aRp4QPtfVEXRcZM9Hy1SwJaI8OSl6q1AEi/jxqFGjTzc4jD7lXkP6j
 4TSKcWUh8EbRbmTqpKFiMKPNh4YP1xWl2I228YRdwGsY1F1PPTO9Lyvdgikzch+O52pE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oxXje-00397n-1p; Tue, 22 Nov 2022 19:11:06 +0100
Date: Tue, 22 Nov 2022 19:11:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Goh, Wei Sheng" <wei.sheng.goh@intel.com>
Message-ID: <Y30QukgIdFJg7X/+@lunn.ch>
References: <20221122063935.6741-1-wei.sheng.goh@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221122063935.6741-1-wei.sheng.goh@intel.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 Tan Tee Min <tee.min.tan@intel.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Ahmad Tarmizi Noor Azura <noor.azura.ahmad.tarmizi@intel.com>
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Set MAC's flow
 control register to reflect current settings
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

On Tue, Nov 22, 2022 at 02:39:35PM +0800, Goh, Wei Sheng wrote:
> Currently, pause frame register GMAC_RX_FLOW_CTRL_RFE is not updated
> correctly when 'ethtool -A <IFACE> autoneg off rx off tx off' command
> is issued. This fix ensures the flow control change is reflected directly
> in the GMAC_RX_FLOW_CTRL_RFE register.

In future, please include a summary of what changed from version 1 of
the patch. This is generally placed under the --- marker.

> 
> Fixes: 46f69ded988d ("net: stmmac: Use resolved link config in mac_link_up()")
> Cc: <stable@vger.kernel.org> # 5.10.x
> Signed-off-by: Goh, Wei Sheng <wei.sheng.goh@intel.com>
> Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
