Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 764E82A2AF1
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Nov 2020 13:48:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EFF5C36B35;
	Mon,  2 Nov 2020 12:48:57 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80EA3C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Nov 2020 12:48:56 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kZZGa-0001Yb-0n; Mon, 02 Nov 2020 13:48:56 +0100
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Corentin Labbe <clabbe.montjoie@gmail.com>
References: <20201021183149.GA8436@Red> <20201023134201.GA533@Red>
 <20201023203943.GA21435@Red> <20201024115307.GA2745@qmqm.qmqm.pl>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <8a580d12-fa4a-6cd8-4d82-3e3b784e348b@pengutronix.de>
Date: Mon, 2 Nov 2020 13:48:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201024115307.GA2745@qmqm.qmqm.pl>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: lgirdwood@gmail.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 wens@csie.org, broonie@kernel.org,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [BUG] Error applying setting,
 reverse things back on lot of devices
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Micha=B3,

CC +=3D linux-stm32

On 10/24/20 1:53 PM, Micha=B3 Miros=B3aw wrote:
> On Fri, Oct 23, 2020 at 10:39:43PM +0200, Corentin Labbe wrote:
>> On Fri, Oct 23, 2020 at 03:42:01PM +0200, Corentin Labbe wrote:
>>> On Wed, Oct 21, 2020 at 08:31:49PM +0200, Corentin Labbe wrote:
>>> I have just saw thoses 3 lines which are probably the real problem.
>>> I have started a new bisect with this error, but it is hitting the same=
 "crash range" the first one.
>>>
>>
>> I have bisected the problem to commit aea6cb99703e17019e025aa71643b4d3e0=
a24413 ("regulator: resolve supply after creating regulator")
>> Reverting this fix my problem.

The change broke boot on all the STM32MP1 boards, because the STPMIC driver
has a vref_ddr regulator, which does not have a dedicated supply, but witho=
ut
a vref_ddr-supply property the system now no longer boots.

> Can you try the hack below?
> =

> Best Regards,
> Micha=B3 Miros=B3aw
> =

> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index a4ffd71696da..9ad091f5f1ab 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -1169,6 +1169,9 @@ static int machine_constraints_voltage(struct regul=
ator_dev *rdev,
>  		}
>  =

>  		if (current_uV < 0) {
> +			if (current_uV =3D=3D -EINVAL && rdev->supply_name)
> +				return -EPROBE_DEFER;
> +

This doesn't fix the issue for the STM32MP1 boards (tested on LXA MC-1).
Seeing that the patch is already in stable, I think this patch should be
reverted until the issues are solved in Linus' master.

Cheers,
Ahmad


>  			rdev_err(rdev,
>  				 "failed to get the current voltage: %pe\n",
>  				 ERR_PTR(current_uV));
> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> =


-- =

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
