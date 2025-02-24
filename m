Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 351BBA42D25
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 20:56:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F08BDC78F60;
	Mon, 24 Feb 2025 19:56:29 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C15CDC7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 19:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=vsWVUTlT5IhFb0LzL3cca1uMum0uWzsxWdOe223isrk=; b=bOIMyNRzV9lEe2ed5JBnzEhmPZ
 7+r3qNFhdOJAh6rp0T0JQT70UdRlB/FPImLv6QJBisym68/lXTC+fYoyhu0QBQTvOwW+VRJQlYBmm
 SxLTSFMYs2Pr5wPiWGFtY9w5tRSKjV/VjbGvJSPZRbgd6bwThgf9CKqyxhewTMsozo14=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tmeYu-00HHAM-N1; Mon, 24 Feb 2025 20:56:20 +0100
Date: Mon, 24 Feb 2025 20:56:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Philipp Stanner <phasta@kernel.org>
Message-ID: <5b41e2b5-a676-4082-8f3b-0ed3c81c383a@lunn.ch>
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-5-phasta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224135321.36603-5-phasta@kernel.org>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>,
 linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>,
 netdev@vger.kernel.org, Yinggang Gu <guyinggang@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Qing Zhang <zhangqing@loongson.cn>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/4] stmmac: Remove pcim_*
 functions for driver detach
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

On Mon, Feb 24, 2025 at 02:53:21PM +0100, Philipp Stanner wrote:
> Functions prefixed with "pcim_" are managed devres functions which
> perform automatic cleanup once the driver unloads. It is, thus, not
> necessary to call any cleanup functions in remove() callbacks.
> 
> Remove the pcim_ cleanup function calls in the remove() callbacks.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
