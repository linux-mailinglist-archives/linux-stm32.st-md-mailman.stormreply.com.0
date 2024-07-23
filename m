Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B345193A3FF
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jul 2024 17:50:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6388AC71292;
	Tue, 23 Jul 2024 15:50:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BB9FC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2024 15:50:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2FDC1BF204;
 Tue, 23 Jul 2024 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1721749829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qW4zkwGdwDYDktpri7pWekVPN6py5ctB8Xz2qiAJLKI=;
 b=diGmkaDDhbbwGnVqM5n+brku5HpTbCKSvZABMWHjNUcdhSnnk6qDKbKoZ7f64Rw5NAi9r2
 RHJ7mvjwVFc5RENCp/g29cR4Q1fauVps0WvzuWblz96EymuolIR5gT5ROgyPjdYrGysSTd
 93xtVkLz5XQyRpv+YD8hQJ3l7TmaawX15Y9Lb7w38Q/JeGJTxICvX702Yp71MAFDMYnH99
 Qmfdo9D+iFlpiBH0PlfwLDXWQEZSJ4xRqKk3JHpBCec6T8ibL7ZglixTlZ7xLoxzMZ6akJ
 L6demDM9v/YZMZYgKHrMfKAOyz9nyCdhZpMY7Secu/DUnQCyGO7t/OgMGuzi3Q==
Date: Tue, 23 Jul 2024 17:50:27 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Simon Horman <horms@kernel.org>
Message-ID: <20240723175027.081423a1@fedora.home>
In-Reply-To: <20240723-stmmac-perfect-match-v1-1-678a800343b2@kernel.org>
References: <20240723-stmmac-perfect-match-v1-1-678a800343b2@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Correct byte order of
	perfect_match
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

Hello Simon,

On Tue, 23 Jul 2024 14:29:27 +0100
Simon Horman <horms@kernel.org> wrote:

> The perfect_match parameter of the update_vlan_hash operation is __le16,
> and is correctly converted from host byte-order in the lone caller,
> stmmac_vlan_update().
> 
> However, the implementations of this caller, dwxgmac2_update_vlan_hash()
> and dwxgmac2_update_vlan_hash(), both treat this parameter as host byte
> order, using the following pattern:
> 
> 	u32 value = ...
> 	...
> 	writel(value | perfect_match, ...);
> 
> This is not correct because both:
> 1) value is host byte order; and
> 2) writel expects a host byte order value as it's first argument
> 
> I believe that this will break on big endian systems. And I expect it
> has gone unnoticed by only being exercised on little endian systems.
> 
> The approach taken by this patch is to update the callback, and it's
> caller to simply use a host byte order value.
> 
> Flagged by Sparse.
> Compile tested only.
> 
> Fixes: c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if HASH is not available")
> Signed-off-by: Simon Horman <horms@kernel.org>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
