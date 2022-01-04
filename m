Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAA348413D
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jan 2022 12:57:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31587C5F1F6;
	Tue,  4 Jan 2022 11:57:05 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE210C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jan 2022 11:57:03 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id t19so32004447pfg.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Jan 2022 03:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7qz4IOP4tQz6MVqNRs763jv/JpxIVCzSerIqjO9KVko=;
 b=akyWELdrqaMAzl+2u09k1siH03kmBuljuWevsTKn1MKWsv4RxLbC91yNXgeVnihFLy
 BZl9MxSdEKAJb61U47jRSZil0FvHd0Us300+yNsKCroJ0s7xApGir6uFNjmBed8Lrs0W
 nSTHtffY1vSOjK92/eysLhB+fiFm2KITapxdhIscazqv61h7luzo1YtcOE2Xrdmjq6vo
 ZnBIE7IUodgKn/aSLdvM0aZQNCtU9eKq1m9pbzTyDMdviSDcY+bCXwgKsoxbuBs5NpyF
 /fYOrJIatvWrwMi+hdohh2rQ6Sdy94B3O4hEpIl/GJXO6q3cKcEq0bF/dOfHGe5TpayW
 XzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7qz4IOP4tQz6MVqNRs763jv/JpxIVCzSerIqjO9KVko=;
 b=gqu+MtzoSR2h+sd3WHElwTsRxU7QwVoKkx3b8XoZjaliEftkjCBImg/5GKNJmxdYOa
 GQBHZlVcou69MnrfOGickLXQK5n9fsL98FhJeMzQIR8kWaHcgZDNlpNCAVyixHYdF394
 NT3ULq6HQUYzps7AG0n9CIdIu/aVdWFGi+un2voen/KvQGbJo7zbg88ct1OdaTe1Za8b
 LTZQ3tvM4xxrlC7SAt2glfAp98vOZlQxjXcPUH++SWtOS3crWY5gRgYAPtD4f4FM8hsD
 rIovFJAx3zB4wrGi9CgijMEVG7EzJcLQ8rTO7O8p3gnPLdfalF24Zv3vRqsXwP20s7TD
 31kQ==
X-Gm-Message-State: AOAM531fjxWjSZBpQIVf2YQPsWIlwImhCvXQgzTLP30OlW1Iho+jLUd2
 QEwE9AEyq3b2O1sFVrpXRMrwZrhrQ9D496dz0bKt0g==
X-Google-Smtp-Source: ABdhPJzMeT/jerydzvJxQ9/6wchNhHmZXkPXPOHChg26wvS1FiPbEWYjw7SN+cUnWOvaq/P4AkteJjt6VgH0XBpaArQ=
X-Received: by 2002:aa7:8f37:0:b0:4bb:a19:d3aa with SMTP id
 y23-20020aa78f37000000b004bb0a19d3aamr50952958pfr.1.1641297422211; Tue, 04
 Jan 2022 03:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20211218215055.212421-1-antonio.borneo@foss.st.com>
 <20c77dc1-7e7e-ec0e-f545-593d1cfeb3b3@foss.st.com>
In-Reply-To: <20c77dc1-7e7e-ec0e-f545-593d1cfeb3b3@foss.st.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 12:56:51 +0100
Message-ID: <CAG3jFyu-btTaP+6YFTzPi13jD3RyqAWQq1QJUk3A_dVKjT4T4w@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonas Karlman <jonas@kwiboo.se>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] drm/stm: dsi: move lane capability
	detection in probe()
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

On Tue, 4 Jan 2022 at 11:47, Philippe CORNU <philippe.cornu@foss.st.com> wrote:
>
>
>
> On 12/18/21 10:50 PM, Antonio Borneo wrote:
> > There is no need to re-compute the dsi lane capability because it
> > only depends on dsi hw version.
> > Since dsi hw version is detected at probe(), move there also the
> > assignment of dsi lane capability.
> >
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> > ---
> > To: David Airlie <airlied@linux.ie>
> > To: Daniel Vetter <daniel@ffwll.ch>
> > To: Andrzej Hajda <a.hajda@samsung.com>
> > To: Neil Armstrong <narmstrong@baylibre.com>
> > To: Robert Foss <robert.foss@linaro.org>
> > To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > To: Jonas Karlman <jonas@kwiboo.se>
> > To: Jernej Skrabec <jernej.skrabec@gmail.com>
> > To: Yannick Fertre <yannick.fertre@foss.st.com>
> > To: Philippe Cornu <philippe.cornu@foss.st.com>
> > To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > To: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > To: Philipp Zabel <p.zabel@pengutronix.de>
> > To: dri-devel@lists.freedesktop.org
> > To: linux-stm32@st-md-mailman.stormreply.com
> > To: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> >
>
> Hi Antonio,
> many thanks for your patch.
> Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
> Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>
> Philippe :-)

Thanks for the series and the Acks.

Applied series to drm-misc-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
