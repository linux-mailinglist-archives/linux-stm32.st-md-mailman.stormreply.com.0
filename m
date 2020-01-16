Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E613DB40
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2020 14:16:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5F8AC36B0F;
	Thu, 16 Jan 2020 13:16:07 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E15F4C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 13:16:06 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id w5so7139993wmi.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 05:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2fUXK8SpQFeNUTHHjq17WKEa2HX3RjBEp1dlf1605d8=;
 b=QctqX+SABPym4k6LOX1hzx5gGwkEvbayU2AwkCvhTMCpEs7ix0z3Y9lzgR8BIzExGs
 7Nmlqo7vmRyMi5++i7LRdKtmyQT8h2AfO8p5VVGLeEuuRSByY4ji0ucCpYlyiAntiLhu
 VsZz2FGp/upKFVJQvg0CGbvNSY1KlWk+pFvE8a8aihQPntSsMDotWqDTQIiPgwfSrpeP
 kj7Hfcr35pFToHNz5/Ub5rPit4WdGxYOcZuxPMdDsVrPknOEcggUKzQu2umL1Fkw76g8
 oiToDbmSTMNxl31Lfusng0BIhaz9f+r7aGAksBjS7megI67hE+Gmn+5o41tNxzsfXU5V
 +X6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2fUXK8SpQFeNUTHHjq17WKEa2HX3RjBEp1dlf1605d8=;
 b=g11hIJHjxR8q8QWtKDMHZrGv0dUZXaE6Hals5OfrPyfF5SPWRKm3ir3NSHKHsugFUt
 2g5wGM5tP+fs5qfW14MnJkKSeiwAOYPT1XAr6suUbVPZcfCvsS1XSTxh9mFbiINss/QI
 fgq6GW9iQ+IuBWAIPchCshtErL+6e43KXhs08/Ymt+XLe7nR2Dc6bGAeFx5x955i2H6w
 afdAUG5sC9NcRDBDsauqTPgMjs+iL9sQYuOKT1BfExx/q7kiDez0FfUZcovRUFAuf1Az
 6wkg4fMqrn7Ek5b6WOd+/WqSaUcWRBELqLHKV9Lj+Uk9You4WvDgVmZTqsPpmzWtwLhi
 Kbww==
X-Gm-Message-State: APjAAAUB//8BgmUBA7MgFRzbMD5cJmCXJ1PkEH6p8osIFHu0R/o5EJvd
 CePSHq1dPMLGtaqaN4c/djM=
X-Google-Smtp-Source: APXvYqy+KZj1RE5Da5UJUk8yDqkXjQ9G20krvYN+N07Q3VSfPwOBls/Wn9bvazOAR6xdN4I5BNBNVg==
X-Received: by 2002:a05:600c:224d:: with SMTP id
 a13mr6139437wmm.70.1579180566478; 
 Thu, 16 Jan 2020 05:16:06 -0800 (PST)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id y139sm3415692wmd.24.2020.01.16.05.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:16:05 -0800 (PST)
Date: Thu, 16 Jan 2020 14:16:03 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Message-ID: <20200116131603.GA26487@Red>
References: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
 <VI1PR04MB444530675D82743E8AFFD8FE8C360@VI1PR04MB4445.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR04MB444530675D82743E8AFFD8FE8C360@VI1PR04MB4445.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 Horia Geanta <horia.geanta@nxp.com>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "wens@csie.org" <wens@csie.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH RFC 00/10] crypto: engine: permit to batch
	requests
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

On Thu, Jan 16, 2020 at 11:33:24AM +0000, Iuliana Prodan wrote:
> On 1/14/2020 3:59 PM, Corentin Labbe wrote:
> > Hello
> > 
> > The sun8i-ce hardware can work on multiple requests in one batch.
> > For this it use a task descriptor, and chain them.
> > For the moment, the driver does not use this mechanism and do requests
> > one at a time and issue an irq for each.
> > 
> > Using the chaning will permit to issue less interrupts, and increase
> > thoughput.
> > 
> > But the crypto/engine can enqueue lots of requests but can ran them only
> > one by one.
> > 
> > This serie introduce a way to batch requests in crypto/engine by
> > - setting a batch limit (1 by default)
> > - refactor the prepare/unprepare code to permit to have x requests
> >    prepared/unprepared at the same time.
> > 
> > For testing the serie, the selftest are not enough, since it issue
> > request one at a time.
> > I have used LUKS for testing it.
> > 
> > Please give me what you think about this serie, specially maintainers
> > which have hardware with the same kind of capability.
> > 
> Hi,
> 
> I'm working on CAAM, on adding support for crypto-engine.
> These modifications are not working on CAAM.
> They seem to be specific to requests that are linked. CAAM can work on 
> multiple request, at the same time, but they are processed independently.
> So, I believe the parallelization is a good idea, but the requests still 
> need to be independent.
> I'll follow up with comments on each patch.

Hello

Thanks for the review.
Yes my serie is for doing "linked" request.
For the CAAM, if you can do multiple request independently, why not having x crypto engine ? (like sun8i-ce/sun8i-ss/amlogic)

> 
> Also, IMO you should send the patches for crypto-engine improvements in 
> a separate series from the one for allwinner driver.

For this RFC serie, I tried to do real atomic patch, for let people see the whole process.

Regards
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
