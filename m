Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC1C9FBC90
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Dec 2024 11:42:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60BF8C78030;
	Tue, 24 Dec 2024 10:42:37 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31EA9C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 10:42:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 307C3A41494;
 Tue, 24 Dec 2024 10:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7BAC4CEDE;
 Tue, 24 Dec 2024 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735036949;
 bh=5Cxrf1mpeQlP/xWn7RoT5esd+s9F+bviYF/k+MUUJzo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kgLaYMf8AHYU+htlhj548Ui1vPAqKVTqHUmL/iWSdJsPElGkHLofpbGEMAqqTqIij
 TknIT0wk/gTNBeI5ci7LA7GE1npXcf8ewzwmIi/YoEE42oC+pxQKegdkl4hZY1Zmw7
 /47S0GmI6XDSBuRkH4Y8EigI9HadUvFi6aO27vBGZsXsQMemepZ26mNXYnrnXhQTxw
 BjjDcp8jWR2Sd2mIKSRGbYy7TwiPwshMPoyvIdCqZu04/Vz/JME4JZIVW37Z/ZzaHM
 fkWuIzimh9AncZiw5uLZDH8UG6lJD0cb9A3A27v2qj53j7BjRg7H7a+YfUpLi2PZ+A
 L5rb98Mp3cjDg==
From: Vinod Koul <vkoul@kernel.org>
To: Ken Sloat <ksloat@cornersoftsolutions.com>
In-Reply-To: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
References: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
Message-Id: <173503694532.903491.10482380884670352908.b4-ty@kernel.org>
Date: Tue, 24 Dec 2024 16:12:25 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: dma: st-stm32-dmamux: Add
 description for dma-cell values
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


On Fri, 06 Dec 2024 06:50:18 -0500, Ken Sloat wrote:
> The dma-cell values for the stm32-dmamux are used to craft the DMA spec
> for the actual controller. These values are currently undocumented
> leaving the user to reverse engineer the driver in order to determine
> their meaning. Add a basic description, while avoiding duplicating
> information by pointing the user to the associated DMA docs that
> describe the fields in depth.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: dma: st-stm32-dmamux: Add description for dma-cell values
      commit: 54e09c8e2d3b0b7d603a64368fa49fe2a8031dd1

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
