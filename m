Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFE9C18917
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 07:59:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 678B7C62D3D;
	Wed, 29 Oct 2025 06:59:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 539FAC62D3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 06:59:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8222CC0BEBA;
 Wed, 29 Oct 2025 06:59:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C0F63606E8;
 Wed, 29 Oct 2025 06:59:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D513F103115AD; Wed, 29 Oct 2025 07:59:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761721162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=F+KTjI1TM7mg6rcCTezA/+UdyBmDty2R5itDbwstprQ=;
 b=o/f2BvsK1UFERMGggVndtxtQP6Off6yNARbRDm45ax8eVzx6q68dtBRTepmeXOju2Zrq3a
 jaH+noqfpaC8Gu9aTjShhjImZRq0X0lMCzzDXyVJkOV7o4wSw+RMjBH+bXzHKaF9tkTROV
 xfMczXjE0dkfTw6GY31uyOk+FWRoY+ASP+3TunTC9hMPsZKyBfeTrlkyznVPrxgBCea9mQ
 2Xi6esdXpqoG2p1KkVm/nKFR0lzaKIy8qT0jhpGlqno5jw0YDmn+UgDngAdIfvQmhRa5BL
 6T0m1GLtxuLgtVRF0l+z7bz9fdL2atrz2GKf0Q2UD7zXVuJDHwzF8H2BIqxAaw==
Message-ID: <71310577-7cea-42ce-8442-49e09e0b958a@bootlin.com>
Date: Wed, 29 Oct 2025 07:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
 <20251024070720.71174-3-maxime.chevallier@bootlin.com>
 <20251028151925.12784dca@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251028151925.12784dca@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: Add a
 devlink attribute to control timestamping mode
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

Hi Jakub,

On 28/10/2025 23:19, Jakub Kicinski wrote:
> Sorry didn't get to review this in time.
> 
> On Fri, 24 Oct 2025 09:07:18 +0200 Maxime Chevallier wrote:
>> +   * - ``ts_coarse``
> 
> This is not a great name IMHO. Is "coarse" from the PRM?

Yes, it uses "fine/coarse"

> It's the increment that's coarse, right? Not the timestamp
> This naming confuses me greatly.

That is true, the ts_ was added as this configuration is done based
on the timestamping control registers, and is refered to as
"timestamping control fine update" in the register defs :(

So you are correct that in the end the clock frequency is coarsely
adjusted.

The patch was applied, should we revert or add another patch to rename
that parameter ?

> 
>> +     - Boolean
>> +     - runtime
>> +     - Enable the Coarse timestamping mode. In Coarse mode, the ptp clock is
>> +       expected to be updated through an external PPS input, but the subsecond
> 
> I guess the definition of "PPS input" got diluted but technically it
> means Pulse Per Second, right? Here IIUC we need an actual 50MHz clock
> fed in?

For GM, yes indeed. I can update the doc accordingly.

> 
>> +       increment used for timestamping is set to 1/ptp_clock_rate. In Fine mode
>> +       (i.e. Coarse mode == false), the ptp clock frequency is adjusted more
>> +       frequently, but the subsecond increment is set to 2/ptp_clock_rate.
>> +       Coarse mode is suitable for PTP Grand Master operation. If unsure, leave
>> +       the parameter to False.
> 
> My understanding based on your previous explanation is that basically
> in one of the modes the frequency cannot be adjusted. It's only usable
> if a very stable reference clock is fed into the device (or otherwise
> we "trust" the clock that's fed in). So that's why Grand Master.
> 
> In the other mode we can tweak the frequency more accurately.
> But it comes at a cost of the HW time incrementing 2x larger step.
> 
> If that's the case I think we should update the documentation and
> rename the knob to indicate that it's the frequency adjustment that's
> coarse.

That's fine by me, just let me know abut the exact process, I can followup
on that :)

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
