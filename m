Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1643AACAC
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 08:46:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B352BC59780;
	Thu, 17 Jun 2021 06:46:14 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BFA8C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 06:46:13 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AAF3980488;
 Thu, 17 Jun 2021 08:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623912372;
 bh=3LNfs60VA3LWGoKvJHHA7RUoJIcB6us5WIZF6Y71+WE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iX/QAqFuWzws1E3uJHmDU8HiUsCiAZxrQizvt0BAf8wrzClAibk/h2Gtl4JLsau+R
 b0eG0v9xvyEWVNwgdKxDc6d23nFofOmx4n6UTX/LsPpm7c4ZyZ9nUqr2vXb/CBChFP
 PmPwgIZVWyLJFUJ9nPGY2fWX5b1SHLYxN9w2hSnykM+zIN42qoGrB/MOYAliN+MBOw
 Cz4AJsLTewLK5CtmYQNCmkPw/wFnYfpvUcJyOroNYtzdy5V4E7hX3OpOsbUwPkme1R
 NiOMXfVdUKLB3SxuIZmBZuZqcfUq1ID4CyCqzF57FdADP88lXqvz5pecOX47xXTdvl
 BD1ZEI8OPu2ng==
To: gabriel.fernandez@foss.st.com, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Etienne Carriere <etienne.carriere@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-12-gabriel.fernandez@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <14a81ad2-d646-30ca-46f0-d2078b09c4f2@denx.de>
Date: Thu, 17 Jun 2021 08:46:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617051814.12018-12-gabriel.fernandez@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 11/11] clk: stm32mp1: new
 compatible for secure RCC support
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

On 6/17/21 7:18 AM, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Platform STM32MP1 can be used in configuration where some clock
> resources cannot be accessed by Linux kernel when executing in non-secure
> state of the CPU(s).
> In such configuration, the RCC clock driver must not register clocks
> it cannot access.
> They are expected to be registered from another clock driver such
> as the SCMI clock driver.
> This change uses specific compatible string "st,stm32mp1-rcc-secure"
> to specify RCC clock driver configuration where RCC is secure.

Should this really be a new compatible string or rather a DT property ? 
I think the later, since this is the same clock IP, only operating in 
different "mode" , no ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
