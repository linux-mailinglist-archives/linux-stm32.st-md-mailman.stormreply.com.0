Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D22A3D24
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Nov 2020 08:06:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B79F4C3FAD5;
	Tue,  3 Nov 2020 07:06:54 +0000 (UTC)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6178BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Nov 2020 20:27:35 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4CQ4GX0ZWfz6r;
 Mon,  2 Nov 2020 21:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1604348854; bh=WK11YnyQEwN2KcQnNU2MIZhQIDNo2+h26QG/omCesAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MtprQsP4+xMhD1EN+MeixU5nEa4DUFL3FjfiVo8Whu81aisNIHBvQ2Hsv6jHi7AQL
 9NNJKvaLSUk2eySBa+rkhK+L9aCoUXKctp6XirYjBbfIz95zRxByOYq+nWuTJPZfhr
 PsHqcSModOggZCV4NNq0zWyiLZJLmgKf2rGPl3YQnBoeWzkrsLzTTcYvMNcH9QQM3R
 QLiDS4QbSl3BDxaCjufOk+JdS5V3BWho9hv3kkdXiuj3i/Df7spTS8/X7plhQ7iqtk
 Wlp7ZQlIJe1BMFb2NLMNe8uVG+b0OpWxMJ6+8cFEUQ8BVLLZqCTqPVBmELxZ/cO+NH
 jWIMlvzEgokcg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Mon, 2 Nov 2020 21:27:27 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20201102202727.GA20042@qmqm.qmqm.pl>
References: <20201021183149.GA8436@Red> <20201023134201.GA533@Red>
 <20201023203943.GA21435@Red> <20201024115307.GA2745@qmqm.qmqm.pl>
 <8a580d12-fa4a-6cd8-4d82-3e3b784e348b@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a580d12-fa4a-6cd8-4d82-3e3b784e348b@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 03 Nov 2020 07:06:52 +0000
Cc: lgirdwood@gmail.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 wens@csie.org, broonie@kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>,
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

On Mon, Nov 02, 2020 at 01:48:54PM +0100, Ahmad Fatoum wrote:
> Hello Micha=B3,
> =

> CC +=3D linux-stm32
> =

> On 10/24/20 1:53 PM, Micha=B3 Miros=B3aw wrote:
> > On Fri, Oct 23, 2020 at 10:39:43PM +0200, Corentin Labbe wrote:
> >> On Fri, Oct 23, 2020 at 03:42:01PM +0200, Corentin Labbe wrote:
> >>> On Wed, Oct 21, 2020 at 08:31:49PM +0200, Corentin Labbe wrote:
> >>> I have just saw thoses 3 lines which are probably the real problem.
> >>> I have started a new bisect with this error, but it is hitting the sa=
me "crash range" the first one.
> >>>
> >>
> >> I have bisected the problem to commit aea6cb99703e17019e025aa71643b4d3=
e0a24413 ("regulator: resolve supply after creating regulator")
> >> Reverting this fix my problem.
> =

> The change broke boot on all the STM32MP1 boards, because the STPMIC driv=
er
> has a vref_ddr regulator, which does not have a dedicated supply, but wit=
hout
> a vref_ddr-supply property the system now no longer boots.
[...]

Can you catch debug logs for the bootup in question? I'm not sure what's
the failure mode in your case. I guess this is not a bypassed regulator?

Best Regards,
Micha=B3 Miros=B3aw

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
