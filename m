Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B8395461
	for <lists+linux-stm32@lfdr.de>; Mon, 31 May 2021 06:16:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C061AC57B69;
	Mon, 31 May 2021 04:16:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72F35C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 04:16:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16A4660FF0;
 Mon, 31 May 2021 04:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622434599;
 bh=WrrNcXLSHGAxtkDaYh0sooXVPLQWlfDXREfK1i3H/5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZSNt6RNUzsFj9QqGharZZ/5OVOErMq24NUVJUMA3vcK9ZQIk2vk0cRcPTSD5Kz5hq
 LqMKAcCXBv2DaYPPefCkKDSfEuqesQUAwmHpqZT0fzecNe1OlS9kBfWSjftgezJL7R
 X0hJwwvahOCLHA2euDqqvAdkNGO1Cg/QvEUXpU5fLNyfg5zgZBry5snamtdexI5qCM
 att6IndNwPQgS5b/rTtayW+ISR9zx3HSgSx7vDdL052nfx/Z+G7mrdVvdXKZCzzW98
 Yw6QeGZcNc4BLYOJ+anmQk3aEV7TDphNwmE2d5HALkwgJgjgxZWOl/xGNXw1JIsabD
 usLUFzXJfDAwQ==
Date: Mon, 31 May 2021 09:46:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Zou Wei <zou_wei@huawei.com>
Message-ID: <YLRjJFN96NGHS9Rj@vkoul-mobl.Dlink>
References: <1621601902-33697-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621601902-33697-1-git-send-email-zou_wei@huawei.com>
Cc: zhang.lyra@gmail.com, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 mcoquelin.stm32@gmail.com, baolin.wang7@gmail.com, orsonzhai@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] dmaengine: fix PM reference leak
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

On 21-05-21, 20:58, Zou Wei wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.

Please rebase and submit per driver.. I have already applied few fixes
for this and rejected few

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
