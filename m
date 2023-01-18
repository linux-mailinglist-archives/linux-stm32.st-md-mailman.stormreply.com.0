Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D996A671216
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 04:43:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BD9BC65E71;
	Wed, 18 Jan 2023 03:43:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B919AC65E6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 03:43:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BEDA61615;
 Wed, 18 Jan 2023 03:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C289C433EF;
 Wed, 18 Jan 2023 03:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674013429;
 bh=0ILKWOlamb3ppN+hUK/M6c0wITie324WG6pz/EbdT6w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NPsKqjHLBwdy9unr2PXkGQacLhWf7BFNap8y4qq9e4QGG7oeu/SN/zX5wOn/EOvIA
 GtbQKRKzvRoBXVxCkF1wuM1Z9UFf+xiMcRCLRX+irBD7moeyATxYDQxM8o8LG90RsU
 LuRgjYgoeRZklfmX+3AkxNglQHoPsXi/7VPAGoZUEbkOxs4bPtQvWldXuG7/WeFXNH
 IlSbbK5QBcNuoVeyIEhogIgb/wTEMgxEEiRDSVZE0//ZeadXVDS4C5MMo0wA7ArMS/
 vYj8W2oydlT7PsD4LhdmZrQwpXFgqtyRWyIsUYYVvwgOr9NRGpr2QjAKnM8NQgLsr9
 3A4TxqRgfHmoA==
Date: Tue, 17 Jan 2023 19:43:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <20230117194348.3f098a18@kernel.org>
In-Reply-To: <20230116193722.50360-1-ahalaney@redhat.com>
References: <20230116193722.50360-1-ahalaney@redhat.com>
MIME-Version: 1.0
Cc: Ning Cai <ncai@quicinc.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: enable all safety
	features by default
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

On Mon, 16 Jan 2023 13:37:23 -0600 Andrew Halaney wrote:
> I've been working on a newer Qualcomm platform (sa8540p-ride) which has
> a variant of dwmac5 in it. This patch is something Ning stumbled on when
> adding some support for it downstream, and has been in my queue as I try
> and get some support ready for review on list upstream.
> 
> Since it isn't really related to the particular hardware I decided to
> pop it on list now. Please let me know if instead of enabling by default
> (which the original implementation did and is why I went that route) a
> message like "Safety features detected but not enabled in software" is
> preferred and platforms are skipped unless they opt-in for enablement.

Could you repost and CC Wong Vee Khee, and maybe some other Intel folks
who have been touching stmmac recently? They are probably the best to
comment / review.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
