Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9ACF548F
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2019 20:21:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58931C36B0B;
	Fri,  8 Nov 2019 19:21:42 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4112CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 19:21:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 89E451539AF1E;
 Fri,  8 Nov 2019 11:21:38 -0800 (PST)
Date: Fri, 08 Nov 2019 11:21:38 -0800 (PST)
Message-Id: <20191108.112138.629818881403847512.davem@davemloft.net>
To: alexandre.torgue@st.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <8c4efcce-b46f-ac94-a367-50ff5d78c8a2@st.com>
References: <20191107084757.17910-1-christophe.roullier@st.com>
 <20191107.152640.1457462659040029467.davem@davemloft.net>
 <8c4efcce-b46f-ac94-a367-50ff5d78c8a2@st.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 08 Nov 2019 11:21:39 -0800 (PST)
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com, andrew@lunn.ch,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 net-next 0/4] net: ethernet: stmmac:
 cleanup clock and optimization
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

From: Alexandre Torgue <alexandre.torgue@st.com>
Date: Fri, 8 Nov 2019 11:35:23 +0100

> Hi David
> 
> On 11/8/19 12:26 AM, David Miller wrote:
>> From: Christophe Roullier <christophe.roullier@st.com>
>> Date: Thu, 7 Nov 2019 09:47:53 +0100
>> 
>>> Some improvements:
>>>   - manage syscfg as optional clock,
>>>   - update slew rate of ETH_MDIO pin,
>>>   - Enable gating of the MAC TX clock during TX low-power mode
>>>
>>> V4: Update with Andrew Lunn remark
>> This is mostly ARM DT updates, which tree should this go through?
>> I don't want to step on toes this time :-)
>> 
> 
> I'll take DT patches in my STM32 tree.

Ok, I took patch #1 into net-next.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
