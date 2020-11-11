Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8632E2AF622
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Nov 2020 17:22:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DBABC3FAE2;
	Wed, 11 Nov 2020 16:22:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8601C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 16:22:05 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F0CC20659;
 Wed, 11 Nov 2020 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605111724;
 bh=HAxtj1PVhA7gGIoHhM6mBjlHxkmTmNoqSrX04hzHLZc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GlIVwKUF4JBzPYHYMcpOYjNjEIllEd4V5s5D+OQC1EuklVOS3mTlAvZ+lxQI2VBve
 q01ITsB3lNED7KjdRzUqK1ccj9iBMUjV5ly5wQ4DZeQ35dsuojupyzdnsR4rZjCQf5
 F0c7VoqbmqFWIyGPM67/MrN+s6T2+ijc15cdrTvs=
Date: Wed, 11 Nov 2020 08:22:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Message-ID: <20201111082202.577ea1e0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201111101033.753555cc@xhacker.debian>
References: <20201109160855.24e911b6@xhacker.debian>
 <20201109115713.026aeb68@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <20201111101033.753555cc@xhacker.debian>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: platform: use
 optional clk/reset get APIs
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

On Wed, 11 Nov 2020 10:10:33 +0800 Jisheng Zhang wrote:
> On Mon, 9 Nov 2020 11:57:13 -0800 Jakub Kicinski wrote:
> > On Mon, 9 Nov 2020 16:09:10 +0800 Jisheng Zhang wrote:  
> > > @@ -596,14 +595,10 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
> > >               dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
> > >       }
> > >
> > > -     plat->stmmac_rst = devm_reset_control_get(&pdev->dev,
> > > -                                               STMMAC_RESOURCE_NAME);
> > > +     plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev, STMMAC_RESOURCE_NAME);    
> > 
> > This code was wrapped at 80 chars, please keep it wrapped.
> >   
> 
> I tried to keep wrapped, since s/devm_reset_control_get/devm_reset_control_get_optional,
> to match alignment at open parenthesis on the second line, the
> "STMMAC_RESOURCE_NAME" will exceed 80 chars. How to handle this situation?

Indeed, it's 81 chars. Still one character over 80 is easier to read
than when STMMAC_RESOURCE_NAME is wrapped half way through the name.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
