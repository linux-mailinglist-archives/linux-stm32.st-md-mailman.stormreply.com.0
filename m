Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 713B896619
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2019 18:18:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29B16C35E01;
	Tue, 20 Aug 2019 16:18:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C547C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 16:18:26 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9EE222DD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566317904;
 bh=vSKsKdK9IvnILRtQlA/Vlb4e7VL6KyuijFf6Qr77Vyo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P8B1UyAjjQcRVTw4CZkWfoT3CVeiiSN+krnpT0XNAUC5xZZyDdaz1GnUiGG8t91wq
 g/Tt2ARlyZku7kDE4IH6F4nPPD67lIT32044zY8ETRAoFimCAvNHIWwm8YE3yLwwbu
 JmxlX44VlwYGODQVsf+f9OAssEmXFY+Y3LG8+oKQ=
Received: by mail-qt1-f177.google.com with SMTP id z4so6686897qtc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 09:18:24 -0700 (PDT)
X-Gm-Message-State: APjAAAU/DyGlDUJu+hZX6DUNFmsB9ab5HSrU5xiLvzIjMW8dmKaWxxvH
 rDO6tRWy92Uij6xig5t7sgMssCxIrh0SaKnERw==
X-Google-Smtp-Source: APXvYqycMaa214ptNayJBYSEm7y6VToBsSlNqtP2In+5+f5juo9lDSmILxM4UZrWQJSIt7mf+ihWQZGtHJECipi/vbw=
X-Received: by 2002:a0c:9782:: with SMTP id l2mr15058937qvd.72.1566317903978; 
 Tue, 20 Aug 2019 09:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190820145343.29108-1-megous@megous.com>
 <20190820145343.29108-2-megous@megous.com>
In-Reply-To: <20190820145343.29108-2-megous@megous.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 20 Aug 2019 11:18:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL-fBA5fV=AwegyGpCKAEHtU1C6MZQX9dNYs0tpL9EbVw@mail.gmail.com>
Message-ID: <CAL_JsqL-fBA5fV=AwegyGpCKAEHtU1C6MZQX9dNYs0tpL9EbVw@mail.gmail.com>
To: Ondrej Jirman <megous@megous.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: net: sun8i-a83t-emac:
	Add phy-supply property
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

On Tue, Aug 20, 2019 at 9:53 AM <megous@megous.com> wrote:
>
> From: Ondrej Jirman <megous@megous.com>
>
> This is already supported by the driver, but is missing from the
> bindings.

Really, the supply for the phy should be in the phy's node...

>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
