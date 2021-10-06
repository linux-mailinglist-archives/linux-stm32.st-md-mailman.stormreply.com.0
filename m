Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCCA423DD4
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Oct 2021 14:38:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7933C597B4;
	Wed,  6 Oct 2021 12:38:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3424C5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Oct 2021 12:38:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17AF66109F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Oct 2021 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633523906;
 bh=UHuY6TlmNNN+9dHIfYDo1fNOZhjqyzlZ9T9CCgL0xEU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FMaxJQcIq5dpx0Qm5GFBLQ+EdlaR9+9stYXn60nWTPBT4+9G15Sw2WVrQglTXT5Lg
 UMuJlHTdA400XqSJR6SBqYYYDzEOZefBcIRbZXGXl35mk3fKSzFfuCJxyd5GYResO7
 ahS4iKYkGJeNTes3+G23ZA+tDr3aUYYBRRjy5E+pk7NZFDgK8DcJ75zshZj4uNaTc+
 F2EODBK98Pmlu4rT5+n3adZq7r+iPrMzfgajeuJDGd+cKqx+SXySukbtPNYsse0UU8
 kGN2Xi6Riq42LXSc8b1bMRNQVrGiv50Tp84HsmFFl4rD6IrM7vOvbOicqi0hGHFtfA
 MFsZ3bfpp5MgQ==
Received: by mail-ed1-f49.google.com with SMTP id dj4so9382677edb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Oct 2021 05:38:26 -0700 (PDT)
X-Gm-Message-State: AOAM530x5ij7hVPfGmgk8hlElwySX5RqxlHmjemjJJ8AkxvDizJeRzsG
 ag8+QPWRF/6c948QJVCnkLKNInN3O6P0Q91EHA==
X-Google-Smtp-Source: ABdhPJyAb9U55hRGrJFM5z+LO/Z/GHO9Bc2eJXtu9imIRuHnkqUJxRxM+FC9hlNN13H9dupCP+6z5hNjuJUGX5lXUSg=
X-Received: by 2002:a17:906:5a47:: with SMTP id
 my7mr31284501ejc.128.1633523904621; 
 Wed, 06 Oct 2021 05:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211005152453.89330-1-amelie.delaunay@foss.st.com>
 <20211005152453.89330-3-amelie.delaunay@foss.st.com>
 <1633473959.465401.106809.nullmailer@robh.at.kernel.org>
 <491ab475-e7dc-eb71-85aa-6d82543b74db@foss.st.com>
In-Reply-To: <491ab475-e7dc-eb71-85aa-6d82543b74db@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Oct 2021 07:38:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLEPd9_4SgmDh8GakyNxQeuMKhJeGzaLbZSdxDJ_-dZYg@mail.gmail.com>
Message-ID: <CAL_JsqLEPd9_4SgmDh8GakyNxQeuMKhJeGzaLbZSdxDJ_-dZYg@mail.gmail.com>
To: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Oct 6, 2021 at 1:51 AM Amelie DELAUNAY
<amelie.delaunay@foss.st.com> wrote:
>
> Hi Rob,
>
> On 10/6/21 12:45 AM, Rob Herring wrote:
> > On Tue, 05 Oct 2021 17:24:52 +0200, Amelie Delaunay wrote:
> >> This patch adds the description of new optional phy tuning properties
> >> for usbphyc phy sub nodes.
> >>
> >> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> >> ---
> >> Changes in v2:
> >> - st,phy-tuning property removed
> >> - tuning properties are now put directly in each child node
> >> - tuning properties are no more free form text and their name reworked
> >> ---
> >>   .../bindings/phy/phy-stm32-usbphyc.yaml       | 126 ++++++++++++++++++
> >>   1 file changed, 126 insertions(+)
> >>
> >
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> >
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> >
> > Full log is available here: https://patchwork.ozlabs.org/patch/1536730
> >
> >
> > usbphyc@5a006000: usb-phy@0: 'phy-supply' is a required property
> >       arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dt.yaml
> >       arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dt.yaml
> >       arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dt.yaml
> >       arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dt.yaml
> >       arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
> >       arch/arm/boot/dts/stm32mp157c-odyssey.dt.yaml
> >
> > usbphyc@5a006000: usb-phy@1: 'phy-supply' is a required property
> >       arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dt.yaml
> >       arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dt.yaml
> >       arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dt.yaml
> >       arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dt.yaml
> >       arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
> >       arch/arm/boot/dts/stm32mp157c-odyssey.dt.yaml
> >
>
> These warnings are due to the fact that usbphyc parent node is disabled
> in parent device tree (stm32mp151.dtsi) but not the "usb-phy" child
> nodes. These warnings are not introduced by this current patch "optional
> phy tuning properties" but anyway.

Yes, I said that may be the case.

> The device trees mentioned don't
> enable usbphyc, so they don't have to set phy-supply in usbphyc child nodes.
>
> $ git diff arch/arm/boot/dts/stm32mp151.dtsi
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi
> b/arch/arm/boot/dts/stm32mp151.dtsi
> index bd289bf5d269..abef8b6be40a 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1507,11 +1507,13 @@ usbphyc: usbphyc@5a006000 {
>                          usbphyc_port0: usb-phy@0 {
>                                  #phy-cells = <0>;
>                                  reg = <0>;
> +                               status = "disabled";
>                          };
>
>                          usbphyc_port1: usb-phy@1 {
>                                  #phy-cells = <1>;
>                                  reg = <1>;
> +                               status = "disabled";
>                          };
>                  };
>
> Disable child nodes while parent node is already disabled fixes the
> warning. But it means to add status = "okay"; in child nodes everywhere
> usbphyc is enabled.

Presumably, you already have to add phy-supply everywhere.

> Is it normal dtbs_check checks in child nodes when parent node is disabled?

I'll look into doing that.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
