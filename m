Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85881AD82FC
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 08:14:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E8B0C36B31;
	Fri, 13 Jun 2025 06:14:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 713E9C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 06:14:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45C08442B2;
 Fri, 13 Jun 2025 06:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749795282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=whxBYE463gQ4dvnKL9epaVnqgXjwtqwBi/Pgw4zDGAo=;
 b=Qg6CdPM/9/G53Ye6rnkUDr/xFI5pnFi0Qc2CNo1k5EJ9FV6eeqEo9HcGkBncQNINKnTK98
 fFM2dOiZpmv915v6xjq0WEIz6AmeUYd9byqGSpg+Lz4n8SxLd86euyc46UGqdsULU+N1Tc
 7WrZMQVzSXLDZtvOaX6ufHwhVYG9UmE+/DwyiMg8vIuR7BiHJXLYgnbL+78gmDh/qqAFrP
 +qgd+urf+ygVbQn5z2gtF0L0ClUhuNkizcnLVIm99OlxY+N7yXptSwfSPx3ETcyV1dyNrQ
 Pa/ziU7E+M9dWpsuV40eIYOf1Rr85jOcyrkOxOYbTrve/Ll7IorDwei5XjJdTA==
Date: Fri, 13 Jun 2025 08:14:39 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Message-ID: <20250613081439.2ad972ef@fedora.home>
In-Reply-To: <20250612221630.45198-1-matthew.gerlach@altera.com>
References: <20250612221630.45198-1-matthew.gerlach@altera.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujedvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehmrghtthhhvgifrdhgvghrlhgrtghhsegrlhhtvghrrgdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlo
 hhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Mun Yew Tham <mun.yew.tham@altera.com>, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] dt-bindings: net: Convert
 socfpga-dwmac bindings to yaml
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

Hello Matthew,

On Thu, 12 Jun 2025 15:16:30 -0700
Matthew Gerlach <matthew.gerlach@altera.com> wrote:

> Convert the bindings for socfpga-dwmac to yaml. Since the original
> text contained descriptions for two separate nodes, two separate
> yaml files were created.
> 
> Signed-off-by: Mun Yew Tham <mun.yew.tham@altera.com>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>

Sorry I've been spending some time away from netdev@ lately... This
looks very good, again thanks !

Unless there's some more comments from the DT bindings maintainers, you
can add my :
 
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
