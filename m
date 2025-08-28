Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E6BB391AB
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 04:31:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A555C3F95B;
	Thu, 28 Aug 2025 02:31:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 725FCC3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 02:31:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6806560235;
 Thu, 28 Aug 2025 02:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99700C4CEEB;
 Thu, 28 Aug 2025 02:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756348267;
 bh=Jp+q+OMH44/A5s5dMrV18NukkMjsoCFKlwXK6QRC9c0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gy7w7Z+gTiX4okHiVGemqZyKkOvwfjqvIB2fVFE/FzwchMy1SjtHL61AQhk1Yj5a0
 e0iRWpLsvQ8BBCxMLQjJVzH7EgP53BxAPOZOWv2cPGztSUS2NeUuDeej8PUIOEH973
 7xX1hdDIYDR3UfVvmXQgZtR42X+grk8y8tOx03VyVq546yR2NJyI3ripWcLqlFNuF4
 rTiUjlNHeDI8SmGuq3FdDnth1PlWxz8GuEsc6p+esGHZV+ebXa+ajsoIeedijpju9+
 J/0bVn8d+beYlAim3UDQQZlEUd+vSVW7P1lIBxK3ooODwdMxjqTQynmuusrkfCh5aR
 VgahFsmkF5J7g==
Date: Wed, 27 Aug 2025 19:31:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20250827193105.47aaa17b@kernel.org>
In-Reply-To: <20250827-relative_flex_pps-v3-1-673e77978ba2@foss.st.com>
References: <20250827-relative_flex_pps-v3-0-673e77978ba2@foss.st.com>
 <20250827-relative_flex_pps-v3-1-673e77978ba2@foss.st.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/2] drivers: net: stmmac:
 handle start time set in the past for flexible PPS
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

On Wed, 27 Aug 2025 13:04:58 +0200 Gatien Chevallier wrote:
> +		curr_time = ns_to_timespec64(ns);
> +		if (target_ns < ns + PTP_SAFE_TIME_OFFSET_NS) {
> +			cfg->start = timespec64_add_safe(cfg->start, curr_time);

Is there a strong reason to use timespec64_add_safe()?
It's not exported to modules:
ERROR: modpost: "timespec64_add_safe" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
