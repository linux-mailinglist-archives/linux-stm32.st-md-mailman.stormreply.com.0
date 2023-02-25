Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62E6A2C89
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Feb 2023 00:15:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FD2CC65E56;
	Sat, 25 Feb 2023 23:15:41 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F052EC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Feb 2023 23:15:39 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-536b7ffdd34so79558717b3.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Feb 2023 15:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SJmSfEEN4ER+rrwr2AAo+0NwW5TiTbnjxiFoVH+2l9g=;
 b=lJuA91aU+Z6dTyfnGMZiVv3hrjIkUarjSMsX4//t7Svg2+BqrGDoGH0GjaPHAdBO4u
 G3blhCZrGSY7lPwfnaKaW39TqZjA/tz4w6Vv1c+0JaDZS2srvRmFlfxteeK3UpfVBreJ
 5F8qqdMVrlED+IGO+nY37MbRA7IKvEt4wWuVcgZAA84RtrzqTpYeSsqH2SMeL6gpX0lE
 +n9MzpJR4CBJEDStxxjecE5wzyZK8v8sgZwd7sYVY4RtLz7ZEul2g8HJPy7fggXDL3xB
 8gWG3WGEGYMnEs1sowTXxetmnWh9yN9AfLCCjOiKo0CniLKCUTCTXaz+sgbee/E0TQGH
 XHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SJmSfEEN4ER+rrwr2AAo+0NwW5TiTbnjxiFoVH+2l9g=;
 b=00Zpf6BLCEzOlbjlzFHYzGXt1yr3PSL82JijEZnwEqXlqm4fPsY9NmyGbc/Exsds7b
 EPLgWOBZ7wiQ0D+OFI5EsXzlcITOH+R0cN2nS3Wie1yg9YyGR5G7tAguuI+fWtLRg9Yf
 Np8IwOX3NdyfNMe8WO5IgUdXAOl1sOy8Pz3Fx8NkLB5/srMUeBdpMzHdweZfgsmPyDfg
 PcEtlNiDZzFq0yvx2Yv7fSzSObn81MwvZVBMlynEBreLSMbq+77DcUlnuLcMcKT96/RB
 7SpLp59DdRpv3M0k5SJIKNxTYO2WtMPD5kPqHq2idXn4OBdl8PM6BmC5o+mzUWDdXt1d
 oJeQ==
X-Gm-Message-State: AO0yUKUX7Uind7SLsYDXcaN1WP4BMymKZ7EJ2VYeFiZw4RIEsuu3AhqD
 OgK0qwO8yfMNBxghgvrV43s591zr7OMrTBHDaGHc7Q==
X-Google-Smtp-Source: AK7set81k6a7OARPbG8rGRSwKMm+X+pUCEQjYElVtITGMi8kMV0p1mfBo4QFoFXB6q5yGAxkalHBm6shkJcbwLjHKLw=
X-Received: by 2002:a81:af5d:0:b0:52e:cea7:f6e3 with SMTP id
 x29-20020a81af5d000000b0052ecea7f6e3mr7373343ywj.10.1677366938879; Sat, 25
 Feb 2023 15:15:38 -0800 (PST)
MIME-Version: 1.0
References: <Y/cBB+q0Ono9j2Jy@gondor.apana.org.au>
 <20230224231430.2948-1-kunyu@nfschina.com>
 <Y/cy5wUtk10OahpO@gondor.apana.org.au>
 <CACRpkdYyB=-UnE1bmdVszSSB5ReECZ0fUoWJX6XtYbKHEe52tA@mail.gmail.com>
 <Y/c7iVW67Xhhdu8e@gondor.apana.org.au> <Y/hQdzsKMYgkIfMY@gondor.apana.org.au>
 <CACRpkdZe3cMMxJesD0mpqHTwvuWHjSGVHsiFUQQyuA+VWknMTQ@mail.gmail.com>
In-Reply-To: <CACRpkdZe3cMMxJesD0mpqHTwvuWHjSGVHsiFUQQyuA+VWknMTQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Feb 2023 00:15:27 +0100
Message-ID: <CACRpkdY7V=x9+oWsbPtmjc-WBz6v2aSr9RVD1pJ4SGu+Dxejvw@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v2 PATCH] crypto: stm32 - Save and restore
	between each request
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

On Sat, Feb 25, 2023 at 1:01 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> I tested this on the Ux500 and sadly this happens
> already in probe():
(...)
> [    2.828815] stm32-hash a03c2000.hash: Algo 0 : 0 failed
> [    2.834144] stm32-hash: probe of a03c2000.hash failed with error -22

It turns out that this is because this:

-       /* Export Context */
-       u32                     *hw_context;
+       /* hash state */
+       u32                     hw_context[3 + HASH_CSR_REGISTER_NUMBER];

Makes struct stm32_hash_request_ctx 580 bytes
and that fails sanity check in ahash.c because
HASH_MAX_STATESIZE is 512.

I don't know the story behind why HASH_MAX_STATESIZE
is 512, the stm32 hash state contains a buffer of 256 bytes
so I guess either that buffer is a bit big or
HASH_MAX_STATESIZE is a bit small?

I'm happy to try to change either to make this fit.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
