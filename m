Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBF687B512
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Mar 2024 00:06:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FEC8C6B46B;
	Wed, 13 Mar 2024 23:06:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4850BC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 23:06:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 247CE614EA;
 Wed, 13 Mar 2024 23:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F717C433C7;
 Wed, 13 Mar 2024 23:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710371173;
 bh=aDTL1RV4FmboqbvrhDA4V/RHp/RwqjG+GI9GeVrckK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dpX1pLgW4VdByx9VX8UDNvQD1euFzbstWX/V4JrnQCuw+ZjvdPIKIcinxzZ2DrJe2
 erOIYgSWUSlwekE1/HhIEVAPniOC11fljCpw/1gt3043jhD9N507ko3IAjMU3dKEfo
 qd9ES4a3vkKV8R44Ez7Lot6sRhK9+nUBGQGBbM6wXZEbM4FEghP+sWg6cFBcI49wSm
 MzxuM8GlyGtq4dgdg9IxJYKHJ39bNMOsR63IKlTpY+XjKFF6VVCL3nrr6fp3d8U915
 jpPvzjvL/LvV/8K2T3Y34EbampxxgSxS6WKMrl7nnla+Sct8BLIabyucIedWqG6J0v
 I4vx1ldhw07rA==
Date: Wed, 13 Mar 2024 16:06:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Message-ID: <20240313230611.GD1111@sol.localdomain>
References: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
 <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
 <f2dcbe55-0f0e-4173-8e21-f899c6fc802a@gmail.com>
 <20240313194423.GA1111@sol.localdomain>
 <b838e729-dc30-4e18-b928-c34c16b08606@gmail.com>
 <20240313202223.GB1111@sol.localdomain>
 <db86cba4-0e61-441d-8e66-405a13b61a3c@gmail.com>
 <20240313221043.GC1111@sol.localdomain>
 <f0492c92-1015-48e3-bfce-598c7a4843d1@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0492c92-1015-48e3-bfce-598c7a4843d1@quicinc.com>
Cc: linux-wireless@vger.kernel.org, herbert@gondor.apana.org.au,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Karel Balej <balejk@matfyz.cz>, dhowells@redhat.com, mcgrof@kernel.org,
 keyrings@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-modules@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, iwd@lists.linux.dev,
 davem@davemloft.net, dimitri.ledkov@canonical.com,
 James Prestwood <prestwoj@gmail.com>
Subject: Re: [Linux-stm32] [REGRESSION] Re: [PATCH] crypto: pkcs7: remove
	sha1 support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Mar 13, 2024 at 03:51:10PM -0700, Jeff Johnson wrote:
> On 3/13/2024 3:10 PM, Eric Biggers wrote:
> > On Wed, Mar 13, 2024 at 02:17:29PM -0700, James Prestwood wrote:
> >> Hi,
> >>
> >> On 3/13/24 1:22 PM, Eric Biggers wrote:
> >>> On Wed, Mar 13, 2024 at 01:12:54PM -0700, James Prestwood wrote:
> >>>> Hi,
> >>>>
> >>>> On 3/13/24 12:44 PM, Eric Biggers wrote:
> >>>>> On Wed, Mar 13, 2024 at 10:26:06AM -0700, James Prestwood wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 3/13/24 1:56 AM, Johannes Berg wrote:
> >>>>>>> Not sure why you're CC'ing the world, but I guess adding a few mo=
re
> >>>>>>> doesn't hurt ...
> >>>>>>>
> >>>>>>> On Wed, 2024-03-13 at 09:50 +0100, Karel Balej wrote:
> >>>>>>>>     and I use iwd
> >>>>>>> This is your problem, the wireless stack in the kernel doesn't us=
e any
> >>>>>>> kernel crypto code for 802.1X.
> >>>>>> Yes, the wireless stack has zero bearing on the issue. I think tha=
t's what
> >>>>>> you meant by "problem".
> >>>>>>
> >>>>>> IWD has used the kernel crypto API forever which was abruptly brok=
en, that
> >>>>>> is the problem.
> >>>>>>
> >>>>>> The original commit says it was to remove support for sha1 signed =
kernel
> >>>>>> modules, but it did more than that and broke the keyctl API.
> >>>>>>
> >>>>> Which specific API is iwd using that is relevant here?
> >>>>> I cloned https://kernel.googlesource.com/pub/scm/network/wireless/i=
wd
> >>>>> and grepped for keyctl and AF_ALG, but there are no matches.
> >>>> IWD uses ELL for its crypto, which uses the AF_ALG API:
> >>>>
> >>>> https://git.kernel.org/pub/scm/libs/ell/ell.git/
> >>> Thanks for pointing out that the relevant code is really in that sepa=
rate
> >>> repository.  Note, it seems that keyctl() is the problem here, not AF=
_ALG.  The
> >>> blamed commit didn't change anything for AF_ALG.
> >>>
> >>>> I believe the failure is when calling:
> >>>>
> >>>> KEYCTL_PKEY_QUERY enc=3D"x962" hash=3D"sha1"
> >>>>
> >>>>  From logs Michael posted on the IWD list, the ELL API that fails is:
> >>>>
> >>>> l_key_get_info (ell.git/ell/key.c:416)
> >>> Okay, I guess that's what's actually causing the problem.  KEYCTL_PKE=
Y_* are a
> >>> weird set of APIs where userspace can ask the kernel to do asymmetric=
 key
