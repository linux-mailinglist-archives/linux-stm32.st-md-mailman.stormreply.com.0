Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A8CA5DB9
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Dec 2025 02:51:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0E0EC628D4;
	Fri,  5 Dec 2025 01:51:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45264C628D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 01:51:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E67A8415F6;
 Fri,  5 Dec 2025 01:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A4DC4CEFB;
 Fri,  5 Dec 2025 01:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764899509;
 bh=sKh7ACLjMjQtVuiTyjntM342EI8O9YcjrBWtL5K0Ou8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dvCRUhE4cHp8jX4hjL7MrcKx+G/eDwKRqqbfP+yt0xwK282dAeQVkVLguW4qM3Kwe
 tNZe0rV1mcebu3UjlH00h3WRgBdW88mLIaTeeyitTIRxe2KQotLBhn/NRvy9PoY9PO
 YfrvVQssy3G6KbMQPjo8mDMGVUp2nTAhq2O9oT/L/FukZ6WDXvjGBx9fv4Lw0fSvhc
 jFKYbTr0icmubOJPfqii/uQKXL/XLPuZKytqgPp7pGN4DPrQIxLEepuCLasHQPCzTS
 q/IN+5MbpRe4CDrswQSV5wXN9+QuBTTydwNwXxnWygCZN2LHdPJihzmJxZP9o5Pkk4
 Q/+LngI7aVRdA==
Date: Thu, 4 Dec 2025 17:51:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: 2694439648@qq.com
Message-ID: <20251204175148.5a5cc065@kernel.org>
In-Reply-To: <tencent_639FC431D959DA3E8FC007985FC88EA5A90A@qq.com>
References: <tencent_639FC431D959DA3E8FC007985FC88EA5A90A@qq.com>
MIME-Version: 1.0
Cc: hailong.fan@siengine.com, inux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: Modify the judgment
 condition of "tx_avail" from 1 to 2
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

On Wed,  3 Dec 2025 09:31:52 +0800 2694439648@qq.com wrote:
> -	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 1))) {
> +	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 2))) {

Please add a constant for "(MAX_SKB_FRAGS + 2)" and a comment next to
it explaining why the literal 2 is used.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
