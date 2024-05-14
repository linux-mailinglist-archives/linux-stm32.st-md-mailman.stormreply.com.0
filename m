Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EFF8C58CB
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 17:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 202DBC6B476;
	Tue, 14 May 2024 15:33:58 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDDBEC5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 15:33:50 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B2F0088280;
 Tue, 14 May 2024 17:33:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715700830;
 bh=eaQhgXWHbWMqf6I8rAKPNOuRRYsSQhfgPu8SXwLtL80=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ik0uf6Gte814yE7g5bKytAreIqV9wvHq7HCCxR7M6yyMhQ6NYTTxzn0YAF+lvNYsW
 kPixg5xsaLs3uWHxWscWLbQ607cOgzG022nrShmYegVXZ9It1xXeuslG9SbR0MyDbe
 Xcy964qLCku+tpgg8qMZMW36IOqsUjt5SsJgAR63uPqW3ieIbKvHh26mflRKZqZ6mR
 fgmlw5v61zHSOTYjE0hMrfJBFiooNFYx1ErSOfq/mwTdF6LVyqNiXHnRCkxQSVI5GJ
 xVC+TbCRAvoaqH7fYyjTrQfBKh6Ng8KSeOIKCTtxOgdJ/Y/cUSuN5RsohKqtu6JrIR
 f/OQTkVU22kVg==
Message-ID: <cc6f98eb-f6b2-4a34-a8ed-c0f759fa4c79@denx.de>
Date: Tue, 14 May 2024 16:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 linux-crypto@vger.kernel.org
References: <20240513220349.183568-1-marex@denx.de>
 <b2d0dfcb-37d6-4375-a4ad-ca96a5339840@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b2d0dfcb-37d6-4375-a4ad-ca96a5339840@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] [RFC] clk: stm32mp1: Keep RNG1 clock
	always running
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 5/14/24 10:10 AM, Gatien CHEVALLIER wrote:
> Hi Marek,

Hi,

> Strange indeed.

Yes.

> A potential reason that comes to my mind would be that something tries 
> to get a random number after the driver suspended and fails to do so.

Possibly.

> Else it might just be a bad clock balance.

I don't think so, this would be reported by the kernel and it would show 
up in /sys/kernel/debug/clk/clk_summary as incrementing use count. It 
would also not happen in a non-deterministic manner like this happens 
here, the hang doesn't always happen after well defined suspend/resume 
cycle count.

> Can you describe the software ecosystem that you're running please?
> (SCMI/no SCMI)?

STM32MP157C DHCOM PDK2 with mainline U-Boot 2024.07-rc2 , no SCMI.

> Do you have the 3 fixes of stm32_rng.c that you've sent recently in your
> software when testing?

Yes, but this happens even without them.

> What if you add a trace in a random generation function in random.c?

Do you have a function name or line number for me ?

> After this, I'll try to reproduce the issue.

If you have a minute to test it on some ST MP15 board, that would be 
real nice. Thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
