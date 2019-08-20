Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0904C96624
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2019 18:20:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C43F7C35E03;
	Tue, 20 Aug 2019 16:20:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E04B5C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 16:20:35 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A795233A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566318034;
 bh=MhrM+wnpo98DgCvfrw9p71rUiiQM/sQQEu+zF5hCEp8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tbPSe22P0yz80TXNq+TmiToY5Gbdd0QxeDFmQRKu5Ab/jv0rBQmWVmx5VHcyohU9E
 hqStg44RSY2kOyVylH5IMtvL8hTYXAs6XgqvTgi7+HXsdEoe5B9ToOJwko/jiNU7ul
 Wvz6OTpFY1A7xSXjAko24tJBv7z2fLHTP8z84w20=
Received: by mail-qt1-f176.google.com with SMTP id x4so6692199qts.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 09:20:34 -0700 (PDT)
X-Gm-Message-State: APjAAAXY2qQbJwaqgvYJW/LKNmZ9i7Uf21BxoKfvztyJPyYHDUCU9rNH
 FY81HK1JPhY0Z7NRDo9aFW08L7J+G57bSZsI3w==
X-Google-Smtp-Source: APXvYqxQulqOuuzJ0nzppEZjKqYQUJ1LWIXaKSrDPdDKV1V49e8+VUYVdf8eB0g9VTWSMt7oK6gWHJ7swc+TgOoIpDE=
X-Received: by 2002:a0c:eb92:: with SMTP id x18mr15088587qvo.39.1566318033661; 
 Tue, 20 Aug 2019 09:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190820145343.29108-1-megous@megous.com>
 <20190820145343.29108-3-megous@megous.com>
In-Reply-To: <20190820145343.29108-3-megous@megous.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 20 Aug 2019 11:20:22 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLHeA6A_+ZgmCzC42Y6yJrEq6+D3vKn8ETh2D7LJ+1_-g@mail.gmail.com>
Message-ID: <CAL_JsqLHeA6A_+ZgmCzC42Y6yJrEq6+D3vKn8ETh2D7LJ+1_-g@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: net: sun8i-a83t-emac:
	Add phy-io-supply property
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
> Some PHYs require separate power supply for I/O pins in some modes
> of operation. Add phy-io-supply property, to allow enabling this
> power supply.

Perhaps since this is new, such phys should have *-supply in their nodes.

>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
