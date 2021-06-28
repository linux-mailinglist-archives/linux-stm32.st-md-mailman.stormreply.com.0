Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 050803B56AA
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 03:35:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C11FCC57B7D;
	Mon, 28 Jun 2021 01:35:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 045E6C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 01:35:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81AA96144B;
 Mon, 28 Jun 2021 01:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624844100;
 bh=+cKKsMMwmhLDjpHtJw5ie1boGZcj5kQGXXwkCWUBXAw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BSm5MJSmWHF8/cQB0FEFa3iTckNPuUD5vI52FZ8Sk0DwSDIeqn7moONS/ghVpiDSb
 74ChZXwGk7szCozh7SU0sQQ40+DVHUun/iGNXSRkKwnXnc4McXeYXK5jCrNd4KLJfz
 I5sT6ARZ5pqdqBZyVjmT8Wm2EaFYBGFYujyleRpnrpcOH+mKeFrXRzByZ3o36CpbOQ
 O49TSAp1KybiikNOLE4sWIoiJBuppujcSr1SmEc2a0OxKuDGM+y4Q3MLLtAtMHlXRE
 wXx1j6no2jEk+edwlvRZRKDRyO6CGHkKZcNH2yLLxvLykU+fzBjoxEPEfcUHPujRSc
 v9+ZUtI2P47UA==
MIME-Version: 1.0
In-Reply-To: <20210617051814.12018-3-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-3-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 marex@denx.de
Date: Sun, 27 Jun 2021 18:34:59 -0700
Message-ID: <162484409943.3259633.13672186056150870486@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 02/11] clk: stm32mp1: merge
	'ck_hse_rtc' and 'ck_rtc' into one clock
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

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:05)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> 'ck_rtc' has multiple clocks as input (ck_hsi, ck_lsi, and ck_hse).
> A divider is available only on the specific rtc input for ck_hse.
> This Merge will facilitate to have a more coherent clock tree
> in no trusted / trusted world.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
