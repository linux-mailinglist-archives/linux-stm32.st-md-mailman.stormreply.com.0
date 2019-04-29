Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD9E9EB
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 20:15:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C82B4C35E03
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 18:15:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB678C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 18:15:25 +0000 (UTC)
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 342122075E;
 Mon, 29 Apr 2019 18:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556561724;
 bh=fx4OITbER8lfWRFsjpKYjxmfmM4FFQhcrIIX7592miI=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=hBkCppFmJ6UYtguHRR5FERpqeoSf2uQwVsMZ3cArS4hrgDCvnGEo7gmPYlowPOfVb
 quvs3JIhvpsjrbJpAU0yu4UAxQ2Ru3YE66nAaLGgP8bHIudOJNmemEVx5ZF4aSTejH
 mQwBWkqB2SX2rwUhnemVjspcamqOIs9TjpSxXOTM=
MIME-Version: 1.0
In-Reply-To: <1556531652-27740-1-git-send-email-gerald.baeza@st.com>
References: <1556531652-27740-1-git-send-email-gerald.baeza@st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Gerald BAEZA <gerald.baeza@st.com>
Message-ID: <155656172338.168659.837239195206058428@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Mon, 29 Apr 2019 11:15:23 -0700
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Gerald BAEZA <gerald.baeza@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] clk: stm32mp1: Add ddrperfm clock
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

Quoting Gerald BAEZA (2019-04-29 02:54:44)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> Add ddrperfm clock for DDR Performance Monitor driver
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
> ---

Applied to clk-next

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
