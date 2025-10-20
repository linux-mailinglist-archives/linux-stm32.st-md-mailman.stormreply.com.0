Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6654EBF37AE
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 22:43:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0012C5A4F1;
	Mon, 20 Oct 2025 20:43:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C9C9C5A4EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 20:43:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4B8D462085;
 Mon, 20 Oct 2025 20:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A546BC113D0;
 Mon, 20 Oct 2025 20:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760992980;
 bh=ICw2tymwdpgjAi7jhcPJWNLOmDSZpCZMN8Mq3WAbZvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R69E1IQLHAg+VkCglHtQ7jfYYiZBlMH6G6VVr5UwKG2JKxJUnQmBoyYwUjYTjwpiG
 LzbemwGnrE3WwwyCfneg3YNd9kdypNQxp6jCuPXO9ZLEDCAjIpxP+d/YLo9qVrVo9E
 VuBIWlDPwi3BcL8735Qcg0NaoNrA4fxqyjGi1IvPBL8h9ceUt3FX8pK8GwOjmE6sTf
 OZqBXL0sGjdkIeQUL/GNkcLBJ2r8IaZl5PEjyFWpy07/UPGgwJDLCJw96uAGDULfua
 AceGo5xy4hfJtMc8BOarTUexozbSlCMzLbrZ+27NxvQBI+3lqD4a9Wqc5lnJBxp0Kz
 PUK899RLlA1vA==
Date: Mon, 20 Oct 2025 15:42:59 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <20251020204259.GA1591976-robh@kernel.org>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
 <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 imx@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: bus: don't check node
	names
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

On Mon, Oct 20, 2025 at 08:09:50AM +0200, Wolfram Sang wrote:
> Node names are already and properly checked by the core schema. No need
> to do it again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> I'd suggest to give subsystems some time to pick this patch before
> Rob applies it?

Not really any subsystem for this one, so I've applied it. The rest 
should go via subsystems.

> 
>  .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-
>  .../devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml       | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
