Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3043F22E857
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jul 2020 11:04:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2AF5C36B27;
	Mon, 27 Jul 2020 09:04:05 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A8E5C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jul 2020 03:58:44 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id gc9so7335669pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jul 2020 20:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jcaev1Cp7bKZYJR/UD71l80ZfPg2FMWy0HIr5qj2bGY=;
 b=pW3nnfGF9WNDmVTg3erlNCt9uor03x6BZY37vmHSdP/xICtKgeoqTIYUtOqGOGI6kx
 wuXTf9SMQ2Z/ErYmpP7TYebvPZRaAte8jmiOKquFASWUAxefXF8STiy/6P/Jv7R00kBl
 57dQfKZ8WNigXDUijzvOgs/mNBoEIxbs9PlpEC38RImsjO2WVr8iPSXNIl87vtl9a9qq
 i3tHldUSxyybwQGYKtwc1pCYThrLKg67f/t+eRlWvRje+OjBVUmB/EbiwIKg5Ks97btC
 yz7ob2Qp8v5wYvw5b7+lebRQDzRVb9I7zg9817yrUOdm0QQ/Spsbpv7a9Cyl4JlpmWF6
 x7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jcaev1Cp7bKZYJR/UD71l80ZfPg2FMWy0HIr5qj2bGY=;
 b=hFooCncYozSKjonbwrItc9bcXmBpPjwd1WShCOHoSYeb83mDEK4uaFpwY64nVx5/wo
 BDApjS98ozlDuE1dMskpkN0jA8ZlYabf1ICASr4giHWNbG4DKWXMz5eu70iDyb+E8d+O
 Ax4YM3k1eRQsiMQvfv0XcB6EfzEuP6lF6Jyjq2zBWfOByYwrdODmqup60L32ZQA6EuRh
 uPpz7aNFHVCc0WvUH30gvqUAqF4iv9izkdrov7/crE9QAQBwv1nYlacRT5jju5g3qg73
 TIFIdQWfqOUKIvQDQV8H+zhnL3tud9/oa4lctTMcGDs0TGq7mx/4+EfcgU6W1CBSmkhw
 rhMg==
X-Gm-Message-State: AOAM531bk4bCFBqYlNIlNTqZxmwxopiE8GPMGmiSZNixd14PzWCQ2JLN
 wmJNzPm5dHw/qDaKxZLMtHAo/xtXwbgLL4dwr4vzvQ==
X-Google-Smtp-Source: ABdhPJwXraTjC6SZ1tebNEZfR+TFnQAO2mmQKDrLOibMydwILen7cWd7OX+0bEwRfZm/OlR0+VbdaTmWP6YaljsQzW0=
X-Received: by 2002:a17:90a:f98e:: with SMTP id
 cq14mr1036997pjb.51.1595735922224; 
 Sat, 25 Jul 2020 20:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <159568680935.564881.11936174169505990646.b4-ty@kernel.org>
In-Reply-To: <159568680935.564881.11936174169505990646.b4-ty@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Sat, 25 Jul 2020 20:58:06 -0700
Message-ID: <CAGETcx8qyn8TmwvTrXkYEj78MdCNr+HxV0x7JTc8Wvo0VanKEg@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Mailman-Approved-At: Mon, 27 Jul 2020 09:04:04 +0000
Cc: marex@denx.de, CC Hwang <cc.hwang@mediatek.com>,
 Jason Cooper <jason@lakedaemon.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org,
 Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 0/4] irqchip: Add
	IRQCHIP_PLATFORM_DRIVER helper macros
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

On Sat, Jul 25, 2020 at 7:23 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 17 Jul 2020 17:06:33 -0700, Saravana Kannan wrote:
> > Made a series out of the previous v2 patch + some example uses of the
> > macros.
> >
> > Not sure if the MTK changes work (just compile tested), but saw that
> > Hanks was trying to make those drivers into tristate. So I assume
> > they'll work as platform drivers. Please wait for MTK Ack before picking
> > up patches 3 and 4.
> >
> > [...]
>
> Applied to irq/irqchip-5.9, thanks!
>
> [1/4] irqchip: Add IRQCHIP_PLATFORM_DRIVER_BEGIN/END and IRQCHIP_MATCH helper macros
>       commit: f3b5e608ed6d17bdf04dacbf2374f10d51fe9b09
> [2/4] irqchip/qcom-pdc: Switch to using IRQCHIP_PLATFORM_DRIVER helper macros
>       commit: 04741740254cd83fb4f2b7747aeb35202104f8fe
> [3/4] irqchip/mtk-sysirq: Convert to a platform driver
>       commit: 3ae3022690e6787839dafa8ea3496450248b53e1
> [4/4] irqchip/mtk-cirq: Convert to a platform driver
>       commit: 538b63351607960ff2249460089daa31337ddeba

Thanks!

-Saravana
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
