Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9DF141FBE
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jan 2020 20:16:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2731C36B0D;
	Sun, 19 Jan 2020 19:16:00 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB422C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jan 2020 19:15:58 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a5so12331269wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jan 2020 11:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wjPqQ+QcgdIt/3k/Xgoi79/wU8alTV3s3eopmW4iuJ4=;
 b=pbnbAH/bUX12Izz9PfnJQGv8De5M+j/8A0539bbmCvM9Kr3lCMwBNBj7/NLFX1hX5N
 xevMpe4hX4hU1+EbDyquumYVC6i5bvZn3yMZGSDVgjdR2xJGhI5viocmxGKI/EXsdTaQ
 DMQqrwPyu3QSvdFAin8XnwwCN9WFbwec8Hbyhb3uvo/f7haaG37X5cw1hx/yGc/wt13W
 bJijlhZi148lZHLc/bpgmkztlWg+l7mbxViuqdq5hUj5xEWW8Us24mqYk451C2XXox0B
 DXDfxFN/rL888aF7/S3LuktLMf556o29pIBrQLUyJ2drc0EpwaolAe1EvsieQ/iF1t8a
 r4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wjPqQ+QcgdIt/3k/Xgoi79/wU8alTV3s3eopmW4iuJ4=;
 b=ofu0VTJLCRffhABsBONi4wZkeqHRFUTajC8gFeLCHEF/iqyVrsAxHIceu+NFbj6xye
 tFbw0yRne6X13u0961texLzqiMpv6HjTe/oyxiu+AOoT98WK9YqwbDkQkMhyAFxuXNEz
 GRgxwpfElcW3ALZ14A8E+bDYdWgwlTDccZpdL4LxG6UhQxgYyXRqdW5BRAQpB8PDer8s
 Ri/6vaVhGtUemrks5eYhVum4FynJBypvnp0vPpxN5XDmWBcFlBeK9aVv28vhM1cPIdbD
 YIm6IMJXx2krL5xumgNVvdMNT2MqbUben17nPieook1xGTNszuc+K1moYChLBCrmq5zt
 MhrQ==
X-Gm-Message-State: APjAAAXCitC5+vhHuxqY+hGXm8XTCug8chz22fRc+3dslujcwbuhup8V
 oitbqvKpCh3X3kpXOWp1f9pH+2/afHeKiehHt6U=
X-Google-Smtp-Source: APXvYqzaBOq+usci2PMODRtU54TPMBfi0WijWwTBptOYu4FQw3HqD/2aJDrNY4I40wXQwl5H1OOYdw9zFnhcOFW5Ma0=
X-Received: by 2002:a1c:f719:: with SMTP id v25mr15697450wmh.116.1579461358280; 
 Sun, 19 Jan 2020 11:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
 <CAFLxGvyBO=_4-f+HQPZSaAL=aJouok3y=MxEKjup3Q=Cj0KKZg@mail.gmail.com>
 <20200117034035.GB19765@kadam>
In-Reply-To: <20200117034035.GB19765@kadam>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 19 Jan 2020 20:15:47 +0100
Message-ID: <CAFLxGvymMF-ijcUFc71Rg6MisC5RUa4dsUGesvE=rU=Z9Pj7-w@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH] ubi: Fix an error pointer dereference in
	error handling code
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

On Fri, Jan 17, 2020 at 4:39 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jan 17, 2020 at 12:50:14AM +0100, Richard Weinberger wrote:
> > On Mon, Jan 13, 2020 at 2:24 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > If "seen_pebs = init_seen(ubi);" fails then "seen_pebs" is an error pointer
> > > and we try to kfree() it which results in an Oops.
> > >
> > > This patch re-arranges the error handling so now it only frees things
> > > which have been allocated successfully.
> > >
> > > Fixes: daef3dd1f0ae ("UBI: Fastmap: Add self check to detect absent PEBs")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/mtd/ubi/fastmap.c | 19 +++++++++++--------
> > >  1 file changed, 11 insertions(+), 8 deletions(-)
> > > ---
> > >  drivers/mtd/ubi/fastmap.c | 21 ++++++++++++---------
> > >  1 file changed, 12 insertions(+), 9 deletions(-)
> >
> > This patch seems badly formatted.
> > Copy&paste error?
> >
>
> Oh, yeah.  Sorrry.  I shouldn't affect anything though.  I can resend
> if you want.

No need to resend, just wanted to make sure you sent the right patch.
Applied, thanks!

-- 
Thanks,
//richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
