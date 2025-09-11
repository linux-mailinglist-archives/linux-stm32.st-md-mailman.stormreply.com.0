Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E5AB526B9
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 04:57:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CC93C32EBF;
	Thu, 11 Sep 2025 02:57:39 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0333DC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 02:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type; bh=Raijf0pxSNsl3FesVHkWVDpo58+B3Fa1eBdInzF1Pzo=;
 b=WlYgDmVJKeOz2HCf2T+/k5D8y+gVK/8GI5wnA3CJUtFKLCw3FKtT0HQ+SMWNbN
 r1wUJRj7/OCzAdF3qFfo7/QL143fSqZlCBNUoLAN0RUyGDl9hrO6ejStoJN9kwpN
 2v5r3juk1e+SmN/7wYQu30AYMQ0qkRkmT26/xaXEquwfs=
Received: from dragon (unknown [])
 by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHe3scOsJocw1PBA--.47548S3;
 Thu, 11 Sep 2025 10:55:27 +0800 (CST)
Date: Thu, 11 Sep 2025 10:55:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.li@nxp.com>
Message-ID: <aMI6HNACh3y1UWhW@dragon>
References: <20250901103632.3409896-1-joy.zou@nxp.com>
 <175694281723.1237656.10367505965534451710.git-patchwork-notify@kernel.org>
 <aMI0PJtHJyPom68X@dragon>
 <aMI1ljdUkC3qxGU9@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMI1ljdUkC3qxGU9@lizhi-Precision-Tower-5810>
X-CM-TRANSID: Mc8vCgAHe3scOsJocw1PBA--.47548S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw1DAFWDKryUWw18Wr18uFg_yoWxAwbEvF
 4UZw4kCws8GF4UK3Wktrn3AwnYya47Xa4xXr1UWw43Z3Z5ArWkXFWFgFWkJFn5KFWkJFna
 yr9IqrWq9rWa9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8S1v3UUUUU==
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwXFZWjCG0lVNgAAs1
Cc: imx@lists.linux.dev, alexander.stein@ew.tq-group.com, edumazet@google.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 Markus.Niebel@ew.tq-group.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 richardcochran@gmail.com, Joy Zou <joy.zou@nxp.com>,
 devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
 linux-pm@vger.kernel.org, othacehe@gnu.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, shawnguo@kernel.org, davem@davemloft.net,
 linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v10 0/6] Add i.MX91 platform support
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

On Wed, Sep 10, 2025 at 10:36:06PM -0400, Frank Li wrote:
> On Thu, Sep 11, 2025 at 10:30:20AM +0800, Shawn Guo wrote:
> > On Wed, Sep 03, 2025 at 11:40:17PM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> > > Hello:
> > >
> > > This series was applied to netdev/net-next.git (main)
> > > by Jakub Kicinski <kuba@kernel.org>:
> >
> > Jakub,
> >
> > Can you stop applying DTS changes via net tree?
> 
> shawn:
> 	Suppose Jaku only pick patch 6.
> 
>         - [v10,6/6] net: stmmac: imx: add i.MX91 support
>           https://git.kernel.org/netdev/net-next/c/59aec9138f30
> 
> other patches is "(no matching commit)"

Ah, sorry for missing that!  Thanks for pointing it out, Frank!

Shawn

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
