Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 287782291D0
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jul 2020 09:12:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC800C36B29;
	Wed, 22 Jul 2020 07:12:13 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7C01C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jul 2020 07:12:11 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1jy8u9-0002Pa-FR; Wed, 22 Jul 2020 17:11:06 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Wed, 22 Jul 2020 17:11:05 +1000
Date: Wed, 22 Jul 2020 17:11:05 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20200722071105.GA27451@gondor.apana.org.au>
References: <20200719094948.57487-1-grandmaster@al2klimov.de>
 <43c11c7a-269e-cc41-6934-0d2e0dec3226@st.com>
 <219075a0-d7cf-a699-21d7-fabc6f077f95@al2klimov.de>
 <55c95208-de0f-b2d3-c20c-d19f3ce34e2a@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55c95208-de0f-b2d3-c20c-d19f3ce34e2a@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk, davem@davemloft.net,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH for v5.9] ARM: STM32: Replace HTTP links
	with HTTPS ones
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

On Wed, Jul 22, 2020 at 09:06:29AM +0200, Alexandre Torgue wrote:
>
> hum, I was not aware that I could take "crypto" patches. But anyway I think,
> the clean way (to avoid merge  issue later) is that I take mach-stm32 patch
> and Herbert the crypto one. Except if Herbert doesn't agree can you please
> split ?

Yes I think splitting it up would be better in case there are
other patches down the track that may cause conflicts.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
