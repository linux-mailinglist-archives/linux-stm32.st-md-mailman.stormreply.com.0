Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B46264715
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 15:35:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2873C424B7;
	Thu, 10 Sep 2020 13:35:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A32AAC3FAE3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 13:35:49 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7C4620809
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 13:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599744948;
 bh=V1wKpfnBNnmhv6G3q9IsWvZn9GlN18uZFdJxqnq2jxk=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=Iu/QQeP8BdkkjmC//fxdEnzC5MvdHm2RGo1WAcNBcr9EVzPC8+MLBZHSXIf7rWBF2
 6D9BONK2qf/U6VezTnMLux6qXZPOwqeNdD92RjA6BNJVqI/TkLyqvz2cckdmfoQW66
 Vq3lhpyM3TycBna9MohQUjs1xHctxsM4+qg8bjx8=
Received: by mail-ej1-f49.google.com with SMTP id j11so8808835ejk.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 06:35:47 -0700 (PDT)
X-Gm-Message-State: AOAM533LTtnLTjUC/nHRSBnMfxw7MHQhQ2ERilecnfvBjs2g5rAou5XZ
 wh6FqHzTbVLdpDO8QjGcaDp31ruK0ocYHloIlxY=
X-Google-Smtp-Source: ABdhPJwINmV5bI33FlqWtuSmo9zSXfn21SyT8mGvBNJyprgovPHUzJONmLEebsWy015sjIsWUjJzxmOGWX+E8h1VP8s=
X-Received: by 2002:a17:906:82d1:: with SMTP id
 a17mr8613075ejy.385.1599744946434; 
 Thu, 10 Sep 2020 06:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <1599730349-2160-1-git-send-email-alain.volmat@st.com>
 <20200910100607.GJ1031@ninjato> <20200910122739.GA5093@gnbcxd0016.gnb.st.com>
In-Reply-To: <20200910122739.GA5093@gnbcxd0016.gnb.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 10 Sep 2020 15:35:34 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcx1tL93KJAvVT3rAgHX-r3bxri9GwHMSgDSAhALi2aFA@mail.gmail.com>
Message-ID: <CAJKOXPcx1tL93KJAvVT3rAgHX-r3bxri9GwHMSgDSAhALi2aFA@mail.gmail.com>
To: Wolfram Sang <wsa@kernel.org>, pierre-yves.mordret@st.com,
 alexandre.torgue@st.com, 
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 fabrice.gasnier@st.com, Krzysztof Kozlowski <krzk@kernel.org>,
 Holger Assmann <h.assmann@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32: do not display error when DMA
	is not requested
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

On Thu, 10 Sep 2020 at 14:27, Alain Volmat <alain.volmat@st.com> wrote:
>
> On Thu, Sep 10, 2020 at 12:06:07PM +0200, Wolfram Sang wrote:
> > On Thu, Sep 10, 2020 at 11:32:29AM +0200, Alain Volmat wrote:
> > > DMA usage is optional for the I2C driver. check for the -ENODEV
> > > error in order to avoid displaying an error when no DMA
> > > has been requested.
> > >
> > > Signed-off-by: Alain Volmat <alain.volmat@st.com>
> > > ---
> > > This patch should be applied on top of the patch [i2c: stm32: Simplify with dev_err_probe()]
> >
> > We can do it in this order, it just makes backporting to stable kernels
> > (if that is desired) a bit harder than a self-contained patch. I am fine
> > with both approaches, but just wanted to point it out.
>
> Indeed, that's a good point. I'll rework it then, to avoid the dependency
> on dev_err_probe change. If that is ok, I propose to push a two patches serie
> with both this fix (updated) followed by a rebased version of the
> dev_err_probe patch from Krzysztof for dev_err_probe change.

I can rebase mine on top of yours. Indeed such cleanups as mine should
be rather later in the queue.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
