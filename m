Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB852C33D4
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 23:24:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1E78C56630;
	Tue, 24 Nov 2020 22:24:14 +0000 (UTC)
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB88BC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 22:24:13 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 8A96E22AD6;
 Tue, 24 Nov 2020 17:24:09 -0500 (EST)
Date: Wed, 25 Nov 2020 09:24:08 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Kees Cook <keescook@chromium.org>
In-Reply-To: <202011241327.BB28F12F6@keescook>
Message-ID: <alpine.LNX.2.23.453.2011250859290.15@nippy.intranet>
References: <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
 <20201123130348.GA3119@embeddedor>
 <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
 <202011241327.BB28F12F6@keescook>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, bridge@lists.linux-foundation.org,
 target-devel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com,
 wcn36xx@lists.infradead.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-scsi@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-rdma@vger.kernel.org, oss-drivers@netronome.com,
 linux-atm-general@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
 linux-mmc@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-sctp@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-geode@lists.infradead.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org,
 nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-can@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-decnet-user@lists.sourceforge.net, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, x86@kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH 000/141] Fix
 fall-through warnings for Clang
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

On Tue, 24 Nov 2020, Kees Cook wrote:

> On Mon, Nov 23, 2020 at 08:31:30AM -0800, James Bottomley wrote:
> > Really, no ... something which produces no improvement has no value at 
> > all ... we really shouldn't be wasting maintainer time with it because 
> > it has a cost to merge.  I'm not sure we understand where the balance 
> > lies in value vs cost to merge but I am confident in the zero value 
> > case.
> 
> What? We can't measure how many future bugs aren't introduced because 
> the kernel requires explicit case flow-control statements for all new 
> code.
> 

These statements are not "missing" unless you presume that code written 
before the latest de facto language spec was written should somehow be 
held to that spec.

If the 'fallthrough' statement is not part of the latest draft spec then 
we should ask why not before we embrace it. Being that the kernel still 
prefers -std=gnu89 you might want to consider what has prevented 
-std=gnu99 or -std=gnu2x etc.

> We already enable -Wimplicit-fallthrough globally, so that's not the 
> discussion. The issue is that Clang is (correctly) even more strict than 
> GCC for this, so these are the remaining ones to fix for full Clang 
> coverage too.
> 

Seems to me you should be patching the compiler.

When you have consensus among the language lawyers you'll have more 
credibility with those being subjected to enforcement.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
