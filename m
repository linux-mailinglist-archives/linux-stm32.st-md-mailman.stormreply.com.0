Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CC887BCA8
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Mar 2024 13:22:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A8B3C6B476;
	Thu, 14 Mar 2024 12:22:46 +0000 (UTC)
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [96.44.175.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A80EEC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Mar 2024 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1710418963;
 bh=uF11DoSFt961i+nkF6vLB5AG08D98tmA/0JbyoEeduA=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=UvBUPVuafM8nwhbmf+1Hg6nBV1/IyeoZtHbq1z8RHiZHxhwNuxkEsyH4HDtoxhgrg
 Y9nheLFZYYlBQlrR83z/myUdmiIr3pC+Iqvt9YLvosJx1bkdYh/ehBZGXqQJNwRrBD
 GlY+t+sdgsvvgIVhMOt0QDcmxgiDicffdr3iRrK8=
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 96A7312861A8;
 Thu, 14 Mar 2024 08:22:43 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id GuyOpsDknp7T; Thu, 14 Mar 2024 08:22:43 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1710418963;
 bh=uF11DoSFt961i+nkF6vLB5AG08D98tmA/0JbyoEeduA=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=UvBUPVuafM8nwhbmf+1Hg6nBV1/IyeoZtHbq1z8RHiZHxhwNuxkEsyH4HDtoxhgrg
 Y9nheLFZYYlBQlrR83z/myUdmiIr3pC+Iqvt9YLvosJx1bkdYh/ehBZGXqQJNwRrBD
 GlY+t+sdgsvvgIVhMOt0QDcmxgiDicffdr3iRrK8=
Received: from lingrow.int.hansenpartnership.com (unknown
 [IPv6:2601:5c4:4302:c21::a774])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9F5BE12860BE;
 Thu, 14 Mar 2024 08:22:41 -0400 (EDT)
Message-ID: <7133628a2f45ad63e90c481387ed5b44906df54f.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: James Prestwood <prestwoj@gmail.com>, Eric Biggers
 <ebiggers@kernel.org>,  Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 14 Mar 2024 08:22:38 -0400
In-Reply-To: <a4d24b2c-7dbf-4354-9514-f8a253aac14b@gmail.com>
References: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
 <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
 <f2dcbe55-0f0e-4173-8e21-f899c6fc802a@gmail.com>
 <20240313194423.GA1111@sol.localdomain>
 <b838e729-dc30-4e18-b928-c34c16b08606@gmail.com>
 <20240313202223.GB1111@sol.localdomain>
 <db86cba4-0e61-441d-8e66-405a13b61a3c@gmail.com>
 <20240313221043.GC1111@sol.localdomain>
 <f0492c92-1015-48e3-bfce-598c7a4843d1@quicinc.com>
 <20240313230611.GD1111@sol.localdomain>
 <a4d24b2c-7dbf-4354-9514-f8a253aac14b@gmail.com>
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
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

On Thu, 2024-03-14 at 04:52 -0700, James Prestwood wrote:
> I'm also not entirely sure why this stuff continues to be removed
> from the kernel. First MD4, then it got reverted, then this (now
> reverted, thanks). Both cases there was not clear justification of
> why it was  being removed.

I think this is some misunderstanding of the NIST and FIPS requirements
with regards to hashes, ciphers and bits of security.  The bottom line
is that neither NIST nor FIPS requires the removal of the sha1
algorithm at all.  Both of them still support it for HMAC (for now). 
In addition, the FIPS requirement is only that you not *issue* sha1
hashed signatures.  FIPS still allows you to verify legacy signatures
with sha1 as the signing hash (for backwards compatibility reasons). 
Enterprises with no legacy and no HMAC requirements *may* remove the
hash, but it's not mandated.

So *removing* sha1 from the certificate code was the wrong thing to do.
We should have configurably prevented using sha1 as the algorithm for
new signatures but kept it for signature verification.

Can we please get this sorted out before 2025, because next up is the
FIPS requirement to move to at least 128 bits of security which will
see RSA2048 deprecated in a similar way: We should refuse to issue
RSA2048 signatures, but will still be allowed to verify them for legacy
reasons.

James



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
