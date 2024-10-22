Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB2F9AB017
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 15:51:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2CB4C6DD9F;
	Tue, 22 Oct 2024 13:51:38 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D20AEC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=EvgeLiQ1i9RqfW0Xm0MuToc51LBco8luwq4fL+Inhzc=; b=xooZKAgd7OkHixgbYVMEcGcidL
 a+SWF6BNyNSjY6eJy8yQGbXPowzJ4G1vD/u8Lrbngi4UPc8IU6Mww6P7m85HQiZWAIQW97HQ2s5BI
 tQxjhR9NLctB2XtWz3xWo3JoopalvpzvS+1/PA3XzVs0c4WbTQ4IISKXeVRRcle51beQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1t3FHw-00Aqeu-KD; Tue, 22 Oct 2024 15:51:08 +0200
Date: Tue, 22 Oct 2024 15:51:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <66f35d1b-fd26-429b-bbf9-d03ed0c1edaf@lunn.ch>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
 <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
 <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
Cc: Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Chen Wang <unicorn_wang@outlook.com>, Jose Abreu <joabreu@synopsys.com>,
 Inochi Amaoto <inochiama@outlook.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 4/4] net: stmmac: Add glue layer for
	Sophgo SG2044 SoC
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

On Tue, Oct 22, 2024 at 06:21:49PM +0800, Inochi Amaoto wrote:
> On Mon, Oct 21, 2024 at 03:27:18PM +0200, Andrew Lunn wrote:
> > > It is related to the RGMII delay. On sg2044, when the phy 
> > > sets rx-delay, the interal mac is not set the same delay, 
> > > so this is needed to be set.
> > 
> > This is the wrong way to do it. Please look at how phy-mode should be
> > used, the four different "rgmii" values. Nearly everybody gets this
> > wrong, so there are plenty of emails from me in the netdev list about
> > how it should be done.
> > 
> 
> The phy-mode is alreay set to the "rgmii-id" and a rx delay is already
> set (a default tx delay is set by the phy driver). In the scenario 
> the extra bit is used to fix 2ns difference between the sampling clock
> and data. It is more like an extra setting and the kernel can not handle
> it by only setting the phy-mode.

This sounds wrong.

So in DT you have rgmii-id? You say the PHY is doing TX delay. So you
pass PHY_INTERFACE_MODE_RGMII_TXID to the PHY? It is not clear from
this patch, i don't see any code mentioning
PHY_INTERFACE_MODE_RGMII_TXID. Could you point me at that code.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
