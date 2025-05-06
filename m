Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEE9AACF66
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 23:15:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08B60C78F83;
	Tue,  6 May 2025 21:15:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFF6DC78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 21:15:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A8F243D4F;
 Tue,  6 May 2025 21:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F4CC4CEE4;
 Tue,  6 May 2025 21:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746566109;
 bh=UKDHa0bNqRGou8tssWC4DP+HvyHvliqv34GyV/Vyj6Q=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Lf5pmecR/+hvX5yBph9kRNqb/T/VN8CvscGLViGx20XpFvd204wWNIweCzGnFEs7f
 gbZ6Zh6B+ppM9NxyAehlXoYUbgdwThSzR33NLcZ6BEjaucB+2pvrXKSzvJFXYMFmW4
 M8RUbVPcZ2tUXBVtJpZTo7gglW50EsQemQ3SbHEe1dB/tR0tI3mdx/NpqykILiREKI
 D9n4KPuaBOav/Z4u7kt0SUA1UGz+x+RSFWeiqJSnHklfESqK1prvR9cmjN0A/YgErX
 Qcio5j9h/damgAm/3SD0UtpCcDyYgN7R9jVnalDF46wyj7JHPEYMM+PDKGR9u8mJjk
 zC8IdijU1AcLg==
Message-ID: <673e96e58a1f5043c7a073b8f971d29c@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250505161933.1432791-1-robh@kernel.org>
References: <20250505161933.1432791-1-robh@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring (Arm) <robh@kernel.org>
Date: Tue, 06 May 2025 14:15:07 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: clock: Drop st,
	stm32h7-rcc.txt
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

Quoting Rob Herring (Arm) (2025-05-05 09:19:32)
> The binding is already covered by st,stm32-rcc.yaml.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
