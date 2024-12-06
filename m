Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F789E6F67
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 14:42:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8ED3BC71280;
	Fri,  6 Dec 2024 13:42:31 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB1CDC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 13:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=finest.io;
 s=s1-ionos; t=1733492527; x=1734097327; i=parker@finest.io;
 bh=oDF1pej/umtycNfhCuypshXjUCnhQjJmU/FweU7t1Po=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YQ90jWMq2rXWFaX438FmYhwwYE9TSB1Ecw8/gunwHNUi0LUFCsiqYQh2nF3qP/+c
 xo9rB1QO90fdP+VVzIe8gqqbit8UqIjSGpbRTQO/vRcoH6OOhurCtJTX2WM/ZJxSZ
 kuKtWDGjDg7FREGnWFLCQPrmpXSa6Z5LCggcxfalt02afteb5W077iP4Ys9Ir7rn6
 5sWD+4pPEFVIHQcAqHtkXEilZh1AnaWyT1173888lDozReuQz1A/lnr2kfE7y9YyU
 B8CxCISPxngEKaIbKKz+2IEp6MeL9eSG4AMhnmAfzH6iMDsDE6pOLEooucYL4Hxul
 OrxKOEWWyMoFicx6Qg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from SWDEV2.connecttech.local ([98.159.241.229]) by
 mrelay.perfora.net (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id
 0MVwAo-1t8Qek45hQ-00Sn2A; Fri, 06 Dec 2024 14:42:07 +0100
Date: Fri, 6 Dec 2024 08:42:03 -0500
From: Parker Newman <parker@finest.io>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <20241206084203.2502ab95.parker@finest.io>
In-Reply-To: <uad6id6omswjm7e4eqwd75c52sy5pddtxru3bcuxlukhecvj4u@klzgrws24r2q>
References: <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
 <20241118084400.35f4697a.parker@finest.io>
 <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
 <20241119131336.371af397.parker@finest.io>
 <f00bccd3-62d5-46a9-b448-051894267c7a@lunn.ch>
 <20241119144729.72e048a5.parker@finest.io>
 <mpgilwqb5zg5kb4n7r6zwbhy4uutdh6rq5s2yc6ndhcj6gqgri@qkfr4qwjj3ym>
 <20241204115317.008f497c.parker@finest.io>
 <uad6id6omswjm7e4eqwd75c52sy5pddtxru3bcuxlukhecvj4u@klzgrws24r2q>
Organization: Connect Tech Inc.
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:GR+U7oNcooRx02NQ+ePVePaP8XU668iNhisc08U9+9BaNkxGndT
 ifm4bBy086QhHHMDrwj2FKqrc9kTkDBAl0YA5Sbq9GlAu3oHD5tvVHQN97Dzr7Asxs1ATVC
 +X8UyGf8bb8rS27CyMUIzTJTa59yKH/O99qCbKdOZTlB6ORrqh9sGVFig7UcNICBawmgl+l
 X3O5EqjU2q5WN8vEBaqag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:us4J4tAxtOE=;dkxNfRtOIWovCVWfT5CsAqe4xAC
 j/vEtWFMuf0VaSDW7FqfdDV9WKHcGZ68c0pehi9mPt2Vd/Bat3rI+lcbqNKPvGVDljcI+BTQN
 89k1q3bUkCtEsOj5hRC1V1kaAVVhaudVxEm1RHt3e2NtepesShPp02K7s3M3zp1hOxaePqqPO
 TEJgBwNj8cisc2oucEoAZ4h0L0uWOUAU4EmXIHRy1i6LrsjHpALvb8/abtZ4QB9xU7qQec4TD
 H2l5PabOv5va6EId0BndMKfRxWG3fRa6wNDIjnuTry9SJ208SvMUKMzTrMLVqlrR8/AKIh03o
 ZHxlw4subb9BQ87+qwvx0IB3NDsImsjQjCvcZ0Ur1uZyBVAvr4/A5bWPsZtlLHmQsua9hNBM4
 cSgP0G2HJVJODp5bd9aUKoFiu2Xb/Nf5Ag6NzLJxr8kwupL/cQsoF3JCPeBfwJi//cit8FzWN
 +QI+RUfMBJK7urA758Efx2L02dbaFwjDTGlhHb2cpYp3a+olOwZZ8JyLSEGPW8Dc8JwSabnyo
 VBi8XRegXl7xpTi8KIqDCfqvrwR/Sl4BpCoccO9Qg0fBpaWuKDxwiz7y2jIUGfQ2q8Rp+oUBV
 ipTwLAF2YKYamBf53IB18NO68j42Aib2rH9pHOsAklr3Ew0k5NSoWxnyrdyFdHZ4rYBlDQkx/
 eSI3laW0WCpO8bfjNHP5EvwgImnMoB/MYLTFKCUt1GG7AZjpMJ3iG1tSsAa9sySy0npMgVA14
 3b+VadvYCr0qEoRquGiZFPKzmfX1url/q7G2Q+LhexpS6i06zfU7bE3AJoEKRXB29p4lqOMpj
 NONu5ea+kwJTiSxIpGJrcpZXNEQYFOxix829XAf6AaTr4hkooWz9ZkHEhU+IGRyWsGNwmznCX
 dzQ6PFhtEzc6T6yUw7L/jRPX1Du6sZoh9ZIEfQwjSNQj9537kUXNlHlGCkBFj/P71jhLS2Eao
 KHqnJZIHdZ1fhGEho1kufqJp8E25v8Us603GzOs7cQqad0NXES20roi5WYfaXbkeAMMDw173Z
 i5YBwkKuUAr48fFIPkbv3MSxuo0isHXiK6zqms3
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

On Wed, 4 Dec 2024 19:06:30 +0100
Thierry Reding <thierry.reding@gmail.com> wrote:

> On Wed, Dec 04, 2024 at 11:53:17AM -0500, Parker Newman wrote:
> > On Wed, 4 Dec 2024 17:23:53 +0100
> > Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > > On Tue, Nov 19, 2024 at 02:47:29PM -0500, Parker Newman wrote:
> > > > On Tue, 19 Nov 2024 20:18:00 +0100
> > > > Andrew Lunn <andrew@lunn.ch> wrote:
> > > >
> > > > > > I think there is some confusion here. I will try to summarize:
> > > > > > - Ihe iommu is supported by the Tegra SOC.
> > > > > > - The way the mgbe driver is written the iommu DT property is REQUIRED.
> > > > >
> > > > > If it is required, please also include a patch to
> > > > > nvidia,tegra234-mgbe.yaml and make iommus required.
> > > > >
> > > >
> > > > I will add this when I submit a v2 of the patch.
> > > >
> > > > > > - "iommus" is a SOC DT property and is defined in tegra234.dtsi.
> > > > > > - The mgbe device tree nodes in tegra234.dtsi DO have the iommus property.
> > > > > > - There are no device tree changes required to to make this patch work.
> > > > > > - This patch works fine with existing device trees.
> > > > > >
> > > > > > I will add the fallback however in case there is changes made to the iommu
> > > > > > subsystem in the future.
> > > > >
> > > > > I would suggest you make iommus a required property and run the tests
> > > > > over the existing .dts files.
> > > > >
> > > > > I looked at the history of tegra234.dtsi. The ethernet nodes were
> > > > > added in:
> > > > >
> > > > > 610cdf3186bc604961bf04851e300deefd318038
> > > > > Author: Thierry Reding <treding@nvidia.com>
> > > > > Date:   Thu Jul 7 09:48:15 2022 +0200
> > > > >
> > > > >     arm64: tegra: Add MGBE nodes on Tegra234
> > > > >
> > > > > and the iommus property is present. So the requires is safe.
> > > > >
> > > > > Please expand the commit message. It is clear from all the questions
> > > > > and backwards and forwards, it does not provide enough details.
> > > > >
> > > >
> > > > I will add more details when I submit V2.
> > > >
> > > > > I just have one open issue. The code has been like this for over 2
> > > > > years. Why has it only now started crashing?
> > > > >
> > > >
> > > > It is rare for Nvidia Jetson users to use the mainline kernel. Nvidia
> > > > provides a custom kernel package with many out of tree drivers including a
> > > > driver for the mgbe controllers.
> > > >
> > > > Also, while the Orin AGX SOC (tegra234) has 4 instances of the mgbe controller,
> > > > the Nvidia Orin AGX devkit only uses mgbe0. Connect Tech has carrier boards
> > > > that use 2 or more of the mgbe controllers which is why we found the bug.
> > >
> > > Correct. Also, this was a really stupid thing that I overlooked. I don't
> > > recall the exact circumstances, but I vaguely recall there had been
> > > discussions about adding the tegra_dev_iommu_get_stream_id() helper
> > > (that this patch uses) around the time that this driver was created. In
> > > the midst of all of this I likely forgot to update the driver after the
> > > discussions had settled.
> > >
> > > Anyway, I agree with the conclusion that we don't need a compatibility
> > > fallback for this, both because it would be actively wrong to do it and
> > > we've had the required IOMMU properties in device tree since the start,
> > > so there can't be any regressions caused by this.
> > >
> > > I don't think it's necessary to make the iommus property required,
> > > though, because there's technically no requirement for these devices to
> > > be attached to an IOMMU. They usually are, and it's better if they are,
> > > but they should be able to work correctly without an IOMMU.
> > >
> > Thanks for confirming from the Nvidia side! I wasn't sure if they would
> > work without the iommu. That said, if you did NOT want to use the iommu
> > and removed the iommu DT property then the probe will fail after my patch.
> > Would we not need a guard around the writes to MGBE_WRAP_AXI_ASID0_CTRL as well?
>
> Well... frankly, I don't know. There's an override in the memory
> controller which we set when a device is attached to an IOMMU. That's
> usually how the stream ID is programmed. If we don't do that it will
> typically default to a special passthrough stream ID (technically the
> firmware can lock down those register and force them to a specific
> stream ID all the time). I'm not sure what exactly the impact is of
> these ASID registers (there's a few other instances where those are
> needed). They are required if you want to use the IOMMU, but I don't
> know what their meaning is if the IOMMU is not enabled.
>
> There's also different cases: the IOMMU can be disabled altogether, in
> which case no page tables and such exist for any device and no
> translation should happen whatsoever. But there's also the case where an
> IOMMU is enabled, but certain devices shouldn't attach to them. I should
> make it very clear that both of these are not recommended setups and I
> don't know if they'll work. And they are mostly untested. I've been
> meaning, but haven't found the time, to test some of these cases.
>

Yes I agree, all of those situations are very niche and not recommended for
a Tegra platform that should always have the iommu enabled anyways. Adding an
iommu bypass would probably be outside of the scope of this patch.

I will not add a patch marking the iommu as required in the device tree
bindings when I submit v2 unless anyone else feels different.

Thanks again,
Parker


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
