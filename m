Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9B3956D0
	for <lists+linux-stm32@lfdr.de>; Mon, 31 May 2021 10:22:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEC97C57B5A;
	Mon, 31 May 2021 08:22:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBE7AC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 08:22:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F4296103E;
 Mon, 31 May 2021 08:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622449331;
 bh=0fzSp4PUDxkbwQ9WVqH4hcCf2zwEpJ8nEwsSxZ2qXMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P5g4kmWxKRIiQlmEELmFcy6P1q0RX5632M4WRbMgqcNCbRP6y5hK+7+hhJl5D+jQk
 WwMtH3WilvLZLAj6RU4dHzJIKHpDrgy+pOSKxgWgEd7rA4+W/p5PdqPLi+EKTNayUb
 2pze2E3bht8vC6w8o6o9XLSiy1PzK2QqGpYLKhL9hB59aY0ciITrPZ9jhp4zgZPShj
 ZgGGh+nT8r4lCx7IEx385D7OfIcTXac3p05zeBCKaCi7lpDQNiQ5cxdVQb37MdpQVZ
 acRkKVkigDkmhLNMbpU71vcBjRa4k0Q6lDwHwT6oo1zGaMCuwtjW2JFI38wz/WK/O/
 N0G8jzqmrmS1A==
Date: Mon, 31 May 2021 13:52:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YLScr5BwfLkk80eF@vkoul-mobl.Dlink>
References: <20210517120821.26466-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517120821.26466-1-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 0/2] STM32 USBPHYC vbus-supply
	property support
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

On 17-05-21, 14:08, Amelie Delaunay wrote:
> STM32 USBPHYC provides two USB High-Speed ports which are used by controllers
> with Host capabilities. That's why vbus-supply has to be supported on each
> phy node.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
