Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 703082A75CC
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 03:57:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34E19C36B36;
	Thu,  5 Nov 2020 02:57:11 +0000 (UTC)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40967C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 02:57:08 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4CRSq80gJrz8p;
 Thu,  5 Nov 2020 03:57:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1604545028; bh=ftTu3GVhpENCklOKbGWhySdZBk/3XyASkUeEvoboYxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=coIYJ4QFqThVJlAPSGs2RnDKZzFWxTyG88+X0vtqmLPKM28BghZsxExYdrns4OMbl
 zvEOvpEVqNiEbe9QAZ0VdnAYgtHZyvGL/CB5nt4hLdJtT43JO+jLiKiPvPmbtScR2O
 ulNwUE4yRcwmDwgy7qbMmRFN6rqqMLTNXKJ54ijCD1OO3cntFYkSuvYmRT7GYxHuiQ
 b+lnQCTzfHoqvr3gUzNnAju75nl8ZSElDxcv5KJbpyFPGFHi95Mig1VoX8L3aIPFMn
 GnDWJTc0xwJJe3FQKux780JbHY33qVCsSqmClKMGUw6ft/+KpxLa9vFCeJijkMO4zN
 XuW9o03CGBoMA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 5 Nov 2020 03:57:06 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20201105025706.GE17266@qmqm.qmqm.pl>
References: <20201021183149.GA8436@Red> <20201023134201.GA533@Red>
 <20201023203943.GA21435@Red> <20201024115307.GA2745@qmqm.qmqm.pl>
 <8a580d12-fa4a-6cd8-4d82-3e3b784e348b@pengutronix.de>
 <20201102202727.GA20042@qmqm.qmqm.pl>
 <124b90a8-72c7-c6cb-790f-7a22ef7510eb@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <124b90a8-72c7-c6cb-790f-7a22ef7510eb@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 wens@csie.org, broonie@kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
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

On Wed, Nov 04, 2020 at 11:28:45AM +0100, Ahmad Fatoum wrote:
> Hello,
> =

> On 11/2/20 9:27 PM, Micha=B3 Miros=B3aw wrote:
> > On Mon, Nov 02, 2020 at 01:48:54PM +0100, Ahmad Fatoum wrote:
> >> Hello Micha=B3,
> >>
> >> CC +=3D linux-stm32
> >>
> >> On 10/24/20 1:53 PM, Micha=B3 Miros=B3aw wrote:
> >>> On Fri, Oct 23, 2020 at 10:39:43PM +0200, Corentin Labbe wrote:
> >>>> On Fri, Oct 23, 2020 at 03:42:01PM +0200, Corentin Labbe wrote:
> >>>>> On Wed, Oct 21, 2020 at 08:31:49PM +0200, Corentin Labbe wrote:
> >>>>> I have just saw thoses 3 lines which are probably the real problem.
> >>>>> I have started a new bisect with this error, but it is hitting the =
same "crash range" the first one.
> >>>>>
> >>>>
> >>>> I have bisected the problem to commit aea6cb99703e17019e025aa71643b4=
d3e0a24413 ("regulator: resolve supply after creating regulator")
> >>>> Reverting this fix my problem.
> >>
> >> The change broke boot on all the STM32MP1 boards, because the STPMIC d=
river
> >> has a vref_ddr regulator, which does not have a dedicated supply, but =
without
> >> a vref_ddr-supply property the system now no longer boots.
> > [...]
> > =

> > Can you catch debug logs for the bootup in question? I'm not sure what's
> > the failure mode in your case. I guess this is not a bypassed regulator?
> =

> Boot up with v5.10-rc2 + your cf1ad559a2 ("regulator: defer probe when tr=
ying
> to get voltage from unresolved supply") hangs:
> =

> [    1.151489] stm32f7-i2c 40015000.i2c: STM32F7 I2C-0 bus adapter
> [    1.180698] stpmic1 1-0033: PMIC Chip Version: 0x10
> [    1.189526] vddcore: supplied by regulator-dummy
> [    1.195633] vdd_ddr: supplied by regulator-dummy
> [    1.201672] vdd: supplied by regulator-dummy
> [    1.207452] v3v3: supplied by 5V2
> [    1.211997] v1v8_audio: supplied by v3v3
> [    1.218036] v3v3_hdmi: supplied by 5V2
> [    1.223626] vtt_ddr: supplied by regulator-dummy
> [    1.227107] vdd_usb: supplied by regulator-dummy
> [    1.234532] vdda: supplied by 5V2
> [    1.239497] v1v2_hdmi: supplied by v3v3
[...]

Can you try with the patches I just sent and with debug logs enabled?

The first one just plugs a memory leak, but if there is some state
changed/saved in the rdev->constraints (can't find that code, though),
this might prevent it from being overwritten.

The second patch will just tell us if you hit the early resolve case.

Best Regards,
Micha=B3 Miros=B3aw
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
