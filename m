Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA666045CA
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Oct 2022 14:49:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18759C64104;
	Wed, 19 Oct 2022 12:49:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A5E6C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 12:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0fsK06XH6eOz8QUYu7W6haCyhqbOJ3WnbeWYAL5slVo=; b=pXNf/TpCCzgHcbe302KXLuoY7+
 8Y/jFPJ4a4iKo5bMujxGTdL82eq5duKQVc/eXLuh1S85tm7iEza7H7XPeqm3EehVYbt7FNdBveqB8
 CyrFEthXrArT8/uPCt7zKGMFyML0Y+Hgp/tTExGAqYmyNHAIZ+wqogCcyTXWKLyFIo4rdnAO2DDL9
 ekr6JFNSkwDWW0ZmQS9xO/Dqm35W7iyL8ovtm3l2sb4HlqcaHYCXuENhNrcZk+xY8Bg0LvkU0o5zr
 0si6evLOEWm2iK+LCl/7WgFhMhA+Nwd4zqP1bmDmQ7TV86V44ZaJ24pyh8eaE7ZsouNPxAbxMAQxv
 SDNqcQYA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34802)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ol8Vo-0005fg-Oh; Wed, 19 Oct 2022 13:49:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ol8Vk-0002AK-MA; Wed, 19 Oct 2022 13:49:28 +0100
Date: Wed, 19 Oct 2022 13:49:28 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Clark Wang <xiaoning.wang@nxp.com>
Message-ID: <Y0/yWHvHs6NHdB8W@shell.armlinux.org.uk>
References: <20221019123643.1937889-1-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019123643.1937889-1-xiaoning.wang@nxp.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, linux-imx@nxp.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: linkup phy after enabled mac
 when system resume
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

On Wed, Oct 19, 2022 at 08:36:43PM +0800, Clark Wang wrote:
> +	mutex_unlock(&priv->lock);
> +	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
> +		phylink_resume(priv->phylink);
> +	} else {
> +		phylink_resume(priv->phylink);
> +		if (device_may_wakeup(priv->device))
> +			phylink_speed_up(priv->phylink);
> +	}
> +	mutex_lock(&priv->lock);

First, is there a reason this isn't coded as:

	mutex_unlock(&priv->lock);
	phylink_resume(priv->phylink);

	if (!priv->plat->pmt && device_may_wakeup(priv->device))
		phylink_speed_up(priv->phylink);

	mutex_lock(&priv->lock);

And secondly, is it really safe to drop this lock? What specifically
is the lock protecting? I see this isn't documented in the driver...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
