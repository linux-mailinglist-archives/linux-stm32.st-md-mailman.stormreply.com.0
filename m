Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDF78194FC
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Dec 2023 01:11:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E428C6B477;
	Wed, 20 Dec 2023 00:11:46 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D84CAC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Dec 2023 00:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703031104;
 bh=ULx5xd+z/eIZKpsC2ELI2qU38ouHqgBhMuuOX3WZpCs=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=OfG2Jlwpg/d7fgTNVvQ8VqO4fAYQ6lXx6bTNLWF/y6+fxHdzlVVNwmgZCGqhKuENn
 pRGFekFWsrigklcjZ3CoeuuxWxB75uNYNDBetgEJOYWOXMSphloTSkn2q2rjimOM7X
 8VF8S4VcL12suO/cj5Nd/UfwzDgbd44I2X3BLBjhz0IYNFE5vCJmIfizk0ByVcRpME
 8WA4Luqw579mcDJcu12/fp1OLT+4agWcVFF/6lCDsa0afP/yN6lglovEeMfHSr7L2x
 x68lhBC7Pw1zLAdYutPytTnh6naTLokB0a3FdnopJYg50AnCHd1Q2MiRWGtKkgmnvZ
 iP3OsVqipc9Lg==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 559AD378000B;
 Wed, 20 Dec 2023 00:11:43 +0000 (UTC)
Message-ID: <4992a407-c59f-4d1c-a058-9a6679606103@collabora.com>
Date: Wed, 20 Dec 2023 02:11:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Conor Dooley <conor@kernel.org>
References: <20231219231040.2459358-1-cristian.ciocaltea@collabora.com>
 <20231219-green-footwear-e81d37f9c63c@spud>
 <25f36378-a998-4a48-b348-1ab1df6c803e@collabora.com>
In-Reply-To: <25f36378-a998-4a48-b348-1ab1df6c803e@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/1] StarFive DWMAC support for JH7100
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

On 12/20/23 01:58, Cristian Ciocaltea wrote:
> On 12/20/23 01:48, Conor Dooley wrote:
>> On Wed, Dec 20, 2023 at 01:10:38AM +0200, Cristian Ciocaltea wrote:
>>> This is just a subset of the initial patch series [1] adding networking
>>> support for StarFive JH7100 SoC.
>>>
>>> [1]: https://lore.kernel.org/lkml/20231218214451.2345691-1-cristian.ciocaltea@collabora.com/
>>
>> You need to send the binding patch alongside the driver, unless that has
>> been applied already.

You are right, the binding should stay with the driver as it provides
the top-level compatibles.  I was wrongly thinking on the base
snps,dwmac only.

> Yeah, I wasn't sure about that, that's why I initially asked in [1] for
> a confirmation regarding the split.  I chose to keep the binding in the
> same set with the dts patches because the driver is just a glue layer
> and doesn't really depend on bindings changes.
> 
> Should I still provide it here?  I was about to submit the remaining
> patch set, so it would be great if we could clarify this beforehand.
> 
> Thanks for noticing the potential issue,
> Cristian
> 
> [1]:
> https://lore.kernel.org/lkml/0451e5a9-0cfb-42a5-b74b-2012e2c0d326@collabora.com/
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
