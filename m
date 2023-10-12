Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A5E7C7A94
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 01:47:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE932C6A613;
	Thu, 12 Oct 2023 23:47:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78332C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 23:47:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 37AF261F8F;
 Thu, 12 Oct 2023 23:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1C4C433C8;
 Thu, 12 Oct 2023 23:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697154451;
 bh=g0j0ntI7cDursByucgnzG9BJl82/ZPQ8pgpkva55nnE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=dK8W5ZmTFp+nRPaYMnqtSLj8r06kz2uUeV6PikgHxVbIdah6Kn6Bb8WNEMyUylTYZ
 Uk2ugUn8P3sbz0Lv2tZK8HV508ta0OnNSRN8KpXu4MHjrdvzQEeBNLaJIUZax3VzFW
 P7NkX8xDZn2tT/H03E+bhTHSS8YUpmmzJheYBfigCbRjHtbOCzQOx14pCXb5kxneiN
 1CIjSW1fib+3wFN+OI54384AqtxoUeowMXkcNxjMNc4ut+fgEheSjQWrmTpRcQjpe7
 n5KfSVpAWgKv49p9PdExdzMSmS+hAv7hJI2JO+Q6OmZ+07CAl7VdcEcqfemKF5XUbE
 anlVynjdKNAKA==
Message-ID: <8ec3d2c6458d6979d780936d3521cf1d.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <d9a78453-9b40-48c1-830e-00751ba3ecb8@kili.mountain>
References: <d9a78453-9b40-48c1-830e-00751ba3ecb8@kili.mountain>
From: Stephen Boyd <sboyd@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
Date: Thu, 12 Oct 2023 16:47:29 -0700
User-Agent: alot/0.10
Cc: Michael Turquette <mturquette@baylibre.com>,
 kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] clk: stm32: Fix a signedness issue in
	clk_stm32_composite_determine_rate()
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

Quoting Dan Carpenter (2023-10-10 06:35:28)
> The divider_ro_round_rate() function could potentially return -EINVAL on
> error but the error handling doesn't work because "rate" is unsigned.
> It should be a type long.
> 
> Fixes: 06ed0fc0fbac ("clk: stm32: composite: Switch to determine_rate")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Applied to clk-fixes
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
