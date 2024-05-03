Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4318BCD68
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2024 14:05:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D169C78007;
	Mon,  6 May 2024 12:05:37 +0000 (UTC)
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31597C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 14:08:52 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1714745331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3C+MgtjD5FFzr1H8ErTkKFFC7gX/7QwO2uuYNs38Akc=;
 b=mAarC0LY0zCqC2ZrO6f/B0kd24XVsuHukHHUkTxv8x6uP89ukwITU0O3Ynvicd1D1E9pAe
 IO3tmU10O6igCP8QZy19eeUc6Ld3IxJqvuNP1A5HBT6M5ThYS4BpN1w2gd1THv6O1jAK7/
 ezGJ5lRjzzWduiC7DpEa6et6y5QamPHTjx/cHxFoa92YbVL3l6ufWF1RIr8LLxjgxMNHq8
 xLmLl+oEm7sIthlsxDBs1Nx//ZO6J02vTNuOw0f8VgzJgXGDL/8MklHPqBILGlrXprDE9w
 hibkEuHJ/OUQOHG1dbrTz8I/N/GLzP9y5rNue5qKcnd9Fy1V2tSamIAR/DWm+g==
Date: Fri, 03 May 2024 16:08:48 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
In-Reply-To: <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
 <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
 <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
Message-ID: <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org>
X-Sender: dsimic@manjaro.org
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-Mailman-Approved-At: Mon, 06 May 2024 12:05:30 +0000
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sergey Kozlov <serjk@netup.ru>,
 Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>
Subject: Re: [Linux-stm32] [PATCH v3 26/26] media: dvb-frontends: tda10048:
 Make the range of z explicit.
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

Hello Ricardo,

On 2024-05-03 13:56, Ricardo Ribalda wrote:
> I am trying to get the DS, but
> https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf is a
> dead links now.
> 
> Anyone have access to the datasheet?

It's kind of available on the link below, but for some strange reason
the download fails after downloading the first 128 KB or so.

https://web.archive.org/web/20080907185532/https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf


> On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> 
> wrote:
>> 
>> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrote:
>> > Em Mon, 29 Apr 2024 15:05:05 +0000
>> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
>> >
>> > > We do not expect the sample_freq to be over 613MHz.
>> > >
>> > > Found by cocci:
>> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>> > >
>> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> > > ---
>> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
>> > >  1 file changed, 3 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
>> > > index 3e725cdcc66b..1886f733dbbf 100644
>> > > --- a/drivers/media/dvb-frontends/tda10048.c
>> > > +++ b/drivers/media/dvb-frontends/tda10048.c
>> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
>> > >                          u32 bw)
>> > >  {
>> > >     struct tda10048_state *state = fe->demodulator_priv;
>> > > -   u64 t, z;
>> > > +   u32 z;
>> > > +   u64 t;
>> > >
>> > >     dprintk(1, "%s()\n", __func__);
>> > >
>> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
>> > >     /* t *= 2147483648 on 32bit platforms */
>> > >     t *= (2048 * 1024);
>> > >     t *= 1024;
>> > > +   /* Sample frequency is under 613MHz */
>> >
>> > Are you sure about that? Some DVB devices have very high frequency
>> > clocks, specially if they're also used for satellite, so I can't
>> > be sure by just looking at the driver's code.
>> >
>> > Also, we had already a bunch of regressions with "fixes" like this
>> > that actually broke frontend drivers.
>> 
>> This patch preserves the existing behavior. The sample_freq_hz 
>> variable
>> is a u32 so, in the original code, z couldn't have been more than
>> U32_MAX even though it was declared as a u64.
>> 
>> It's possible that the original code was wrong.  We have seen that in
>> other places in this patchset.  Adding a note about the datasheet is
>> also a good idea.
>> 
>> regards,
>> dan carpenter
>> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
