Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A68899F4B8C
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 14:06:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 600A9C78014;
	Tue, 17 Dec 2024 13:06:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91874C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 13:06:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FC6C40009;
 Tue, 17 Dec 2024 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734440781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0HD5+UGwPhPjBTRomgMW1WMHP3Ot9+Wi9ed4vzq6Oo4=;
 b=oRbaBnyXDJFZn1UBMCOUL8udFQoFdfQ/7OLxQ6Av1DNPffbCo2AS9KhCVm6RuJK2VKy57R
 pqSivEIciVVKEoGDz+rJaFC1c/DgDUqoPkhccB75V2bHN+Cz6ZNCGJgYrEH5MqdEQQMNGq
 bOUb1h/rlXCZF6q6JGvMm8Q6gbCP5IN3aIKU7I2XqNDBC2ixLOpR3bJRlnB8GCdAPNs5Eo
 cchPboxxjf9s5kcAk8gziPNqTJMltTjYcM46078lyB5ZfMVeR8vpodyQ5KoPMhIc2TJc9g
 lzulpSxwHX4RS/4eMQUXRL3p0OwvGXsmv+xCMy5+ir1PVHcIYzsKazRIQG4fMQ==
Date: Tue, 17 Dec 2024 14:06:18 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20241217140618.0debd644@fedora.home>
In-Reply-To: <E1tMBR5-006vaS-Ou@rmk-PC.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
 <E1tMBR5-006vaS-Ou@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/5] net: phylink: add support
 for PCS supported_interfaces bitmap
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

Hi Russell,

On Fri, 13 Dec 2024 19:34:51 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Add support for the PCS to specify which interfaces it supports, which
> can be used by MAC drivers to build the main supported_interfaces
> bitmap. Phylink also validates that the PCS returned by the MAC driver
> supports the interface that the MAC was asked for.
> 
> An empty supported_interfaces bitmap from the PCS indicates that it
> does not provide this information, and we handle that appropriately.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
