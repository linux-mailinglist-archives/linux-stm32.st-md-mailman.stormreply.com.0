Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A977E1D82
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 10:52:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53494C6B460;
	Mon,  6 Nov 2023 09:52:28 +0000 (UTC)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E5D6C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 11:20:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1698664832; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Mm02NCKuU0Thm9w5RBoDg+s36tDjuHMXpViOFYEEnGCOpTftapCaakSlLKpu83Xxhr
 mYOzDqE5zt/r6082tAE92YVJu+eghIPrviwt2Mczeqg0rjlMYQMUgPBpsCPRBnvQ5RdN
 eAsFN/hm/zIT2sgSIvtro+2eC7tpGk6sKoYzLOgLYieeXb8B4xUQgzfRC0ggy86DuYy8
 Z3GYxkbTbxtJfCR9Oz5gS3E9u7CF5PDSYRyofJEA6fN1uBl8GF/MYVQs7jexFlAEL8nm
 C84QZiWoyS5dEiJ6neRHjBWsnqa4/U/PzV7S8x5oARyubab2bh+Y5gBlcnR9z7wjEZ0b
 Tq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1698664832;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=RKJ07SNymskf0t+1fsv83/i0WSlIOVRZ9TdRpl1TvZY=;
 b=DCDF92/V2tLnAz5TorpoD/eng/Xwnfh9tsDU6lRbY4WwY+qEyeK6R/Vl3/tcYpCBzg
 Z1trDiD+w87dglsoHHnPhp9lCU+qp3DdCUIk+77solrc1T+y+F45d6/2atj4iK+QGjvg
 CMT/+nBW1IdSqV3NLKqf3hwZaiw1Fx1LA8HUzlJ0Vx63wEfu9ryFnQxfYGVdiqBBWOBa
 QkWHVq5k2KOBppxTbW6lRw7hHPYUjUHqhhE50q6eMaZhS5p7HjvmegwULt6Km/U+pBT1
 OyWiBs18L8mFXogn2ZFtao9tuwaKQPiPRJYuiTpy+vxOtX7Sa0Crb0QbT5zJMMjYicrh
 hGLQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1698664832;
 s=strato-dkim-0002; d=chronox.de;
 h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=RKJ07SNymskf0t+1fsv83/i0WSlIOVRZ9TdRpl1TvZY=;
 b=KV5VGEJLUr5+xTYo2wk/3Cm84I6My52WBVF+CFrwwc+4GfCSxpB1zpx2vxUn66Y2Cr
 MbJxG44lVzELkNCP/j4oVyLYBhDn4tJH+rsQBpgZNc5ivaKBN4nyRHx9DGWtZBOzUfHS
 XhJ0AZ8ZAgHu05cTqKOs8WIQnBciBJXe7704bNkiA5G9CQFHcl1WrE9IRlaSV7enO+X4
 3q7kSnBhIHV7SyTqGjf98zSI8iUTi6dNd00xckeVUflVAnh0eFxSlabb7n+15GE4MfGH
 V2LcT6kHj6IxYXm5pLnp2nMtvPt4EKcgeF4wYtA4wZEuqUdLQv4mMZa7oZegUBySr/BZ
 qfBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1698664832;
 s=strato-dkim-0003; d=chronox.de;
 h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=RKJ07SNymskf0t+1fsv83/i0WSlIOVRZ9TdRpl1TvZY=;
 b=GCLMbwHESCbjm7mtI/4BeY6JHr+BAU7Zs5PZ8pHhZTIFJyifQg79xCgjuev7V/Ry57
 2N1UyTl2wFbxUL+UfOBg==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9yWsdNeEDyFXR1lg3JD8="
Received: from tauon.chronox.de by smtp.strato.de (RZmta 49.9.1 AUTH)
 with ESMTPSA id 6b1cadz9UBKSU4Q
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 30 Oct 2023 12:20:28 +0100 (CET)
From: Stephan Mueller <smueller@chronox.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Mon, 30 Oct 2023 12:20:27 +0100
Message-ID: <5821221.9qqs2JS0CK@tauon.chronox.de>
In-Reply-To: <20231029204823.663930-4-dimitri.ledkov@canonical.com>
References: <20231029204823.663930-1-dimitri.ledkov@canonical.com>
 <20231029204823.663930-4-dimitri.ledkov@canonical.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Nov 2023 09:52:27 +0000
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 simo@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 4/4] crypto: drbg - Remove SHA1 from drbg
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

Am Sonntag, 29. Oktober 2023, 21:48:23 CET schrieb Dimitri John Ledkov:

Hi Dimitri,

> SP800-90C 3rd draft states that SHA-1 will be removed from all
> specifications, including drbg by end of 2030. Given kernels built
> today will be operating past that date, start complying with upcoming
> requirements.
> 
> No functional change, as SHA-256 / SHA-512 based DRBG have always been
> the preferred ones.

Reviewed-by: Stephan Mueller <smueller@chronox.de>

Ciao
Stephan


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
