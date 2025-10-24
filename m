Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7726BC0769D
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 18:57:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FFD1C5F1F0;
	Fri, 24 Oct 2025 16:57:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B05E9C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 16:57:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8B16A6049F;
 Fri, 24 Oct 2025 16:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356DAC4CEF7;
 Fri, 24 Oct 2025 16:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761325060;
 bh=DJwgWQV6LS0y1HCZdTukbp7eZ5b2oG/b60BU6bAySRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bDeNgxpxlfWKCDa5lCi+7eDV6CLbBTSTQ0BI8fCL4g3akCIqJee7S0pfUG+TKpkb1
 EO1iPBo5W+rlWfRyhW4bdyKJUH6YS3FvDWnPCzgrQy9UjzouQzSTyp4RgzV4+IKpeu
 oXj119hem00USE8NLX6A+mqmmg8RhiW5+J/VzwiU7TtI6O4IiYctQBbvj4WLqJjvHI
 fhfbIO8fESHwCfSxtXXu6p3rJrNKhhlQBgLSAVx9BzhTJHJj2x//XVoMOzy37z3V7O
 mzk3OzVCJT7mkghK3wt4fjeMC8Y9SeOkvcDZt1UKOEBcav6XVkq6AngqfHHKz0VKRx
 +LHUfZaSgpkYw==
Date: Fri, 24 Oct 2025 17:57:34 +0100
From: Simon Horman <horms@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Message-ID: <aPuv_q3beG7kEj9N@horms.kernel.org>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
 <20251024-v6-12-topic-socfpga-agilex5-v5-4-4c4a51159eeb@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-4-4c4a51159eeb@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Dinh Nguyen <dinguyen@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Austin Zhang <austin.zhang@intel.com>
Subject: Re: [Linux-stm32] [PATCH v5 04/10] arm64: dts: socfpga: agilex5:
	smmu enablement
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

On Fri, Oct 24, 2025 at 01:49:56PM +0200, Steffen Trumtrar wrote:
> From: Austin Zhang <austin.zhang@intel.com>
> 
> Add iommu property for peripherals connected to TBU.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>

As Austin Zhang is the author (as listed in the from line),
their Signed-off-by is needed.

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
