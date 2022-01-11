Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A448BB7E
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jan 2022 00:37:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D9D1C5F1F4;
	Tue, 11 Jan 2022 23:37:12 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2784CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 23:37:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BDC46B81D4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 23:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7C3C36AE3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 23:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641944228;
 bh=v20NyJnnrpRCSXRNC/bxgBQIPv65XMpppqdhmj/Hzvs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=s9qNkpwcKPVuanI5Kw+TTgMfk7JJRYxrLKhky2VaBe7JNusoldsDzVbrjJtz5IJls
 Dsap4Rdhc6KW5naVyUP3cl1e1mVMROZxwCoexpiuLfl8u40GZbm3ya0Yw9twDUA7CB
 8CkqCDJpa1VfiCFRLF3GovLW4tn4VdSbg+3mJTu/JPKY8eqLzxK4cO6GbhCwzoZ5pu
 ybvTJ1zkHXn24U3x7EsUMl44HQiT6Nxp9pIRjH15EP6d6GaRUU4QitjRXpw30E+v6Z
 /0XUi3/R0tE6lQvSGunHAc+KbF7DcXE9z9iWN3n3WPB+8oYnVy4gwT7gt7heV3QF15
 MvdeUZUFYqkAQ==
Received: by mail-ed1-f47.google.com with SMTP id i5so2634384edf.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 15:37:08 -0800 (PST)
X-Gm-Message-State: AOAM532+8xiMNK3voy7WiKf6q17Q3RQiDeRZPGpp75wnOUD273kw0RKt
 X31zikDCzxLMqa3IReC+tZEDso17FMS8Z17mGw==
X-Google-Smtp-Source: ABdhPJw710G1pZDb3HvgWDjTL63fkfcrpRHCZFpw//6sxrytQyY8zszFTXytk0jVWFHu0ZF1BEoxLUB6BT1sM9dzczw=
X-Received: by 2002:a17:906:d184:: with SMTP id
 c4mr5387166ejz.20.1641944226855; 
 Tue, 11 Jan 2022 15:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-7-biao.huang@mediatek.com>
 <1639662782.987227.4004875.nullmailer@robh.at.kernel.org>
 <be023f9d2fb2a8f947bd0075e8732ba07cfd7b89.camel@mediatek.com>
In-Reply-To: <be023f9d2fb2a8f947bd0075e8732ba07cfd7b89.camel@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Jan 2022 17:36:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLo7z-KWtwFx+Kng2aQuCpQwJaO6mHnyBzmCKCJDK5n+Q@mail.gmail.com>
Message-ID: <CAL_JsqLo7z-KWtwFx+Kng2aQuCpQwJaO6mHnyBzmCKCJDK5n+Q@mail.gmail.com>
To: Biao Huang <biao.huang@mediatek.com>
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, netdev <netdev@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 David Miller <davem@davemloft.net>, dkirjanov@suse.de,
 Jose Abreu <joabreu@synopsys.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net-next v10 6/6] net: dt-bindings: dwmac:
	add support for mt8195
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

On Thu, Dec 16, 2021 at 8:06 PM Biao Huang <biao.huang@mediatek.com> wrote:
>
> Dear Rob,
>   Thanks for your comments~
>
>   For mt8195, the eth device node will look like:
>   eth: ethernet@11021000 {
>     compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
>     ...
>     clock-names = "axi",
>                   "apb",
>                   "mac_cg",
>                   "mac_main",
>                   "ptp_ref",
>                   "rmii_internal";
>     clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
>              <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
>              <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>,
>              <&topckgen CLK_TOP_SNPS_ETH_250M>,
>              <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
>              <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
>     ...
>   }
>
> 1. "rmii_internal" is a special clock only required for
>    RMII phy interface, dwmac-mediatek.c will enable clocks
>    invoking clk_bulk_prepare_enable(xx, 6) for RMII,
>    and clk_bulk_prepare_enable(xx, 5) for other phy interfaces.
>    so, mt2712/mt8195 all put "rmii_internal" clock to the
>    end of clock list to simplify clock handling.
>
>    If I put mac_cg as described above, a if condition is required
> for clocks description in dt-binding, just like what I do in v7 send:
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - mediatek,mt2712-gmac
>
>     then:
>       properties:
>         clocks:
>           minItems: 5
>           items:
>             - description: AXI clock
>             - description: APB clock
>             - description: MAC Main clock
>             - description: PTP clock
>             - description: RMII reference clock provided by MAC
>
>         clock-names:
>           minItems: 5
>           items:
>             - const: axi
>             - const: apb
>             - const: mac_main
>             - const: ptp_ref
>             - const: rmii_internal
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - mediatek,mt8195-gmac
>
>     then:
>       properties:
>         clocks:
>           minItems: 6
>           items:
>             - description: AXI clock
>             - description: APB clock
>             - description: MAC clock gate
>             - description: MAC Main clock
>             - description: PTP clock
>             - description: RMII reference clock provided by MAC
>
>    This introduces some duplicated description.
>
> 2. If I put "mac_cg" to the end of clock list,
>    the dt-binding file can be simple just like
>    what we do in this v10 patch(need fix warnings reported by "make
> DT_CHECKER_FLAGS=-m dt_binding_check").
>
>    But for mt8195:
>      the eth node in dts should be modified,

I hope you are defining the binding before you use it... That's not
good practice and not a valid argument.

>      and eth driver clock handling will be complex;

How so?

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
