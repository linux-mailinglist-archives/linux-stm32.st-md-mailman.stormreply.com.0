Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B32304AC6B
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 22:58:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6390CCBC23F
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 20:58:37 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BF4ECBC23D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 20:58:36 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n5so16963823otk.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 13:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eWOlIQpBoXx+dBn8lseeqeYMHmFuOji9HYHAzsBj+Yo=;
 b=lTtpIIik85r71kD7QuF+ci8JCVP6HSQJwrWbglXjJOHHWVSCFPBaEzidFE1P1szIvW
 uyN+6I3/3CeGSgDFBJSKpUqJ+bZFNFvPbIvkugH31w9jGgajx5rZp5S8eX2eafs3HYEA
 z7U6sC9z6XhaKTgQ5usQK1k+KMV30FqPrWd0nyr/PzUKElTBMHWSdyA4/po+vihp3lhW
 QIPsR7HmvZG6opDQNl9Y2AKrLZHeJHdKe8x+5iR/vZcdjXA6NKSdcsPeHuKrMnZ1e04i
 M9hcai3YmZYBqE8NU7og9mjkzIv+vTOG6eYHIrGm5HsehFPmEkqhjr57nrOXc0aeskRk
 SpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eWOlIQpBoXx+dBn8lseeqeYMHmFuOji9HYHAzsBj+Yo=;
 b=Sk1r4VkLC04EN2X36azroGlB4BavlBZffpTzhHmQUYeRE7BY8VxP44aX6G5JaYtnS/
 UpNrfonLY8IZeXfEoS1NNB+8liO8I9hwmm0XuAP+ptenNCqc5Yc5zF+DPS8oo3gZ2adp
 f1Vyb/KD74Anl1OY2KosLsB77FrwIDd9deXqULM4qlky4bmV69bgqps9RQ2hOrrtC8gg
 HfPv/bQqEgBaRE/NbDSVjvvR5Y5doOw1xLCxWQ0v5yHs4QNFsJTDNAqeIEld2HYK6KFs
 CofqqOCQ6XwvBuLuLXyP6xHnL2qpl/PKBHy0RZjznk3CEMVIn++Cv4FBoirczNKeTabC
 fS+g==
X-Gm-Message-State: APjAAAXSU+SlwhCRg4/3i3qLNjFT4U3JBYlw414m7JmCg0pT0AFukWB2
 Q0GMHe2qrtz2vMTcPcF3NzrRs5wPojN4uL1qgwI=
X-Google-Smtp-Source: APXvYqwkdc6hhspveBKMMLkcBtJO+FzMapbB2HHbr7srIo2djZJcZ+0uZld5b+z55f3sgyxFjDXdwUv6VaCslijIKmw=
X-Received: by 2002:a9d:6405:: with SMTP id h5mr54059515otl.42.1560891514777; 
 Tue, 18 Jun 2019 13:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <5d089fb6.1c69fb81.4f92.9134@mx.google.com>
 <7hr27qdedo.fsf@baylibre.com>
 <CAFBinCCrpQNU_JtL0SwEGbwWZ2Qy-b2m5rdjuE0__nDRORGTiQ@mail.gmail.com>
 <7d0a9da1-0b42-d4e9-0690-32d58a6d27de@collabora.com>
In-Reply-To: <7d0a9da1-0b42-d4e9-0690-32d58a6d27de@collabora.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 18 Jun 2019 22:58:23 +0200
Message-ID: <CAFBinCA7gMLJ=jPqgRgHcBABBvC7bWVt8VJhLZ5uN=03WL1UWQ@mail.gmail.com>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Jose Abreu <joabreu@synopsys.com>, tomeu.vizoso@collabora.com,
 Andrew Lunn <andrew@lunn.ch>, Kevin Hilman <khilman@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org,
 matthew.hart@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 mgalka@collabora.com, enric.balletbo@collabora.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] next/master boot bisection: next-20190617 on
	sun8i-h2-plus-orangepi-zero
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

Hi Guillaume,

On Tue, Jun 18, 2019 at 10:53 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 18/06/2019 21:42, Martin Blumenstingl wrote:
> > On Tue, Jun 18, 2019 at 6:53 PM Kevin Hilman <khilman@baylibre.com> wrote:
> > [...]
> >> This seems to have broken on several sunxi SoCs, but also a MIPS SoC
> >> (pistachio_marduk):
> >>
> >> https://storage.kernelci.org/next/master/next-20190618/mips/pistachio_defconfig/gcc-8/lab-baylibre-seattle/boot-pistachio_marduk.html
> > today I learned why initializing arrays on the stack is important
> > too bad gcc didn't warn that I was about to shoot myself (or someone
> > else) in the foot :/
> >
> > I just sent a fix: [0]
> >
> > sorry for this issue and thanks to Kernel CI for even pointing out the
> > offending commit (this makes things a lot easier than just yelling
> > that "something is broken")
>
> Glad that helped :)
>
> If you would be so kind as to credit our robot friend in your
> patch, it'll be forever grateful:
>
>   Reported-by: "kernelci.org bot" <bot@kernelci.org>
sure
do you want me to re-send my other patch or should I just reply to it
adding the Reported-by tag and hope that Dave will catch it when
applying the patch?
in either case: I did mention in the patch description that Kernel CI caught it

by the way: I didn't know how to credit the Kernel CI bot.
syzbot / syzkaller makes that bit easy as it's mentioned in the
generated email, see [0] for a (random) example
have you considered adding the Reported-by to the generated email?


Martin


[0] https://lkml.org/lkml/2019/4/19/638
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
