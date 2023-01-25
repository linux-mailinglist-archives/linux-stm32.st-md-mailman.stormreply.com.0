Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 937B667B817
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 18:11:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CDFCC69057;
	Wed, 25 Jan 2023 17:11:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C90BFC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 17:11:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A24861590
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 17:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7A4C433A4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 17:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674666697;
 bh=RetSZbgsPvYqvv6AGDmz0Y2yuG9iulSs8DCbaH8Bt78=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CEyaH+bgf2lcwko+f741pV+QMy0dxz2Olo9d9xTL1WwCP+bkqbbWyzTq6ffTKyPzZ
 jFa3v1SPmDrBKh1SjsBi9LXYHRY+V77bNQ9rpqapfki/MThO8gURNUYAvpZIc3T57B
 nUkcF5ONSO62yv/l10IYayHhb+xuxx2mgi4/RZQ4H2132SpJtXoQvVtPOWqyN+hSwG
 oDpuewCjY0y3xKp4316s6VrfZge3SajjG03VP7LDYyyYsViAhfr7a39/wNTBe5nlZj
 ThtqLDUK8oBlq2rUD3m4Mr4MFat46rPa/t1vxd8iXs3K8CXLSDbNTnG6SbfEIcVrm8
 ZRTGUn67f9crw==
Received: by mail-ua1-f50.google.com with SMTP id g12so4842027uae.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 09:11:37 -0800 (PST)
X-Gm-Message-State: AFqh2krAzOjsFKORez/14iyRI5OnC4Ywi7GqiM2wULpimB+KNmuG0+jW
 AMKzV2yMM4TxwLw2OH5nmYAEB/eiJ6btOqcLGg==
X-Google-Smtp-Source: AMrXdXvkBeNWibWQ7iPb1UKnLnMwCQw9G4I7LpDrOPCqvmhVcacTBEc2M+BHEtbF4izLYj2eXZV0gKgfipYxi1WDLuQ=
X-Received: by 2002:ab0:5bda:0:b0:444:2123:f8df with SMTP id
 z26-20020ab05bda000000b004442123f8dfmr3758761uae.86.1674666696257; Wed, 25
 Jan 2023 09:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
 <20230123151302.368277-11-krzysztof.kozlowski@linaro.org>
 <167451486467.2795286.1299932821783618559.robh@kernel.org>
 <71fd9674-63a7-9887-d602-1f57ae3982aa@linaro.org>
In-Reply-To: <71fd9674-63a7-9887-d602-1f57ae3982aa@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 25 Jan 2023 11:11:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK7ZYe+PMXZ34WG746JzgGvaLanRpwF2x3sSGdsA7PCSA@mail.gmail.com>
Message-ID: <CAL_JsqK7ZYe+PMXZ34WG746JzgGvaLanRpwF2x3sSGdsA7PCSA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Korsgaard <jacmet@sunsite.dk>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 - <devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Chester Lin <clin@suse.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Fugang Duan <fugang.duan@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [Linux-stm32] [PATCH 11/13] dt-bindings: serial: restrict
	possible child node names
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

On Tue, Jan 24, 2023 at 3:05 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/01/2023 00:05, Rob Herring wrote:
> >
> > On Mon, 23 Jan 2023 16:13:00 +0100, Krzysztof Kozlowski wrote:
> >> The re-usable serial.yaml schema matches every property with ".*"
> >> pattern, thus any other schema referencing it will not report unknown
> >> (unevaluated) properties.  This hides several wrong properties.  It is
> >> a limitation of dtschema, thus provide a simple workaround: expect
> >> children to be only of few names matching upstream usage (Bluetooth,
> >> GNSS, GPS and MCU).
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/serial/serial.yaml | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.example.dtb: serial@1,0: Unevaluated properties are not allowed ('intel,ixp4xx-eb-byte-access', 'intel,ixp4xx-eb-cycle-type', 'intel,ixp4xx-eb-t3', 'intel,ixp4xx-eb-write-enable' were unexpected)
> >       From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/8250.yaml
>
> Eh, this is not trivial to solve. The
> "intel,ixp4xx-expansion-bus-controller.yaml" bindings add properties to
> children nodes, just like spi-peripheral-props:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml?h=v6.2-rc5#n147

Yep, those properties probably need to go into mc-peripheral-props.yaml.

> Any node can be there:
> 1. serial, which was broken since beginning but errors not visible,

8250 only in all likelyhood.

> 2. flash, which work fine just because mtd-physmap.yaml allows it,
> 3. more?

I guess it is *only* external parallel bus devices...

>
> Existing DTS of this ixp4xx controller have different nodes, for example:
> flash, shared-dma-pool, ns8250, arcom,vulcan-gpio, maxim,max6369:

'shared-dma-pool' is odd.

So is max6369. Looks like that h/w was creatively attached.

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts?h=v6.2-rc5#n40
>
> Probably we need expansion-bus-controller-peripheral-props.yaml and
> include it in every possible child. Does it sound reasonable?

What's the difference to mc-peripheral-props.yaml?

Honestly, this stuff is somewhat rare that I'd rather worry about it
later. Maybe ixp4xx will be removed by then... We could just comment
out the problematic parts of the example for now.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
