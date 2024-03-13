Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D5787B221
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Mar 2024 20:44:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6CD7C6B46B;
	Wed, 13 Mar 2024 19:44:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2955EC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 19:44:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C8EED61345;
 Wed, 13 Mar 2024 19:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9B6C433F1;
 Wed, 13 Mar 2024 19:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710359065;
 bh=y4IkOkfDTy6Hf5RFlO9oP6K871NhGp6uazdYCzXOG5o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m+lHgNSpmOVZFWHTL9/c1q9/BAn+Hs2c1s3lqTXVoGwnLWhY7ebljIWs+Di9lmYPq
 qXxJTCDpoiM7OxydG+AfbATKxYHfO32qhDAHBzPR0ycn1LuXPzCJNyE8PopCBIoZ0M
 VwhveDYuplvMxkTUkwzkykT4bQqyHomo7QVmqsp1/ZjJfE9/gcUTM1Q3+1xPmgCX7G
 I5dWqE2e/Uh5P0Z0lGYULRAIvr/aFXnaHeV5yTMsJ1D3VxEfHcvff3RKqfp8Y3iGSm
 eNptZnJxrvjBkgKQV7nTr0N1VrlxJ7XMFIUOIIqlrwLGQqZYj6y7WNi7DkErD8bqC8
 uaVnhthnNyIfw==
Date: Wed, 13 Mar 2024 12:44:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Message-ID: <20240313194423.GA1111@sol.localdomain>
References: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
 <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
 <f2dcbe55-0f0e-4173-8e21-f899c6fc802a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2dcbe55-0f0e-4173-8e21-f899c6fc802a@gmail.com>
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

On Wed, Mar 13, 2024 at 10:26:06AM -0700, James Prestwood wrote:
> Hi,
> 
> On 3/13/24 1:56 AM, Johannes Berg wrote:
> > Not sure why you're CC'ing the world, but I guess adding a few more
> > doesn't hurt ...
> > 
> > On Wed, 2024-03-13 at 09:50 +0100, Karel Balej wrote:
> > >   and I use iwd
> > This is your problem, the wireless stack in the kernel doesn't use any
> > kernel crypto code for 802.1X.
> 
> Yes, the wireless stack has zero bearing on the issue. I think that's what
> you meant by "problem".
> 
> IWD has used the kernel crypto API forever which was abruptly broken, that
> is the problem.
> 
> The original commit says it was to remove support for sha1 signed kernel
> modules, but it did more than that and broke the keyctl API.
> 

Which specific API is iwd using that is relevant here?
I cloned https://kernel.googlesource.com/pub/scm/network/wireless/iwd
and grepped for keyctl and AF_ALG, but there are no matches.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
