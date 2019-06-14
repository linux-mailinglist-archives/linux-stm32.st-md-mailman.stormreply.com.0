Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C0B4532F
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2019 05:57:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EC00CC2398
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2019 03:57:41 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 822B9CC2397
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2019 03:57:40 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id s49so1463571edb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2019 20:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gDNeDNC6IhsxAfX1pCDhnGOlsLviHqkXzki8BiuCzfE=;
 b=pcbjuSreld4Y706hdj8M6kKp4kLTEsk7/zmxxGr/PyJ4Q63Evk+mFr05ZIUVlmh+xk
 +0sSwQJsJ3jl8VYasKac8A3nGlVpbTvobhzfAiK9jP8FOJMCcOUv8sOB66NZKQ2jc1ck
 GvR1DksaU4g55K+AlRMkee6MvlDCf7T7s4cjPBY5LeQTIxuG1Ff18gGqyPfQJUkqLLbq
 INWo7KBa6PX+s490TnOJjOoqdA+X/uqRhysLgQWo1Fsn7nqPJy+Pgx/UrGrn4Pw5b9jD
 R3nbCobM8hgSagh2KXO9ItEJz9DkEBVoe3ICfHdk6TImZ5kG7CFqaccEAYkebncKR1Ao
 klMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gDNeDNC6IhsxAfX1pCDhnGOlsLviHqkXzki8BiuCzfE=;
 b=KWX7sguboh6uir3gARw6ldWbtBeVGSNTJXrVULb59C2KQInEm0ocliUwCO1ii0c4yb
 iyNv3Baxo0QAgQmmb30gQ5Cow1f8waFtPX9TPYVBi3s5mnwuS+ZFbasi4ztEqzqFe6WN
 06e4ypoz7Th5CMAhCA6s0fOwszJBgedUcUVaeQ3QcGSKY1UqvVLAvp0SZFHdILGghSJn
 ntyqGlyh88K2gxbkm9KG70b04TXM6en8Xh5TV/pSqMNt4WdBA1QLspso5gFPmDIgfiVo
 VkGGF7a6Gc9Xh61XlXQCEp3D/ZIcLTH20dHE2guI99UniYzaxy+SLxNOKKwOBBqR3Ysw
 8Yig==
X-Gm-Message-State: APjAAAXfEF1m3vDJ+Lj7CVOkJveBKI2vFQux0HKs+yb3UWsQ53zR5ONy
 FiGzupfBwHb0bf7cwyMx/zw=
X-Google-Smtp-Source: APXvYqzJURQRQFhk+6yXhETpK9HjQuPFeyc8sNjYHpDFcm1C735qDO8j/cj2/Vadm8ArJoVnhREYtQ==
X-Received: by 2002:a50:ac24:: with SMTP id v33mr72538475edc.30.1560484660031; 
 Thu, 13 Jun 2019 20:57:40 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id m19sm332256eje.30.2019.06.13.20.57.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 20:57:39 -0700 (PDT)
Date: Thu, 13 Jun 2019 20:57:36 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20190614035736.GA57346@archlinux-epyc>
References: <20190511012301.2661-1-natechancellor@gmail.com>
 <20190513073059.GH4319@dell> <20190514183900.GA7559@archlinux-i9>
 <20190514185404.GP4319@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514185404.GP4319@dell>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Fix macro definition spelling
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

On Tue, May 14, 2019 at 07:54:04PM +0100, Lee Jones wrote:
> On Tue, 14 May 2019, Nathan Chancellor wrote:
> 
> > On Mon, May 13, 2019 at 08:30:59AM +0100, Lee Jones wrote:
> > > On Fri, 10 May 2019, Nathan Chancellor wrote:
> > > 
> > > > Clang warns:
> > > > 
> > > > In file included from drivers/mfd/stmfx.c:13:
> > > > include/linux/mfd/stmfx.h:7:9: warning: 'MFD_STMFX_H' is used as a
> > > > header guard here, followed by #define of a different macro
> > > > [-Wheader-guard]
> > > > 
> > > > Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core driver")
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/475
> > > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > > ---
> > > >  include/linux/mfd/stmfx.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > Applied, thanks.
> > > 
> > 
> > Hi Lee,
> > 
> > Thanks for picking it up. It seems this didn't make it into your MFD
> > pull request for 5.2, was that intentional? It would be nice to avoid
> > this warning.
> 
> Hmm... no it was not intentional.  Not sure what happened there.
> 
> I will pick it up for the -rcs.

Hi Lee,

Have you picked this up yet? I don't see it in -next or your public
tree.

Cheers,
Nathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
