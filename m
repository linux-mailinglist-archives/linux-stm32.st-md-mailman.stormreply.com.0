Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C6BB12758
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Jul 2025 01:25:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C851C36B2D;
	Fri, 25 Jul 2025 23:25:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66807C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 23:25:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ECDEA442D1;
 Fri, 25 Jul 2025 23:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A37C4CEE7;
 Fri, 25 Jul 2025 23:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753485918;
 bh=30Lu0lu5cTdskwZvddFTxEhvmB6dDSde5G6CiimxE18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BhH2V1yHUI/4eJQ6O6SG1WTvCOkt3dRljpQMyc6AJJvfc9Ge6R4yFP34FihWPc4AU
 sCHjWECuBb9JWB5DHvvXko61NyKC4mpUdZUBDorYydB9bN4zn+wWJXl9dRjjTi5oNm
 69IZ10ziTsotIvFjLvZ5zVRy0Aw8VaWi36Zm01diusnQXnPMP/Er4YWcGxQ/lIZD03
 JQewW2m6ut/0cqUi+V2EZFgFNUuRVVyZlHJl/PRCu3xi28NZFElIJzIx9EKtLDIFJ7
 E4curYdmx/NhdLREspoJMKHpBsLMP0OxYHetdO3gTNCl53Mvd6oA2GnJE7/UAegz/B
 yCq9g/Ji9+iCQ==
Date: Fri, 25 Jul 2025 18:25:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Message-ID: <175348591737.2024488.4815901624908424031.robh@kernel.org>
References: <20250724154052.205706-1-matthew.gerlach@altera.com>
 <20250724154052.205706-2-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724154052.205706-2-matthew.gerlach@altera.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 linux-kernel@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, dinguyen@kernel.org,
 edumazet@google.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] dt-bindings: net: altr,
 socfpga-stmmac: Add compatible string for Agilex5
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


On Thu, 24 Jul 2025 08:40:48 -0700, Matthew Gerlach wrote:
> Add compatible string for the Altera Agilex5 variant of the Synopsys DWC
> XGMAC IP version 2.10.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
> v2:
>  - Remove generic compatible string for Agilex5.
> ---
>  .../devicetree/bindings/net/altr,socfpga-stmmac.yaml      | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
