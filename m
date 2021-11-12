Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B745444E7D6
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 14:48:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B13AC5EC74;
	Fri, 12 Nov 2021 13:48:47 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EF33C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 13:48:46 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id s139so17883901oie.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 05:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=lfnFk0Vk2nlPX6zE3Xuo6uqEuasd9Rkq/bqEgF/SFTA=;
 b=bXOXYKfTvnaIAtI2hTR0hT0MmK1QK9tXW5n3aGSSUQaSSPf8/lk6Ip8Nm27nMtDg+/
 BT0eLrrB1sBPKldvSwumQBgqmjdNV0puTaB+csSlAgDlJQ2bqVB2eUVNcQGkgD0GuGMs
 lFTY5rrrdlBKRDyHrH2auSZ5S7gWAFj1XJoC6/Ddv/JAoBlEVaFb7+MttfEHfBcw9UC5
 ItkvURJ0Din1Nsryfzfof3Bz4CCTzh4alxxvHvk1KMKTtI+2pED7pAAGPmM2Thi7RAIk
 VGB8vvyzOfFViEOt7Lnnetxszjz9xupmgxxWR7xLWsaBfrSZMcmUJS3rZnnaDSgYBPAy
 Z/mg==
X-Gm-Message-State: AOAM53084uqaLqEWYzWaT6a3NxVG3lqFvd3eQkhy1u7JKouOXqmi5pYp
 iTtVMEBg/yBwpi/qI08dBA==
X-Google-Smtp-Source: ABdhPJwYvgxWt2U6crFb5cYgShEcV2k6Ksx10uPU+Y41+QNrwmhXTQw/q/at2PcM13hNbmCaEt2ZHA==
X-Received: by 2002:a05:6808:14e:: with SMTP id
 h14mr23166380oie.28.1636724925287; 
 Fri, 12 Nov 2021 05:48:45 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h3sm11658ooe.13.2021.11.12.05.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:48:44 -0800 (PST)
Received: (nullmailer pid 2463377 invoked by uid 1000);
 Fri, 12 Nov 2021 13:48:37 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
In-Reply-To: <20211112093918.11061-8-biao.huang@mediatek.com>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-8-biao.huang@mediatek.com>
Date: Fri, 12 Nov 2021 07:48:37 -0600
Message-Id: <1636724917.173620.2463376.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 7/7] net-next: dt-bindings: dwmac: add
	support for mt8195
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

On Fri, 12 Nov 2021 17:39:18 +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 86 +++++++++++++++----
>  1 file changed, 70 insertions(+), 16 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1554230


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
