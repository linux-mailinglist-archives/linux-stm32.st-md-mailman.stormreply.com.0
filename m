Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E874CC459D
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 17:41:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3F08C7A834;
	Tue, 16 Dec 2025 16:41:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FDEEC01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 16:41:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A47E54421C;
 Tue, 16 Dec 2025 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EF5C113D0;
 Tue, 16 Dec 2025 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765903288;
 bh=glph62P7/Du4L/3zXD5ZSp61IfKb8z3u5NBivwGvyHc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UTSV+DLObsuIg8F42cTPdSxFgpaSaHhToXwVdstqF3sHCOidUNUBhS68w184Nhqks
 s//HVY2Kzi3RWoTBzOve0RRyfroC5brIzvI3RZfl2bdpRMSYLO9i270EXaSMGHQ+gt
 eJI8E66Zo4PjdHlSAEe2NhN9ayKou8oQ0pwEh7SKx62R7czgfBVQ7veUq1jEkTlMDQ
 XN0ipskMG/x7vaE3ubud0qTrv7aAkdAWXGbU3p7a8ngdoRef9m8t4sor4EgMmAVqvk
 zSQKBvD48JP/LWaUQu6Otnw8jFYX1lBIkwUCZ3rJdpZQKEqchIURbgjKmptRW1smDD
 mk0ZPEXtUdlGg==
Date: Tue, 16 Dec 2025 10:41:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <176590328507.2607309.18218209388270739835.robh@kernel.org>
References: <20251215212700.3320634-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215212700.3320634-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: bus: stm32mp25-rifsc: Allow
	2 size cells
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


On Mon, 15 Dec 2025 15:26:59 -0600, Rob Herring (Arm) wrote:
> There are users already with 2 size cells, and there's no reason to not
> support that.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
