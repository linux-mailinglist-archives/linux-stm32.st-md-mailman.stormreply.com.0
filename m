Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A7081794C
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 18:58:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A483CC6DD70;
	Mon, 18 Dec 2023 17:58:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 532CFC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 17:58:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D91A6114E;
 Mon, 18 Dec 2023 17:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8B8C433C7;
 Mon, 18 Dec 2023 17:58:31 +0000 (UTC)
Date: Mon, 18 Dec 2023 12:58:28 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZYCIRHVVTDD_k0Wk@ishi>
References: <20230922143920.3144249-1-fabrice.gasnier@foss.st.com>
 <20230922143920.3144249-6-fabrice.gasnier@foss.st.com>
 <ZSnJR2yfYsBNHu/4@fedora>
 <997c056e-c4e1-4bd8-9fcd-9f1b4bd45929@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <997c056e-c4e1-4bd8-9fcd-9f1b4bd45929@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/6] counter: stm32-timer-cnt: populate
 capture channels and check encoder
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
Content-Type: multipart/mixed; boundary="===============3738272515766697476=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3738272515766697476==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6hNcEl+RZUM6gQNw"
Content-Disposition: inline


--6hNcEl+RZUM6gQNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 06:13:51PM +0100, Fabrice Gasnier wrote:
> >> +	/*
> >> +	 * Handle diversity for stm32 timers features. For now encoder is fo=
und with
> >> +	 * advanced timers or gp timers with 4 channels. Timers with less ch=
annels
> >> +	 * doesn't support encoder.
> >> +	 */
> >> +	switch (priv->nchannels) {
> >> +	case 4:
> >> +		if (priv->has_encoder)
> >> +			counter->counts =3D &stm32_counts_enc_4ch;
> >> +		else
> >> +			counter->counts =3D &stm32_counts_4ch;
> >> +		counter->signals =3D stm32_signals;
> >> +		counter->num_signals =3D ARRAY_SIZE(stm32_signals);
> >> +		break;
> >> +	case 2:
> >> +		counter->counts =3D &stm32_counts_2ch;
> >> +		counter->signals =3D stm32_signals;
> >> +		counter->num_signals =3D 3; /* clock, ch1 and ch2 */
> >> +		break;
> >> +	case 1:
> >> +		counter->counts =3D &stm32_counts_1ch;
> >> +		counter->signals =3D stm32_signals;
> >> +		counter->num_signals =3D 2; /* clock, ch1 */
> >> +		break;
> >> +	default:
> >> +		counter->counts =3D &stm32_counts;
> >> +		counter->signals =3D stm32_signals;
> >> +		counter->num_signals =3D 1; /* clock */
> >> +		break;
> >> +	}
> >=20
> > Rather than adjusting the number of counts and signals, keep the
> > configuration static and use a single stm32_counts array. The reason is
> > that in the Counter subsystem paradigm Signals do not necessary
> > correlate to specific hardware signals but are rather an abstract
> > representation of the device behavior at a high level. In other words, a
> > Synapse with an action mode set to COUNTER_SYNAPSE_ACTION_NONE can be
> > viewed as representing a Signal that does not affect the Count (i.e. in
> > this case equivalent to an unconnected line).
> >=20
> > What you'll need to do instead is check priv->nchannels during
> > stm32_action_read and stm32_count_function_read calls in order to return
> > the correct synapse action and count function for the particular
> > channels configuration you have. In stm32_count_function_write you would
> > return an -EINVAL (maybe -EOPNOTSUPP would be better?) when the channels
> > configuration does not support a particular count function.
>=20
> Hi William,
>=20
> Sorry for the long delay to address your comments here. Many thanks for
> these guidelines.
>=20
> I'm preparing a v3, to address these. I'll probably send it soon, so we
> can start to review also the capture part of it. Still there are few
> things here I'm wondering about (as an anticipation task).
>=20
> Basically, removing all the diversity here means the most featured timer
> model will be represented here (with all possible signals).
> When I wrote the various configuration arrays, I'd have been tempted to
> allocate them dynamically upon probing to avoid having all these
> variants described as const arrays. This may have eased other signals
> additions later. But that's not the direction. So, this simplifies the
> description here, clearly, to describe the full-featured timer/counter,
> and handle the ("unconnected") variants by returning errors.
>=20
> I still have in mind the replacement of the last IIO_COUNT device [1]
> (not addressed in this series), e.g. in
> drivers/iio/trigger/stm32-timer-trigger.c. Here, there are
> "valids_table" that are used to cascade two timers (one timer output
> being the input to another timer). With this table currently, an IIO
> user knows the name of the signal it selects (then the driver looks up
> the 'valids' table to set SMCR / TS bits, e.g. trigger select). Each
> individual timer has a different input mapping, so called peripheral
> interconnect in STM32.
> What bothers me here is: with an abstracted full-featured timer, without
> any diversity on the signal names, I fear the userland has no clue on
> which signal would be used. Abstracting the timer this way would mean
> the user only knows it selects "Internal Trigger 0" for example, without
> knowing which internal signal in the SoC it has selected.
>=20
> Even if this is out of scope for this series, would you have some clue
> so I can anticipate it ? Or if we stick with abstract names? In which
> case the userland may need to be aware of the signals mapping (where
> currently in IIO_COUNT driver, the signal names are privided). I'd be
> glad to get some direction here.
>=20
> Please advise,
> Best Regards,
> Fabrice
>=20
> [1] https://lore.kernel.org/linux-arm-kernel/Y0vzlOmFrVCQVXMq@fedora/

Hi Fabrice,

I took a look the stm32-timer-trigger.c file, but I'm having trouble
understanding it well (probably the cascading is confusing me). If I
understand the logic correctly, the user selects the trigger they want
by the attribute's name which is compared via strncmp() against the
'valids' table. It's possible we could dynamically configure the signal
names, but keep the signal id static so the driver code won't need some
many variations; alternatively, we could introduce a new signal
extension attribute that could display the trigger name.

Would you walk me through an example of using the stm32-timer-trigger
IIO sysfs interface? I think that would help me understand how users
currently interact with the triggers for that driver, and then maybe I
can figure out an appropriate equivalent in the Counter paradigm for
the migration. Right now, the timer cascade is confusing me so if I can
grok it well, the right solution for this may come to me more easily.

Thanks,

William Breathitt Gray

--6hNcEl+RZUM6gQNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZYCIRAAKCRC1SFbKvhIj
KzL0AQCBGPqG8kOluqjB/Yzuc6T3oT6VwNPErfSyZN8uvziqDQD9EI31uZSzpDLU
hHMJkRMkV+Is306UT0QLqo+nFChRtgo=
=wI3r
-----END PGP SIGNATURE-----

--6hNcEl+RZUM6gQNw--

--===============3738272515766697476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3738272515766697476==--
