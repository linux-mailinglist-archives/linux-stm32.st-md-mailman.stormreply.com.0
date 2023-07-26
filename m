Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B8A762B23
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 08:10:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB887C6A61A;
	Wed, 26 Jul 2023 06:10:58 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90527C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 06:10:57 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qOXjP-00073w-Ss; Wed, 26 Jul 2023 08:10:43 +0200
Message-ID: <09a2d767-d781-eba2-028f-a949f1128fbd@pengutronix.de>
Date: Wed, 26 Jul 2023 08:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Richard Cochran <richardcochran@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <20230725200606.5264b59c@kernel.org> <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
Content-Language: en-US, de-DE
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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

Hi Richard,

On 7/26/23 05:22, Richard Cochran wrote:
> On Tue, Jul 25, 2023 at 08:06:06PM -0700, Jakub Kicinski wrote:
> 
>> any opinion on this one?
> 
> Yeah, I saw it, but I can't get excited about drivers trying to
> correct delays.  I don't think this can be done automatically in a
> reliable way, and so I expect that the few end users who are really
> getting into the microseconds and nanoseconds will calibrate their
> systems end to end, maybe even patching out this driver nonsense in
> their kernels.
> 

Thanks for your reading and commenting on my patch. As the commit message 
elaborates, the Patch corrects for the MAC-internal delays (this is neither PHY 
delays nor cable delays), that arise from the timestamps not being taken at the 
packet egress, but at an internal point in the MAC. The compensation values are 
read from internal registers of the hardware since these values depend on the 
actual operational mode of the MAC and on the MII link. I have done extensive 
testing, and as far as my results are concerned, this is reliable at least on 
the i.MX8MP Hardware I can access for testing. I would actually like correct 
this on other MACs too, but they are often poorly documented. I have to admit 
that the DWMAC is one of the first hardwares I encountered with proper 
documentation. The driver admittedly still has room for improvements - so here 
we go...

Nevertheless, there is still PHY delays to be corrected for, but I need to 
extend the PHY framework for querying the clause 45 registers to account for 
the PHY delays (which are even a larger factor of). I plan to send another 
series fixing this, but this still needs some cleanup being done.

Also on a side-note, "driver nonsense" sounds a bit harsh from someone always 
insisting that one should not compensate for bad drivers in the userspace stack 
and instead fixing driver and hardware issues in the kernel, don't you think?

> Having said that, I won't stand in the way of such driver stuff.
> After all, who cares about a few microseconds time error one way or
> the other?

I do, and so does my customer. If you want to reach sub-microsecond accuracy 
with a linuxptp setup (which is absolutely feasible on COTS hardware), you have 
to take these things into account. I did quite extensive tests, and measuring 
the peer delay as precisely as possible is one of the key steps in getting 
offsets down between physical nodes. As I use the PHCs to recover clocks with 
as low phase offset as possible, the peer delays matter, as they add phase 
error. At the moment, this patch reduces the offset of approx 150ns to <50ns in 
a real world application, which is not so bad for a few lines of code, i guess...

I don't want to kick off a lengthy discussion here (especially since Jakub 
already picked the patch to next), but maybe this mail can help for 
clarification in the future, when the next poor soul does work on the hwtstamps 
in the dwmac.

Thanks, also for keeping linuxptp going,
Johannes

> 
> Thanks,
> Richard
> 
> 

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
