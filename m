Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 803D52C599F
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Nov 2020 17:54:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FCB3C56631;
	Thu, 26 Nov 2020 16:54:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D7F8C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Nov 2020 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606407509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IL7sPB68gF1YeWIUFuBJ//YIBDjI3bDL6qHHKubt/Z0=;
 b=AT6WJNqi+bJ+LtMsn9rUWD3HIPkQCmkageHMItDtO/gOMhrM8JIECpB9TlysAK6gCQfR6D
 +9BQH3+JeXDql1JP2mhx/yt5czdNRbtGu4NPZwEtD6iEDHUgdj+NqytmOxF+PLHh/1xJcH
 lxC4BPy8F+7iZiHXDSvmsWkiaUyf8yw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-1ztc7rnjNi6Zq92Yw8CAqw-1; Thu, 26 Nov 2020 11:18:25 -0500
X-MC-Unique: 1ztc7rnjNi6Zq92Yw8CAqw-1
Received: by mail-qv1-f72.google.com with SMTP id c35so944730qva.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Nov 2020 08:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IL7sPB68gF1YeWIUFuBJ//YIBDjI3bDL6qHHKubt/Z0=;
 b=WuPRMi+6XW+uCuFo3bAjP3hU070rOaYAq90rfluptEPuIcb1jIqBOYwJOke2cKekMo
 fiwFNtoz89Q3G+B2jRjdHwS6h0E+ISbFgDPMybiL1r0YshtcmjnRcM1/eyBltOJyweOJ
 SosAEhAJIpVE/q3jjXI6kzKcU2iEnGuZWNE+xwHmC3VDxrHVDKycgbBgqUPjOnti9nHJ
 tusfDgnjGCBvULuhrr4N/qHmdwJTyWAj7M28itCDJVS+MtA48VjG6M+5GMFhqE9fhma3
 btZy+psOJFdFnI9+u3Jkf83MrgGL8BHlK4n5APeEbP4V5dFKSEZLO7PJ2yWGdNB8h4Ko
 DlVQ==
X-Gm-Message-State: AOAM530Kjpw0jv9N5ED7lRYrTVRoenb7GJI+/MVVNQDYDmG3Wk8fbhKe
 Wc+03ID39i+p5zT3K8NcQpF+fBxnExGZfoL0ujnUsNHRh6ofBOUJofSaEp3Bla4jSGBQdAe/tA9
 uwDgrSlhD/cm4+n+odTdU9dfhzm2f7UnWCqBtdjpx4f6aEnAADIhkiLcW
X-Received: by 2002:a37:ac8:: with SMTP id 191mr3793925qkk.381.1606407504814; 
 Thu, 26 Nov 2020 08:18:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCU4CKAolN2PpaYdMoKCHma/+NC3lHjkQkQkRPTWC20j3rANbYTTy+FG9V7n634RRlgf0kcsxPjR4LO+NB5fA=
X-Received: by 2002:a37:ac8:: with SMTP id 191mr3793888qkk.381.1606407504531; 
 Thu, 26 Nov 2020 08:18:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
 <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
 <CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
 <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
 <CANiq72kqO=bYMJnFS2uYRpgWATJ=uXxZuNUsTXT+3aLtrpnzvQ@mail.gmail.com>
 <44005bde-f6d4-5eaa-39b8-1a5efeedb2d3@gmail.com>
 <CANiq72nobq=ptWK-qWxU91JHqkKhMcRtJNnw2XJd5-vSJWZd8Q@mail.gmail.com>
 <CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
In-Reply-To: <CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 26 Nov 2020 17:18:13 +0100
Message-ID: <CACO55tsBj3gLECoMWtViDitd7fVTnW+Cp0LVmqYkR=QFBJkEmQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Thu, 26 Nov 2020 16:54:07 +0000
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-atm-general@lists.sourceforge.net, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 linux-ide@vger.kernel.org, dm-devel@redhat.com,
 target-devel <target-devel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 "open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
 linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net,
 Lars Ellenberg <drbd-dev@lists.linbit.com>,
 driverdevel <devel@driverdev.osuosl.org>, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, scsi <linux-scsi@vger.kernel.org>,
 Edward Cree <ecree.xilinx@gmail.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 reiserfs-devel@vger.kernel.org, linux-geode@lists.infradead.org,
 linux-block@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 samba-technical@lists.samba.org, xen-devel@lists.xenproject.org,
 Nouveau Dev <nouveau@lists.freedesktop.org>, linux-hams@vger.kernel.org,
 ceph-devel <ceph-devel@vger.kernel.org>, linux-can@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 GR-Linux-NIC-Dev@marvell.com, tipc-discussion@lists.sourceforge.net,
 Linux-MM <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net,
 Linux MMC List <linux-mmc@vger.kernel.org>, linux-sctp@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 linux-security-module <linux-security-module@vger.kernel.org>,
 keyrings@vger.kernel.org, NetFilter <netfilter-devel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 000/141] Fix fall-through warnings for
	Clang
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

On Thu, Nov 26, 2020 at 4:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Miguel,
>
> On Thu, Nov 26, 2020 at 3:54 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> > On Wed, Nov 25, 2020 at 11:44 PM Edward Cree <ecree.xilinx@gmail.com> wrote:
> > > To make the intent clear, you have to first be certain that you
> > >  understand the intent; otherwise by adding either a break or a
> > >  fallthrough to suppress the warning you are just destroying the
> > >  information that "the intent of this code is unknown".
> >
> > If you don't know what the intent of your own code is, then you
> > *already* have a problem in your hands.
>
> The maintainer is not necessarily the owner/author of the code, and
> thus may not know the intent of the code.
>
> > > or does it flag up code
> > >  that can be mindlessly "fixed" (in which case the warning is
> > >  worthless)?  Proponents in this thread seem to be trying to
> > >  have it both ways.
> >
> > A warning is not worthless just because you can mindlessly fix it.
> > There are many counterexamples, e.g. many
> > checkpatch/lint/lang-format/indentation warnings, functional ones like
> > the `if (a = b)` warning...
>
> BTW, you cannot mindlessly fix the latter, as you cannot know if
> "(a == b)" or "((a = b))" was intended, without understanding the code
> (and the (possibly unavailable) data sheet, and the hardware, ...).
>

to allow assignments in if statements was clearly a mistake and if you
need outside information to understand the code, your code is the
issue already.

> P.S. So far I've stayed out of this thread, as I like it if the compiler
>      flags possible mistakes.  After all I was the one fixing new
>      "may be used uninitialized" warnings thrown up by gcc-4.1, until
>      (a bit later than) support for that compiler was removed...
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
