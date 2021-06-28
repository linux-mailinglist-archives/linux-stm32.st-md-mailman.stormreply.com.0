Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D593B56A4
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 03:31:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 609C2C5662F;
	Mon, 28 Jun 2021 01:31:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CAE4C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 01:31:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1661D61423;
 Mon, 28 Jun 2021 01:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624843863;
 bh=5usTtx7z5SSezj6nechjRCoAkmrlWqcY2pLxgoqGg1Q=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Gvjo8hsY2wTrZhfdpsi42S2WEaJEPDc4u5mZa+w9UIuvrdje0zY3QiCmkGBgVYoEN
 SHLnWfiLtAmUbrx18aejE+slJ5iHVPF45Q1BDnPzo5MzhU+XQeZ6hxME7U6ABvTyrd
 as2zLTpalPo/SGVOQOWdTgmYjVYJjNE4JXBlqfCiVWfZUX9jE/njxIHYr6SCEWjSIm
 cWmBPEeFMatnczko9hOmZawow2Uh+/teoKLqB8lWEjwO/CZFZP1BBAnjh2hnVcV392
 ZYCUjIfvZjvG/CqnesEDwZmpXyY0+yAQ3HYOSVP8xJ96eg919do4RMtdTCHNPjqvfg
 YvRIzEFQUEzdw==
MIME-Version: 1.0
In-Reply-To: <e7952251-b3bb-5042-65bd-7ab7ef37ac93@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-12-gabriel.fernandez@foss.st.com>
 <14a81ad2-d646-30ca-46f0-d2078b09c4f2@denx.de>
 <e7952251-b3bb-5042-65bd-7ab7ef37ac93@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>, Marek Vasut <marex@denx.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 gabriel.fernandez@foss.st.com <gabriel.fernandez@foss.st.com>
Date: Sun, 27 Jun 2021 18:31:01 -0700
Message-ID: <162484386172.3259633.7365659222302211532@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Quoting gabriel.fernandez@foss.st.com (2021-06-18 06:24:36)
> Yes we could have considered it as a feature but we think it's better to 
> manage it as a layer of our driver via a compatible.

Please don't top post

> 
> On 6/17/21 8:46 AM, Marek Vasut wrote:
> > On 6/17/21 7:18 AM, gabriel.fernandez@foss.st.com wrote:
> >> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> >>
> >> Platform STM32MP1 can be used in configuration where some clock
> >> resources cannot be accessed by Linux kernel when executing in non-secure
> >> state of the CPU(s).
> >> In such configuration, the RCC clock driver must not register clocks
> >> it cannot access.
> >> They are expected to be registered from another clock driver such
> >> as the SCMI clock driver.
> >> This change uses specific compatible string "st,stm32mp1-rcc-secure"
> >> to specify RCC clock driver configuration where RCC is secure.
> > 
> > Should this really be a new compatible string or rather a DT property ? 
> > I think the later, since this is the same clock IP, only operating in 
> > different "mode" , no ?

I saw there was a bit of discussion on a previous round of this patch
and the conclusion was to use a different compatible string. Seems fine.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
