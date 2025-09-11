Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 344D1B53393
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 15:24:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3AC1C349C1;
	Thu, 11 Sep 2025 13:24:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B65EAC36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 13:24:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C4BF4076B;
 Thu, 11 Sep 2025 13:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2804AC4CEF0;
 Thu, 11 Sep 2025 13:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757597046;
 bh=ReBPBkxXd+EypkUBHcKbC5D48dqv14ID4CKpjTXEUa4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CaDSz7w62JVQ9qph9vkiqPWEkMdO9ksAVmIJj6NNKrNQhtpY77er7EdYsXNaC3Gw7
 Or7QidGxUnAo4jA+WYPKEG0esydorOwwWQZMNuyXSKReLFJbk9OUJjmMX1h8WrZaCC
 kdugKwZrxFmyMFGRCijvIsDKthcvmqU6FbjU7TfoPRV/fEKPknX6eThWyBYYYCmWGy
 NnptvyWq2o2frDJrRPJalmbwzPlpzkUokxPIWhCQK0WY4lfqfYh6AH5G/p/N9YIJYF
 TZ4WZwjrZBDTfKUguTN6o6JgjeEoNWh5YbaKNSRXQFbXRrQSUX+E1cGz+mssdgJDSF
 6ZLuO0WOJbW1Q==
Date: Thu, 11 Sep 2025 06:24:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Message-ID: <20250911062404.1d2c98f6@kernel.org>
In-Reply-To: <aMI6HNACh3y1UWhW@dragon>
References: <20250901103632.3409896-1-joy.zou@nxp.com>
 <175694281723.1237656.10367505965534451710.git-patchwork-notify@kernel.org>
 <aMI0PJtHJyPom68X@dragon>
 <aMI1ljdUkC3qxGU9@lizhi-Precision-Tower-5810>
 <aMI6HNACh3y1UWhW@dragon>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, alexander.stein@ew.tq-group.com,
 Frank Li <Frank.li@nxp.com>, edumazet@google.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 Markus.Niebel@ew.tq-group.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, Shawn Guo <shawnguo2@yeah.net>, pabeni@redhat.com,
 richardcochran@gmail.com, Joy Zou <joy.zou@nxp.com>,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-pm@vger.kernel.org, othacehe@gnu.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, kernel@pengutronix.de,
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

On Thu, 11 Sep 2025 10:55:24 +0800 Shawn Guo wrote:
> > > Can you stop applying DTS changes via net tree?  
> > 
> > shawn:
> > 	Suppose Jaku only pick patch 6.
> > 
> >         - [v10,6/6] net: stmmac: imx: add i.MX91 support
> >           https://git.kernel.org/netdev/net-next/c/59aec9138f30
> > 
> > other patches is "(no matching commit)"  
> 
> Ah, sorry for missing that!  Thanks for pointing it out, Frank!

The output is a little confusing.

Konstantin, would it be possible to add (part) to the subject of the
patchwork bot reply when only some patches were applied? I've seen
other people's bots do this. Something like:

 Re: (part) $subject

? Maybe there are other ideas how to express that just part of the
series was applied, no real preference.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
