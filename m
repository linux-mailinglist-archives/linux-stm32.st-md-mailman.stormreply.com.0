Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE09E6F6A4C
	for <lists+linux-stm32@lfdr.de>; Thu,  4 May 2023 13:45:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8ED62C6A5EE;
	Thu,  4 May 2023 11:45:12 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE466C69073
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 May 2023 11:45:10 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7F8E7580E74;
 Thu,  4 May 2023 07:45:09 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 04 May 2023 07:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1683200709; x=1683207909; bh=rv
 dn+vPe48KPGDs0leGYpaM1jtugXaszLFPftQ7tCmQ=; b=K3vb/txYtZKnDaX7av
 yXDErCEtK8JWoojEYV/KOhr/Dv3+/xOdTNnlfPilF7nZ1vUsdDP7l+AgwDbRQSuE
 5AUT6SPooYuy01IO6jURwU7twh1iCROPuF4Hz3zAUJdbJERGRcVw7wLAOdZON0f2
 AhZwSiy8u7IYmN4dU7xIQbvrXShHBkCkYnYnC0IoMvFDdx6WQKJ4rLgfLXj0hCW/
 ckDTGcWhommWigg7s6rAmkjQ1+FesSQJLbAeZIs8XTPkdZlzCBQmlaWbCOt46UI7
 TaQrFKOEB7Nrxln82bVy1GZqe9KuSEr+WJIPa6wdhqmLquSGvkDqg3ABmaiUtN8f
 /V6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1683200709; x=1683207909; bh=rvdn+vPe48KPG
 Ds0leGYpaM1jtugXaszLFPftQ7tCmQ=; b=Pw6Rg+XVCkD8w3YHy7jGkIyjxzhiF
 bN/nWbfwIR4ZK/F9LSR2lSdh5WuOB6Zd/S/dxjLYOJX2pQKrTV0T8idbkjcOcQF5
 SwoSgg9l8jKzkx3OOYZXp9IzAPIUyKCbJYXfJ1Co1zpAhWXPmQXpDlG8hbdhXCqo
 Ide3agAfwauTe+q41YGw5qJ2db95dqZn1JU+kHQVa7baSeKRpcpIB14hYe498UV1
 qSbU08XfSJ51vZL4nbzqAVErhFeOyUkPmcXy3uA1E2ZHbZ12aj+TO8581K6JMOqx
 WSKLMOUGfU3GMPJTvVpyvFa7UxM2y027LOl0hEHvk1DeHWVGhQTOePmWQ==
X-ME-Sender: <xms:xJpTZBRFDKFjpUX2zSPaH_4Nc8R2Qpk2no6uSQvOfRDhdZKlcM2S1w>
 <xme:xJpTZKx9r-aiclDw81Wu7rGAVEGjfn7b8plKzDI0Fm4sbn8ToKgyao_lHGOMzamjl
 uNZIJ6W5xJhlsHwBQU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeftddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:xJpTZG1ikd38RTtD1R071POfBXt5S1hFZ6Fml4H3RBTwbc4m3wVYQA>
 <xmx:xJpTZJBCtHzUiKeZoBrJeZc8fH8Ed5ISfh9DPuxYIqK6axwqLg053Q>
 <xmx:xJpTZKh7kYU5y_FppCdiasiBdQUPjv6lvIKqgolP6FEiBuWg49SF6g>
 <xmx:xZpTZKDU9-4LKKK2Ti8y1N5SEny0C66Vm4BJmIaG1feFi_OTmPFchA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5DF60B60089; Thu,  4 May 2023 07:45:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <6ece505b-1075-48e6-9ff9-1673014e5df1@app.fastmail.com>
In-Reply-To: <ZFOE4wd31hpJh0ro@shell.armlinux.org.uk>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <ZFOE4wd31hpJh0ro@shell.armlinux.org.uk>
Date: Thu, 04 May 2023 13:44:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Russell King" <linux@armlinux.org.uk>, "Rob Herring" <robh+dt@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

On Thu, May 4, 2023, at 12:11, Russell King (Oracle) wrote:
> On Tue, May 02, 2023 at 02:40:19PM -0500, Rob Herring wrote:
>> I think the only issue remaining is finalizing the mapping of
>> platforms to subdirs. What I have currently is a mixture of SoC
>> families and vendors. The most notable are all the Freescale/NXP
>> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
>> either. Once that's finalized, I still need to go update MAINTAINERS.
>
> I haven't followed this discussion at all, so here's a question.
>
> What does this mean for the _installed_ dtb files? Do they move
> location? If they do, lots is going to break, because there will
> be u-boot configurations and other scripts that assume the flat
> directory structure for the installed dtb files.
>
> I don't think changing the installed dtb structure is acceptable
> at this point in time. It's something that _should_ have been
> thought about when ARM was converted to dtb, it's too late to be
> changing that now.

Rob said earlier that his script does keep a flat directory
for the output of 'make dtbs_install'.

     Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
