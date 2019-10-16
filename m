Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBBAD8FB2
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2019 13:39:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D982CC36B0B;
	Wed, 16 Oct 2019 11:39:17 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9079EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2019 11:39:16 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id q12so17163365lfc.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2019 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U44zrrUEGPIKyeOF3bZO4ezT9IQ+ohS6tJrNxnkfoIw=;
 b=cDtS4Ct8KuWqEQHwFav9PV5/jOHM+PFzylmEbTUwCHv8M5H22ez/ZvgXU/AlP81CIn
 zUg+2LXILvxP4B4af9Kxb2/A2cnMT4tmyYdBWfqseP7P4MYnum45g04lADPpkCG69UnW
 vVA8/Qv0SaxwIKNR7jbBx3KlHfXludJgao831emYBXLIV8pjFPNqAnlJR/ZTIiewQl+Q
 owRk7DdyytF3GocIiBNMbCCbV4/lySf8+Vw2fA9MPyUxsbRyTQu6J/8HzTSPD7gGvkIJ
 RAri2J/k2MjTmbHWeksU8eTZLkYqYQvybVdg29MIySSnluDQq8VkQSOzLvpC47pOQgTM
 cn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U44zrrUEGPIKyeOF3bZO4ezT9IQ+ohS6tJrNxnkfoIw=;
 b=Hy2ZFF6lZK3KnEz9n36AyirbhJIDiaqCdXXwYqvmeSlsJFZQbvClg2Ylp7WCskaMOH
 OICstLexea+TLwymelAbImj8SxuCqkLUoJ+zK2gPjvH8zhjDWRv7ikKmDqQtv5Deqgt/
 iQIIKXtNob2jpDzQkQ8ru283vzoYOiUTE0yipcl6Z6mKaRS4jW2ey4+4RAjrDDPX+l4I
 jn9kw8qDAMjkQDzFHNu1zBUMnuOljj422G4UX9JZi9g3sIBR8Fx+9u4B6r5CaKoazNlV
 aWWVfmp0kV7uPvqVTuU3l2sQDCLLMGppfUhTMydtyTGKIpztglbrSIM92PfBb5fTZTy0
 qWWg==
X-Gm-Message-State: APjAAAVDVJVREzcpk42gAvOI3yvhXe9AMXXLLeywLUbVNKlMk4CKE7/6
 HLzXG85ufq4II0t7/TIlL/gkq8w1v129FWMyqjwMzw==
X-Google-Smtp-Source: APXvYqzfCYDzmJNrYkCLjNO3+528qx9sXazaTJ4hMTfKdtkfJD7qb/QPqfw0WxRQrluNmVoZn4BGeuPjiL8sr+GDC28=
X-Received: by 2002:a19:22c4:: with SMTP id i187mr5079447lfi.152.1571225955627; 
 Wed, 16 Oct 2019 04:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191009091606.17283-1-amelie.delaunay@st.com>
In-Reply-To: <20191009091606.17283-1-amelie.delaunay@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2019 13:39:04 +0200
Message-ID: <CACRpkdYGAAU5nrMgobQNo_CZyAHdee5owGqTPYcy6D8DYt_Xjw@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/1] pinctrl: stmfx: add
	irq_request/release_resources callbacks
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

On Wed, Oct 9, 2019 at 11:16 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> When an STMFX IO is used as interrupt through the interrupt-controller
> binding, the STMFX driver should configure this IO as input. Default
> value of STMFX IO direction is input, but if the IO is used as output
> before the interrupt use, it will not work without these callbacks.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
> Changes in V2:
> - use gpiochip_reqres_irq and gpiochip_relres_irq instead of calling
> explicitely the lock/unlock.

Patch applied!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
