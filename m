Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACA59D41A1
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52BBBC7BF84;
	Wed, 20 Nov 2024 17:49:47 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61E55C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=finest.io;
 s=s1-ionos; t=1732040021; x=1732644821; i=parker@finest.io;
 bh=VGT8AsS8Us1spIq9IkDtJaus5/uzjZbOrMzyLjeFCNQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uONjaW2FblG/6peh9CrwJ8XfF2tDFqYzBm0/FVmh1cbgSJvIV2STyvLj609t1bSm
 j7E/90mYpc6DFcdH5K9kuPE3fUdGViS6Cyl6s1yfiCoGy9nC4AC4TkMrLJAUGfjjL
 3ot+Uio1KuKJL+Z/ZvUa3rTw6BIU3zYv+vqnDj2PdMsw5bMvTVF0s9ljozJwLRCYK
 9kps61qMxknCaPTMQhBQQIpKxV0Kxu+q5zMTHlPhgS6ApViyesHEvdDvip9csBZZ5
 RNhiHzIZMnFFRvQSWLWX6iiniXgWEvZNSZ/zqVjzvO6+UxgVk5O4HlvAX1sQ+0Z6z
 pqMzG4BBklMvP2R+zg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from SWDEV2.connecttech.local ([98.159.241.229]) by
 mrelay.perfora.net (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
 1N95Jb-1tqap93LVv-017uyx; Tue, 19 Nov 2024 19:13:40 +0100
Date: Tue, 19 Nov 2024 13:13:36 -0500
From: Parker Newman <parker@finest.io>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20241119131336.371af397.parker@finest.io>
In-Reply-To: <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
 <20241118084400.35f4697a.parker@finest.io>
 <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
Organization: Connect Tech Inc.
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:AtKqw0Z1I7mrrYJHxTfQz5F8hUNeBM14Cog+yV7Z7kBlruzLoEq
 52aV4ZlzIPc1OCm+IfwqymFQaKhYt2ZbqHTJJjIQtpu18McO2js+UUUqNozSyFiYvq1vMor
 j9qgYJ9/bNlYyTzSt2XcktTKgokGqx4GQXdAyJty1dbl52/eaXikcxB5rMLKxb3u1DoDau0
 uxB9RThgXBNB/H6oziE3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GuLdzSAGVIo=;t3EYDXONAZMT2F7a5+doMXWtZjV
 cuPGr3pdRSaNEJ3lO0C0RnOVAEH+I4kv7Lt9MhqlfkkCa3ctc+Eru00Tvng2hrD7aEvbKEGR2
 Wxyg76vJ6IzKEaeRWP3H3PilJZHve7T0xqTYrl4X+RFBxF0FUOCgF0uVCOpxr05CLxuqxNEas
 VajBnbVq1GKwPOo2s/J0ZPsxei8RaO2/NhtbJXrgLf/V/EbYVkcs35rr5pRNmoKc1jsUL30rH
 IaLCS6xT3Dca9e8ZYpX37p1rpT2e8/SW3jqZLCRwHXVmYAbOZST1WD/1qEaDr32EPl8do+Pf5
 bhkB01vomsqhSSD2kGW+APTP3QA4z+Aqp0dYn3FbAr+ASMgt+PmghUV/CIcjnIrHPBj8Df/vz
 dCWIDSC8goGPB2aLNJDsjWNC1cLOk/Xyy0d3RDAJjiMA/uPMJWuw6yoLc7YTCZJS8JYlbgt3x
 m61c4e5SHkb3lafflPNLQEPo1FTEWpWu95VWbn4csRoo7XQT1IiOvdslMd58YVN1BSef89qeZ
 lq1sbzE9+tlg25Rwx9S+Gflbq/R9ZmIQw/c2Rmxqaed4CTVyFf5e68kln99SAMq6chzOpaDRe
 quTSx0TaDCaw0bgcavSAWYkcmgkAqk3o9WZh5huC+o70gGK/RQ1jgIw/7cHXdJCJDIory/dYH
 PCc+TioN+rhYatstwunHIshLdhPvLA06Pv5/+UoaoaRAe07nfdcvITa8EQvzi/y6d9WEjCHx/
 07d1BJrVCRQjXE+kBDRQ4+SaZ4M9Zc9yqrnc1Ofo5ii8rBGvcZ0o0ABKOh8S65HiZdboh2e4b
 IpA4NlLSNMrMLav9j14WctihV02FYT81m/4Y+QtzPNYTAqfOHznU1Z4E0I1KmubFto
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: Parker Newman <pnewman@connecttech.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <thierry.reding@gmail.com>,
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

On Tue, 19 Nov 2024 01:50:18 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> > This is not a new dt property, the "iommus" property is an existing property
> > that is parsed by the Nvidia implementation of the arm-smmu driver.
> >
> > Here is a snippet from the device tree:
> >
> > smmu_niso0: iommu@12000000 {
> >         compatible = "nvidia,tegra234-smmu", "nvidia,smmu-500";
> > ...
> > }
> >
> > /* MGBE0 */
> > ethernet@6800000 {
> > 	compatible = "nvidia,tegra234-mgbe";
> > ...
> > 	iommus = <&smmu_niso0 TEGRA234_SID_MGBE>;
> > ...
> > }
> >
> > /* MGBE1 */
> > ethernet@6900000 {
> > 	compatible = "nvidia,tegra234-mgbe";
> > ...
> > 	iommus = <&smmu_niso0 TEGRA234_SID_MGBE_VF1>;
> > ...
> > }
>
> What i was meaning does the nvidia,tegra234-mgbe binding allow iommus?
> I just checked, yes it does.
>
> > If the iommus property is missing completely from the MGBE's device tree node it
> > causes secure read/write errors which spam the kernel log and can cause crashes.
> >
> > I can add the fallback in V2 with a warning if that is preferred.
>
> The fact it crashed makes me think it is optional. Any existing users
> must work, otherwise it would crash, and then be debugged. I guess you
> are pushing the usage further, and so have come across this condition.
>
> Is the iommus a SoC property, or a board property? If it is a SoC
> property, could you review all the SoC .dtsi files and fix up any
> which are missing the property?
>
> Adding a warning is O.K, but ideally the missing property should be
> added first.

I think there is some confusion here. I will try to summarize:
- Ihe iommu is supported by the Tegra SOC.
- The way the mgbe driver is written the iommu DT property is REQUIRED.
- "iommus" is a SOC DT property and is defined in tegra234.dtsi.
- The mgbe device tree nodes in tegra234.dtsi DO have the iommus property.
- There are no device tree changes required to to make this patch work.
- This patch works fine with existing device trees.

I will add the fallback however in case there is changes made to the iommu
subsystem in the future.

> The merge window is open now, so patches will need to wait two weeks.
>

Ok thanks, I will wait a couple weeks to resend.
Parker







_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
