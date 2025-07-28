Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5650CB13F50
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BEC6C36B2E;
	Mon, 28 Jul 2025 15:58:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03B9DC36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 15:58:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EFB6760007;
 Mon, 28 Jul 2025 15:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4379EC4CEE7;
 Mon, 28 Jul 2025 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753718299;
 bh=V+d2rcREysRXtKARHFsAr2HZDjswTxp4mAu7WVwQcLQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FsFU/0l0JhHv3KnAnvGh9cpDYQdde/ZjdI3aAicUrmd3JLMO9kvxN2dnUFGVg0nb6
 hwT1GRV+wSWcnTNqtXJT6NqIcKUVqyD09yR6V7inanEVa5Tyl9FVxqlTZyb0sRB8Iw
 0LkJepsCP/izOEN+2HGU/elG6XQ7moL86xFYwSbRxQmYZswsXEK2zrsVcKhMvPmt2X
 SXgDWQzWx/r010pE96+/oMBHaXLVkhE3D4N2grCCJ3At2BOdRwbn1O+WvkO6XNmAqg
 MEJbJDImzWSQzN3NeoodWSvXhEn/8yn/3zB6u9cx8s36tkXFHMBRmYird8o5GOgq+A
 jNm9g6/zcDC5Q==
Date: Mon, 28 Jul 2025 08:58:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <20250728085818.5c7a1e45@kernel.org>
In-Reply-To: <424f8bbd-10b2-468c-aac8-edc71296dabb@foss.st.com>
References: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
 <20250725172547.13d550a4@kernel.org>
 <424f8bbd-10b2-468c-aac8-edc71296dabb@foss.st.com>
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

On Mon, 28 Jul 2025 10:15:07 +0200 Gatien CHEVALLIER wrote:
> Maybe we could compare the time to the current MAC system
> time and, if the start time is in the past, consider the
> value to be an offset. Therefore, any value set in the past
> would be considered as an offset. I see some implementations
> doing either that or replacing any value set in the past to
> a safe start + a fixed offset.

Let's try this.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
