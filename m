Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FD37C7178
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 17:30:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 880A6C6A5EA;
	Thu, 12 Oct 2023 15:30:19 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42309C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 15:30:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AA24FB824CA;
 Thu, 12 Oct 2023 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F77C433C8;
 Thu, 12 Oct 2023 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697124617;
 bh=ZtcSIbjB2WpeZfQRyCvdpc+0MAvoSIsAVFQJFGWoAZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sNlqy8imXhwlW5ogqsGatXLJh6x3ULy2dxsaSxs56ggFVkTV6XlGelwtvmknbj7Xu
 ShUCZ/8OXslZolbuuvyrBlxLrcJ01GSlmz7CSJEaxf3rAcgbPMbnfuFHufU09E90RW
 5ApYEGyJHTTls7cFvAibnKaw6QYJ/MgybICMj+V6qAR0vsGzNnF3N6loiEvhXeakbo
 Tc8RBxaMuLt9cw9IyN5cmf2yVbPk/7zrWOf/NIL+18Z146Hj24oQ+EZR236LNiKgxH
 rW8s1EpB9lyTQA3S/nGP0hy8u95XFa9UJYnNgK7IXnZV4NIWHKMv5YsKgXN/Jehq6j
 lkrAiKBqcY2gw==
Received: (nullmailer pid 821925 invoked by uid 1000);
 Thu, 12 Oct 2023 15:30:12 -0000
Date: Thu, 12 Oct 2023 10:30:12 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <20231012153012.GA698406-robh@kernel.org>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
 <20231010125719.784627-11-gatien.chevallier@foss.st.com>
 <20231010184212.GA1221641-robh@kernel.org>
 <8f1b6915-68be-a525-c5d5-37f0983c14de@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f1b6915-68be-a525-c5d5-37f0983c14de@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, peng.fan@oss.nxp.com,
 herbert@gondor.apana.org.au, Frank Rowand <frowand.list@gmail.com>,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org,
 linux-p.hy@lists.infradead.org, richardcochran@gmail.com,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 10/11] ARM: dts: stm32: add ETZPC as a
 system bus for STM32MP15x boards
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

On Wed, Oct 11, 2023 at 10:49:58AM +0200, Gatien CHEVALLIER wrote:
> Hi Rob,
> 
> On 10/10/23 20:42, Rob Herring wrote:
> > On Tue, Oct 10, 2023 at 02:57:18PM +0200, Gatien Chevallier wrote:
> > > ETZPC is a firewall controller. Put all peripherals filtered by the
> > > ETZPC as ETZPC subnodes and reference ETZPC as an
> > > access-control-provider.
> > > 
> > > For more information on which peripheral is securable or supports MCU
> > > isolation, please read the STM32MP15 reference manual.
> > > 
> > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > > ---
> > > 
> > > Changes in V6:
> > >      	- Renamed access-controller to access-controllers
> > >      	- Removal of access-control-provider property
> > > 
> > > Changes in V5:
> > >      	- Renamed feature-domain* to access-control*
> > > 
> > >   arch/arm/boot/dts/st/stm32mp151.dtsi  | 2756 +++++++++++++------------
> > >   arch/arm/boot/dts/st/stm32mp153.dtsi  |   52 +-
> > >   arch/arm/boot/dts/st/stm32mp15xc.dtsi |   19 +-
> > >   3 files changed, 1450 insertions(+), 1377 deletions(-)
> > 
> > This is not reviewable. Change the indentation and any non-functional
> > change in one patch and then actual changes in another.
> 
> Ok, I'll make it easier to read.
> 
> > 
> > This is also an ABI break. Though I'm not sure it's avoidable. All the
> > devices below the ETZPC node won't probe on existing kernel. A
> > simple-bus fallback for ETZPC node should solve that.
> > 
> 
> I had one issue when trying with a simple-bus fallback that was the
> drivers were probing even though the access rights aren't correct.
> Hence the removal of the simple-bus compatible in the STM32MP25 patch.

But it worked before, right? So the difference is you have either added 
new devices which need setup or your firmware changed how devices are 
setup (or not setup). Certainly can't fix the latter case. You just need 
to be explicit about what you are doing to users.


> Even though a node is tagged with the OF_POPULATED flag when checking
> the access rights with the firewall controller, it seems that when
> simple-bus is probing, there's no check of this flag.

It shouldn't. Those flags are for creating the devices (or not) and 
removing only devices of_platform_populate() created.

> of_platform_populate() checks and sets the OF_POPULATED_BUS flag.
> Maybe that is my error and the firewall bus populate should set
> OF_POPULATED_BUS instead of OF_POPULATED. Is that correct?

Shrug. Off hand, I'd say probably not, but am not certain.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
