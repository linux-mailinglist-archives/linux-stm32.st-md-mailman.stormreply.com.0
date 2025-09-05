Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E8AB45056
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 09:53:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E9E7C36B3E;
	Fri,  5 Sep 2025 07:53:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21B56C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 07:53:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 991B64185E;
 Fri,  5 Sep 2025 07:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD639C4CEF1;
 Fri,  5 Sep 2025 07:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757058812;
 bh=tTfuVxL0tJfbFNZIAPWlOg3hJrctEWrR38o7eJHMoW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GHq/Q+ABhcD5UQfn7jq1ts55lGplUJdn2IoIYKmokP3etjrHQqMg/gHOgZvvkRm5G
 /GywyuGH8gptUPW18QCJXZuBA0WWJBmkpADlBKdfFyPbnoZka/476VoOTxknW4s0+H
 rO06xx1GdKGMkQsjspj3nXY0yfSZZVbHAeIaExJ4Xkt9tuTH72JF06kV5qxpW5qfOX
 37tGPYiTVeT+zkd/1ZW9KZEbqrYufpaEaobaasUcZfcZfZtgYw6J7JB4+im3wduGiB
 m26G6Iz/xQubB6cHV/wqd9yGFuKsN+Yr8PbXOHEhQe1EU2QSBXNvDGcG4RVq5uVNX7
 fBPtROte2MkQw==
Date: Fri, 5 Sep 2025 09:53:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: weishangjuan@eswincomputing.com
Message-ID: <20250905-hissing-papaya-badger-1b2ddf@kuoka>
References: <20250904085913.2494-1-weishangjuan@eswincomputing.com>
 <20250904090055.2546-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250904090055.2546-1-weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, 0x1207@gmail.com, edumazet@google.com,
 jszhang@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, faizal.abdul.rahim@linux.intel.com,
 lizhi2@eswincomputing.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, inochiama@gmail.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, p.zabel@pengutronix.de,
 netdev@vger.kernel.org, krzk+dt@kernel.org, emil.renner.berthing@canonical.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 1/2] dt-bindings: ethernet: eswin:
 Document for EIC7700 SoC
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

On Thu, Sep 04, 2025 at 05:00:55PM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add ESWIN EIC7700 Ethernet controller, supporting clock
> configuration, delay adjustment and speed adaptive functions.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
