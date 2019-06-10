Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 242EF3B87F
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 17:50:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB2CFCD9476
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 15:50:34 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECAF7CD9475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 15:50:33 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a15so8949313wmj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j0cvrW0LiR2yAWHacC+paieH/BsPhO653fx0ilOqwbQ=;
 b=XrYcjT7N66H7PZl89qVvjkYy2lcUUR+p2y5QlMqTrKSYLfpAHr+5bhPvrKUDoDW2Gn
 gc8KQUOivmTgSCQR5PIvdxh3Np5UEb4HOX5Y/TgrcVFjLu1N/l6ZRZHcLQwZoZkFB2PK
 dnHDV+JZ8jRZwikhp0mK3D3c9YrIoYwTbrv+XI3t6hXqkMvOg/CU3HdRVKBqqbiWsoYb
 ZmrGKLaXtkNsJEc6GlFos05req6azeUDaSh/0lsYh1U2oaNxBegmv6xh+NlQSfkKDqss
 qqcF/nZdT+NcxD5fD2IRb0hwvT8zPzyEN97nHCywHGtE8NnApD9T/+hYylByZ803tbq9
 bqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j0cvrW0LiR2yAWHacC+paieH/BsPhO653fx0ilOqwbQ=;
 b=KDV15Rg6Fa2yy7RTP91IbMY95F3EhFhKO4jr18HQoGhfW2gcqw8jKj5AmNWpnebb1K
 mL8qZeYi4EceKxAk5tAM0Mt7NrSPlwOidX9ONZV9HKq8WQp6rUpuIFykH89bkpt/xvWm
 BAdZ0KIFe9AoN3up5SyMpWWi+g+q8wXUrZKQ9vKR6wdPQRXqZiX51s24HjA8XggteJTW
 akS1a2sqpoSLAc7DBfttNpyHrYwmnUUK+BKllBCeYcpURuUBGIKPFbuUx4fOJUKpWNNS
 NKB0nN189wA715wkO+urmvMMCirs6kZaEQ3VRgEPWiBxGD+wcITFnG0bbzbc43bzVe9G
 RC2A==
X-Gm-Message-State: APjAAAWJhuQSBgyE2AOGr2vWoYkcgm1NONxfW8RDwILK5DBMGcgNCGas
 6oA02/QmLbIIUSM+r9GbU0U=
X-Google-Smtp-Source: APXvYqzLna+aVnK3OUUKYltUUrEa4DJqameWzsVBUOMurnw3ZFvBDcb4Rdm+t6M1JqO46Sv5jxt2fg==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr14836813wmk.127.1560181833344; 
 Mon, 10 Jun 2019 08:50:33 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA40000C4C39937FBD289.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:c4:c399:37fb:d289])
 by smtp.googlemail.com with ESMTPSA id z17sm9711917wru.21.2019.06.10.08.50.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 08:50:32 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>,
	netdev@vger.kernel.org
Date: Mon, 10 Jun 2019 17:50:11 +0200
Message-Id: <20190610155011.4305-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <ff6306c71a6b6ad174007f9f2823499d3093e21c.1560158667.git-series.maxime.ripard@bootlin.com>
References: <ff6306c71a6b6ad174007f9f2823499d3093e21c.1560158667.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 10/11] dt-bindings: net: dwmac:
	Deprecate the PHY reset properties
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

> Even though the DWMAC driver uses some driver specific properties, the PHY
> core has a bunch of generic properties and can deal with them nicely.
> 
> Let's deprecate our specific properties.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
I am not sure about the yaml syntax for deprecated properties but
the description inside the .yaml file looks good to me so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
