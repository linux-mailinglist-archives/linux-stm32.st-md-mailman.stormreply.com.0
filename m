Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B91353A2E71
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 16:42:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71D0DC58D5B;
	Thu, 10 Jun 2021 14:42:45 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FBBAC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=G/4KF+EXeK0CRlPgzQxnXXiJ5+yIDNT85WHr1QHw8N4=; b=bq6a+xbXIB1VsshgmgoWDw7fAT
 /kuSotYXw8oH5HLpnxnKBV4PyCkWApEMh58y6y4Aotl9R0MwhEAwj+aVwrPImpTouEQDSwaRS+zU/
 zO4nYHZVJiwA//O0wt9I9mViPntavLET86XzTsSw3ftWyntMVOZ5mPkRvC1Yl2tROeww=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lrLt2-008fqS-RB; Thu, 10 Jun 2021 16:42:24 +0200
Date: Thu, 10 Jun 2021 16:42:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <YMIk0NfOPryoY607@lunn.ch>
References: <1623260110-25842-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623260110-25842-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YMGEutCet7fP1NZ9@lunn.ch>
 <405696cb-5987-0e56-87f8-5a1443eadc19@wanyeetech.com>
 <YMICTvjyEAgPMH9u@lunn.ch>
 <346f64d9-6949-b506-258f-4cfa7eb22784@wanyeetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <346f64d9-6949-b506-258f-4cfa7eb22784@wanyeetech.com>
Cc: joabreu@synopsys.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com,
 linux-kernel@vger.kernel.org, sihui.liu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-mips@vger.kernel.org, paul@crapouillou.net, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 netdev@vger.kernel.org, dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: Add Ingenic SoCs MAC
	support.
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

>     We are much more strict about this now than before. You have to use
>     standard units and convert to hardware values. It also makes it a lot
>     easier for DT writers, if they have an idea what the units mean.
> 
>     Having the MAC add small delays is something you can add later,
>     without breaking backwards compatibility. So if you cannot determine
>     what the units are now, just submit the glue driver without support
>     for this feature. If anybody really needs it, they can do the needed
>     research, maybe do some measurements, and then add the code.
> 
> 
> I did an experiment, when the tx delay is not set, RGMII works a

You had rgmii-id in your device tree, so that the PHY added the
delays?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
