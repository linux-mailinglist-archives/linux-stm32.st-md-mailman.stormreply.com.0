Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A23742BC7B9
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Nov 2020 19:22:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BE87C5663D;
	Sun, 22 Nov 2020 18:22:15 +0000 (UTC)
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [96.44.175.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96B76C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Nov 2020 18:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5BB5B128028F;
 Sun, 22 Nov 2020 10:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1606069324;
 bh=h3sTlT+FA6NHXH38/foFLBJi59858PUlbpLzv2N/tQY=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=rW4pDHaLDXSFZXr6Cvxz8pUU95XYbgWiZrc9VupyznX2uzr45WZkkmPcoVv7UQLC7
 fsMPdBOfQk9ceeuIggpWHLoyVFttsPe9E/go/w8zBhamKaY37ALEH+1JPMFR7KYHwj
 pjW3T1Eqz9YAkW2FP12UvIfqAj7a03n4eq2U3CyI=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id nGXBdIQjsZJa; Sun, 22 Nov 2020 10:22:04 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id DB46B1280287;
 Sun, 22 Nov 2020 10:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1606069324;
 bh=h3sTlT+FA6NHXH38/foFLBJi59858PUlbpLzv2N/tQY=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=rW4pDHaLDXSFZXr6Cvxz8pUU95XYbgWiZrc9VupyznX2uzr45WZkkmPcoVv7UQLC7
 fsMPdBOfQk9ceeuIggpWHLoyVFttsPe9E/go/w8zBhamKaY37ALEH+1JPMFR7KYHwj
 pjW3T1Eqz9YAkW2FP12UvIfqAj7a03n4eq2U3CyI=
Message-ID: <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>
Date: Sun, 22 Nov 2020 10:21:59 -0800
In-Reply-To: <202011220816.8B6591A@keescook>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 x86@kernel.org, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
 linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 Joe Perches <joe@perches.com>, linux-integrity@vger.kernel.org,
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

On Sun, 2020-11-22 at 08:17 -0800, Kees Cook wrote:
> On Fri, Nov 20, 2020 at 11:51:42AM -0800, Jakub Kicinski wrote:
> > On Fri, 20 Nov 2020 11:30:40 -0800 Kees Cook wrote:
> > > On Fri, Nov 20, 2020 at 10:53:44AM -0800, Jakub Kicinski wrote:
> > > > On Fri, 20 Nov 2020 12:21:39 -0600 Gustavo A. R. Silva wrote:  
> > > > > This series aims to fix almost all remaining fall-through
> > > > > warnings in order to enable -Wimplicit-fallthrough for Clang.
> > > > > 
> > > > > In preparation to enable -Wimplicit-fallthrough for Clang,
> > > > > explicitly add multiple break/goto/return/fallthrough
> > > > > statements instead of just letting the code fall through to
> > > > > the next case.
> > > > > 
> > > > > Notice that in order to enable -Wimplicit-fallthrough for
> > > > > Clang, this change[1] is meant to be reverted at some point.
> > > > > So, this patch helps to move in that direction.
> > > > > 
> > > > > Something important to mention is that there is currently a
> > > > > discrepancy between GCC and Clang when dealing with switch
> > > > > fall-through to empty case statements or to cases that only
> > > > > contain a break/continue/return statement[2][3][4].  
> > > > 
> > > > Are we sure we want to make this change? Was it discussed
> > > > before?
> > > > 
> > > > Are there any bugs Clangs puritanical definition of fallthrough
> > > > helped find?
> > > > 
> > > > IMVHO compiler warnings are supposed to warn about issues that
> > > > could be bugs. Falling through to default: break; can hardly be
> > > > a bug?!  
> > > 
> > > It's certainly a place where the intent is not always clear. I
> > > think this makes all the cases unambiguous, and doesn't impact
> > > the machine code, since the compiler will happily optimize away
> > > any behavioral redundancy.
> > 
> > If none of the 140 patches here fix a real bug, and there is no
> > change to machine code then it sounds to me like a W=2 kind of a
> > warning.
> 
> FWIW, this series has found at least one bug so far:
> https://lore.kernel.org/lkml/CAFCwf11izHF=g1mGry1fE5kvFFFrxzhPSM6qKAO8gxSp=Kr_CQ@mail.gmail.com/


Well, it's a problem in an error leg, sure, but it's not a really
compelling reason for a 141 patch series, is it?  All that fixing this
error will do is get the driver to print "oh dear there's a problem"
under four more conditions than it previously did.

We've been at this for three years now with nearly a thousand patches,
firstly marking all the fall throughs with /* fall through */ and later
changing it to fallthrough.  At some point we do have to ask if the
effort is commensurate with the protection afforded.  Please tell me
our reward for all this effort isn't a single missing error print.

James


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
