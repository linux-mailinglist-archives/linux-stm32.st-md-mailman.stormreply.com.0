Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9ED57E8D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 894B1C57B7D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:49 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C23BBD2BAA0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 18:23:44 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d30so7418908pgm.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 11:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RUaqGS6QUgdTDoLllogq970LN7Ava4NDdFpVFqXYY/M=;
 b=GiGCJBrmLCcwdoXR/hfEWhxRxVXP0yUu9sUUZqvg4wVFwA5vVS81R3w7B/Hws02GBs
 bQf5m5LzSY2evhzZIaPcrTxdlRnOKG6JcgzyoPlFQaOBfdx4zG/zxciv5YgK+lrLTrxM
 cYO9J/gPwcAT2TpewnRYZ31E6KAMbCy2diEh13IEFyvzxVtxzxo7VvptCqzuA/hlCovh
 ZjKXMOGRmPvdeF+5XJnjjjFZqUja5TFKSjRPTAWJT6DPCrYdGGCmiq3H5dJ2O/MfvLXb
 zKyrSiVi+o3Z7jKpHKP2VcOUjPmBH9gPMgDgTzpANCDXfrsR2Ml+cEgzRas33f/OlAYk
 2KbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RUaqGS6QUgdTDoLllogq970LN7Ava4NDdFpVFqXYY/M=;
 b=KohdNW6hqheD+8rS52G6cjvODKdphh0JOehiEFaHWttLPxAgLnBoVZ1e4iYI5CyNNK
 EnfSgIBPJ0jvp83QU7qUsnHGTWxYTegue3LbAFQX7THizRL+zvMSRjNatCSfGoCe30dG
 tQnte9sfd41WGCKa7Tzit3yQXY5jUFWLsZzvTNpulGm267hVuLbNRngO1Wy5sR8UoCzJ
 0NIrtw0myIKE94jvfTwWlH5VkAtpRkQk00DbMZ+cVIslsZdElvKLFqG9EOw1nexR5zH0
 v52OSIKdwyiMPjB4rMuM/TjcuhjDlUtfM/JAwdQL8FiH4dGGb79cRXraH0tMkW5Dop3H
 ASlg==
X-Gm-Message-State: APjAAAXYl5HOFd0YLJOPb9He7SaMwiGyXabQJWtdWB9tE6gNEuF2b9OP
 4AzZb+9TKOwH6JhYDOSmNRqoUT32gtK13qmlOnY=
X-Google-Smtp-Source: APXvYqz0tqszhCDpzjSzH68sStNjjm2tLdRCgCOXbFIcDIoXYykPNvT0ZevAXzhMLOzrGgeFEbCuT5n6tl8XXCDe+dk=
X-Received: by 2002:a17:90b:d8b:: with SMTP id
 bg11mr28168554pjb.30.1560277423232; 
 Tue, 11 Jun 2019 11:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
 <CAHp75VfTNJOGZx-PoUXLRvzghqf6bVUdJ+yFjE9hNtDLCQ1=UA@mail.gmail.com>
 <20190611140501.11ba091b@coco.lan>
In-Reply-To: <20190611140501.11ba091b@coco.lan>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Jun 2019 21:23:32 +0300
Message-ID: <CAHp75VcdMXHf=hz_m5ySZ-=fBU=qkFxry9Q-Dos9Jx0qoyHCXQ@mail.gmail.com>
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

On Tue, Jun 11, 2019 at 8:05 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Em Tue, 11 Jun 2019 19:52:04 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
>
> > On Fri, Jun 7, 2019 at 10:04 PM Mauro Carvalho Chehab
> > <mchehab+samsung@kernel.org> wrote:
> > > Sphinx doesn't like orphan documents:
> >
> > >     Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree
> >
> > >  Documentation/laptops/lg-laptop.rst             | 2 ++
> >
> > > diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
> > > index aa503ee9b3bc..f2c2ffe31101 100644
> > > --- a/Documentation/laptops/lg-laptop.rst
> > > +++ b/Documentation/laptops/lg-laptop.rst
> > > @@ -1,5 +1,7 @@
> > >  .. SPDX-License-Identifier: GPL-2.0+
> > >
> > > +:orphan:
> > > +
> > >  LG Gram laptop extra features
> > >  =============================
> > >
> >
> > Can we rather create a toc tree there?
> > It was a first document in reST format in that folder.
>
> Sure, but:
>
> 1) I have a patch converting the other files on this dir to rst:
>
>         https://git.linuxtv.org/mchehab/experimental.git/commit/?h=convert_rst_renames_v4.1&id=abc13233035fdfdbc5ef2f2fbd3d127a1ab15530
>
> 2) It probably makes sense to move the entire dir to
> Documentation/admin-guide.
>
> So, I would prefer to have the :orphan: here while (1) is not merged.

Fine to me as long as you will drop it by the mentioned effort.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
