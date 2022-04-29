Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D1E51404F
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Apr 2022 03:40:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E3D0C6047D;
	Fri, 29 Apr 2022 01:40:59 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 257AFC5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Apr 2022 01:40:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A25D7B8328E;
 Fri, 29 Apr 2022 01:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7CBC385AC;
 Fri, 29 Apr 2022 01:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651196456;
 bh=Hz6ulH+o/XA3d/ohY6QMo3a7cl6ZEDIejB0K3veZ9gw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hbqr3sYCWquHPPIGT12Ir8IJ8M2rIRjkIx6bydazwbRTF3vsdVxWbwmYa17j93Y1T
 CmPDfLH9/sDfXM56lx64FfPeN3m/SyTtFt+mBdpbqM9RpLRfUKY9JiEPiPJUQgKhe5
 ili1hZR4k4Jg/LhXv3cRQZ+mnkM/L307Xkmuws0+bkoIKJD9JPiuJ5uCmPW0G/LgHs
 xvD8NR0nSQsQf+KwKIfjHsO89fGbTNUkhpu5/B4Qs1xveASSPEqOjG6sd4w+0f7v+S
 40LohYVRzYdxcPUfmec/UFYagUWtr32Qt/8I7TdWHZiGPlgW/XEijZHyWCaXzku6vH
 La9YD2kGDcCWA==
Date: Thu, 28 Apr 2022 18:40:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jianqun Xu <jay.xu@rock-chips.com>
Message-ID: <20220428184054.3dd72784@kernel.org>
In-Reply-To: <20220429004605.1010751-1-jay.xu@rock-chips.com>
References: <20220428010927.526310-1-jay.xu@rock-chips.com>
 <20220429004605.1010751-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-rockchip@lists.infradead.org, joabreu@synopsys.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2] ethernet: stmmac: support driver work
 for DTs without child queue node
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

On Fri, 29 Apr 2022 08:46:05 +0800 Jianqun Xu wrote:
> The driver use the value of property 'snps,rx-queues-to-use' to loop
> same numbers child nodes as queues, such as:
> 
>     gmac {
>         rx-queues-config {
>             snps,rx-queues-to-use = <1>;
>             queue0 {
>                 // nothing need here.
> 	    };
> 	};
>     };

I think you mean tx, not rx, given the code.

>  
>  		queue++;
>  	}
> -	if (queue != plat->tx_queues_to_use) {
> +	if (queue != plat->tx_queues_to_use && of_get_child_count(tx_node)) {
>  		ret = -EINVAL;
>  		dev_err(&pdev->dev, "Not all TX queues were configured\n");
>  		goto out;

Also what about the init to defaults I asked about?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