> >>> operations.  It's unclear why they exist, as the same functionality i=
s available
> >>> in userspace crypto libraries.
> >>>
> >>> I suppose that the blamed commit, or at least part of it, will need t=
o be
> >>> reverted to keep these weird keyctls working.
> >>>
> >>> For the future, why doesn't iwd just use a userspace crypto library s=
uch as
> >>> OpenSSL?
> >>
> >> I was not around when the original decision was made, but a few reason=
s I
> >> know we don't use openSSL:
> >>
> >> =A0- IWD has virtually zero dependencies.
> > =

> > Depending on something in the kernel does not eliminate a dependency; i=
t just
> > adds that particular kernel UAPI to your list of dependencies.  The rea=
son that
> > we're having this discussion in the first place is because iwd is depen=
ding on
> > an obscure kernel UAPI that is not well defined.  Historically it's bee=
n hard to
> > avoid "breaking" changes in these crypto-related UAPIs because of the p=
oor
> > design where a huge number of algorithms are potentially supported, but=
 the list
> > is undocumented and it varies from one system to another based on confi=
guration.
> > Also due to their obscurity many kernel developers don't know that thes=
e UAPIs
> > even exist.  (The reaction when someone finds out is usually "Why!?")
> > =

> > It may be worth looking at if iwd should make a different choice for th=
is
> > dependency.  It's understandable to blame dependencies when things go w=
rong, but
> > at the same time the choice of dependency is very much a choice, and so=
me
> > choices can be more technically sound and cause fewer problems than oth=
ers...
> > =

> >> =A0- OpenSSL + friends are rather large libraries.
> > =

> > The Linux kernel is also large, and it's made larger by having to suppo=
rt
> > obsolete crypto algorithms for backwards compatibility with iwd.
> > =

> >> =A0- AF_ALG has transparent hardware acceleration (not sure if openSSL=
 does
> >> too).
> > =

> > OpenSSL takes advantage of CPU-based hardware acceleration, e.g. AES-NI.
> > =

> >> Another consideration is once you support openSSL someone wants wolfSS=
L,
> >> then boringSSL etc. Even if users implement support it just becomes a =
huge
> >> burden to carry for the project. Just look at wpa_supplicant's src/cry=
pto/
> >> folder, nearly 40k LOC in there, compared to ELL's crypto modules whic=
h is
> >> ~5k. You have to sort out all the nitty gritty details of each library=
, and
> >> provide a common driver/API for the core code, differences between ope=
nssl
> >> versions, the list goes on.
> > =

> > What is the specific functionality that you're actually relying on that=
 you
> > think would need 40K lines of code to replace, even using OpenSSL?  I s=
ee you
> > are using KEYCTL_PKEY_*, but what specifically are you using them for? =
 What
> > operations are being performed, and with which algorithms and key forma=
ts?
> > Also, is the kernel behavior that you're relying on documented anywhere=
?  There
> > are man pages for those keyctls, but they don't say anything about any
> > particular hash algorithm, SHA-1 or otherwise, being supported.
> =

> <https://lore.kernel.org/all/CA+55aFxW7NMAMvYhkvz1UPbUTUJewRt6Yb51QAx5Rtr=
WOwjebg@mail.gmail.com/>
> "And we simply do not break user space."
> -Linus Torvalds
> =

> Is this no longer applicable?
> =


As I said, the commit, or at least the part of it that broke iwd (it's not =
clear
that it's the whole commit), needs to be reverted.

I just hope that, simultaneously, the iwd developers will consider improvin=
g the
design of iwd to avoid this type of recurring issue in the future.  After a=
ll,
this may be the only real chance for such a discussion before the next time=
 iwd
breaks.

Also, part of the reason I'm asking about what functionality that iwd is re=
lying
on is so that, if necessary, it can be properly documented and supported...

If we don't know what we are supporting, it is very hard to support it.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
