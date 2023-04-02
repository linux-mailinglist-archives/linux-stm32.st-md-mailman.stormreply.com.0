Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 447E56D387F
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 16:41:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDD45C65E56;
	Sun,  2 Apr 2023 14:41:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00BBFC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 14:41:18 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r29so26787519wra.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Apr 2023 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680446478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZrZkQDilPn1vacJZvzA6Nj9qCFTdPg8cOLsQDyidsM=;
 b=AWiAEpgmtq1ABmkIlHJMb3ekqLp/o5PBApXYHaUJd6fMBgINSst8BmJ/pgShbKKOeS
 k8wBFhY8/TOYGeGJnneNHpDQP3X0kyBdLdEufd36IBRxu5BjW+r4ms5yZy3oQpbROla+
 HuK0LSYtls5NDlBQiaKRY6pjE12QvLR0gdxZvzJPCpW0i1hfsep+nLFMs1KEs4LJMcoz
 MsllhAHbGZPXJN1p8RKV2TlnjCVbftkHvtY88q6n5HKQ0gQVYOf2Bwz+KuEPeA/ZRo7n
 AEdvOz6fpYyC8XMB9IgZpTx0TkjyMuthpPmYX+kcLN7IfSIMZNA86JgEs0+mJQRN69Nx
 1AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680446478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZrZkQDilPn1vacJZvzA6Nj9qCFTdPg8cOLsQDyidsM=;
 b=bYK/vOGvZ6iMZcFgA2ssVJTFbz2eWZQdQxNL5pKpq/Z76jQE91rvsmIz+1Ncja6rLl
 +w1rA3uk7HgcUJBRFClz9TmBES7x4tUsKpVYoe+meGvNfuvLLyApVchIenyor5nH0Pmd
 PFI9OYY9eET7jL7aHTYDe8magBlUt4FG3o8cK2aH2nasU9tJbRdCz4LvvFx3FbnUl3oW
 FyphYSzcG0PgJMRFR/xY6CEh4CEWsa/Thxsj25ggUl5ZpfiNtxweh+c4GXypV6CF0MxX
 0thFi0m8bjnBYfC/Vaat0Zh4CIQhAtXmT7aL4CyFpop+4RrToa1pE7GpUOH/O990G1QJ
 1iBA==
X-Gm-Message-State: AAQBX9fRSE53vUZaUbDNgdwWCtsoe9W2ssf27U6LuKeKhy0LTC1a099b
 oe0YEEX3Gs9rb6bUsq1ZHG0=
X-Google-Smtp-Source: AKy350blBuOVV+IjEZR9/y8oar0G5BwMskydAcUw+0jw7gSYoEmOmZAUU8e+M2Tp1dBCe1Rkl1g83g==
X-Received: by 2002:adf:f38e:0:b0:2dc:c9c0:85cc with SMTP id
 m14-20020adff38e000000b002dcc9c085ccmr26600215wro.59.1680446478145; 
 Sun, 02 Apr 2023 07:41:18 -0700 (PDT)
Received: from jernej-laptop.localnet ([209.198.137.155])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a056000136a00b002c6e8cb612fsm7363100wrz.92.2023.04.02.07.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 07:41:17 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Sun, 02 Apr 2023 16:41:14 +0200
Message-ID: <2674462.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: linux-oxnas@groups.io, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] Re: [PATCH net-next 01/11] net: stmmac: Make
 stmmac_pltfr_remove() return void
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Dne nedelja, 02. april 2023 ob 16:30:15 CEST je Uwe Kleine-K=F6nig napisal(=
a):
> The function returns zero unconditionally. Change it to return void inste=
ad
> which simplifies some callers as error handing becomes unnecessary.
> =

> The function is also used for some drivers as remove callback. Switch the=
se
> to the .remove_new() callback. For some others no error can happen in the
> remove callback now, convert them to .remove_new(), too.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c  | 9 +++------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 9 +++------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 ++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c       | 2 +-

For sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c    | 4 +---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 4 +---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h   | 2 +-
>  17 files changed, 22 insertions(+), 33 deletions(-)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
