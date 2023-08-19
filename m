Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B655781ACB
	for <lists+linux-stm32@lfdr.de>; Sat, 19 Aug 2023 20:59:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93FDFC6B477;
	Sat, 19 Aug 2023 18:59:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72008C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Aug 2023 18:59:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2748861F12;
 Sat, 19 Aug 2023 18:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32ADC433C8;
 Sat, 19 Aug 2023 18:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692471548;
 bh=muSsZQXeH5W5ZWIQQGcJYHD2XdcfeOyxVM9kY1wr7f8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i74yyXCF1RpoTfnu1exjW2hK1HDtKw2oAVHRpVll+Mt2HqVxOFnXWkki5CEEZFNcb
 2gOurktbrZNr16tNwNkzOM2rd40R2TfPCei7W3ZewL6qgYUI3cSUL4y8i8fiaVHcQm
 i/8i5QlbHq+2OOh3cagGRp2QU+QkTKfN0FNz2c+fFxqAjEagqnJeJjJS0/kJffU0XU
 JHd4jdq4eSU7dh4PY8I7ZNvIsLRiq328kzObyS5l47RPqXhyZ8Z7xU7a0NDO60Ram+
 khhDhMrwPC+aOzNJ6JlzrpQMl14uzaikCMDbV3w7dOcKGRhSfMh6wToV3rrs+M38i9
 0wqRsPMeYRA5Q==
Date: Sat, 19 Aug 2023 20:59:01 +0200
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <ZOEQ9TYM/FX8UPr6@vergenet.net>
References: <20230819105440.226892-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230819105440.226892-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/1] net: stmmac: Check more
 MAC HW features for XGMAC Core 3.20
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

On Sat, Aug 19, 2023 at 06:54:40PM +0800, Furong Xu wrote:
> 1. XGMAC Core does not have hash_filter definition, it uses
> vlhash(VLAN Hash Filtering) instead, skip hash_filter when XGMAC.
> 2. Show exact size of Hash Table instead of raw register value.
> 3. Show full description of safety features defined by Synopsys Databook.
> 4. When safety feature is configured with no parity, or ECC only,
> keep FSM Parity Checking disabled.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
> Changes in v2:
>   - Rebase patch on net-next. Thanks Simon :)

Likewise, thanks.

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
