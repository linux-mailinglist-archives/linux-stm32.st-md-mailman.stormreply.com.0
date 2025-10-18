Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E7BEDB99
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Oct 2025 22:38:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1684C5A4D9;
	Sat, 18 Oct 2025 20:38:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E083C5A4C9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 20:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=QO5CCKZz8K+FxHChucX6dPFxnD74Zj4nIadAyB4UqqY=; b=219YyT2koGh9ZG2kniua6hTtA3
 kytbSTUCvH09jHO6xXuf3x3Wc6W3WX0VChfdQ3HfTBaGmxtTF3F1A+cM12lNgHKF8d4kUx4gV6pGN
 HNsUb3N8w6uO6+o2yuRj2Ps5j/XN2dRTfCiXoXBz1mu5HGG5Y8Zmz1huUjGQhGi+zR64=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vADgv-00BOZC-9S; Sat, 18 Oct 2025 22:38:17 +0200
Date: Sat, 18 Oct 2025 22:38:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <c16e53f9-f506-41e8-b3c6-cc3bdb1843e1@lunn.ch>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
 <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
Cc: linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
 sophgo@lists.linux.dev, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Longbin Li <looong.bin@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Yao Zi <ziyao@disroot.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-sophgo: Add phy
	interface filter
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

On Sat, Oct 18, 2025 at 08:42:07AM +0800, Inochi Amaoto wrote:
> On Fri, Oct 17, 2025 at 08:16:17PM +0200, Andrew Lunn wrote:
> > On Fri, Oct 17, 2025 at 09:18:01AM +0800, Inochi Amaoto wrote:
> > > As the SG2042 has an internal rx delay, the delay should be remove
> > > when init the mac, otherwise the phy will be misconfigurated.
> > 
> > Are there any in tree DT blobs using invalid phy-modes? In theory,
> > they should not work, but sometimes there is other magic going on. I
> > just want to make sure this is not going to cause a regression.
> > 
> 
> I see no SG2042 board using invalid phy-modes. Only rgmii-id is used,
> which is vaild.

Great, thanks for checking.

> 
> > Also, does the DT binding document list the valid phy-modes?
> > 
> 
> It does not list. Is it better for me to add a list for it?

It would be nice to list the valid modes, to match the code.

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
