Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57575757F6E
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jul 2023 16:29:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1496C6B442;
	Tue, 18 Jul 2023 14:29:17 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 243D5C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 14:29:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qLlhR-0006sb-1r; Tue, 18 Jul 2023 16:29:13 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qLlhP-000OT0-1G; Tue, 18 Jul 2023 16:29:11 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1qLlhO-000Eqt-2k;
 Tue, 18 Jul 2023 16:29:10 +0200
Message-ID: <6032fcba75d34b0273508166c8b79331cd5c34ef.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Thierry Reding
 <thierry.reding@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Tue, 18 Jul 2023 16:29:10 +0200
In-Reply-To: <dac9c545-fcbc-3aec-c341-abc62f551703@foss.st.com>
References: <20230608-pwm-stm32-get-state-v1-1-db7e58a7461b@pengutronix.de>
 <dac9c545-fcbc-3aec-c341-abc62f551703@foss.st.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Implement .get_state()
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

Hi Fabrice,

On Fr, 2023-06-09 at 15:06 +0200, Fabrice Gasnier wrote:
[...]
> > @@ -635,7 +675,10 @@ static int stm32_pwm_probe(struct platform_device *pdev)
> >  
> >  	priv->chip.dev = dev;
> >  	priv->chip.ops = &stm32pwm_ops;
> > -	priv->chip.npwm = stm32_pwm_detect_channels(priv);
> > +	priv->chip.npwm = stm32_pwm_detect_channels(priv, &n_enabled);
> > +
> 
> I'd suggest to comment a bit here, to explain it initializes the PWM
> counter clock refcount in sync with PWM initial state left by the
> bootloader.
> 
> In all case, this is fine for me, you can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thank you, I'll add a comment here.

regards
Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
