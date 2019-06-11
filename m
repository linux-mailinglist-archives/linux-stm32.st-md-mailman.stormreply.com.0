Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA5257E8C
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 764C5C57B70
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:49 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E977C20B7E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 16:52:17 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f21so1273379pgi.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DQYk/P/AHz+84MHAfqs8A9FFft/ChbHJqGQaIDzi6ok=;
 b=cjJRH/tiJROWu574Li6WdMn+vr3Phrkemo9e0MrIa7BjfXn2y19eO6hPYoPqTcaHm+
 hm86n1rLG16xTwB/lLMEZ2SGn8PMjk7ag060+cgnFYiLM2inu1qWcunQBV1YSvwfqYTT
 DgE717bOFNLWOZArTH/miO/fXl2dyCUiS6unF3rjzsK53ET9uPUrfDplIbVezPaE0owq
 T40LrouoYo1Kjly8EJOlF7nZLhlPBw95nQfBGP3R4rCFndbjLuo5+P13eHpc0hbKjwSf
 j1WcA8dmRUBq2QbCXlBPmirBES11keCDGZCylHH6F7HiSk1MO2DGiSF9oKgwoUiwsuzg
 zNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQYk/P/AHz+84MHAfqs8A9FFft/ChbHJqGQaIDzi6ok=;
 b=CvozsSh9cth6C0g/pZDmlHeJZd9acFe1m3KKG4pS6J6b1sj6Ls5nHkFZb59eSJGmNn
 QvA/bqzOoieBznxZ15KgOrsoQryKr9vYtEhkgJCWBrqiKjhp8Xcn+mIJwNeE4r4Q4NzT
 rVSRe51J7I1OKOwuj5kx1Yknc7volSLckkpqMVvqCIFCfBlygqaRIiEeV8NZdHE7Pche
 3sHJ51Wlzr3GF9rGFWfIF/VzIxgCi0rlV5yX6l4S2QOiH+2J/mO7VEuToEvg/KtI4nD+
 YANofI3zye8qcUFPnPGuNt9VTR6DvwyzqhFLVB7hpcmrBRvJS5xLgWOBuCW9h9Hw08l5
 rIPQ==
X-Gm-Message-State: APjAAAWpozPH15BxPihdHaAKWjmYCBhTq63X1iGNtZ+pYWUkAnHzC4/E
 ewpCnktDwq0Matx+w0QvtRQbN2XA8eJFjRMfk+Y=
X-Google-Smtp-Source: APXvYqwIRgwZSvbJvIgasj06odVOLwqV4e1NGaONT67RAQJDqA/rR9sRiGkufN8AoUbyfd4Xe69TJ3rJVeHoEHiPbLI=
X-Received: by 2002:a17:90b:8d2:: with SMTP id
 ds18mr3765976pjb.132.1560271935519; 
 Tue, 11 Jun 2019 09:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
In-Reply-To: <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Jun 2019 19:52:04 +0300
Message-ID: <CAHp75VfTNJOGZx-PoUXLRvzghqf6bVUdJ+yFjE9hNtDLCQ1=UA@mail.gmail.com>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 dri-devel@lists.freedesktop.org,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Linux PM <linux-pm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matan Ziv-Av <matan@svgalib.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 06/20] docs: mark orphan documents as
	such
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

On Fri, Jun 7, 2019 at 10:04 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
> Sphinx doesn't like orphan documents:

>     Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree

>  Documentation/laptops/lg-laptop.rst             | 2 ++

> diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
> index aa503ee9b3bc..f2c2ffe31101 100644
> --- a/Documentation/laptops/lg-laptop.rst
> +++ b/Documentation/laptops/lg-laptop.rst
> @@ -1,5 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0+
>
> +:orphan:
> +
>  LG Gram laptop extra features
>  =============================
>

Can we rather create a toc tree there?
It was a first document in reST format in that folder.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
