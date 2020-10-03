Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCE1283085
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 09:02:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEA5CC424AF;
	Mon,  5 Oct 2020 07:02:37 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B4FEC3FAFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Oct 2020 19:31:43 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id g3so5829210qtq.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 03 Oct 2020 12:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=CWQLnefJnV9lai9ha07+j4R+wHuwUmFBxVnJsYEYjsI=;
 b=TRIuiKupRuCU5VUlLtlKbsBlNQbnfv9jVMRmvy5WrUMTyv5g7SdRa3REDAkElPyBzv
 WSOws0iapEwPs/zPE6it9FcrVqCtAnsz/UakcRiEJxUOMFcBe7pAZ20U41kh3yUYUB6u
 lAK2edDDWs/OyXo320TXSOEjMz+2dy680rqXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=CWQLnefJnV9lai9ha07+j4R+wHuwUmFBxVnJsYEYjsI=;
 b=PjmEljxSX691okFjvZxifxYN4lweDj2xVAC78PTS+GPzq5SIPV4oieDK2QZ89S+pSG
 sv5PRsZSkrCQUVuGoGSgwgf8qiTdVlIxxLaQL0K8DpSmPkL5GMjGfJrS8MDcgEBsvgwP
 ZcAG7nZjL7QOXR87XeeXCQ1I1hwVR9DGECe2WosnV/4W/kU4ljDrZT37J+Ov8KcS1OXb
 ZmBq14gkQTr89b2Cx6b+3SjQae6AIlRzRzJ5jwbtY1QSyv4HrhEizSSrsX+ZyZpvMxRj
 f0Wc1vlomjXDnwacBIFJI0ko8xq4HkvJINtIhoQsvSqx12nYW4garujeu5fAZOnYbBkk
 M8Yg==
X-Gm-Message-State: AOAM532iEJhTVF0pld6kwszTuFIhtZJzjoaQaCMzBDpH+G5Tzn1gRHGC
 CxAvHGF2UuKfysy6KX2LCUuvfw==
X-Google-Smtp-Source: ABdhPJyXj0to29E/962sKEc6U/odEp+QvXfYgP1BYnP1Sa/tA6o1DsKTTnJkOmEDBav7C7kIlGgFyQ==
X-Received: by 2002:ac8:4548:: with SMTP id z8mr7894174qtn.291.1601753502454; 
 Sat, 03 Oct 2020 12:31:42 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
 by smtp.gmail.com with ESMTPSA id a66sm3745298qkc.52.2020.10.03.12.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 12:31:41 -0700 (PDT)
Date: Sat, 3 Oct 2020 15:31:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <20201003193137.z2bpwzlz5a66kkex@chatter.i7.local>
Mail-Followup-To: Julia Lawall <julia.lawall@inria.fr>,
 Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>,
 tools@linux.kernel.org, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-acpi@vger.kernel.org,
 David Lechner <david@lechnology.com>,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com,
 openipmi-developer@lists.sourceforge.net,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-ide@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-wireless@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
 <20201001110150.GA6715@sirena.org.uk>
 <f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com>
 <20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
 <alpine.DEB.2.22.394.2010032118420.2741@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2010032118420.2741@hadrien>
X-Mailman-Approved-At: Mon, 05 Oct 2020 07:02:31 +0000
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-acpi@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Joe Perches <joe@perches.com>,
 openipmi-developer@lists.sourceforge.net, tools@linux.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/18] use semicolons rather than commas
 to separate statements
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

On Sat, Oct 03, 2020 at 09:18:51PM +0200, Julia Lawall wrote:
> > > There seems to be some mismatch between b4's use of the
> > > cover letter to a patch series and what maintainers that
> > > apply a subset of the patches in the patch series.
> > >
> > > The merge description shows the entire patch series as
> > > applied, but the actual merge is only a subset of the
> > > series.
> > >
> > > Can this be improved in b4?
> >
> > So, the following logic should be applied:
> >
> > - if the entire series was applied, reply to 0/n
> > - if a subset only is applied, reply to each n/n of the patch that was
> >   cherry-picked out of the series
> >
> > Is that an accurate summary?
> 
> That sounds good.

I'm worried that this can get unwieldy for series of 50 patches where 49 
got applied. Would the following be better:

-----
From: ...
To: ...
Subject: Re: [PATCH 00/18] use semicolons...

On Sun...
> These patches...
>
> [...]

A subset of these patches was applied to

  https://...

Thanks!

[5/18] regmap: debugfs:
       commit:

(etc)
-----

In other words, we:

- specifically say that it's a subset
- instead of just enumerating the number of patches that were applied, 
  as is currently the case ([1/1]) we list the exact numbers out of the 
  posted series (e.g. [5/18])

I think this is a better solution than potentially flooding everyone 
with 49 emails.

-K
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
