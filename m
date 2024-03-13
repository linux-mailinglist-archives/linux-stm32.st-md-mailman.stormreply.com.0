Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDBF87BCB2
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Mar 2024 13:23:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D6BFC6C83D;
	Thu, 14 Mar 2024 12:23:40 +0000 (UTC)
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEE4DC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 18:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yartys.no;
 s=protonmail2; t=1710355183; x=1710614383;
 bh=Yrv8K3dsh6oQe0fjpFm5hJusnOC8JMbr41ioJIneLpA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=KrKykjnW5eFDDULKUiFGV+s7Y+Nvz+Tnn1yTw8HC6fXQ/B7Rtcrn2a8Ufw+mPREHg
 tDi5RZEf/D4wxLWLBwp7V3gLFSq8tXkbySxgQr2KYOahuHzApZ9UDBdvCRux+zbUHp
 Qu4mZhaiGHYR51PP5aQqM7dbTt45b4iXu1UUYuHKZT/huLEF1M8T21JdBBw3ACqjJF
 ero40e4Ujk7NiLh/mTpB5ymvd1WFOyQxNb5h2wrc0e0PaNQJjhJQpRiObxFh3NSW0Q
 86BST8cig9RaTNJs4OkBmi5tzkM90F0goJTer1YWD75PRnS7+1uNfwcc+o9uybvspB
 5EAMNwiSk8PyQ==
Date: Wed, 13 Mar 2024 18:39:27 +0000
To: Johannes Berg <johannes@sipsolutions.net>
From: Michael Yartys <mail@yartys.no>
Message-ID: <NbWQKmrYDD20KKHeq9TMda2MJFE00-weepZGuSIRzO5BOgMlTbWBkDlNNweA2dhbvF8TK1F_cHbMxblLVNREZa1HZEFt9TVCkTB1jo_5ppc=@yartys.no>
In-Reply-To: <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
References: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
 <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
Feedback-ID: 77365699:user:proton
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 14 Mar 2024 12:23:39 +0000
Cc: linux-wireless@vger.kernel.org, herbert@gondor.apana.org.au,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Karel Balej <balejk@matfyz.cz>, dhowells@redhat.com, mcgrof@kernel.org,
 keyrings@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-modules@vger.kernel.org, iwd@lists.linux.dev, davem@davemloft.net,
 dimitri.ledkov@canonical.com, linux-crypto@vger.kernel.org
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

Hi

This came in via the iwd mailing list, and I would like to add some small a detail as I also experience this issue on my university eduroam network. I've verified that the certificate chain doesn't contain SHA-1 signed certificates, so the update breaks more than just SHA-1.

Michael




On Wednesday, March 13th, 2024 at 09:56, Johannes Berg <johannes@sipsolutions.net> wrote:

> 
> 
> Not sure why you're CC'ing the world, but I guess adding a few more
> doesn't hurt ...
> 
> On Wed, 2024-03-13 at 09:50 +0100, Karel Balej wrote:
> 
> > and I use iwd
> 
> 
> This is your problem, the wireless stack in the kernel doesn't use any
> kernel crypto code for 802.1X.
> 
> I suppose iwd wants to use the kernel infrastructure but has no
> fallbacks to other implementations.
> 
> johannes
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
