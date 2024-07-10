Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF02D92D4CB
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jul 2024 17:16:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 698E5C6DD72;
	Wed, 10 Jul 2024 15:16:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00E0FC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jul 2024 15:16:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEAC71C0004;
 Wed, 10 Jul 2024 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720624583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qbzKLd7ErNBgkbYzecOVb1namw7uD3ODB1goMPPdBkM=;
 b=XqnjmAhVOuJsiBws3R+w+psrQpNgCAdH+iSYZDUagZ+SAu6rZKt6jQtkwDFDoJNEMTdAGX
 vCdWn2og/C/5eDOVYsxTRpC7d+wHRM+Q6RdI/TuaHNzSP02/8NWg+Bgm2jakSQ916rTEb+
 yGrZCBll5elU5JByE4C4u3uj8lQJ0zCWxwKXg8juJ8ZqzTML2bJV1IAz0TX95+qlMK4Rd1
 q4vW/Qk2ZuEpZM9bxoWCU77NVHXZrzLpsP2GmBsi4UD3rQjnoL+t+BxM178Zj4IDaB1WC7
 9caRRFE5hkYDUNf1gU/zohoRVpFIrERn4hSgdMSX1TpWkLxPIpWhp39kXruALQ==
Date: Wed, 10 Jul 2024 17:16:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <172062457006.735991.3860839372097638119.b4-ty@bootlin.com>
References: <20240708153434.416287-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708153434.416287-1-valentin.caron@foss.st.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] rtc: stm32: introduce new st,
 stm32mp25-rtc compatible
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

On Mon, 08 Jul 2024 17:34:32 +0200, Valentin Caron wrote:
> Introduce new st,stm32mp25-rtc compatible. It is based on st,stm32mp1-rtc.
> 
> Difference is that stm32mp25 SoC implements a triple protection on RTC
> registers:
> - Secure bit based protection
> - Privileged context based protection
> - Compartment ID filtering based protection
> This driver will now check theses configurations before probing to avoid
> exceptions and fake reads on register.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: rtc: stm32: introduce new st,stm32mp25-rtc compatible
      https://git.kernel.org/abelloni/c/1746a61a0248
[2/2] rtc: stm32: add new st,stm32mp25-rtc compatible and check RIF configuration
      https://git.kernel.org/abelloni/c/efa9c5be2cae

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
