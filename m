Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD85C57E9A
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99640C9FE3B
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:50 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB63BCBC239
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 20:55:47 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id p17so997514ljg.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 13:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rgyz2cVF6lciICHj9aRxm3g8t9416ctrHS5B3PoGzGM=;
 b=er8IX2IUKbXU9cahan+PR49raLMPgXXPPUR2yIHqZPbkQsvl37yRNMqfD0QJCdAjv/
 Js7XnzEYA+84AFVz+WBmB839fafHCxPz6VNvQMgMq5clTEv658MFIY2euF6/qDtGFn5n
 /mCm3ynK8OYbMKS6yBEJaYs5AYJ0Te0crzo84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rgyz2cVF6lciICHj9aRxm3g8t9416ctrHS5B3PoGzGM=;
 b=TrDMQOe7vg8eJU4dxD+q2KHod+VklsWkk+aMhrBUX6hpSlJADmbnGeJh145CCh2ukF
 I5mKF4/r3gU3/dkPf5OD/6T5mXdkJHA0Jn51d1AIWcgUZTMXPZ53o50TEXu7qh4oDwld
 ZNijs81JeXVkHwsmEGXOcpeGoBbwBMZgsPmn8hVDieda4lSGsJOXpkhS5D92xNPv/8qR
 Q05vbJeC/Oh5rK10S5+t+w1mOxS3Bdl2gmtPxXandspjT35eO3rTGwullkS9p60v+8EH
 z0Rp9p9P5udi27VI1JvZ2JOwVs/peWETNilntLYXUPpaSf1PmWymegqh41d2dmP0bTIk
 Pd0A==
X-Gm-Message-State: APjAAAWE+EOfifphcJqg7Kp8EmC+80ZiNjpYLOnoUF+5MHFFRWfRuGx8
 lmUBwipd6YWjxfrbm38ocaAm6ccz4xg=
X-Google-Smtp-Source: APXvYqzSG8KVUHMNLeYuHZDVdgPuP4DnISAwPJU62f8rj148/aNSMeAa1lfFZ+IY6ovEY2HZeP/MFA==
X-Received: by 2002:a2e:b0c4:: with SMTP id g4mr26778352ljl.155.1560891346712; 
 Tue, 18 Jun 2019 13:55:46 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id t21sm2777797ljg.60.2019.06.18.13.55.45
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 13:55:45 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id y198so10358257lfa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 13:55:45 -0700 (PDT)
X-Received: by 2002:a19:f808:: with SMTP id a8mr6231181lff.29.1560891345414;
 Tue, 18 Jun 2019 13:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgTL5sYCGxX8+xQqyBRWRUE05GAdL58+UTG8bYwjFxMkw@mail.gmail.com>
 <20190617190605.GA21332@mwanda> <20190618081645.GM16364@dell>
In-Reply-To: <20190618081645.GM16364@dell>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Jun 2019 13:55:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
Message-ID: <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:47 +0000
Cc: kernel-janitors@vger.kernel.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Fix an endian bug in
	stmfx_irq_handler()
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

On Tue, Jun 18, 2019 at 1:16 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
>
> Ideally we can get a review too.

Looks fine to me, but obviously somebody should actually _test_ it too.

              Linus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
