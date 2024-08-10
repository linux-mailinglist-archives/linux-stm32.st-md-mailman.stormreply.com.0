Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5FC94DC1C
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Aug 2024 11:51:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45428C78021;
	Sat, 10 Aug 2024 09:51:44 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E92FC712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Aug 2024 09:51:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7F853CE1318;
 Sat, 10 Aug 2024 09:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC652C32781;
 Sat, 10 Aug 2024 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723283494;
 bh=cTqL5xUWw00ey23oEIyGFCO8ELq1yoTqJ70ikIFg6Q8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n6UyPYKV1YKJai8yOSp7iJnOBvvjmhHbwzQgbbU8upVe1vgsV6nFii27yHIHYy9LB
 W95vaHHMFmoJbtkBV0ehXYHe/dSuPCccv7SY9bs+sF12KV8vpeTFn24Eob/0gDZlfN
 yO9f9yx+gyAnR+zQZI/M7vZqioCUBp0jYabFkl51RMIJSouYvTZs5N6TFirfrvb3JH
 bsJGyekpDbU4s9diRaKrxXzqw+11+SEBzOCUJfyGLjyQXdW4Syq7mryDqKlQYO+OH9
 pBgce2jyvVXQrOhXIVD1+cangixuX5aeps/SIMqBAfaymYMYw2MsUKkQ+NxakkPRhp
 E1vCsGs5343Vw==
Date: Sat, 10 Aug 2024 10:51:29 +0100
From: Simon Horman <horms@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <20240810095129.GH1951@kernel.org>
References: <20240809082146.3496481-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240809082146.3496481-1-o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] arm: dts: st: stm32mp151a-prtt1l: Fix
 QSPI configuration
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

On Fri, Aug 09, 2024 at 10:21:46AM +0200, Oleksij Rempel wrote:
> Rename 'pins1' to 'pins' in the qspi_bk1_pins_a node to correct the
> subnode name. The incorrect name caused the configuration to be
> applied to the wrong subnode, resulting in QSPI not working properly.
> 
> To avoid this kind of regression, all references to pin configuration
> nodes are now referenced directly using the format &{label/subnode}.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Pass
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
