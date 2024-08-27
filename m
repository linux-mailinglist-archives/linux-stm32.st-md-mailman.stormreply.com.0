Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFF396086F
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 13:21:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0398C6DD9A;
	Tue, 27 Aug 2024 11:21:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEF2CC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 11:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yDxLqgwteaSZePjmW3+flmjAobg0eTLuPPhZim1kmZA=; b=XXBB7A6zsvYdQLmrtTL5cjKH4+
 o7nFXQ+RcxH/TYawgNqYmAmFxT+yQf9lgKHF+p2IqljkPII8baGMoM0fq8L3C/ktR50tAqmAPlYAB
 Nl5kSLd8yHbacHqh81V0Tm6FkhjmpDnup6plOzzLu0u8Jk6bad5FgHOC8vUOnK0FETXuTrfAd1ehf
 a+I1tCTCMF7wUgW12HbaIM7Dlp0KLBNgpJFw/DnuoRo0/9rxbD4SWNBaP+rLqrfwnG5+EODc6kwR9
 Umoyf3Vv+EI/Ndl74PXdrdJhhFIXcWSzjFfJizANa+NHugoqUJAcwomOKz/Z9ewOzseO7WH6n4p4m
 b/wyneqQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58266)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1siuFn-0006rq-1T;
 Tue, 27 Aug 2024 12:20:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1siuFg-0003OM-1i;
 Tue, 27 Aug 2024 12:20:44 +0100
Date: Tue, 27 Aug 2024 12:20:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Zs22jHBb1ztHbXDq@shell.armlinux.org.uk>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-2-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240827095712.2672820-2-frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, linus.walleij@linaro.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, sd@queasysnail.net, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, kuba@kernel.org,
 pabeni@redhat.com, clement.leger@bootlin.com, mcoquelin.stm32@gmail.com,
 ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, horms@kernel.org, justinstitt@google.com,
 olteanv@gmail.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v3 1/9] net: stmmac: dwmac-intel-plat:
 Convert to devm_clk_get_enabled()
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

On Tue, Aug 27, 2024 at 03:57:04AM -0600, Yangtao Li wrote:
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> -	if (ret) {
> -		clk_disable_unprepare(dwmac->tx_clk);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	return 0;

Please head off the next "cleanup" patch that someone has to review,
which will be to convert this to:

	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);

When doing cleanups, don't _create_ new opportunities for cleanups.
Always try to write the best replacement code. This reduces the
burden on reviewers - and we need the burden on reviewers to be
minimised because there's relatively few of them compared to the
number of people generating patches.

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
