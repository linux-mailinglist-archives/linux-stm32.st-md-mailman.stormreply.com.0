Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAA97C6685
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 09:38:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B086C6B44B;
	Thu, 12 Oct 2023 07:38:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12231C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 07:38:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C6B2661CDC;
 Thu, 12 Oct 2023 07:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4782C433C8;
 Thu, 12 Oct 2023 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697096332;
 bh=CsaiPXVs+zUR0bb0Jyu/YD3MxKJLDO6cfeyazYsZ2B4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=fPsyBEgSlESduxNrNv0pBjPfQ+6YybZF1KLufACbji07ZLl+Xz7OyoRqcntdy8Nex
 wqxAjfAP0eyrqH1gJ3PH9Qf52dAXSRJpKkWvr932ULtx/qZXxNiEUXe6BxtKsoy5aO
 9S/6I1bBuy7PyraInI/6g07RllstI4dYxekaEWuEYz0CTvplFNwTwYbTB61dIRrz3Q
 m9d9yOmDhXOF1MZpUzldJFLwoVbA0PfUvhsVJB4P+ADUUgwo2zBJhaiE2lEI4yQv3p
 FX/9lWUJ8jVC7FqNN2TkbhzEtAeisxEJWa+581o0tS2PVeAzCWVo6VuiGB+QF5gucl
 KauvbFYfnjqTA==
Message-ID: <a60be34c2b196782fce6c9b622cf8d33.mripard@kernel.org>
Date: Thu, 12 Oct 2023 07:38:49 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
In-Reply-To: <d9a78453-9b40-48c1-830e-00751ba3ecb8@kili.mountain>
References: <d9a78453-9b40-48c1-830e-00751ba3ecb8@kili.mountain>
Cc: Stephen
 Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 kernel-janitors@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-clk@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 10 Oct 2023 16:35:28 +0300, Dan Carpenter wrote:
> The divider_ro_round_rate() function could potentially return -EINVAL on
> error but the error handling doesn't work because "rate" is unsigned.
> It should be a type long.
> 
> Fixes: 06ed0fc0fbac ("clk: stm32: composite: Switch to determine_rate")
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
