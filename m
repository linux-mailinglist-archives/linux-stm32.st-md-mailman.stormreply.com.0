Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 197898967ED
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 10:12:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5008C6B45B;
	Wed,  3 Apr 2024 08:12:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85350C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 08:12:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DF8B240006;
 Wed,  3 Apr 2024 08:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712131950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7VmNXsVVzmynD0RU3YYpBwDxDMYzHSxROIRJMRyMYA=;
 b=DUci3QcCRqYH5n73+mf4W+BNdIe3VGa+vtx+ctsNebBek1RSWvHApFxoQJzvKWUsv8YBTP
 UvzQf4DtfkKGx2LaJ9vabDXwb+f7KkMl4cpHgtkaL3UOCZyRd7hIk7pzt0LocBxxEA/cBI
 xExFOxrTFKOaWNfwJ6ZnG8qw43TALkGhtgW3WK07ctTwEGQa7fgbiA4U7o6TzxKVrMpm89
 C0SbOM3d1XKJ4IC7YUokK9z1qrk0QNlCQ8qnyQlCFJSXeH0FijWN6msIRniXwrSOWhr+Wt
 lENNnrgDar/k4as8GHDSY9G6tuNkItv69gyiPQPlGKowzyzSQaOWNBNwWGJVnQ==
Date: Wed, 3 Apr 2024 10:12:26 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20240403101226.3db69df9@device-28.home>
In-Reply-To: <E1rrgQO-005ZOA-KT@rmk-PC.armlinux.org.uk>
References: <ZgwoygldsA1V8fs9@shell.armlinux.org.uk>
 <E1rrgQO-005ZOA-KT@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 netdev@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-socfpga:
 use pcs_init/pcs_exit
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

Hello Russell,

On Tue, 02 Apr 2024 16:51:48 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Use the newly introduced pcs_init() and pcs_exit() operations to
> create and destroy the PCS instance at a more appropriate moment during
> the driver lifecycle, thereby avoiding publishing a network device to
> userspace that has not yet finished its PCS initialisation.
> 
> There are other similar issues with this driver which remain
> unaddressed, but these are out of scope for this patch.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks for addressing this,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
