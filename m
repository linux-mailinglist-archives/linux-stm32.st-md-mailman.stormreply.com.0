Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F848A68AE
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 12:40:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58C63C6B47E;
	Tue, 16 Apr 2024 10:40:14 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 917AEC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 10:40:13 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-516d0c004b1so5586928e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 03:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713264012; x=1713868812;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eHTLqtmJofb3OW9dwP60b9IkbybIqw6tzFbVJdsjmeU=;
 b=obu/oBDgoqoQuAGUjrPP3jQo7rRSVagtDuKJuMHO/7YbCH3LHkvsw2oanUB8eO8DHt
 Y0K1E4wA5XFQI+kpD6Je96vD0XZZBDmzoQRu8k1cf35+PgQwg/9F/rxCNlPpsxAhdnKW
 OE4OoG9Hy+ksn7jSnzjoePUqhG/BTwsU5aZ48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713264012; x=1713868812;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eHTLqtmJofb3OW9dwP60b9IkbybIqw6tzFbVJdsjmeU=;
 b=lr8oA48nLY9Cj/qoA0BrEJ/4Jg3K/D0jP0p/0RrUT7pR5WlUw3zHdSYu2Xq0f/RHf5
 jdnq0797HCE1Ut1IcshXrWmDV2z+tsKNMMfKQiIyTS0ovtNBl9gL94qbPb8hG2y3clJ3
 eRo9kg8AInR/oN2yExeTv0zrWrNMeqB5w8Y72oLK8i7KuGpV/0iOfny2P5etxulfYCI+
 /OLw6RbYeQrtpBwkMhZt9CE5gOufJAk9k2zrMW1ifeQ+oFjAYOGYKUZS8cJaw6ZMMGfi
 YqqG/ojRvVOfkbq8eN0cf8ZTS75Zb+3CKAHFQYnpQQ2YqbrlVrJuNJEmlqNj0iUKd3VX
 4scA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNziebjcNrts+D9Osh83AOvAygtIG1B6c562uNirU0aANOLQgiBrhFFwMw8d39HDqUoTxW5kfGe44YWbtp3WFzUhneLVA6cN5vCPcEmc+wycn9PaVlNzuZ
X-Gm-Message-State: AOJu0YzIwxaB7K28sNbS0HA7LwnY6Ck1BXD/a4loKFSWs4tRrrM4w1vs
 v914Ctvi7+XiCTzqcGz3wQS2xQ2ov84kMCGQR6IMIA4p74K51nWUeOeLJTjssdFlggMRfygOcnW
 kUh9tPg0=
X-Google-Smtp-Source: AGHT+IGVpiii2FB2b3J/vOp5WnQ+6RVsTqDecwInv5qOT+1DmcpoHUM0YDtmZMXtnV2srQs/3sBnKQ==
X-Received: by 2002:ac2:5587:0:b0:519:33b5:f57d with SMTP id
 v7-20020ac25587000000b0051933b5f57dmr236415lfg.62.1713264012608; 
 Tue, 16 Apr 2024 03:40:12 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 b9-20020a056512070900b00516c50689dfsm1548041lfs.70.2024.04.16.03.40.11
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 03:40:11 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d8863d8a6eso53574521fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 03:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVYpjcPEWqsZOxufO2675IILtIHn4jiD4Hc0cC60UPYov7e6aCIRyhMh8PRXWUXry3RVh9LY/U6feslNCiXqSzqLx+fc0nmBRhdR5ROMOlem8596+1TbkSA
X-Received: by 2002:a05:6512:114b:b0:518:d5c4:b47f with SMTP id
 m11-20020a056512114b00b00518d5c4b47fmr7177225lfg.13.1713263990804; Tue, 16
 Apr 2024 03:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
 <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
In-Reply-To: <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 16 Apr 2024 12:39:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCvp9gBo6Oh31GghvcHmgBY1cYqq4uM_njFTTvQOcS1mbw@mail.gmail.com>
Message-ID: <CANiDSCvp9gBo6Oh31GghvcHmgBY1cYqq4uM_njFTTvQOcS1mbw@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sergey Kozlov <serjk@netup.ru>, Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [Linux-stm32] [PATCH 23/35] media: dvb-frontends: tda10048: Use
	the right div
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

Hi Dan

What about going the safe way?

--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -341,7 +341,7 @@ static int tda10048_set_wref(struct dvb_frontend
*fe, u32 sample_freq_hz,
        /* t *= 2147483648 on 32bit platforms */
        t *= (2048 * 1024);
        t *= 1024;
-       z = 7 * sample_freq_hz;
+       z = (u64)7 * sample_freq_hz;
        t = div64_u64(t, z) + 5;
        do_div(t, 10);

@@ -409,6 +409,7 @@ static int tda10048_set_if(struct dvb_frontend *fe, u32 bw)
        struct tda10048_config *config = &state->config;
        int i;
        u32 if_freq_khz;
+       u64 sample_freq;

        dprintk(1, "%s(bw = %d)\n", __func__, bw);

@@ -450,9 +451,10 @@ static int tda10048_set_if(struct dvb_frontend *fe, u32 bw)
        dprintk(1, "- pll_pfactor = %d\n", state->pll_pfactor);

        /* Calculate the sample frequency */
-       state->sample_freq = state->xtal_hz * (state->pll_mfactor + 45);
-       state->sample_freq /= (state->pll_nfactor + 1);
-       state->sample_freq /= (state->pll_pfactor + 4);
+       sample_freq = (u64)state->xtal_hz * (state->pll_mfactor + 45);
+       do_div(sample_freq, state->pll_nfactor + 1);
+       do_div(sample_freq, state->pll_pfactor + 4);
+       state->sample_freq = sample_freq;
        dprintk(1, "- sample_freq = %d\n", state->sample_freq);

        /* Update the I/F */

I will add a extra patch to fix tda10048_set_if

Thanks

PS: Thanks a lot for your reviews, really appreciate! I have a v2 with
your changes, I am giving it a couple of days before re-submitting

On Tue, 16 Apr 2024 at 12:10, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Mon, Apr 15, 2024 at 07:34:40PM +0000, Ricardo Ribalda wrote:
> > z does not fit in 32 bits.
> >
>
> z has to fit in 32 bits otherwise there is a different bug.
>
> > Found by cocci:
> > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/dvb-frontends/tda10048.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> > index 5d5e4e9e4422..b176e7803e5b 100644
> > --- a/drivers/media/dvb-frontends/tda10048.c
> > +++ b/drivers/media/dvb-frontends/tda10048.c
> > @@ -342,8 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >       t *= (2048 * 1024);
> >       t *= 1024;
> >       z = 7 * sample_freq_hz;
>
> sample_freq_hz is a u32 so z can't be more than U32_MAX.  Perhaps there
> is an integer overflow bug on this line.
>
> The sample frequency is set in tda10048_set_if().
>
>         state->sample_freq = state->xtal_hz * (state->pll_mfactor + 45);
>
> ->xtal_hz is set earlier in tda10048_set_if() and it goes up to
> 16,000,000.  So if ->pll_mfactor is non-zero this line will have an
> integer overflow.  16million * 46 > U32_MAX.  Maybe when .clk_freq_khz
> is TDA10048_CLK_16000 then ->pll_mfactor is zero?  Ugh...
>
> > -     do_div(t, z);
> > -     t += 5;
> > +     t = div64_u64(t, z) + 5;
> >       do_div(t, 10);
>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
