Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D76DBB127FF
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Jul 2025 02:25:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4208BC36B3C;
	Sat, 26 Jul 2025 00:25:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00367C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Jul 2025 00:25:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ABAF3418C0;
 Sat, 26 Jul 2025 00:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4FDC4CEE7;
 Sat, 26 Jul 2025 00:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753489548;
 bh=Dko3kWgCT0Ys++R7H9KuFtq5eskVkBM8MOSnrUZdmSM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yexe2ilWaZpg4EONL/tBPagglcnpt1t2mC9YTEcUOirFA4Vjm4ooF6XzXKBMUZQy9
 e2gZLxn6Co3PeNaQ0UipNCoc2PI93Jj8A/gkcq7IQ6DMgssqfM6JIThKV52QPiU/Vd
 FgVV5nQVPFRRXoZEJw6rQFPy104fmqwxEdk+NKJcbAH6JbAC8gdpGrhzJCsaY08bUr
 l5njw75dvCUEP8KWSrqLiS60IJ2TxwiFhme/Zn+9uqm2mZ3q4sWr/InoxUxsXEdpzo
 geQAjruPoUDFOv+QCfwiC641tZFmFBgG9vj3uiRAWFna8d6J5vEedJkNhIRhsa6SJn
 ROuZXyfueL8Zg==
Date: Fri, 25 Jul 2025 17:25:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20250725172547.13d550a4@kernel.org>
In-Reply-To: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
References: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: allow
 generation of flexible PPS relative to MAC time
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

On Thu, 24 Jul 2025 14:31:17 +0200 Gatien Chevallier wrote:
> When doing some testing on stm32mp2x platforms(MACv5), I noticed that
> the command previously used with a MACv4 for genering a PPS signal:
> echo "0 0 0 1 1" > /sys/class/ptp/ptp0/period
> did not work.
> 
> This is because the arguments passed through this command must contain
> the start time at which the PPS should be generated, relative to the
> MAC system time. For some reason, a time set in the past seems to work
> with a MACv4.
> 
> Because passing such an argument is tedious, introduce
> STMMAC_RELATIVE_FLEX_PPS config switch so that the MAC system time
> is added to the args to the stmmac_ptp driver.
> 
> Example to generate a flexible PPS signal that has a 1s period 3s
> relative to when the command was entered before and after setting
> STMMAC_RELATIVE_FLEX_PPS:
> 
> Before: echo "0 175xxxxxxx 0 1 1" > /sys/class/ptp/ptp0/period
> 
> After: echo "0 3 0 1 1" > /sys/class/ptp/ptp0/period

Kconfig doesn't seem like a great way of achieving the outcome.
Some per-platform knob would be better.
But ideally we wouldn't do either. Could we possibly guess which
format user has chosen based on the values, at runtime?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
