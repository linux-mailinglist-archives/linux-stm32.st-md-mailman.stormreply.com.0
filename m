Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07464768C80
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:00:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E9E2C6C844;
	Mon, 31 Jul 2023 07:00:54 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46A4CC6C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 07:00:53 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qQMtS-0004SZ-1N; Mon, 31 Jul 2023 09:00:38 +0200
Message-ID: <de822fa6-16ca-381c-2cdf-7e983f29945b@pengutronix.de>
Date: Mon, 31 Jul 2023 09:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US, de-DE
To: Richard Cochran <richardcochran@gmail.com>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <ZMGIuKVP7BEotbrn@hoboy.vegasvil.org>
 <729dd79e-83aa-0237-1edd-1662a6ae28cd@pengutronix.de>
 <ZMJy6yt4CL250x6Q@hoboy.vegasvil.org>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <ZMJy6yt4CL250x6Q@hoboy.vegasvil.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
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

On 7/27/23 15:36, Richard Cochran wrote:
> On Thu, Jul 27, 2023 at 09:20:10AM +0200, Johannes Zink wrote:
>> Hi Richard,
>>
>> On 7/26/23 22:57, Richard Cochran wrote:
>>> On Mon, Jul 24, 2023 at 12:01:31PM +0200, Johannes Zink wrote:
>>>
>>> Earlier versions of the IP core return zero from these...
>>>
>>>> +#define	PTP_TS_INGR_LAT	0x68	/* MAC internal Ingress Latency */
>>>> +#define	PTP_TS_EGR_LAT	0x6c	/* MAC internal Egress Latency */
>>>
>>
>> good catch. Gonna send a v3 with a check to and set the values for dwmac v5 only.
> 
> AFAICT there is no feature bit that indicates the presence or absence
> of these two registers.
> 
> Are you sure that *all* v5 IP cores have these?
> 
> I am not sure.

I cannot tell for sure either, since I have datasheets for the i.MX8MP only. 
Maybe Kurt has some insights here, as he has additional hardware available for 
testing?

Nevertheless, I am going to add a guard to only use the correction codepath on 
i.MX8MP in v3 for the time being, we can add other hardware later trivially if 
they support doing this.

Best regards
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
