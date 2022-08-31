Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 779985A80DF
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Aug 2022 17:06:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 215D3C03FDB;
	Wed, 31 Aug 2022 15:06:12 +0000 (UTC)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3BCFC03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 13:15:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHl6L1w6Lz4xGS;
 Wed, 31 Aug 2022 23:15:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-spi@vger.kernel.org
In-Reply-To: <20220824082130.21934-1-wsa+renesas@sang-engineering.com>
References: <20220824082130.21934-1-wsa+renesas@sang-engineering.com>
Message-Id: <166195164122.45984.7055398708417257507.b4-ty@ellerman.id.au>
Date: Wed, 31 Aug 2022 23:14:01 +1000
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Aug 2022 15:06:11 +0000
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/2] spi: remove "spidev" nodes from DTs
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

On Wed, 24 Aug 2022 10:21:27 +0200, Wolfram Sang wrote:
> There were two DTs left specifying "spidev" directly. Remove them.
> 
> Wolfram Sang (2):
>   ARM: dts: stm32: argon: remove spidev node
>   powerpc/82xx: remove spidev node from mgcoge
> 
> arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 6 ------
>  arch/powerpc/boot/dts/mgcoge.dts                 | 7 -------
>  2 files changed, 13 deletions(-)
> 
> [...]

Patch 2 applied to powerpc/next.

[2/2] powerpc/82xx: remove spidev node from mgcoge
      https://git.kernel.org/powerpc/c/fd20b60aea6a37788f2f761af405b41c6c34473b

cheers
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
