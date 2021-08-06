Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B32E3E207A
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Aug 2021 03:10:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 410A4C597BC;
	Fri,  6 Aug 2021 01:10:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC1E6C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Aug 2021 01:10:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6473161176;
 Fri,  6 Aug 2021 01:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628212243;
 bh=9ddLVrEMbcuwWfjwyTUIp5+wk0404rhszEa1fNlCPCA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BokKoxbZwHwfnT1FjTY+QFhY2B/lSzPFFf8KfDT0XkkIFVcogOasJuOVP99xqq/7F
 oT7LU2nlAvbyq2QOtAbqtv6sbFt8mUTHGjO6m6//kBqrdsaWzffFfGh3g0zl4t91TY
 Jk0U0/BRLbiDf2t6xzpuB1b1gNDEGZs6At46OlB8ExF6spPR9v4DR+TxLp2nRt1AN/
 uSWXksH9y2/FgVcyiBkEYwYsWHD7nlkTHaMUD+0iG/EHkvLcNsaiRrDKF9qLGxmesx
 lReMKX3CoPVytgpN2vCm6s4HTat93ja7TpWRPTBBWbYW1pAktdvd1qE8BCyGvL0Lv7
 IOMy0nNzny81A==
MIME-Version: 1.0
In-Reply-To: <20210702225145.2643303-6-martin.blumenstingl@googlemail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com>
 <20210702225145.2643303-6-martin.blumenstingl@googlemail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org
Date: Thu, 05 Aug 2021 18:10:41 -0700
Message-ID: <162821224129.19113.5484324790744582709@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 5/6] clk: stm32h7: Switch to
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

Quoting Martin Blumenstingl (2021-07-02 15:51:44)
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
