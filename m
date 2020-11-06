Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8E2AB1D6
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 08:44:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C30EC3FAE3;
	Mon,  9 Nov 2020 07:44:14 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 044D7C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 17:16:54 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <h.assmann@pengutronix.de>)
 id 1kb5M4-0004FQ-MM; Fri, 06 Nov 2020 18:16:52 +0100
To: Fabrice Gasnier <fabrice.gasnier@st.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <e8c99989-f018-dd90-2144-e09c05a3731b@pengutronix.de>
 <f9f26c15-f214-0fa5-3d12-10a5ec3b6202@st.com>
From: Holger Assmann <h.assmann@pengutronix.de>
Message-ID: <f076d2e7-f4fc-ec66-b4a9-56ce3d4606be@pengutronix.de>
Date: Fri, 6 Nov 2020 18:16:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f9f26c15-f214-0fa5-3d12-10a5ec3b6202@st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: h.assmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Mon, 09 Nov 2020 07:44:13 +0000
Cc: linux-iio@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Fabrice,

On Fri, Nov 06, 2020 at 10:11:07 +0100, Fabrice Gasnier wrote:
> May I ask a bit more information regarding your needs here?

We basically want to latch the current counter value into the
respective Capture/Compare Register when a pulse occurs at the
corresponding ICx input.
Our goal is to measure the jitter (and timing offset) between two or
more data lines which are supposed to carry the same signal at the
same time. Every line is thus connected to one of the four channels.

 From my understanding the PWM capture interface already goes into the
right direction, although we obviously require to utilize more than
one channel of the timer (and in return only need one C/C Register
per channel). I will therefore take your hint and have a closer look
at the pwm-stm32.c - thanks!

Regards,
Holger
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
