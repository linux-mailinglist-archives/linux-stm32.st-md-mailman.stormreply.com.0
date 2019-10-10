Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 925F3D215B
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2019 09:07:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 529C3C36B0C;
	Thu, 10 Oct 2019 07:07:58 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5125FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 07:07:57 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iISY7-0004f8-Fx; Thu, 10 Oct 2019 09:07:47 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iISY1-0003fP-PN; Thu, 10 Oct 2019 09:07:41 +0200
Date: Thu, 10 Oct 2019 09:07:41 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20191010070741.jhkpqgmfpqp2jteo@pengutronix.de>
References: <1570534887-26181-1-git-send-email-fabrice.gasnier@st.com>
 <20191008144531.pjt525xuz7n5a3hq@pengutronix.de>
 <5c05893b-e938-4db8-e33a-803b1a498f97@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c05893b-e938-4db8-e33a-803b1a498f97@st.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: add comment to better
 describe breakinput feature
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Oct 09, 2019 at 11:51:05AM +0200, Fabrice Gasnier wrote:
> On 10/8/19 4:45 PM, Uwe Kleine-K=F6nig wrote:
> > On Tue, Oct 08, 2019 at 01:41:27PM +0200, Fabrice Gasnier wrote:
> >> Add a comment to better describe the purpose of breakinput feature that
> >> can be found on some STM32 timer instances. Briefly comment on the
> >> characteristics of this input for PWM, and pinmuxing as suggested in [=
1].
> >>
> >> [1] https://lkml.org/lkml/2019/10/1/207
> >>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> >> ---
> >>  drivers/pwm/pwm-stm32.c | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> >> index 359b085..6406ebb 100644
> >> --- a/drivers/pwm/pwm-stm32.c
> >> +++ b/drivers/pwm/pwm-stm32.c
> >> @@ -522,8 +522,14 @@ static int stm32_pwm_apply_breakinputs(struct stm=
32_pwm *priv,
> >>  					     sizeof(struct stm32_breakinput));
> >>  =

> >>  	/*
> >> +	 * Some timer instances can have BRK input pins (e.g. basically a fa=
ult
> >> +	 * pin from the output power stage). The break feature allows a safe
> >> +	 * shut-down of the PWM outputs to a predefined state. Further detai=
ls
> >> +	 * are available in application note AN4277, "Using STM32 device PWM
> >> +	 * shut-down features..."
> > =

> > Without having read the application note I don't understand the purpose.
> > Not sure if this should be a show stopper though.
> =

> Hi Uwe,
> =

> I can rephrase this. Do you think the bellow comment would be more
> relevant and easy to understand ?
> =

> /*
>  * The break feature allows a safe shut-down of the PWM outputs.
>  * It's based on the BRK event signal defined in the dt-bindings
>  * by <index level filter> values.
>  * Because "st,breakinput" parameter is optional do not make probe
>  * failed if it doesn't exist.
>  */

I still fail to understand. This is an input that determines the actual
value of the output pin? What makes a shutdown of outputs safe? What is
a shutdown anyhow?

Apart from that: s/do not make probe failed/don't fail to probe/.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
