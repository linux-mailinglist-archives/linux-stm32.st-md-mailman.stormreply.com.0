Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ACC960885
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 13:26:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03B56C6DD9A;
	Tue, 27 Aug 2024 11:26:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3DD5C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pPyJCT/R91XYkwzYF/KN6tVWCJJRmOpGOpF/7PNudjU=; b=ai1XaIxAI7LILZRBhBK2yNI2aq
 hdpB046enSIHSlmoCaWmk0Qc0fK7/4H7LARWDtxKmks4YqeSG+NvYYWScheosTcjibkULw++fH325
 thEf8Fa3V0Oi2mvLU9tLJyBjvPzxsbcth0MEDeZXWNA11Po+UzwVpW6Oy6x5hww8C8PLR76hyh6Z/
 YYsn+i1y4i2q6PPEc7m3bUtcftKC+1tYxhSjy2IXwvaV2DwQqczbYIL7T1WEvKzT5O/tyKdw3XD7M
 J3zlrf5eToWI6XdfwOkrslYrk11MfBsMJ1Mpf33a8t9lxoQPCyJf7q1iyHlMaG1w23TT56gnkdh2x
 R8MDOnEA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58178)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1siuKg-0006sT-2Q;
 Tue, 27 Aug 2024 12:25:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1siuKc-0003Of-2M;
 Tue, 27 Aug 2024 12:25:50 +0100
Date: Tue, 27 Aug 2024 12:25:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Zs23vqQn9zqOQ62S@shell.armlinux.org.uk>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-4-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240827095712.2672820-4-frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, linus.walleij@linaro.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, sd@queasysnail.net, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, kuba@kernel.org,
 pabeni@redhat.com, clement.leger@bootlin.com, mcoquelin.stm32@gmail.com,
 ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, horms@kernel.org, justinstitt@google.com,
 olteanv@gmail.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v3 3/9] net: ethernet: cortina: Convert
 to devm_clk_get_enabled()
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

On Tue, Aug 27, 2024 at 03:57:06AM -0600, Yangtao Li wrote:
>  	ret = register_netdev(netdev);
>  	if (ret)
> -		goto unprepare;
> +		return ret;
>  
>  	return 0;

Same comment as per patch 1. At this point, I'm going to stop reviewing
your patches (because I don't want to waste what little time I'm able
to spend in front of the screen raising comments against the same issue
throughout a patch set) and I ask you to do your own review of your
series for this pattern - and also consider where using
PTR_ERR_OR_ZERO() may also be appropriate in any of your patches. See
that function's documentation in linux/err.h.

Please wait at least 24 hours before reposting.

Thanks.

-- 
*** please note that I probably will only be occasionally responsive
*** for an unknown period of time due to recent eye surgery making
*** reading quite difficult.

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
