Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E2F9E4024
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2024 17:53:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBF1DC71292;
	Wed,  4 Dec 2024 16:53:43 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DCF5C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2024 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=finest.io;
 s=s1-ionos; t=1733331200; x=1733936000; i=parker@finest.io;
 bh=uEGlJe4Bxvq2OHTVxLPMc+APrj2QmcCgizfZ45v1DZc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OtiORDSQ8S6w37NRH56VRSCd0cTq6VmBcplAa7Gr39JvCDlmJyuM6lY5WoKnq/fe
 8GtiSf0tZQ1QLobs3u5hXTNxwxd8QWU6WKctZtyHiN2LdOl/MgwBiDo8p1kZlqN9H
 hWOdZdWqGbTZjI00E3FczvmMT+x5NYCxAgO/hMGV2cWQpsWEWIKUsZIihwz3nb2j/
 oEs4fe1gZpzaF3oK3ThOClQu3WOVfx/IaB29LORJfZSdhdD9TU9jsEEPZapp4Fthy
 J/ytHfbs3wKtSgRYsN+ATlC1DFni0o8uKIVMtbwF6NcJT4gjqH1+dV8xiHubjRtY0
 Zlplrj90wNGtscrBRg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from SWDEV2.connecttech.local ([98.159.241.229]) by
 mrelay.perfora.net (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id
 0MeQHZ-1t15bD0w63-00MNLo; Wed, 04 Dec 2024 17:53:20 +0100
Date: Wed, 4 Dec 2024 11:53:17 -0500
From: Parker Newman <parker@finest.io>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <20241204115317.008f497c.parker@finest.io>
In-Reply-To: <mpgilwqb5zg5kb4n7r6zwbhy4uutdh6rq5s2yc6ndhcj6gqgri@qkfr4qwjj3ym>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
 <20241118084400.35f4697a.parker@finest.io>
 <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
 <20241119131336.371af397.parker@finest.io>
 <f00bccd3-62d5-46a9-b448-051894267c7a@lunn.ch>
 <20241119144729.72e048a5.parker@finest.io>
 <mpgilwqb5zg5kb4n7r6zwbhy4uutdh6rq5s2yc6ndhcj6gqgri@qkfr4qwjj3ym>
Organization: Connect Tech Inc.
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:2blSxbCR+yhs7uQqwCDAGl8YVMbUYXlFl2S+vj7UoTf7mx/o3/0
 cVfef/xPPbcAmmGZKCxA5219hwxj7zniR8sS22Xc3Xbp7A13Qx+l8bhI3xk+BuvS6yTVQqx
 3rIB0xJVNf7VE2+YX2oc/bOGwKGpbXNLPBXPSyloSYE5GIaRSjVblAuPZ0wLQN81nTmTamP
 zGtrJCDhCP43c/+iSDIJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VHLldsp8lP4=;qDrO+hlZavqr0m0PZUgQCQN7L7x
 OkLC7CJic9SAE4vZjfIWlNuBl/yLUXuuolv7XTNZEbg126/CEFnIXMLGLVj6/HXMmIjY+o8U8
 m2kvxNkShFHsZzVmIkLxXHUt6fiHRYVdmAHgAH8WtmVW6AsemzztV2bdIb1Za6HRl+XWCfP9q
 xMbKfqSGyWpdQk/se9G2lGoqe8/hHL5gRYoiTMzJyo/jsGzjqW6gs9W2ojeF1uH987ELN0qqJ
 cpwqvehuCb3qYgPRB1PnzD0ChJdCEVAglRmktl7q6qktmSunidefr0YaqbE5U/cJ6BSRaNQiI
 HZ7J/z2qiQmUkp3wFfyY7GLw84+elwNbVwq1hq/3m5EtlbFUeypNKB7xBX9Xym+gUKshPcMWI
 WSkLGyPm2SOG9cxpNkNKc/DTghchEnLj4smaChMuXlDWRAplm/4TGa4JrZI2E8bsBzxzD3npk
 D7HaJ5xyiXZ9hea1xvXVPnqFujpcjiSHsLxHiA65CIfMAwvS4qxlc7VDr3bDkk2kLehIIJzl9
 eaS+/0b97KVFZOG6KaTxHnA8SjVxU1U7ENSdWFIbI4xoLd3s+Dzma0tU6V9IyJQajIyGlBXuV
 VbfMODpOLGkU7g0ZUiK6J4PYqWgG9Q5tbTMn8CVhKUCmXF0DXgRw//6zGrfM8+Q7aeKlUjRNO
 DfLhsI90y3TqhZ93xbyzYc1p8dYZJTAgH1LezOrJc640tZ+BlB6D0qvLBixZQqV+Wlkh3NqLu
 M3NDOoycnH+jrl5KHKtJ1agh/Ij3EkKa7OWwDLjbq+lsd/3qLh+sGFGwPGMBkLNUbGUDjlrFr
 bHtjIlcqa1+ionooviwWUVbrSH/jxelWZZFhqFyJR6nnzlzELGirxmbjUrYV7xjPA2lu3c7jk
 wp6taO+BsZZHWXQQbZCuvG+qpxWpIsBwQepNFGAhWpWSu3ywmwUjyRTbLxam6Ki4famPQ8mS9
 B1qXrh+gMTfwtY3WhYLlCtv4Wn/CkC9epjsE0Qxy+Vhqp3wHrDkAcQLfd5j521jRiV4bHYC/+
 jxrGHLowUbqlDEVOT06LqVVRKlh7PRPG+/siH+2
Cc: Andrew Lunn <andrew@lunn.ch>, Parker Newman <pnewman@connecttech.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read
 iommu stream id from device tree
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

On Wed, 4 Dec 2024 17:23:53 +0100
Thierry Reding <thierry.reding@gmail.com> wrote:

> On Tue, Nov 19, 2024 at 02:47:29PM -0500, Parker Newman wrote:
> > On Tue, 19 Nov 2024 20:18:00 +0100
> > Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > > I think there is some confusion here. I will try to summarize:
> > > > - Ihe iommu is supported by the Tegra SOC.
> > > > - The way the mgbe driver is written the iommu DT property is REQUIRED.
> > >
> > > If it is required, please also include a patch to
> > > nvidia,tegra234-mgbe.yaml and make iommus required.
> > >
> >
> > I will add this when I submit a v2 of the patch.
> >
> > > > - "iommus" is a SOC DT property and is defined in tegra234.dtsi.
> > > > - The mgbe device tree nodes in tegra234.dtsi DO have the iommus property.
> > > > - There are no device tree changes required to to make this patch work.
> > > > - This patch works fine with existing device trees.
> > > >
> > > > I will add the fallback however in case there is changes made to the iommu
> > > > subsystem in the future.
> > >
> > > I would suggest you make iommus a required property and run the tests
> > > over the existing .dts files.
> > >
> > > I looked at the history of tegra234.dtsi. The ethernet nodes were
> > > added in:
> > >
> > > 610cdf3186bc604961bf04851e300deefd318038
> > > Author: Thierry Reding <treding@nvidia.com>
> > > Date:   Thu Jul 7 09:48:15 2022 +0200
> > >
> > >     arm64: tegra: Add MGBE nodes on Tegra234
> > >
> > > and the iommus property is present. So the requires is safe.
> > >
> > > Please expand the commit message. It is clear from all the questions
> > > and backwards and forwards, it does not provide enough details.
> > >
> >
> > I will add more details when I submit V2.
> >
> > > I just have one open issue. The code has been like this for over 2
> > > years. Why has it only now started crashing?
> > >
> >
> > It is rare for Nvidia Jetson users to use the mainline kernel. Nvidia
> > provides a custom kernel package with many out of tree drivers including a
> > driver for the mgbe controllers.
> >
> > Also, while the Orin AGX SOC (tegra234) has 4 instances of the mgbe controller,
> > the Nvidia Orin AGX devkit only uses mgbe0. Connect Tech has carrier boards
> > that use 2 or more of the mgbe controllers which is why we found the bug.
>
> Correct. Also, this was a really stupid thing that I overlooked. I don't
> recall the exact circumstances, but I vaguely recall there had been
> discussions about adding the tegra_dev_iommu_get_stream_id() helper
> (that this patch uses) around the time that this driver was created. In
> the midst of all of this I likely forgot to update the driver after the
> discussions had settled.
>
> Anyway, I agree with the conclusion that we don't need a compatibility
> fallback for this, both because it would be actively wrong to do it and
> we've had the required IOMMU properties in device tree since the start,
> so there can't be any regressions caused by this.
>
> I don't think it's necessary to make the iommus property required,
> though, because there's technically no requirement for these devices to
> be attached to an IOMMU. They usually are, and it's better if they are,
> but they should be able to work correctly without an IOMMU.
>
Thanks for confirming from the Nvidia side! I wasn't sure if they would
work without the iommu. That said, if you did NOT want to use the iommu
and removed the iommu DT property then the probe will fail after my patch.
Would we not need a guard around the writes to MGBE_WRAP_AXI_ASID0_CTRL as well?

Thanks,
Parker

> Thanks, and apologies for dropping the ball on this,
> Thierry

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
