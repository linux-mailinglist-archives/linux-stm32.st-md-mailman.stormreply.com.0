Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 776FBAF752C
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 15:12:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62A59C3F949;
	Thu,  3 Jul 2025 13:12:46 +0000 (UTC)
Received: from xry111.site (xry111.site [89.208.246.23])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C236C3F93E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
 s=default; t=1751534345;
 bh=i74P6ykJLEnyrC03GPEsGhBSSNdT0vtNxbdEH9wyPsQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=M1lb0ty/nrTkoFvVTLVpN9Z1zmKJhYqjAhIXe2H7hR+YWLKab2f59h5IsYIRJpQdE
 ermBlNyrdt65pKqiFV3MiEfD1a/UdC7A/xf//0A+5QPMnhE7O/F7OirkLCMZ8TKoYb
 ugJVt4EpJBBciYzjB8bmUA1D/WXUJPsbQSWt1pA0=
Received: from [IPv6:110::25] (unknown [IPv6:2409:874d:200:3037::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
 (Client did not present a certificate)
 (Authenticated sender: xry111@xry111.site)
 by xry111.site (Postfix) with ESMTPSA id ED6D265FF1;
 Thu,  3 Jul 2025 05:18:54 -0400 (EDT)
Message-ID: <a48666fb2254521197a7f13948feefd38947e944.camel@xry111.site>
From: Xi Ruoyao <xry111@xry111.site>
To: Gu Bowen <gubowen5@huawei.com>, Herbert Xu
 <herbert@gondor.apana.org.au>,  David Howells <dhowells@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Lukas Wunner <lukas@wunner.de>,  Ignat
 Korchagin <ignat@cloudflare.com>, "David S . Miller" <davem@davemloft.net>,
 Jarkko Sakkinen	 <jarkko@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Eric Biggers <ebiggers@kernel.org>, "Jason
 A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Tianjia
 Zhang	 <tianjia.zhang@linux.alibaba.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
Date: Thu, 03 Jul 2025 17:18:49 +0800
In-Reply-To: <20250630133934.766646-2-gubowen5@huawei.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
 <20250630133934.766646-2-gubowen5@huawei.com>
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Jul 2025 13:12:45 +0000
Cc: linux-kernel@vger.kernel.org, Lu Jialin <lujialin4@huawei.com>,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 GONG Ruiqi <gongruiqi1@huawei.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 1/4] Revert "Revert "lib/mpi: Extend
 the MPI library""
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

On Mon, 2025-06-30 at 21:39 +0800, Gu Bowen wrote:
> This reverts commit fca5cb4dd2b4a9423cb6d112cc71c33899955a1f.
> 
> Reintroduce the mpi library based on libgcrypt to support sm2.

If you use a newer version of Git, the subject would be 'Reapply
"lib/mpi: Extend the MPI library"' and IMO it would be better.

-- 
Xi Ruoyao <xry111@xry111.site>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
