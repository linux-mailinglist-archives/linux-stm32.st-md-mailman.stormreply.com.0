Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CEFC0554
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Sep 2019 14:41:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FE85C36B0B;
	Fri, 27 Sep 2019 12:41:08 +0000 (UTC)
Received: from inca-roads.misterjones.org (inca-roads.misterjones.org
 [213.251.177.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56229C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 12:41:07 +0000 (UTC)
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1iDpYV-00084m-MZ; Fri, 27 Sep 2019 14:41:03 +0200
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Date: Fri, 27 Sep 2019 13:41:03 +0100
From: Marc Zyngier <maz@kernel.org>
In-Reply-To: <341949c8-7864-5d65-2797-988022724a4c@st.com>
References: <20190927084819.645-1-benjamin.gaignard@st.com>
 <da48ce9633441cd0186518fa7ce1d528@www.loen.fr>
 <341949c8-7864-5d65-2797-988022724a4c@st.com>
Message-ID: <ff11797da8f049b354797689754fde52@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: benjamin.gaignard@st.com, alexandre.torgue@st.com,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable high resolution
	timer
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 2019-09-27 13:36, Benjamin GAIGNARD wrote:
> On 9/27/19 1:22 PM, Marc Zyngier wrote:
>> On 2019-09-27 09:48, Benjamin Gaignard wrote:
>>> Adding always-on makes arm arch_timer claim to be an high 
>>> resolution
>>> timer.
>>> That is possible because power mode won't stop clocking the timer.
>>
>> The "always-on" is not about the clock. It is about the comparator.
>> The clock itself is *guaranteed* to always tick. If it didn't, 
>> that'd be
>> an integration bug, and a pretty bad one.
>>
>> What you're claiming here is that your CPU never enters a low-power 
>> mode?
>> Ever? I find this very hard to believe.
>>
>> Furthermore, claiming that always-on is the way to force the 
>> arch-timer
>> to be an hrtimer is factually wrong. This is what happens *if* this 
>> is
>> the only timer in the system. The only case this is true is for 
>> virtual
>> machines. Anything else has a global timer somewhere that will allow
>> the arch timers to be used as an hrtimer.
>>
>> I'm pretty sure you too have a global timer somewhere in your 
>> system.
>> Enable it, and enjoy hrtimers without having to lie about the 
>> properties
>> of your system! ;-)
>
> Hi Marc,
>
> This SoC doesn't have any other global timer. Use arch_time is the 
> only
> we have to provide hrtimer on this system.

And you don't have any form of power management either? What happens 
when
your CPU goes into idle? If your system does any form of power 
management
*and* doesn't have a separate timer, it is remarkably broken.

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
