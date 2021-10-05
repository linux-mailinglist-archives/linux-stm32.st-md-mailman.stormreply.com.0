Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CDF4233C9
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Oct 2021 00:46:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDCB0C5AB83;
	Tue,  5 Oct 2021 22:46:12 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E75FDC5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 22:46:11 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 v17-20020a4ae051000000b002b5a56e3da3so280403oos.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Oct 2021 15:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=z05iAxjrVVtJJ74Uea+D+Nd3+xgMuNb36MMScUa9l6s=;
 b=qCv/KA+EZywuTLZDaWKvJSbiA0FDmcxIRHheixb5DTe+JtKhEE8WYBQnzHWz9H+Bhi
 F4pOWt157UGYro+c0lK9LoRSD3goB6zpGCxDgohZbvjiIrQp0yf7hhgXPTCMBZIiDA/U
 GC/iznPhHhJsKVPAU43LCXeULdNhwtx1Uu4FMtgf4uBq+JoCTqnYMNKJ9SoVywnx8ZHw
 Hew4MR7CTYmPYL7wPLnwBIAWc44q9W/FF98awecThOZJ4EruBD05UVqnolx7XY/6CZLM
 ppzMHJMdooVGlNsJxBy9kn8M+wpDITTmu21yqmOPY+xYnZwXM995wbup+XxdIIG9knG6
 fA0g==
X-Gm-Message-State: AOAM531vZe8uZ0liVTmOlodVFS7lLL3ctnpkk1JwIB7dFaDZkf+W/eQx
 JUamSis8eA9c5O8o0wsrfw==
X-Google-Smtp-Source: ABdhPJx76djZVqB0ioneDeAM81Uh6K9ykIIZGHIxMbOnpc1TdPJPUZs3JKxyO2ZilAWRhpHzhp3t9w==
X-Received: by 2002:a4a:a9ce:: with SMTP id h14mr15431532oon.89.1633473970735; 
 Tue, 05 Oct 2021 15:46:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w17sm356605otu.53.2021.10.05.15.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 15:46:10 -0700 (PDT)
Received: (nullmailer pid 106812 invoked by uid 1000);
 Tue, 05 Oct 2021 22:45:59 -0000
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20211005152453.89330-3-amelie.delaunay@foss.st.com>
References: <20211005152453.89330-1-amelie.delaunay@foss.st.com>
 <20211005152453.89330-3-amelie.delaunay@foss.st.com>
Date: Tue, 05 Oct 2021 17:45:59 -0500
Message-Id: <1633473959.465401.106809.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] dt-bindings: phy:
	phy-stm32-usbphyc: add optional phy tuning properties
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

On Tue, 05 Oct 2021 17:24:52 +0200, Amelie Delaunay wrote:
> This patch adds the description of new optional phy tuning properties
> for usbphyc phy sub nodes.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> Changes in v2:
> - st,phy-tuning property removed
> - tuning properties are now put directly in each child node
> - tuning properties are no more free form text and their name reworked
> ---
>  .../bindings/phy/phy-stm32-usbphyc.yaml       | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1536730


usbphyc@5a006000: usb-phy@0: 'phy-supply' is a required property
	arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dt.yaml
	arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dt.yaml
	arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dt.yaml
	arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dt.yaml
	arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
	arch/arm/boot/dts/stm32mp157c-odyssey.dt.yaml

usbphyc@5a006000: usb-phy@1: 'phy-supply' is a required property
	arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dt.yaml
	arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dt.yaml
	arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dt.yaml
	arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dt.yaml
	arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
	arch/arm/boot/dts/stm32mp157c-odyssey.dt.yaml

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
