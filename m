Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEACB7CBEAA
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Oct 2023 11:13:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C91BC6A61D;
	Tue, 17 Oct 2023 09:13:17 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04CAEC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 09:13:15 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qsg8J-0003xl-I0; Tue, 17 Oct 2023 11:12:59 +0200
Message-ID: <004d6ce9-7d15-4944-b31c-c9e628e7483a@pengutronix.de>
Date: Tue, 17 Oct 2023 11:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Simon Horman <horms@kernel.org>
References: <20231010-stmmac_fix_auxiliary_event_capture-v1-0-3eeca9e844fa@pengutronix.de>
 <20231010-stmmac_fix_auxiliary_event_capture-v1-2-3eeca9e844fa@pengutronix.de>
 <20231014144428.GA1386676@kernel.org>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <20231014144428.GA1386676@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
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

Hi Simon,

On 10/14/23 16:44, Simon Horman wrote:
> On Thu, Oct 12, 2023 at 11:02:13AM +0200, Johannes Zink wrote:
>> The stmmac supports up to 4 auxiliary snapshots that can be enabled by
>> setting the appropriate bits in the PTP_ACR bitfield.
>>
>> Previously instead of setting the bits, a fixed value was written to
>> this bitfield instead of passing the appropriate bitmask.
>>
>> Now the correct bit is set according to the ptp_clock_request.extts_index
>> passed as a parameter to stmmac_enable().
>>
>> Fixes: f4da56529da6 ("net: stmmac: Add support for external trigger timestamping")
>> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
> 
> Hi Johannes,
> 
> The fix language of the subject and presence of a fixes tag implies that
> this is a bug fix. But it's not clear to me that this is resolving
> bug that manifests as a problem.

Thank you for taking your time to read through the series. This series is 
somewhere in the realm between "fixing some stuff added previously (and never 
worked)" and "filling the gaps/adding a new feature in some template code that 
never worked as intended". However, I do not have strong opinions about this.

If you prefer to have the commits reworded, I will just wait a bit more for any 
additional feedback and resend the series with the commit messages reworded+ 
fixes, should any be required.

> 
> If it is a bug fix then it should probably be targeted at 'net',
> creating a dependency for the remainder of this series.
> 
> On the other hand, if it is not a bug fix then perhaps it is best to
> update the subject and drop the Fixes tag.

I added the fixes-Tag in order to make code archeology easier, but as it may 
trigger picks to stable branches (which is not required imho), I have no 
objections to dropping it for a v2.

> 
> I'm no expert on stmmac, but the rest of the series looks good to me.
> 
> ...
> 

that's good news. thx for looking through the series.

Best regards
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
