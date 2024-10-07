Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B16A9931F7
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 17:49:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40458C6DD94;
	Mon,  7 Oct 2024 15:49:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0CC3C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 15:49:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7E2D85C5A64;
 Mon,  7 Oct 2024 15:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7203C4CED0;
 Mon,  7 Oct 2024 15:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728316144;
 bh=fdQgCvkUVNcWgqqhdAJ2FjLhihD1asnc+B1Iuh/DpfY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=eLCBPb2Bfjd7B77CLVW4dY4aML/1Dwpq2AAxtMwfOaXWvlhfURh/YmDhXXP7C308J
 SOpjm2zRTcJiWo3ffieH1BQK6H2j1t6Ze8qJodEhZ03tgtRHnwVkbaIBZELYOzPkF6
 HP9fVq5LBsDneoPT0gQ5s0f0YNbdE4ou1wfZnyoWiTAVJ9j9aVVN8jnjp0R+Dk6r0H
 OJmxhB+zvA6u6mOv+fgGWMZUZbsrsXWAzfU3rlWK+q8sYHvk7uUWEteho1wOoYTrZ8
 E5u2p1XKXHLLnlgccfoFw66LLUDJT6vf291tjTyEaEaK6xXV7tPyLfrFSrlk8QJQpi
 Jv7NVoFbIu3hw==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, 
 Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20240930170847.948779-1-christian.bruel@foss.st.com>
References: <20240930170847.948779-1-christian.bruel@foss.st.com>
Message-Id: <172831614044.134526.10151258840417457919.b4-ty@kernel.org>
Date: Mon, 07 Oct 2024 21:19:00 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v9 0/5] Add STM32MP25 USB3/PCIE
 COMBOPHY driver
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


On Mon, 30 Sep 2024 19:08:42 +0200, Christian Bruel wrote:
> Changes in v9:
>    - Fix bot clang warnings: uninitialized variables and
>      include bitfield.h for FIELD_GET
> 
> Changes in v7/v8:
>    - MAINTAINERS: Reorder STM32MP25 DRIVER entry
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: phy: Add STM32MP25 COMBOPHY bindings
      commit: 8c7e955fac07ee11c76ddf2330587fe083fab1a2
[2/5] phy: stm32: Add support for STM32MP25 COMBOPHY.
      commit: 47e1bb6b4ba0987139ab790efa03c542ebc1b10d
[3/5] MAINTAINERS: add entry for ST STM32MP25 COMBOPHY driver
      commit: b6a713b92ebb9e7ee1495f009fd02a71e485184f

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
