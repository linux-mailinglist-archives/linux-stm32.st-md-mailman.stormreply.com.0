Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 879741DE88B
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2020 16:13:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB1FEC36B25;
	Fri, 22 May 2020 14:13:44 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF8C9C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 14:13:42 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1jc8QD-0008Fn-G8; Sat, 23 May 2020 00:13:14 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 23 May 2020 00:13:13 +1000
Date: Sat, 23 May 2020 00:13:13 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nicolas Toromanoff <nicolas.toromanoff@st.com>
Message-ID: <20200522141313.GA859@gondor.apana.org.au>
References: <20200512141113.18972-1-nicolas.toromanoff@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512141113.18972-1-nicolas.toromanoff@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] STM32 CRC update
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

On Tue, May 12, 2020 at 04:11:08PM +0200, Nicolas Toromanoff wrote:
> This set of patches update the STM32 CRC driver.
> It contains bug fix.
> 
> First fixes issue if we enable STM32 CRC32 hardware accelerator with
> ext4 (with metadata-chksum enable) and other fs that use same direct
> access to update crc32 API without previous init.
> Second fixes some issues raise by the extra self-test.
> Third fixes wrong hw usage if there is multiple IP on the SOC.
> Forth fixes "sleep while atomic" in tcrypt test, and some other places
> (ext4)
> Last fixes concurrent accesses. As state is saved in the hardware cell
> and not in stack as other CRC32 drivers, we need to create atomic
> section to protect concurrent CRC32 calculus.
> 
> This patch series applies to cryptodev/master.
> 
> Nicolas Toromanoff (5):
>   crypto: stm32/crc: fix ext4 chksum BUG_ON()
>   crypto: stm32/crc: fix run-time self test issue.
>   crypto: stm32/crc: fix multi-instance
>   crypto: stm32/crc: don't sleep in runtime pm
>   crypto: stm32/crc: protect from concurrent accesses
> 
>  drivers/crypto/stm32/stm32-crc32.c | 230 ++++++++++++++++++++---------
>  1 file changed, 161 insertions(+), 69 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
