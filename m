Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A48DB6AB8
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 20:40:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B202C35E01;
	Wed, 18 Sep 2019 18:40:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03680C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 18:40:47 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iAesa-00059E-Ip; Wed, 18 Sep 2019 20:40:40 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iAesZ-0002ge-3I; Wed, 18 Sep 2019 20:40:39 +0200
Date: Wed, 18 Sep 2019 20:40:39 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190918184039.27dtd3zguawijsqo@pengutronix.de>
References: <1568818461-19995-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568818461-19995-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] pwm: stm32-lp: add check in case
 requested period cannot be achieved
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

On Wed, Sep 18, 2019 at 04:54:21PM +0200, Fabrice Gasnier wrote:
> LPTimer can use a 32KHz clock for counting. It depends on clock tree
> configuration. In such a case, PWM output frequency range is limited.
> Although unlikely, nothing prevents user from requesting a PWM frequency
> above counting clock (32KHz for instance):
> - This causes (prd - 1) =3D 0xffff to be written in ARR register later in
> the apply() routine.
> This results in badly configured PWM period (and also duty_cycle).
> Add a check to report an error is such a case.
> =

> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

If you are interested to improve the driver further, there are a few
things that I would welcome to see fixed in a tested patch:

 - duty calculation uses requested instead of implemented period.
 - stm32_pwm_lp_apply calls pwm_get_state
 - Calculation of prd could be done without a loop
 - A hint about relevant documentation in the driver's header would be
   great
 - Documentation about behaviour of the hardware is missing:
   - Does the hardware complete the currently running period when
     STM32_LPTIM_CR is cleared?
   - Does the output stop in the inactive output level when the PWM is
     stopped?
 - clk_get_rate might be called without the clock being enabled.
 - The driver does:

 	ret =3D regmap_write(priv->regmap, STM32_LPTIM_CMP, prd - (1 + dty));

   That looks wrong. (Consider dty =3D=3D prd.)

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
