Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A207CD3B2
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 07:55:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4071EC6C838;
	Wed, 18 Oct 2023 05:55:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC023C6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 05:55:36 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qszWg-0007hK-2U; Wed, 18 Oct 2023 07:55:26 +0200
Message-ID: <24f14f0f-2a1b-401d-b5f8-314387d0aaef@pengutronix.de>
Date: Wed, 18 Oct 2023 07:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Jakub Kicinski <kuba@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>
References: <20231010-stmmac_fix_auxiliary_event_capture-v1-0-3eeca9e844fa@pengutronix.de>
 <20231010-stmmac_fix_auxiliary_event_capture-v1-2-3eeca9e844fa@pengutronix.de>
 <20231014144428.GA1386676@kernel.org>
 <004d6ce9-7d15-4944-b31c-c9e628e7483a@pengutronix.de>
 <20231017082618.4558ad06@kernel.org>
 <20231017-transfer-refurbish-5cfaf12a524c-mkl@pengutronix.de>
 <20231017165042.30fa9061@kernel.org>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <20231017165042.30fa9061@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH net-next 2/5] net: stmmac: fix PPS capture
	input index
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

Hi Jakub, hi Marc,

On 10/18/23 01:50, Jakub Kicinski wrote:
> On Tue, 17 Oct 2023 22:27:41 +0200 Marc Kleine-Budde wrote:
>>> Would be good to clarify what impact on device operation the problem
>>> has. How would end user notice the problem?
>>> Does it mean snapshots were always or never enabled, previously?
>>
>> On all dwmac devices not covered by dwmac-intel.c (INTEL 10/100/1000
>> Ethernet PCI driver), PPS capture can be requested from user-space, but
>> is not enabled in HW. There is no error message or other feedback to the
>> user space. The user space will not get any PPS events.
>>
>> As this change also affects the Intel driver, and we don't have any
>> hardware to test, I think it's better that this goes via net-next to
>> give it a bit more time of testing.

I have also CC'ed Kurt in this series, as I know he has at least some hardware 
at hand, though I cannot tell whether he has any chance to test the PPS 
capture. Maybe he has a possibility to try it out. However, giving it a spin in 
net-next SGTM.

> 
> SGTM, we can chalk it up to "never worked, doesn't hurt anyone"
> and put it in net-next. But then the Fixes tag must go.
> 

sure, that's fine for me. I will reword the commit messages and send a v2.

Best regards,
Johannes

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
