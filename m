Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E19275CE98
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 18:21:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1BF7C6B442;
	Fri, 21 Jul 2023 16:21:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37523C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 16:21:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0442661D22;
 Fri, 21 Jul 2023 16:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8891C433C7;
 Fri, 21 Jul 2023 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689956500;
 bh=rqY2poUz63yjLOJ55oXMpkn/XJdCG6+xqHNdcLUoepI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OssVYj7mosdQAKg5FblQyX3u6Xjc+ZUww3jNi3i1wgDMkZG1dcuck5NKrWBWdHWup
 ghHxW2s8/Ow30XqgJ3q+nFyWTZ04k105d0vmMMUaVyzIE+gUW9skdFyjs6++n90K4K
 HZDxUMagyb42BZ4Zz/R1O4ayI/7VwWKNoms3w0n3s1d6Hi+ljryzI1KUrhylmsgA6U
 K/xrhmqXxz+lJhxF/PkbZCA3RNtufYKBLb3mYd37MN7Q5qFxne2tFTGy6tHkf0FBgu
 W/Hz8OXbySuew5gRASwnoMuSfIZ1IHGDdRhcwg+YzPjMzKy33RHCzwYPDwkZI3RHOn
 5b8OoFiXDsDvA==
Message-ID: <8e2f9c5f-6249-4325-58b2-a14549eb105d@kernel.org>
Date: Fri, 21 Jul 2023 18:21:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: "Ng, Boon Khai" <boon.khai.ng@intel.com>,
 "Boon@ecsmtp.png.intel.com" <Boon@ecsmtp.png.intel.com>,
 "Khai@ecsmtp.png.intel.com" <Khai@ecsmtp.png.intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
 <20230721062617.9810-2-boon.khai.ng@intel.com>
 <e552cea3-abbb-93e3-4167-aebe979aac6b@kernel.org>
 <DM8PR11MB5751EAB220E28AECF6153522C13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <DM8PR11MB5751EAB220E28AECF6153522C13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
Cc: "Swee, Leong Ching" <leong.ching.swee@intel.com>, "G Thomas,
 Rohan" <rohan.g.thomas@intel.com>,
 Shevchenko Andriy <andriy.shevchenko@linux.intel.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, "Tham,
 Mun Yew" <mun.yew.tham@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 1/2] dt-bindings: net: snps, dwmac: Add description for rx-vlan-offload
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

On 21/07/2023 17:28, Ng, Boon Khai wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Friday, July 21, 2023 6:11 PM
>> To: Boon@ecsmtp.png.intel.com; Khai@ecsmtp.png.intel.com; "Ng
>> <boon.khai.ng"@intel.com; Giuseppe Cavallaro <peppe.cavallaro@st.com>;
>> Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu
>> <joabreu@synopsys.com>; David S . Miller <davem@davemloft.net>; Eric
>> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo
>> Abeni <pabeni@redhat.com>; Maxime Coquelin
>> <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-stm32@st-md-
>> mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org
>> Cc: Ng, Boon Khai <boon.khai.ng@intel.com>; Shevchenko, Andriy
>> <andriy.shevchenko@intel.com>; Tham, Mun Yew <mun.yew.tham@intel.com>;
>> Swee, Leong Ching <leong.ching.swee@intel.com>; G Thomas, Rohan
>> <rohan.g.thomas@intel.com>; Shevchenko Andriy
>> <andriy.shevchenko@linux.intel.com>
>> Subject: Re: [Enable Designware XGMAC VLAN Stripping Feature 1/2] dt-bindings:
>> net: snps,dwmac: Add description for rx-vlan-offload
>>
>> On 21/07/2023 08:26, Boon@ecsmtp.png.intel.com wrote:
>>> From: Boon Khai Ng <boon.khai.ng@intel.com>
>>>
>>> This patch is to add the dts setting for the MAC controller on
>>> synopsys 10G Ethernet MAC which allow the 10G MAC to turn on hardware
>>> accelerated VLAN stripping. Once the hardware accelerated VLAN
>>> stripping is turn on, the VLAN tag will be stripped by the
>>
>> Subject prefix is totally bogus.
>>
> 
> Which part? It's a 10G Ethernet IP from Sysnopsys, in Roman character it is X (mean 10), so XGMAC.
> Even the driver file I'm editing it is dw"xgmac".

Everything in [].

> 
>>
>>> 10G Ethernet MAC.
>>>
>>> Signed-off-by: Boon Khai Ng <boon.khai.ng@intel.com>
>>> Reviewed-by: Shevchenko Andriy <andriy.shevchenko@linux.intel.com>
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people and lists
>> to CC. It might happen, that command when run on an older kernel, gives you
>> outdated entries. Therefore please be sure you base your patches on recent
>> Linux kernel.
>>
> 
> This is based on net-next repository suggested by the get maintainer script.
> 
> I got the latest net-next just now at the Commit-id b44693495af8 
> which just committed yesterday.
> 
> $ ./scripts/get_maintainer.pl  --scm  -f drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c

That's not how you run it. get_maintainers.pl should be run on patches
or on all files, not just some selection.

> Giuseppe Cavallaro <peppe.cavallaro@st.com> (supporter:STMMAC ETHERNET DRIVER)
> Alexandre Torgue <alexandre.torgue@foss.st.com> (supporter:STMMAC ETHERNET DRIVER)
> Jose Abreu <joabreu@synopsys.com> (supporter:STMMAC ETHERNET DRIVER)
> "David S. Miller" <davem@davemloft.net> (maintainer:NETWORKING DRIVERS)
> Eric Dumazet <edumazet@google.com> (maintainer:NETWORKING DRIVERS)
> Jakub Kicinski <kuba@kernel.org> (maintainer:NETWORKING DRIVERS)
> Paolo Abeni <pabeni@redhat.com> (maintainer:NETWORKING DRIVERS)
> Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
> Richard Cochran <richardcochran@gmail.com> (maintainer:PTP HARDWARE CLOCK SUPPORT)
> netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER)
> linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
> linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
> linux-kernel@vger.kernel.org (open list)
> git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
> git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> git git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
> git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> 
>> You missed at least DT list (maybe more), so this won't be tested by automated
>> tooling. Performing review on untested code might be a waste of time, thus I
>> will skip this patch entirely till you follow the process allowing the patch to be
>> tested.
>>
> 
> This is a new device bringup, thus the DT is not available yet. The DTS will be upstreamed
> by my another colleague, unless, if I can upstream only my part on the setting? 

You are mixing now DTS and DT bindings. Sorry, we do not talk about DTS.

Follow our process of submitting patches. For sure there are folks in
Intel which can explain it to you.


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
