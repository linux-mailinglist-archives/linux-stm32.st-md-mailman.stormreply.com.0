Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F7FC8BC23
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Nov 2025 21:05:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 664EDC1A981;
	Wed, 26 Nov 2025 20:05:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E950C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Nov 2025 20:05:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 48A7643F71;
 Wed, 26 Nov 2025 20:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BF9C113D0;
 Wed, 26 Nov 2025 20:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764187522;
 bh=4UvnEA00ko1lzXg0hdjBBBEsnJicagQcXbbjtn3U4jc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KMmDAc/iJr+WTIK/XNheFgGF6KoMxY8sGn6uKmy7ktSGlsc5vAWgRt5OoP/og4282
 iYmETb05ebG5T/0nIWKMYdjtUyF7kBBvRW51Br6V7CfyjHNIBDPA+HK5KmycbyCF7g
 tGFNL90m86oHbEdTEg+E0W+Vc/56Fq/XSASSc6z88l5ag9WUXVUQ5dSQ7v0C4Q/nXA
 2u5iLPnCHmGwtAV1uaqmVLkhXEMfEavoGxYU2Wyri7aHXWoeA64ZANBsABB8Jpv65S
 4M/c2DQYkuMsVf2yLK7BgXqj1rCY6wewj90H4jo+tX/QiXEBqR8lk0P1VeXC+sA3Dt
 c3KUU2YCiOzFg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 26 Nov 2025 14:10:43 -0600
Message-ID: <176418784429.1591314.3521019603654312437.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124182751.507624-1-robh@kernel.org>
References: <20251124182751.507624-1-robh@kernel.org>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Beleswar Padhi <b-padhi@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v7 1/2] remoteproc: Use
	of_reserved_mem_region_* functions for "memory-region"
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


On Mon, 24 Nov 2025 12:27:47 -0600, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> [...]

Applied, thanks!

[2/2] remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"
      commit: c70b9d5fdcd707ddac29284ea425fd433f374696

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
