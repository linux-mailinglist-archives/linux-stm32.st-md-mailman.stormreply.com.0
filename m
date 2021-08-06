Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8862B3E2076
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Aug 2021 03:10:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D83B0C597BC;
	Fri,  6 Aug 2021 01:10:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B13A7C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Aug 2021 01:10:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8D9161186;
 Fri,  6 Aug 2021 01:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628212227;
 bh=z2LbFuvGZ9oYZoczOAsC1gtln5yj7whAdrI8YVYi4+A=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YJcnG6Iy7n5jROmDuxFiUyasnuF7HQfKIGLo966QXl5a8/k8h74Z0Mn3eyqYM+Jjb
 kdiyVwcXSmmG6ycFGZMPZs0VgH92QovxdhaflWzLZI+j/xy/aYXoqnwWcowYHDEBfE
 Ft31AoL9u40VqDNn6FYuwVr9Low05VH0abyhuhDLGnujeikQpU+NQ/RZryhH2ZTppB
 esbCz7qPhPpqWzN2/IcE3NvxMiWnylINKBbJ8Ph2W43vnn67q8i+kyk97yBLDRnEki
 32w1AyQHcm9fLRpP5WMJUdsUmn8TL/w1MK25i5yW8UPappQM8irzkvRT3gB61AIvsU
 lJ8aMyKE8tBww==
MIME-Version: 1.0
In-Reply-To: <20210702225145.2643303-5-martin.blumenstingl@googlemail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com>
 <20210702225145.2643303-5-martin.blumenstingl@googlemail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org
Date: Thu, 05 Aug 2021 18:10:26 -0700
Message-ID: <162821222682.19113.14294600581719716007@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 4/6] clk: stm32f4: Switch to
	clk_divider.determine_rate
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

Quoting Martin Blumenstingl (2021-07-02 15:51:43)
> .determine_rate is meant to replace .round_rate in CCF in the future.
> Switch over to .determine_rate now that clk_divider_ops has gained
> support for that.
> 
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
