Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 616A044D8B4
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Nov 2021 15:57:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22A33C5EC72;
	Thu, 11 Nov 2021 14:57:38 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69761C5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 14:57:36 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id u74so12003361oie.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 06:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=eOq5ir+TFZBL5cj7XaOZPw0GldpRN8fcVtMKUZ8KDPc=;
 b=CGf/jfu002TqTia56Er5+pT/4sSU5W1S/cLQfoef8KMh7YkTmc9nKRoPeX+2DL2Hg9
 8NKQnULXLN8W4fBLk1TagEXCM17j2CtWqtuak2yAyTqRBLJKM7R1xj6u+7KqBRl6zAUc
 Y4X2FYZO4UP1BQdLvElorijuGvZK/LWX7Y0BmgZSq5TNH8sDj2PdWUHsypjKh6Js0+Zj
 9X5NxIyiLW+7RfA6L2Umr65WnjTzgk0bJZ1DaKvb/EGIDtCU1r0/mxhBg6PTIPzvM127
 nr0AwIxmLhU86ARLkIP6rm1PTWD/lkV4n/Ofr8XFGmO/4+Goe1YCMAbvNt9zGTDakmlk
 bHag==
X-Gm-Message-State: AOAM5308Cv3DMfHp6SM0rdnPKEKVrgYXpaKJUZHKqMyrvYMKC+gwwZ6C
 P0YiaSyKF+6agioLNbAJqQ==
X-Google-Smtp-Source: ABdhPJylUnRgVbfCJwWY8YapTYWcyJT8PtHaBGyigns+dkTO2lU8gHUIpbJagVcgphNPxro1ePlm2w==
X-Received: by 2002:a05:6808:159a:: with SMTP id
 t26mr20008829oiw.106.1636642655301; 
 Thu, 11 Nov 2021 06:57:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id ay42sm769577oib.22.2021.11.11.06.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 06:57:34 -0800 (PST)
Received: (nullmailer pid 3774089 invoked by uid 1000);
 Thu, 11 Nov 2021 14:57:26 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
In-Reply-To: <20211111071214.21027-5-biao.huang@mediatek.com>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-5-biao.huang@mediatek.com>
Date: Thu, 11 Nov 2021 08:57:26 -0600
Message-Id: <1636642646.918741.3774088.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/5] dt-bindings: net: dwmac: Convert
	mediatek-dwmac to DT schema
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, 11 Nov 2021 15:12:13 +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 --------
>  .../bindings/net/mediatek-dwmac.yaml          | 211 ++++++++++++++++++
>  2 files changed, 211 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1553803


ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref'] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not contain items matching the given schema
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
