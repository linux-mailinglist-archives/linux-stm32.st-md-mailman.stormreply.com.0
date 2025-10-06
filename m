Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E695DBBF666
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Oct 2025 22:53:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8C40C349C0;
	Mon,  6 Oct 2025 20:53:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E8F5C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Oct 2025 20:53:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BA49A43890;
 Mon,  6 Oct 2025 20:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7199AC4CEF5;
 Mon,  6 Oct 2025 20:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759784017;
 bh=0tCd4WF0gQtfi6/fB2e1mBANwyNMnWMhiYWPsP6L4b4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=igLEaH4CU8kFnBHLB8+7B/C+/775mvsFWWGMwqL/+iOGRFpic5iwoBGBCMunOKQj1
 caxJUTzwJQsFj2+GTKVA6x/Be2ciFIV2vsPxOfFlpyGSixxfYrPNA7mop0Y/RHFVwb
 EpGtxCL4NdwCKZVUF9bL3615/Hxt7B+dxTWxJ+0vb6rRvgUWm2ViiTR5Vz0b5qmFq1
 UYctq6gFsHmXYLXJvjJxwYlTilTF0ODJsEqgfztVaGXLR4iIPPcy7DEG0yGPHtDyfB
 2Z1qb8LOySvxZP5qoUzlwxq91n1FVsrIWGyj0S7srBm56v0dsTqyYwM7gBAIuktG07
 5SwJceazLJCBA==
Date: Mon, 6 Oct 2025 15:53:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Message-ID: <175978385977.561952.12777844195936444721.robh@kernel.org>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
 <20250926-backoff-table-support-v2-2-16d3726646c4@simonwunderlich.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250926-backoff-table-support-v2-2-16d3726646c4@simonwunderlich.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH mt76 v2 2/3] dt-bindings: net: wireless:
 mt76: introduce backoff limit properties
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


On Fri, 26 Sep 2025 12:04:53 +0200, Sven Eckelmann (Plasma Cloud) wrote:
> Introduce path backoff limit properties in mt76 binding in order to specify
> beamforming and non-beamforming backoff limits for 802.11n/ac/ax.
> 
> Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml       | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Though I know nothing about this. Is there any reason why this is 
all specific to mt76 rather than being common? Perhaps these settings 
are all just part of the opaque "calibration data" in the QCom case?

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
