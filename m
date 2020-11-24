Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AADC2C1B99
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 03:48:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6542C56631;
	Tue, 24 Nov 2020 02:48:40 +0000 (UTC)
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18EE8C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 02:48:39 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id EF15F2AA0D;
 Mon, 23 Nov 2020 21:48:35 -0500 (EST)
Date: Tue, 24 Nov 2020 13:48:34 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Joe Perches <joe@perches.com>
In-Reply-To: <e72a1aaef8673553a3ee9dfa033d6e893e00abcd.camel@perches.com>
Message-ID: <alpine.LNX.2.23.453.2011241210310.7@nippy.intranet>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
 <CANiq72=z+tmuey9wj3Kk7wX5s0hTHpsQdLhAqcOVNrHon6xn5Q@mail.gmail.com>
 <alpine.LNX.2.23.453.2011241036520.7@nippy.intranet>
 <e72a1aaef8673553a3ee9dfa033d6e893e00abcd.camel@perches.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
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
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-renesas-soc@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
 target-devel@vger.kernel.org, linux-hardening@vger.kernel.org
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


On Mon, 23 Nov 2020, Joe Perches wrote:

> On Tue, 2020-11-24 at 11:58 +1100, Finn Thain wrote:
> > it's not for me to prove that such patches don't affect code 
> > generation. That's for the patch author and (unfortunately) for 
> > reviewers.
> 
> Ideally, that proof would be provided by the compilation system itself 
> and not patch authors nor reviewers nor maintainers.
> 
> Unfortunately gcc does not guarantee repeatability or deterministic 
> output. To my knowledge, neither does clang.
> 

Yes, I've said the same thing myself. But having attempted it, I now think 
this is a hard problem. YMMV.

https://lore.kernel.org/linux-scsi/alpine.LNX.2.22.394.2004281017310.12@nippy.intranet/
https://lore.kernel.org/linux-scsi/alpine.LNX.2.22.394.2005211358460.8@nippy.intranet/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
