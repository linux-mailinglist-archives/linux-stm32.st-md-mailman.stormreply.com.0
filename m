Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 151BB910E8F
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 19:31:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2675C7128D;
	Thu, 20 Jun 2024 17:31:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EA21C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 17:31:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 27D05621F7;
 Thu, 20 Jun 2024 17:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E54C2BD10;
 Thu, 20 Jun 2024 17:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718904682;
 bh=c07EwySV5A8jyBItyxYvOoGB6xh76nUFiW66NCfaRWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XqTtOATUvwlDYXLFMQX0a7F6u0ozKkRdNk9dpdW9p+sV9iHMSGhNwFzTuTKaVY0OS
 gRSCLXGMnwsH5XJNlQLjm2/Io5kfSfemcVIH22LiBX39gQOUMe2JqIE0dBEFXB7mD2
 Iy+RdOZe7GRR81nEm40hlDkq3y6ltI54V9BHcupMlm3Xs4QsH8EXI7t40q77uQMRvy
 V/W2Ind/qTVPKWTnJa9irSlCJwd6rk4yzd/rYn5eoKlZU3gmlF08ilWNC3T0HEL7lu
 hgyDe4q24UIqdh7JuJmFY2NxOWikW+nHAT3R9Z4wt4UF+2PzhtIntH2XM2Rj2pbZos
 kN0W+jAVwNb6A==
Date: Thu, 20 Jun 2024 18:31:18 +0100
From: Simon Horman <horms@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20240620173118.GP959333@kernel.org>
References: <20240619140119.26777-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240619140119.26777-1-brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: unexport
	stmmac_pltfr_init/exit()
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

On Wed, Jun 19, 2024 at 04:01:19PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> These functions are only used within the compilation unit they're defined
> in so there's no reason to export them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
