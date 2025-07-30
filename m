Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E4CB167DE
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 22:56:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C4C6C3089D;
	Wed, 30 Jul 2025 20:56:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27C4CC30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 20:56:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 99E9B44744;
 Wed, 30 Jul 2025 20:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D34CC4CEE3;
 Wed, 30 Jul 2025 20:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753909015;
 bh=meJm08gIW/vRrCYpVEM3urM9k5Mm+PBeXQeuvnQVQVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R/abVUfbuP7icZl+93Lwq3my8o2/6jYbJCSJ0QiaT84VAMWsguxPTRoaNY3GpCz6W
 TyzKtkhybnWvlCMN/wRcxd5rwQd9lzfZ4gBQ1R5snp7d0gO2KB0wqAUBzQgvDWQDv4
 gvKTMqalfwzGGXkZOb52EDKsLC+5bk2v2cgq1IBaqlHWcjZ16LasrbxA//uQ462lrc
 I81cbSHyXF9EeRXShOA+lG3Ex2Qt7PJx3D9QmZl80sRV2Z0MCRxig1sWAIHGtJ+oEB
 l4FeT15ITP8uapf9qWEUqtO2ZartcWM0t6tQrgJ8GJhO6Vbo4Z2fQFo+t+/VvxKVqe
 UcaQvCMWw/m+w==
Date: Wed, 30 Jul 2025 15:56:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Message-ID: <175390901389.1733801.13463071578614787293.robh@kernel.org>
References: <20250728071438.2332382-1-joy.zou@nxp.com>
 <20250728071438.2332382-3-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728071438.2332382-3-joy.zou@nxp.com>
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org,
 alexander.stein@ew.tq-group.com, catalin.marinas@arm.com, Frank.Li@nxp.com,
 edumazet@google.com, festevam@gmail.com, peng.fan@nxp.com,
 Markus.Niebel@ew.tq-group.com, will@kernel.org, frieder.schrempf@kontron.de,
 linux-stm32@st-md-mailman.stormreply.com, primoz.fiser@norik.com,
 kuba@kernel.org, pabeni@redhat.com, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
 linux-pm@vger.kernel.org, othacehe@gnu.org, richardcochran@gmail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, shawnguo@kernel.org, davem@davemloft.net,
 linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v7 02/11] dt-bindings: soc: imx-blk-ctrl:
 add i.MX91 blk-ctrl compatible
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


On Mon, 28 Jul 2025 15:14:29 +0800, Joy Zou wrote:
> Add new compatible string "fsl,imx91-media-blk-ctrl" for i.MX91,
> which has different input clocks compared to i.MX93. Update the
> clock-names list and handle it in the if-else branch accordingly.
> 
> Keep the same restriction for the existed compatible strings.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
> Changes for v7:
> 1. add clocks constraints in the if-else branch.
> 2. reorder the imx93 and imx91 if-else branch.
>    These changes come from review comments:
>    https://lore.kernel.org/imx/urgfsmkl25woqy5emucfkqs52qu624po6rd532hpusg3fdnyg3@s5iwmhnfsi26/
> 4. add Reviewed-by tag.
> 
> Changes for v5:
> 1. The i.MX91 has different input clocks compared to i.MX93,
>    so add new compatible string for i.MX91.
> 2. update clock-names list and handle it in the if-else branch.
> ---
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 59 +++++++++++++++----
>  1 file changed, 47 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
