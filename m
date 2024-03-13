Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E487B439
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Mar 2024 23:10:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B483AC6B46B;
	Wed, 13 Mar 2024 22:10:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BA1FC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 22:10:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 418F160A29;
 Wed, 13 Mar 2024 22:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAEEC433F1;
 Wed, 13 Mar 2024 22:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710367845;
 bh=5APNX9joY8E9yLLTfEuVlbvQ/cODNID0jd3oX4Dqksg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hlrZKybJJe3Ws3NMMxCNeEsHHbw+o6y1ncI16R6kzSspIO+mmP6NvDgwf4y8KiWzB
 ISriQDG/umtsjSLZngtc4bWRPmhaVLTwDEOJycCVs9T3pb2db6630MGkmEU1X9BTXf
 C/FR1pn4FLZNh7+e2vIRbE75VMM25aAR7Ehz3Q5So2rhXs8lMAJ/BPam+hhyEE2RK8
 TKJzV2JoGANM/fguI5enojXimqQG14HPKu1bLHKGoszu/nNEhNHQE4sQ1LLPnOn7gz
 zp7GTVMs3MuZxyJr6kTsKeJA9ylvnISwYysl+bpNM9dmNSZ3Hug4u0zZxEyvRICWYD
 MYiWylj9cA9LA==
Date: Wed, 13 Mar 2024 15:10:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Message-ID: <20240313221043.GC1111@sol.localdomain>
References: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
 <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
 <f2dcbe55-0f0e-4173-8e21-f899c6fc802a@gmail.com>
 <20240313194423.GA1111@sol.localdomain>
 <b838e729-dc30-4e18-b928-c34c16b08606@gmail.com>
 <20240313202223.GB1111@sol.localdomain>
 <db86cba4-0e61-441d-8e66-405a13b61a3c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db86cba4-0e61-441d-8e66-405a13b61a3c@gmail.com>
Cc: linux-wireless@vger.kernel.org, herbert@gondor.apana.org.au,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Karel Balej <balejk@matfyz.cz>, dhowells@redhat.com, mcgrof@kernel.org,
 keyrings@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-modules@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 iwd@lists.linux.dev, davem@davemloft.net, dimitri.ledkov@canonical.com,
 linux-crypto@vger.kernel.org
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

On Wed, Mar 13, 2024 at 02:17:29PM -0700, James Prestwood wrote:
> Hi,
> =

> On 3/13/24 1:22 PM, Eric Biggers wrote:
> > On Wed, Mar 13, 2024 at 01:12:54PM -0700, James Prestwood wrote:
> > > Hi,
> > > =

> > > On 3/13/24 12:44 PM, Eric Biggers wrote:
> > > > On Wed, Mar 13, 2024 at 10:26:06AM -0700, James Prestwood wrote:
> > > > > Hi,
> > > > > =

> > > > > On 3/13/24 1:56 AM, Johannes Berg wrote:
> > > > > > Not sure why you're CC'ing the world, but I guess adding a few =
more
> > > > > > doesn't hurt ...
> > > > > > =

> > > > > > On Wed, 2024-03-13 at 09:50 +0100, Karel Balej wrote:
> > > > > > >     and I use iwd
> > > > > > This is your problem, the wireless stack in the kernel doesn't =
use any
> > > > > > kernel crypto code for 802.1X.
> > > > > Yes, the wireless stack has zero bearing on the issue. I think th=
at's what
> > > > > you meant by "problem".
> > > > > =

> > > > > IWD has used the kernel crypto API forever which was abruptly bro=
ken, that
> > > > > is the problem.
> > > > > =

> > > > > The original commit says it was to remove support for sha1 signed=
 kernel
> > > > > modules, but it did more than that and broke the keyctl API.
> > > > > =

> > > > Which specific API is iwd using that is relevant here?
> > > > I cloned https://kernel.googlesource.com/pub/scm/network/wireless/i=
wd
> > > > and grepped for keyctl and AF_ALG, but there are no matches.
> > > IWD uses ELL for its crypto, which uses the AF_ALG API:
> > > =

> > > https://git.kernel.org/pub/scm/libs/ell/ell.git/
> > Thanks for pointing out that the relevant code is really in that separa=
te
> > repository.  Note, it seems that keyctl() is the problem here, not AF_A=
LG.  The
> > blamed commit didn't change anything for AF_ALG.
> > =

> > > I believe the failure is when calling:
> > > =

> > > KEYCTL_PKEY_QUERY enc=3D"x962" hash=3D"sha1"
> > > =

> > >  From logs Michael posted on the IWD list, the ELL API that fails is:
> > > =

> > > l_key_get_info (ell.git/ell/key.c:416)
> > Okay, I guess that's what's actually causing the problem.  KEYCTL_PKEY_=
* are a
> > weird set of APIs where userspace can ask the kernel to do asymmetric k=
ey
> > operations.  It's unclear why they exist, as the same functionality is =
available
> > in userspace crypto libraries.
> > =

> > I suppose that the blamed commit, or at least part of it, will need to =
be
> > reverted to keep these weird keyctls working.
> > =

> > For the future, why doesn't iwd just use a userspace crypto library suc=
h as
> > OpenSSL?
> =

> I was not around when the original decision was made, but a few reasons I
> know we don't use openSSL:
> =

> =A0- IWD has virtually zero dependencies.

Depending on something in the kernel does not eliminate a dependency; it ju=
st
adds that particular kernel UAPI to your list of dependencies.  The reason =
that
we're having this discussion in the first place is because iwd is depending=
 on
an obscure kernel UAPI that is not well defined.  Historically it's been ha=
rd to
avoid "breaking" changes in these crypto-related UAPIs because of the poor
design where a huge number of algorithms are potentially supported, but the=
 list
is undocumented and it varies from one system to another based on configura=
tion.
Also due to their obscurity many kernel developers don't know that these UA=
PIs
even exist.  (The reaction when someone finds out is usually "Why!?")

It may be worth looking at if iwd should make a different choice for this
dependency.  It's understandable to blame dependencies when things go wrong=
, but
at the same time the choice of dependency is very much a choice, and some
choices can be more technically sound and cause fewer problems than others.=
..

> =A0- OpenSSL + friends are rather large libraries.

The Linux kernel is also large, and it's made larger by having to support
obsolete crypto algorithms for backwards compatibility with iwd.

> =A0- AF_ALG has transparent hardware acceleration (not sure if openSSL do=
es
> too).

OpenSSL takes advantage of CPU-based hardware acceleration, e.g. AES-NI.

> Another consideration is once you support openSSL someone wants wolfSSL,
> then boringSSL etc. Even if users implement support it just becomes a huge
> burden to carry for the project. Just look at wpa_supplicant's src/crypto/
> folder, nearly 40k LOC in there, compared to ELL's crypto modules which is
> ~5k. You have to sort out all the nitty gritty details of each library, a=
nd
> provide a common driver/API for the core code, differences between openssl
> versions, the list goes on.

What is the specific functionality that you're actually relying on that you
think would need 40K lines of code to replace, even using OpenSSL?  I see y=
ou
are using KEYCTL_PKEY_*, but what specifically are you using them for?  What
operations are being performed, and with which algorithms and key formats?
Also, is the kernel behavior that you're relying on documented anywhere?  T=
here
are man pages for those keyctls, but they don't say anything about any
particular hash algorithm, SHA-1 or otherwise, being supported.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
