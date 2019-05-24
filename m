Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1D2971A
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 13:24:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 662C8C59792
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 11:24:52 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 656B6C59791
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 11:24:51 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z6so6886701qkl.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 04:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pJOfEs/MqDUbj+5GWfxqoTL+Bnu2gJiCCqBKbfD1wrw=;
 b=Cvl7JA+e+AVFmYWhu4jfB9IBFJMs3UrJuQAHr8G84WfcFbHYYdnqNhSCTe+ZtcSnWf
 rzXWKMc6HTAUDclUVjYUUww8hXPFS50T6YXTCSLdGrNaqWPnMnrQxAd6MoOgU6DzPuz5
 BrMBv068cpA54YqwABzC/8gwXnsigRRsGM/gtorFnLkDK+whFy50WUW8FVR57zy4AWE+
 kNzBR+1njXc1ImbB9goDKdUvjbNPZcXF7yDvJb3YZUZUR/pYPtQiNXXfqiow8V//vFpR
 KfTsSDiGsVVBdvgCwXal2d90XQF3X0YgmERFZmDMipobhdPM/xt/Xtu2BfXtCE7+LitZ
 GPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pJOfEs/MqDUbj+5GWfxqoTL+Bnu2gJiCCqBKbfD1wrw=;
 b=UN45x/IK2OS7ljypnzKeu+KdNt9zwjnTVTT0DtlwTIwNv0hzbYvBXiCKQmJ1srXVDn
 UDa1TtwIVU/4ocQd/XPFNhENfleJsq40ghM65tqeP+0okJf9ljCbL233L52ecoUqCE65
 /Da3pq6zhzGDtSPHDDnkpUbDsMfKVBHzF2dok++039EjnqzkH+ykP/Dfpwe0s2pEiaTM
 2s1D2h/Mv1qt+TNK0extoSB3yha8jvEZY15SKQFYZcN9jDtGlFdQF1V22N/9DJy+f/YW
 3riFT+EO0UUgmqNPO1A3+KyyniJzM60UAXHcHoK5VQHowEquBGHON2RtDOI/jL8CbJWQ
 KPRA==
X-Gm-Message-State: APjAAAWF70a8kr1ianVfC9htr8kNe99dr2Y3TWHJSCWgQ8CXKcDLUnxJ
 R7TbjpqB/ZtrGRbqsdKFUn+NEv24rnXB/7Q9jiQD8Q==
X-Google-Smtp-Source: APXvYqwdg7Y2VtK6CWVYHgo4gTEBhE8cGin8YUEKNu+EbS+93jSoldSI3JTfoxGuJdQANtMMQQ2lmSxsjjO2/iAmeuA=
X-Received: by 2002:ac8:2291:: with SMTP id f17mr33453092qta.51.1558697090303; 
 Fri, 24 May 2019 04:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
In-Reply-To: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 May 2019 13:24:37 +0200
Message-ID: <CACRpkdYgTbTa6RmM3y-myk31ZxLGZ+8KvLof1XHkockrX4tofA@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/2] pinctrl: stm32: add suspend/resume
	management
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

On Fri, May 10, 2019 at 9:42 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> During power sequence, GPIO hardware registers could be lost if the power
> supply is switched off. Each device using pinctrl API is in charge of
> managing pins during suspend/resume sequences. But for pins used as gpio or
> irq stm32 pinctrl driver has to save the hardware configuration.
> Each register will be saved at runtime and restored during resume sequence.

Both patches applied.

On the same pinctrl devel branch is also Benjamin's patches to support
the "link_consumers" property on the pin controller descriptor to
enable links from pin control consumers back to their pin controller
suppliers, especially important for STMFX.

Would you please check if it work fine if you turn on this feature
for the SoC STM32 pin controller?

I am working a bit on refining the patches, so I want to enable testing
with some SoC pin controllers as well and possibly make the
behavior default.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
