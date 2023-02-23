Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF96A0545
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Feb 2023 10:52:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E10E6C6A5F8;
	Thu, 23 Feb 2023 09:52:30 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CD98C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 09:52:29 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-536cb25982eso150839217b3.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 01:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WyLlud2sMTYzZimgt3LXDWS5h05sJ2yVKAsksslDR6M=;
 b=ZLQtg4FtpfbiG3pBPGZhMDpS7wCOS2l/Vb/EzOb30N3BpV6OVBj7JZJcCdktYZtAS2
 RGW0dtqmnR+dfXUGssVahvHzdlIIb3Wr6NT5kUUJrlu7BrbwGV02bV3l6E5fzO6bDj70
 SvP2iiqLVg6LEFnvB4bPhSTHAD+gDohAdIL888wz1YBebd/zeDePN5CA8aEU002zeqpO
 ZcehMW3NdG05r1TlY879Hxp5xNtowiQ88BYx74B5pMhCj0t8remt3/dVwp6+clGooA2h
 jjbouEQg1rLtL49fdfDKchmHDrOXR/tW5qzs7HMR9ZX/tYH9q7MbxhVJDA529CYGk8kN
 AOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WyLlud2sMTYzZimgt3LXDWS5h05sJ2yVKAsksslDR6M=;
 b=5ozucxhkbWL6r+a/X8WjCH7OFDccOH8pmP4XaCBlNDz7A/SPMFiBHYAatBhg2xNA/d
 sePtOF00KctqTTybY6YW9+V4Hs49A7xVxdTbSnGcfOUbT5JopBRd1RP1AE4kJKThMn5d
 hn0jrKVhYU7UcYqINRc8E5FWziQFmY7HO/Mo046ylqZhap4es9rRHsxkCf5nqobspMcA
 Ll32yYaIEZi3BvBRFaGUApgk6GZaWCLRLvs+xxDPmD+j0ayfMfaGM1Xhr6y0KCH+fb2z
 sp2/iFWOkdy6orxO2BRhZ8587hbLZzEOChsMrmJVzFdOAZ7SatNrsWHYzt5lJ4+MnKVX
 uqSA==
X-Gm-Message-State: AO0yUKXllFSD3SibdVQYlvcthcPI2hY1zmG0kLLsBUIGD/9DQyTri4cE
 o6fDgcKao97iRjQ+AHQtucDzgVgHqA7ZdtecvHtl1A==
X-Google-Smtp-Source: AK7set/KtoAzQrIYU+2Mgk/pLUdmIb9s9QFOvjUwjQxM7F7nAZs/oSVNu3EBJvX3mgr7i2poBtd8kJyvbE4QOnKDsUs=
X-Received: by 2002:a25:918c:0:b0:8da:d0ab:258a with SMTP id
 w12-20020a25918c000000b008dad0ab258amr1705814ybl.5.1677145948475; Thu, 23 Feb
 2023 01:52:28 -0800 (PST)
MIME-Version: 1.0
References: <Y/cBB+q0Ono9j2Jy@gondor.apana.org.au>
 <20230224231430.2948-1-kunyu@nfschina.com>
 <Y/cy5wUtk10OahpO@gondor.apana.org.au>
In-Reply-To: <Y/cy5wUtk10OahpO@gondor.apana.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Feb 2023 10:52:17 +0100
Message-ID: <CACRpkdYyB=-UnE1bmdVszSSB5ReECZ0fUoWJX6XtYbKHEe52tA@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 Lionel Debieve <lionel.debieve@foss.st.com>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 davem@davemloft.net, linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stm32: stm32-hash: Add kmalloc_array
	allocation check
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

On Thu, Feb 23, 2023 at 10:33 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:
> On Sat, Feb 25, 2023 at 07:14:29AM +0800, Li kunyu wrote:
> >
> > hello senior:
> >   'rctx->hw_context' is a member of the rctx pointer array object and will pass 'memcpy(out, rctx, sizeof(*rctx)) at the end of the function;  ', copied to the out pointer memory, it cannot be released, I think this patch does an allocation check on the 'rctx->hw_context' pointer should help a bit.
>
> Ugh that's completely broken.  You can't export pointers.
>
> I guess this driver needs to be disabled.

Added Lionel to the To: line so he can look at this, I guess we should
also add an entry to MAINTAINERS so that the reports come to the right
address.

Can we fix the actual problem? It seems to have been there since the
initial submission in 2017.

I guess the right fix is to export the *actual* hardware state into "out"
and read it back from there instead of copying out the rctx struct.
Also .statesize needs to be fixed to correspond to that.
I can just use a roof:ed constant size for this.

If Lionel does not have time to look at it I can try to come up with a
quick fix.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
