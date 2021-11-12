Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF81B44E7D8
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 14:48:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75CD1C5EC75;
	Fri, 12 Nov 2021 13:48:51 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB58FC5EC73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 13:48:49 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso397853otr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 05:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=6pHca0PIi6BrRjpQqaAzxuZW0QOl0VIRadxfTfhPAkQ=;
 b=7jKp5lFcas77TIJvANWPigXq0s7Zd0ChQzDCjRakBJ71LesT8qBH3N709o1Q7YnyGJ
 ZaQAEzQ2XOj1E1CuEZh+yxBha2o2Jf0elhpVRWVM93CTxWhZmt01zwvzxQI/1EyMnr01
 Rp+Y/mdBtsFZOflXvvm6wJbXlmdZoxdKAQ3k2nnBgLzy/UrDo6I9aZ3BhwHyxG3PFyo3
 lSp6h9/uPWR87jv6YZNf/Xi13nrIepqTMNneGcbrIlQIlLkLM6suqU/4AFHepE3V7AdX
 PQx+bW1oYOg2dtlz1S3nKYJYH4CFL2cwG50xzhN381Z89ielBSu4TQYsfiB9Rz4a6gIV
 xh4w==
X-Gm-Message-State: AOAM533ptQ7uMjRrwFgseTUaPBWO4YUB32NogQLIRtwOsK5ViysqoqW7
 /MtFd14Nusef9KKRvVXyJQ==
X-Google-Smtp-Source: ABdhPJwly26891iEK8vtNTXyQVNzHORW9lkbyk3RQPIGYIxK3HMgQYC5n3VkFR/ORX4G7j567JV10A==
X-Received: by 2002:a05:6830:1e57:: with SMTP id
 e23mr12025731otj.16.1636724928903; 
 Fri, 12 Nov 2021 05:48:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a23sm1053194ool.3.2021.11.12.05.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:48:48 -0800 (PST)
Received: (nullmailer pid 2463375 invoked by uid 1000);
 Fri, 12 Nov 2021 13:48:37 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
In-Reply-To: <20211112093918.11061-5-biao.huang@mediatek.com>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-5-biao.huang@mediatek.com>
Date: Fri, 12 Nov 2021 07:48:37 -0600
Message-Id: <1636724917.159298.2463374.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, dkirjanov@suse.de,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 4/7] net-next: dt-bindings: dwmac:
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, 12 Nov 2021 17:39:15 +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
>  .../bindings/net/mediatek-dwmac.yaml          | 157 ++++++++++++++++++
>  2 files changed, 157 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1554228


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
