Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 964A2477686
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 17:01:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A737C5F1D8;
	Thu, 16 Dec 2021 16:01:35 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DB7DC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 16:01:33 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id s139so36987610oie.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 08:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dbSG32y6ukLoqfqRo2sXQ+YKKGePZyrZXfU9tAawzpw=;
 b=Rf/2uQNMgVZDI77Mj/1AAF8bguJ4y/dFTgumVDayPYKX9k54EbmDLE+rhPIpKSScpa
 FDUhCY6rPojm8QzIQP6PyKw57mOhS+Rx2My01zQjvpuilzQf6fMhnCTvyix7TFCWQtQ+
 XhLZQbgkVh9ZWuqBDOJurbk5TMhjrNJKGluc3U1O3fzxmRMb1x1syyV1oNvezEVTuk90
 ZNexbuxpNopD5gKLO1N9CZ5sVn3Lpm8R3iMDEmTl3WaGsWRzTmU5jdsPMuBCrvrIcWfT
 F4/vHCeUxgFvI6sjjEAhru/+jJZnLuLOOTZ/oXAyuqWarNoj/rnSYYZ9wgoZ1+pDiCL1
 Mg3A==
X-Gm-Message-State: AOAM53160gmW4ZJuVyzp0ifjZCWKhDNQV9HNeYblTv/PR6kXWUES5uHI
 YPSTrqq6a2V5/vA4pVy+Lw==
X-Google-Smtp-Source: ABdhPJwT+stimIXyLjdj+CQr+hmRqN6GhTves5+Kg2E8pFUvFz/CQxyByaiN3nzlpTAMNrsQfGSp7A==
X-Received: by 2002:a05:6808:697:: with SMTP id
 k23mr4663881oig.18.1639670491935; 
 Thu, 16 Dec 2021 08:01:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x17sm1077566oot.30.2021.12.16.08.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 08:01:31 -0800 (PST)
Received: (nullmailer pid 298545 invoked by uid 1000);
 Thu, 16 Dec 2021 16:01:30 -0000
Date: Thu, 16 Dec 2021 10:01:30 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <Ybti2mNfEVNWQWgM@robh.at.kernel.org>
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-5-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216055328.15953-5-biao.huang@mediatek.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v10 4/6] net: dt-bindings: dwmac:
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

On Thu, Dec 16, 2021 at 01:53:26PM +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> And there are some changes in .yaml than .txt, others almost keep the same:
>   1. compatible "const: snps,dwmac-4.20".
>   2. delete "snps,reset-active-low;" in example, since driver remove this
>      property long ago.
>   3. add "snps,reset-delay-us = <0 10000 10000>" in example.
>   4. the example is for rgmii interface, keep related properties only.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
>  .../bindings/net/mediatek-dwmac.yaml          | 155 ++++++++++++++++++
>  2 files changed, 155 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
