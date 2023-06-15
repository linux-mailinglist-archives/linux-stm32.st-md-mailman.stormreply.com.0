Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A697730C7E
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 03:06:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB91DC6A5EA;
	Thu, 15 Jun 2023 01:06:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78816C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 01:06:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 237E9612E4;
 Thu, 15 Jun 2023 01:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0BDC433C8;
 Thu, 15 Jun 2023 01:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686791202;
 bh=WVphbQvdDrewsJtwZkZ80s7KmaaKA7azPVcrm38R+bQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=D+fq+e6pBYZwX9xBEzVU81AIi0zmvAbqObVJWbFlBbsNLwSSLgXGjKPvWRaIGIh4V
 d0YvtcA3sQ55z/Y+MNCWtPhBldCFXi5pKdLWIN32vcnzZmZX0DrgQc9YHXTNJZ9xiA
 jaB+xINyHEWc+3PFMMCw94nHHl4hPJmXH0OXCYdJPcPok3/J6UqiTInHOqKcci9ckG
 xO22qGeSDHNohl9HArAsOBy/GsQw/mVtyTivLEcr4eTw3MwjVGOb8qDPiELlYCglNj
 8FCLsgkvuL/7MObkK7MHiYdiwisCoQfQNqoo9Nw9kidwEkR73lJGh5AQL387sBYitF
 XPq6smfNmrH3g==
Message-ID: <52e6278bb43511c5bccad41909c4423b.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230510184305.v2.1.I417093ddcea282be479f10a37147d1935a9050b7@changeid>
References: <20230510184305.v2.1.I417093ddcea282be479f10a37147d1935a9050b7@changeid>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 14 Jun 2023 18:06:40 -0700
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, gabriel.fernandez@foss.st.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: rcc: stm32: Sync with
	u-boot copy for STM32MP13 SoC
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

Quoting Patrick Delaunay (2023-05-10 09:51:40)
> Minor cosmetic change, aligned with files in U-Boot:
> - change obsolete SPDX id : GPL-2.0+ and use the same license
>   GPL-2.0-only for the 2 files
> - use correct mail address gabriel.fernandez@foss.st.com
> - remove extra space
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
