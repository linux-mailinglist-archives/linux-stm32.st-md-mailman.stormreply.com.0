Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C2EC6D183
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 08:27:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FE3BC62D37;
	Wed, 19 Nov 2025 07:27:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2C89C628B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 07:27:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8467C405B4;
 Wed, 19 Nov 2025 07:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BEDC4CEF5;
 Wed, 19 Nov 2025 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763537226;
 bh=VkvhOm7Im9NgLtpOPK9Ghu9qT2h9mz/GyVCt//vfA7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WhO9mwHDxV98gAchLiwpCG+KlIE2c1uS/9x3vAEoRyZPn32WURzsAUQgF/vAAv5xu
 KhSA1PATm9Oe1JjpqrFNIWIk3NYvGS6/+Rc07+w8xphZUVdSrq879yAlTfl46ex9dl
 AHhbmAvvMASzQPgZRa/e5kE8ccwirjMzxst/kzoglsm/siP1DLuoU5ABQGvH4gUKM1
 aK0LhtRX48pvKCN3gRGtB/aHTcyKaXSjIFKzS5EW9MaE9FsZk2GXtj0+tixwZ2S51S
 GcM7goKQVm/v+E4yD5Gw7tDGgatsA6SQ2DuZllJ8Xpy9CoVpGDhpiv7QNqWJ7vEM6+
 0xgw1gJByipUw==
Date: Wed, 19 Nov 2025 08:27:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <20251119-ambitious-tuscan-scallop-ecc1b5@kuoka>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
 <20251118161936.1085477-3-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251118161936.1085477-3-antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/15] dt-bindings: pinctrl: stm32: use
 strings for enum property 'st, package'
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

On Tue, Nov 18, 2025 at 05:19:23PM +0100, Antonio Borneo wrote:
> The property 'st,package' reports the SoC package used in the
> board DT and is used to inform the driver about which pins are
> available for use by the pinctrl driver.
> It has historically been declared as an uint32 enum, where each
> value is a power of 2.
> 
> Deprecate the use of the numeric value and replace it with more
> readable string values.

The "SoC package" is defined by top-level compatible or by soc info
driver. It is not the property of pinctrl, therefore if ever touching
this, you should deprecate entire property instead of growing it.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
