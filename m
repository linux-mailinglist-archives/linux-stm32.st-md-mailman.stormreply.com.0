Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D9B50AC6
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 04:08:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72DCFC3FACB;
	Wed, 10 Sep 2025 02:08:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADB25C3FACA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 02:08:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8AF4360230;
 Wed, 10 Sep 2025 02:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F02FC4CEF4;
 Wed, 10 Sep 2025 02:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757470120;
 bh=oXLn8INDpdCoJrpkQGlJIpgFhY/DdHeBq7FxlLPN/QA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GITImNdl8yjBYTBk+yQX/0uVI7ltS4/7XTrkNfaxIJHXYKft1RXu9SwcEiy/Sy5bs
 6bdVpM6Gwf1mjLTdS9K5NE+Pl3DXTqFkPbfYd/R8q3fgo815ac2nao1ORqBMwNhGqk
 3dwdifNPSWhqoyBB6unLZ9lZyRslZOtg+2nqu+DKJqgRNTyMkHjgM2bGZEBNxdC5EX
 7B4lT+XR/2wik9T6Wd+0XsIhMwuaQrVeDpewcB22N9NtIDUSCnIbZrXtJIotOauMI7
 BaAxguReXGE32lMgS9CzrOu9nkoeXk+eP2fJqReOyu5th/roU2pO5hMyPxGJlBHxA5
 kk5KMFM0JGx6w==
Date: Tue, 9 Sep 2025 21:08:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <175747011863.3632305.14159900534334210899.robh@kernel.org>
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
 <20250905135547.934729-3-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250905135547.934729-3-antonio.borneo@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/9] dt-bindings: pincfg-node: Add
 property "skew-delay-direction"
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


On Fri, 05 Sep 2025 15:55:40 +0200, Antonio Borneo wrote:
> Add the property "skew-delay-direction" to specify on which pin's
> direction (either input, output or both) the value of the generic
> property 'skew-delay' applies.
> For backward compatibility, 'skew-delay' applies on both input and
> output directions when the new property is not present or has
> value '0'.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../devicetree/bindings/pinctrl/pincfg-node.yaml    | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
