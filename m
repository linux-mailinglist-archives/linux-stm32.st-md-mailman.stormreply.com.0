Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6533B4E53CF
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Mar 2022 15:00:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CEBEC5F1F1;
	Wed, 23 Mar 2022 14:00:48 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BF97C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 14:00:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B1C6CCE2080
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 14:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EF7C340F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 14:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648044043;
 bh=0iSclD+CWJo049DAjnNmpJPmyTaLxoM33bJuF/qUYIU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jZ+K6QtSrHhnIoImw542na484JXIO49e49FdbBKfgDnU5cncgJ2q8UUGU82ue/Xbi
 KAB+CmdOZ1X58l9kDuVnAV9HtUnKQWpMdvJdL4MVp26ta3q7x+dYSIxNv75EuUBIfF
 cVZxZT/djEZBclgGulDEdZz5nxnPV0ScYwTcKmYB5egJ+ACg2iQobgStpUYixiggOT
 /bqOkJBeAEEnn1gxH8JkMFC+PaRxdRLS/mjB5t3vsKKtQ8rNQIeiiA8hyUCDzA8Z5H
 R3KyQFS7jNouiuGR3lC1pit1u7VdnnNzQ9MzIylbB/nKj2JazUYeCK28O2WomIamp9
 m0qjKUg8PACOg==
Received: by mail-ej1-f42.google.com with SMTP id r22so2995022ejs.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 07:00:43 -0700 (PDT)
X-Gm-Message-State: AOAM531/domszc7suXpcC+t8Io38MHKJVg6ATXbp69Qpu7BFliToZNDw
 58XebFxFbCSaP5loe+5ZWdqtk4zS+6v1QqClUA==
X-Google-Smtp-Source: ABdhPJzJCX1fd6x6XUQvELujRx+GXFcimDLm2YbxSHA7op+nKKjo5EIzA07JjYkwARfwQ/qJhXNGyMd50X5K9s9lP8M=
X-Received: by 2002:a17:907:1c1b:b0:6e0:6618:8ac with SMTP id
 nc27-20020a1709071c1b00b006e0661808acmr109252ejc.82.1648044041365; Wed, 23
 Mar 2022 07:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220314075713.29140-1-biao.huang@mediatek.com>
 <20220314075713.29140-6-biao.huang@mediatek.com>
In-Reply-To: <20220314075713.29140-6-biao.huang@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 23 Mar 2022 09:00:29 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+6XKvS5RcE6j9vRd3JL-Wbi-O6BrcoGQ5xV0Q2ZG8EMw@mail.gmail.com>
Message-ID: <CAL_Jsq+6XKvS5RcE6j9vRd3JL-Wbi-O6BrcoGQ5xV0Q2ZG8EMw@mail.gmail.com>
To: Biao Huang <biao.huang@mediatek.com>
Cc: devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>,
 netdev <netdev@vger.kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dkirjanov@suse.de, Jose Abreu <joabreu@synopsys.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net-next v13 5/7] net: dt-bindings: dwmac:
 Convert mediatek-dwmac to DT schema
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

On Mon, Mar 14, 2022 at 2:57 AM Biao Huang <biao.huang@mediatek.com> wrote:
>
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> And there are some changes in .yaml than .txt, others almost keep the same:
>   1. compatible "const: snps,dwmac-4.20".
>   2. delete "snps,reset-active-low;" in example, since driver remove this
>      property long ago.
>   3. add "snps,reset-delay-us = <0 10000 10000>" in example.
>   4. the example is for rgmii interface, keep related properties only.
>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
>  .../bindings/net/mediatek-dwmac.yaml          | 155 ++++++++++++++++++
>  2 files changed, 155 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml

Now failing in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb:
ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb:
ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml


Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
