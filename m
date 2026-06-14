Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iMH8I1UeL2oG8AQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jun 2026 23:34:13 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE40682507
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jun 2026 23:34:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=nqo82Z5J;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8D45C5F1E9;
	Sun, 14 Jun 2026 21:34:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6CD0C3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jun 2026 21:34:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BD0E160132;
 Sun, 14 Jun 2026 21:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDFD1F000E9;
 Sun, 14 Jun 2026 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781472849;
 bh=oTIfa56JwSsNTBVIbymmQSEjsR106p+YKsLezXG9tC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=nqo82Z5JkWSQ7WUOkIIz1dQyqFiGpYf9EZzbmruEuxCSzI/VJ+lMRpy7+OoM7iVfD
 1+xn2/HL6kJ5JTZXBVg5os2UFQaTCXidQk5ZRl1zWdLY9T9rhD6J9rAWiMJyf9vdRH
 l6KRoi+n4RCMG0XJIBiAXc8kvthybe1p7TubbayIt5H0+VNRYw1XKCWwgFoL8oVsKw
 zbNGUCjprsRcMC/nuGZXR5eQu5aHohTWbUsXdt9gDmYm/UyyTUIkIVHGwY3q3Pm1TH
 hTMMT20V+L9rCdsJ/ZYPG5TZP1LnWKNlU2upyXWk1ERpkNzsLDinSmDr9+zEwcb9oo
 9ObEW4F6FMs6Q==
Date: Sun, 14 Jun 2026 23:34:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Guillermo =?utf-8?Q?Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
Message-ID: <ai8eGsfJN_IgJd2-@zenone.zhora.eu>
References: <20260611104857.242153-1-guille.rodriguez@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260611104857.242153-1-guille.rodriguez@gmail.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: truncate clock period
 instead of rounding it
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:guille.rodriguez@gmail.com,m:pierre-yves.mordret@st.com,m:linux-kernel@vger.kernel.org,m:wsa@kernel.org,m:linux-i2c@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:cedric.madianga@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:guillerodriguez@gmail.com,m:mcoquelinstm32@gmail.com,m:cedricmadianga@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[andi.shyti@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[st.com,vger.kernel.org,kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BE40682507

Pierre-Yves,

any thought on this?

Andi

On Thu, Jun 11, 2026 at 12:48:56PM +0200, Guillermo Rodr=EDguez wrote:
> stm32f7_i2c_compute_timing() derives the I2C clock source period
> (i2cclk) with DIV_ROUND_CLOSEST, which may round it up. When the
> period is overestimated, all timings computed from it (SCLDEL,
> SDADEL, SCLL, SCLH) come out shorter on the wire than calculated,
> and the resulting bus rate can exceed the requested speed, violating
> the I2C specification minimums for tLOW and tHIGH.
> =

> For example, with a 104.45 MHz clock source (e.g. PCLK1, the
> reset-default I2C clock source on STM32MP1), i2cclk is rounded from
> 9.574 ns up to 10 ns. Requesting a 400 kHz fast mode bus with
> 72/27 ns rise/fall times and no analog/digital filters then produces
> an actual bus rate of 415.6 kHz with tLOW =3D 1254 ns, violating both
> the 400 kHz maximum rate and the 1300 ns tLOW minimum of the
> specification.
> =

> Truncate the period instead, so that it can only be underestimated.
> The error then falls on the safe side: the programmed timings come
> out slightly longer than computed and the bus runs marginally below
> the target rate (375.3 kHz in the example above) while meeting the
> specification.
> =

> i2cbus is left rounded-to-closest: it is only used as the target of
> the clk_error comparison and is never multiplied into the programmed
> timings, so nearest rounding remains accurate there.
> =

> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guillermo Rodr=EDguez <guille.rodriguez@gmail.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-st=
m32f7.c
> index 53d9df70ebe4..6439620d6bed 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -464,8 +464,13 @@ static int stm32f7_i2c_compute_timing(struct stm32f7=
_i2c_dev *i2c_dev,
>  {
>  	struct stm32f7_i2c_spec *specs;
>  	u32 p_prev =3D STM32F7_PRESC_MAX;
> -	u32 i2cclk =3D DIV_ROUND_CLOSEST(NSEC_PER_SEC,
> -				       setup->clock_src);
> +	/*
> +	 * Truncate instead of rounding to closest: if the clock period is
> +	 * overestimated, the computed SCL timings will come out shorter on
> +	 * the wire, which can push the bus above the target rate and below
> +	 * the spec's tLOW/tHIGH minimums.
> +	 */
> +	u32 i2cclk =3D NSEC_PER_SEC / setup->clock_src;
>  	u32 i2cbus =3D DIV_ROUND_CLOSEST(NSEC_PER_SEC,
>  				       setup->speed_freq);
>  	u32 clk_error_prev =3D i2cbus;
> -- =

> 2.25.1
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
