Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DDC2B5D46
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Nov 2020 11:54:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68803C3FAD7;
	Tue, 17 Nov 2020 10:54:22 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41A15C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 10:54:21 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1keyct-00059B-EW; Tue, 17 Nov 2020 11:54:19 +0100
To: William Breathitt Gray <vilhelm.gray@gmail.com>
References: <e8c99989-f018-dd90-2144-e09c05a3731b@pengutronix.de>
 <20201106124217.GA4015@shinobu>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <0fa25b7a-92f9-8eb7-088e-2ef3a2edf2a0@pengutronix.de>
Date: Tue, 17 Nov 2020 11:54:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201106124217.GA4015@shinobu>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>, linux-iio@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] Counter device Interface for reading out input
	capture
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

Hello William,

On 06.11.20 13:42, William Breathitt Gray wrote:
> On Thu, Nov 05, 2020 at 07:46:14PM +0100, Ahmad Fatoum wrote:
>> It doesn't look like the counter device API is yet made to support such
>> an input capture mode (latching a counter value on an external event, e.g.
>> to timestamp incoming rising edges to measure jitter between pulses).
>
> Regarding the Counter subsystem, I'm developing a Counter character
> device API that supports timestamps for counter devices:
> https://lore.kernel.org/linux-arm-kernel/157d1edf-feec-33b5-7ad5-94f99316ca6e@lechnology.com/T/

Any chance we could have a "raw" timestamp as well like the network
stack offers (cf. SOF_TIMESTAMPING_{RAW,SYS}_HARDWARE)?

The API currently only exposes a ktime (i.e. CLOCK_MONOTONIC), which the
raw timer count can't be readily converted to. For our use case of
measuring jitter, the raw value is sufficient.

> My aim is to get this functionality picked up for the Linux 5.11 merge
> window. I have one more revision at least that should be ready in a
> couple weeks -- I'll CC you for that patchset to keep you in the loop;
> I force-push periodically to my personal repo when as I develop, so you
> can take a look at the current state of this next revision if you're
> curious:
> https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v6

Great. Looking forward to see this merged.

Thanks,
Ahmad

> 
> Sincerely,
> 
> William Breathitt Gray
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
