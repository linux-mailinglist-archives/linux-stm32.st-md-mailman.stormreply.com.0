Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 998E475CEFA
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 18:26:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A540C6B452;
	Fri, 21 Jul 2023 16:26:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B84C3C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 16:26:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6D1461D3F;
 Fri, 21 Jul 2023 16:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E561C433C8;
 Fri, 21 Jul 2023 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689956779;
 bh=WL2709V7eAgLoPYAlshlm4ASA+zokq6+PqUZyFxv+DM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aAq8uHd8HFGwxapczl08Jl6HfT7SWJGa7hodSjSL8iXf5IOAWZzGgzXW3bv/HEx/6
 u63ZwW2Yv3gbaKiYvcqaU+uhNXe8ALOfUE8j/NMI8T6MOimgXy/KcweVxLz8GdI3IC
 lhxlR1ymyNVgH1aDTw8f4UUREHQiszKjX1p3vyLpqryx8MKcw/ADGt5SwptqEarDTQ
 p6drq4J5gD0BbcNM9bXJ8gSjl0b6BfVFApNal0AjXdET+2o5AJxF3TgnvVHALehreZ
 HVPCIMEIpbjAzypiSo5W4O++b04VymxIDoBnwDqLqGV8v+WZ/1YTffFchL/xiG1Ugc
 oMV5J7utIwdoA==
Message-ID: <d58cd6cc-70a9-3759-9af2-c4a292440767@kernel.org>
Date: Fri, 21 Jul 2023 18:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
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
> This is a new device bringup, thus the DT is not available yet. The DTS will be upstreamed
> by my another colleague, unless, if I can upstream only my part on the setting? 
> 
>> Please kindly resend and include all necessary To/Cc entries.

To be clear, since you do not agree with my comment you skipped vital
lists, this was not tested by automation so it is NAK from me.

Sorry.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
