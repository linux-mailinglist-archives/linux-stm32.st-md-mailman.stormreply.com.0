Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A282C0C90
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 15:05:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE3C9C56631;
	Mon, 23 Nov 2020 14:05:45 +0000 (UTC)
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 816E7C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 14:05:44 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id k65so16027153ybk.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 06:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RhHqKgQbKUW77nc47JuvCnp+w8QNxENxQLSt6AHkTqQ=;
 b=uc3VE1PZNnY/Z1NgZXLeWe/Nj5hsoBfQkeeHXaE+d0SDr9xNRMPYxU1o6fpuaiqkgi
 yuFjhawxyOxFbziEfkWs4inb92LCIVTnNTVXAL7657JtY5jUPnHae9XC4JONvfltcDzK
 9TpDS0ylXwfesoyru6or5tLuj2Wgq4fxc0XGG5evkxw7F5K63x1NbbMukm854FcfQLy0
 gnTDe+NWIPcxyPxl6ZwlkcZY1OnasK1C98JFaIzSzrlrdcg6icgY2nCNokwGspTvBpMG
 u0c2fJxhgJsKPBZAzgP85ZG8VhKJUulmNcJ8sZ+phgCZ9U4trQ3IF/NnqsJiuQ1qY+5Q
 UH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhHqKgQbKUW77nc47JuvCnp+w8QNxENxQLSt6AHkTqQ=;
 b=H7aA2asrn8mWAq+QTHsymAtEifXOySbeHz6TIBcdlAonqWlIaejGDNUysisCputBiX
 7X36aDvwk1gPYNr8y8Z2cHz6t0BvgZa+BUN1Geg1Sqlaoh1VZ6+MQzqQr6365Vz7vo6V
 6oC6oHIr6Mg3DQtJkojE5oe/oqWIVA5Z7+C2mmVmCiiYSdJcJdfqRGSyuZ6aoD/1RCEr
 6TlEK5mzpAsxEK5bTeMtW+j4zN5KzM0lywfm3z40LwIoRYZvL4laBTRKEhKLakruJq4R
 ISLlP7vyk3bZWdJoiqcSEQGyx+3OlYtIDsPyuY2/CX5HOtRAKcR4MyeWPau07D47hOGc
 hOPg==
X-Gm-Message-State: AOAM532J8934mqkK1MJ4pNs9EvheCP2o3Q5aNwNEzQP59PzCd5gDm3Ex
 KWcFGUlKDK/uiMIkzTPkNsRRu267IJbJDCQECHU=
X-Google-Smtp-Source: ABdhPJz9DsZ58e7OIIOr/VE9Xtax3PWaLuFuRyVLpjTsCzIYcuPGWJiVUhGusztX9v02ET+47HU3GtURC6oS5LfC9Lw=
X-Received: by 2002:a5b:40e:: with SMTP id m14mr35121900ybp.33.1606140343388; 
 Mon, 23 Nov 2020 06:05:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
In-Reply-To: <alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2020 15:05:31 +0100
Message-ID: <CANiq72=z+tmuey9wj3Kk7wX5s0hTHpsQdLhAqcOVNrHon6xn5Q@mail.gmail.com>
To: Finn Thain <fthain@telegraphics.com.au>
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com,
 wcn36xx@lists.infradead.org, samba-technical@lists.samba.org,
 linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-scsi@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, tipc-discussion@lists.sourceforge.net,
 Linux-MM <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, target-devel@vger.kernel.org,
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

On Sun, Nov 22, 2020 at 11:54 PM Finn Thain <fthain@telegraphics.com.au> wrote:
>
> We should also take into account optimisim about future improvements in
> tooling.

Not sure what you mean here. There is no reliable way to guess what
the intention was with a missing fallthrough, even if you parsed
whitespace and indentation.

> It is if you want to spin it that way.

How is that a "spin"? It is a fact that we won't get *implicit*
fallthrough mistakes anymore (in particular if we make it a hard
error).

> But what we inevitably get is changes like this:
>
>  case 3:
>         this();
> +       break;
>  case 4:
>         hmmm();
>
> Why? Mainly to silence the compiler. Also because the patch author argued
> successfully that they had found a theoretical bug, often in mature code.

If someone changes control flow, that is on them. Every kernel
developer knows what `break` does.

> But is anyone keeping score of the regressions? If unreported bugs count,
> what about unreported regressions?

Introducing `fallthrough` does not change semantics. If you are really
keen, you can always compare the objects because the generated code
shouldn't change.

Cheers,
Miguel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
