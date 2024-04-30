Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D46F8B66BF
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2024 02:08:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D23FC71283;
	Tue, 30 Apr 2024 00:08:01 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B835C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2024 00:07:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EFED3CE09B8;
 Tue, 30 Apr 2024 00:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B9BC113CD;
 Tue, 30 Apr 2024 00:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714435668;
 bh=vhMJowDwRuHTlntrjfGcVCQMNqbpSZQLuzucFeDjBg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YCQ7Y/lGUacL2IZijCKBlGObESxVjjzsNASBP6BpxH7vYi0yR/wJ2unwlXZKOgThD
 Bq45bgnTPaVF7espT+Nhd5rEHV2F1W1XQ9W3pUqNK7HsrhdCigz5URD9um1NcrO07A
 9Rru4vTA2LWW2s0BlH+12gPtJCa4vWrNjg//+P5CooPJo1vEZWZRaw561F6OuM5n9B
 HptYENweRlTg8pMcX2pRffTkhIH4rQCk7KUu4bLw5KlYtCMK4LKva2NYtjvccX2h9y
 bCa2bYiIjdF3covsdemMsir4FU94t25zzA82/eE7zzn5O+wmQGg1yi3ETGyQAfGXFt
 MPE8NlBvInCdA==
Date: Tue, 30 Apr 2024 02:07:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <cscisecgo547dngzcpmcvertywekxtctyxv6hwhnmi5dq4azh2@4lpq6a4qga3s>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/15] i2c: use 'time_left' with wait_for_*
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

Hi Wolfram,

On Sat, Apr 27, 2024 at 10:35:52PM +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_*() causing patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> This is the I2C part of a tree-wide series. The rest of the patches can
> be found here (slightly WIP):
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left
> 
> Because these patches are generated, they need manual audit. So, I will
> send them step by step. This is part 1 and also a call for opinions if
> this is a desirable change. But at least in the I2C realm, I really want
> to have it proper.
> 
> Build bot is happy with these patches and I also compile tested them
> (except two). No functional changes intended.

It all looks good, I will give people a few days more for reviews
and comments and then I'll take it in.

Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
