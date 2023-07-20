Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF475A4FB
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jul 2023 06:12:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5135C6B44D;
	Thu, 20 Jul 2023 04:12:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6735EC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 04:12:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E5716126B;
 Thu, 20 Jul 2023 04:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72A6C433C7;
 Thu, 20 Jul 2023 04:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689826357;
 bh=3AHdDFL2C0BAHYVyKANj1zL7AGecfNpV115jPkuHkwA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HCpndoyA8eGRaZwEAIZ5eAIvWa1UeWuwHoS8+lWLp7Or7/SKZsbhFOBSgobJo0rJL
 MAhkyCABXiwnAJGHJIxevi8/sd+j+nNXbDZBW1ReYpK3kVjNe9aNcWMtgFWxgs15Ld
 PiTvWapDgxWT1hKwb65i8shckyB9ULl8Y7lRAajvc31XUrxRnhJnB35XYnRv793Ti6
 gqwZpyFe+A9XhecDDAbpOsKcrRhXSC+b5etDY8PhHsVu71Cu2cKcX0lnLQ2abD0uOO
 1/CmuVYMV0aehFssABrVcqyaWJ0C5zCDqz7XX3ebEopddshNbgzn9ST18Oo+vHdpzb
 eRJlJ2uFD+b0g==
Date: Wed, 19 Jul 2023 21:12:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Message-ID: <20230719211235.1758bbc0@kernel.org>
In-Reply-To: <20230718132049.3028341-2-m.felsch@pengutronix.de>
References: <20230718132049.3028341-1-m.felsch@pengutronix.de>
 <20230718132049.3028341-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Cc: kernel@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: add support
	for phy-supply
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

On Tue, 18 Jul 2023 15:20:49 +0200 Marco Felsch wrote:
> Add generic phy-supply handling support to control the phy regulator to
> avoid handling it within the glue code. Use the generic stmmac_platform
> code to register a possible phy-supply and the stmmac_main code to
> handle the power on/off.
> 
> Changelog
> ---
> 
> v2:
> - adapt stmmac_phy_power
> - move power-on/off into stmmac_main to handle WOL
> - adapt commit message
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---

Format should be:

Bla bla bla

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changelog

v2:
 bla bla bla


Please fix and rebase because the current version does not apply to
net-next/main.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
