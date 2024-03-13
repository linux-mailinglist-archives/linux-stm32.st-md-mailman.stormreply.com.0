Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF2087B2CE
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Mar 2024 21:22:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2955EC6B46B;
	Wed, 13 Mar 2024 20:22:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 710CEC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 20:22:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 986D0CE1C1C;
 Wed, 13 Mar 2024 20:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA20C433F1;
 Wed, 13 Mar 2024 20:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710361345;
 bh=rgukJbYU+P6pCiW7WPZ0odGPFMvz8t4VPdQBD930lsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mFlAHNW2U31SD7nKmJI4b7+wEklDjsk/bQ8BQxWUr206VF6u/NDhARmY7EwziZWHL
 uJgVdR0u8oJWsY9qOkLBXcvaQbnOCHpSwkW+0tZNeu7an3CwLwVzuJ8M3ZXzQGhx6r
 pN78QKRGcle4kw748mX/YLsb8xJuqGGiXJ5o+YimikW5hqKEQw2jh7UKz5fxbIBaeV
 FjN4xBzuITH1CzB8PEfUlA9uicYznEVUw9SW7+8ZZuIantuoR49VinlAU4aSSf8wHo
 y83rkovNZggjXEvqkM53hVvea0wF74bMh7LULVEAK1qIy+KmP1EihrCLfs61vEqTfZ
 GCDKedIzuPVWg==
Date: Wed, 13 Mar 2024 13:22:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Message-ID: <20240313202223.GB1111@sol.localdomain>
References: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
 <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
 <f2dcbe55-0f0e-4173-8e21-f899c6fc802a@gmail.com>
 <20240313194423.GA1111@sol.localdomain>
 <b838e729-dc30-4e18-b928-c34c16b08606@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b838e729-dc30-4e18-b928-c34c16b08606@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Mar 13, 2024 at 01:12:54PM -0700, James Prestwood wrote:
> Hi,
> 
> On 3/13/24 12:44 PM, Eric Biggers wrote:
> > On Wed, Mar 13, 2024 at 10:26:06AM -0700, James Prestwood wrote:
> > > Hi,
> > > 
> > > On 3/13/24 1:56 AM, Johannes Berg wrote:
> > > > Not sure why you're CC'ing the world, but I guess adding a few more
> > > > doesn't hurt ...
> > > > 
> > > > On Wed, 2024-03-13 at 09:50 +0100, Karel Balej wrote:
> > > > >    and I use iwd
> > > > This is your problem, the wireless stack in the kernel doesn't use any
> > > > kernel crypto code for 802.1X.
> > > Yes, the wireless stack has zero bearing on the issue. I think that's what
> > > you meant by "problem".
> > > 
> > > IWD has used the kernel crypto API forever which was abruptly broken, that
> > > is the problem.
> > > 
> > > The original commit says it was to remove support for sha1 signed kernel
> > > modules, but it did more than that and broke the keyctl API.
> > > 
> > Which specific API is iwd using that is relevant here?
> > I cloned https://kernel.googlesource.com/pub/scm/network/wireless/iwd
> > and grepped for keyctl and AF_ALG, but there are no matches.
> 
> IWD uses ELL for its crypto, which uses the AF_ALG API:
> 
> https://git.kernel.org/pub/scm/libs/ell/ell.git/

Thanks for pointing out that the relevant code is really in that separate
repository.  Note, it seems that keyctl() is the problem here, not AF_ALG.  The
blamed commit didn't change anything for AF_ALG.

> I believe the failure is when calling:
> 
> KEYCTL_PKEY_QUERY enc="x962" hash="sha1"
> 
> From logs Michael posted on the IWD list, the ELL API that fails is:
> 
> l_key_get_info (ell.git/ell/key.c:416)

Okay, I guess that's what's actually causing the problem.  KEYCTL_PKEY_* are a
weird set of APIs where userspace can ask the kernel to do asymmetric key
operations.  It's unclear why they exist, as the same functionality is available
in userspace crypto libraries.

I suppose that the blamed commit, or at least part of it, will need to be
reverted to keep these weird keyctls working.

For the future, why doesn't iwd just use a userspace crypto library such as
OpenSSL?

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
