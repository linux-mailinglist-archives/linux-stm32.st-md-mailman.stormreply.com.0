Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8BA3B8838
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 20:17:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85AB6C56630;
	Wed, 30 Jun 2021 18:17:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E48A7C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 18:17:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3035A61468;
 Wed, 30 Jun 2021 18:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625077044;
 bh=YkFK0nTuDgcatqh0Z4RxYBaOtpWEF4n6tHpf8q7du7c=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=bsJmwceCqUFBMuMwo5BQFTB6PZ2D4ORepBjkOxLXY9Jy8acl5/L0JqRr4t3Tg1ovA
 375NqldXnMa5w/CAsM6t4Krm6K5thrADg7SJkKzaRrrcd6wS3g0Cv1ouskxOkoENe5
 4pa82L+lM7+cCFnhFKgZrTmaa52Rx/KZDNjvEG05C8aNZgp00/ikU23Vxrkgq+oXdE
 M5EL3YN7lAz7idpKL45JPh9awJaVtZ6I+KhC7neAYWl20oiBOeHKOdT55FmjlASNh7
 oKx9Z1pXEZeTlQ6pvjl3bifxH73dCE8u7ADl2vH5gFFJS1oJtaVUSFsIIxD46hkA9z
 W/Em470lFB4hQ==
MIME-Version: 1.0
In-Reply-To: <20210630015824.2555840-1-wanghai38@huawei.com>
References: <20210630015824.2555840-1-wanghai38@huawei.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Wang Hai <wanghai38@huawei.com>, alexandre.torgue@foss.st.com,
 gabriel.fernandez@foss.st.com, mcoquelin.stm32@gmail.com,
 mturquette@baylibre.com
Date: Wed, 30 Jun 2021 11:17:22 -0700
Message-ID: <162507704293.3331010.4992617374982640116@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH -next] clk: stm32mp1: fix missing
	spin_lock_init()
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

Quoting Wang Hai (2021-06-29 18:58:23)
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
> 
> Fixes: c392df194a2d ("clk: stm32mp1: move RCC reset controller into RCC clock driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
