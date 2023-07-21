Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9EF75BCA8
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 05:11:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA813C6B44D;
	Fri, 21 Jul 2023 03:11:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A364EC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 03:11:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 728D861CB8;
 Fri, 21 Jul 2023 03:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4870DC433C8;
 Fri, 21 Jul 2023 03:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689909093;
 bh=Pq/Uyc4eped6jMU42cvi7k4WYaZlbwcGo8MIhkmhssA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IdcWhLUERbQ0UoanBhSRVkQHJNHwuWctu0603avFZSV2CPkyQmFln54oHsoTVwPfA
 utcAoCCENB92dWcGAyoF8NxtlSwlbU7SJS2rURAt60n0VlkKX+60t3uQ+bWO/tzE9G
 qkm/1TT881Y4S0msDZz/p7P7q34XSjgHqaBEKLhawpH6opKaRVR/DxVTI+PrURDZYw
 zx1bItni2S5VO3a6MF1QdwfTSOqziQx1yLKwNE5ad7yY4xs7LU+MeoWmGRsUUWUE8Q
 jAm/xzR2z5AEZFgx2lhVkreiYnfW2wWQ5/IHIXMhoIRS1nLAYbwFdO+r+x9Euq3lLO
 SN5bNvbW6ezKg==
Date: Thu, 20 Jul 2023 20:11:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Message-ID: <20230720201132.6c6a4c54@kernel.org>
In-Reply-To: <20230720072304.3358701-2-m.felsch@pengutronix.de>
References: <20230720072304.3358701-1-m.felsch@pengutronix.de>
 <20230720072304.3358701-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Cc: kernel@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/2] net: stmmac: add support
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

On Thu, 20 Jul 2023 09:23:04 +0200 Marco Felsch wrote:
> Add generic phy-supply handling support to control the phy regulator to
> avoid handling it within the glue code. Use the generic stmmac_platform
> code to register a possible phy-supply and the stmmac_main code to
> handle the power on/off.

Please rebase on latest net-next/master.
Bartosz converted the use_phy_wol bool to a flag a few weeks back.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
