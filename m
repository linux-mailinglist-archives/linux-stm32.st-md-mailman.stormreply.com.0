Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D9CF6B9A
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 06:05:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A613BC8F26A;
	Tue,  6 Jan 2026 05:05:33 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D039EC5A4CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 05:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
 from:content-type:reply-to; bh=fFZdK8UUvenzvPm6N9koDU/fxnR0ekW5TI24xZDY6kc=; 
 b=YCBTmcleUU2N0rXwpVT4Xw527tlZr0N7PHGhoRYbFxi0V1yz0MspEiuaUgluwOHJi7UgUWJeaCo
 aI+V2pDwpQLlu76KzkCMgTJfa8l73o4xERcZiC67fI6SQ38NHKqBernGbeIoTm6iaacIGzGhOr5GY
 a7chkrDVBcwvZvi4K0hkD8kW9kADwG6VB2ySGSO7s2ZMuzQq0jjPbzgahByLEVKD7zpOn7S8o+0U3
 CubE9wpUlCoN7q0wO2G+XJMN/qiJZ8rSECQv2HK4BVh6Uiw6J4b5giymeUTqeEWc7scenPFiItIlz
 iOppOn/L0OnchT/HUMcryCLJmTDYf6itFTjw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1vczEy-00EaCi-33; Tue, 06 Jan 2026 13:04:22 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 06 Jan 2026 13:04:20 +0800
Date: Tue, 6 Jan 2026 13:04:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jens Wiklander <jens.wiklander@linaro.org>
Message-ID: <aVyX1GXxdJXv438W@gondor.apana.org.au>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
 <20251218135332f323fa91@mail.local>
 <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
 <CAHUa44HqRbCJTXsrTCm0G5iwtkQtq+Si=yOspCjpAn-N2uVSVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHUa44HqRbCJTXsrTCm0G5iwtkQtq+Si=yOspCjpAn-N2uVSVg@mail.gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-efi@vger.kernel.org, linux-doc@vger.kernel.org,
 Jan Kiszka <jan.kiszka@siemens.com>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-mips@vger.kernel.org, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>,
 Ard Biesheuvel <ardb@kernel.org>, linux-rtc@vger.kernel.org,
 Sumit Garg <sumit.garg@oss.qualcomm.com>, Paul Moore <paul@paul-moore.com>,
 Jonathan Corbet <corbet@lwn.net>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 James Morris <jmorris@namei.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jason Gunthorpe <jgg@ziepe.ca>, Cristian Marussi <cristian.marussi@arm.com>,
 arm-scmi@vger.kernel.org,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, op-tee@lists.trustedfirmware.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Sumit Garg <sumit.garg@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-arm-kernel@lists.infradead.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-integrity@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 00/17] tee: Use bus callbacks instead
 of driver callbacks
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

On Mon, Jan 05, 2026 at 10:16:09AM +0100, Jens Wiklander wrote:
>
> Herbert, you seem happy with the following patches
> - hwrng: optee - Make use of module_tee_client_driver()
> - hwrng: optee - Make use of tee bus methods
> OK if I take them via my tree, or would you rather take them yourself?

Feel free to take them through your tree.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
