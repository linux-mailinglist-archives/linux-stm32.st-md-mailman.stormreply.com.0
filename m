Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E3F44D544
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Nov 2021 11:48:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F8EBC5EC71;
	Thu, 11 Nov 2021 10:48:46 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68236C5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 10:48:44 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <h.assmann@pengutronix.de>)
 id 1ml7dL-00011i-GX; Thu, 11 Nov 2021 11:48:43 +0100
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Michael Olbrich <m.olbrich@pengutronix.de>
References: <20211108202854.1740995-1-vladimir.oltean@nxp.com>
 <87bl2t3fkq.fsf@kurt> <20211109103504.ahl2djymnevsbhoj@skbuf>
 <6bf6db8b-4717-71fe-b6de-9f6e12202dad@pengutronix.de>
 <20211109142255.5ohhfyin7hsffmlk@skbuf>
 <20211110123843.3u4jo3xe7plows6r@skbuf>
From: Holger Assmann <h.assmann@pengutronix.de>
Message-ID: <7090ab87-e0ba-3f5a-116d-71ce34a94c97@pengutronix.de>
Date: Thu, 11 Nov 2021 11:48:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110123843.3u4jo3xe7plows6r@skbuf>
Content-Language: de-DE
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: h.assmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Yannick Vignon <yannick.vignon@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: allow a tc-taprio
 base-time of zero
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

Hi,

Am 10.11.21 um 13:38 schrieb Vladimir Oltean:
>>
>> Indeed. Was there a v2 to that?
> 
> FWIW I've applied that patch and made a few fixups according to my
> liking, and it works fine. I can resend it myself if there aren't any
> volunteers from Pengutronix.
> 

Feel free to do so!

Greetings,
Holger

-- 
Pengutronix e.K.                         | Holger Assmann              |
Steuerwalder Str. 21                     | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686         | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
