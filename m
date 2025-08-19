Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AACA9B2C37A
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 14:27:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04322C3F945;
	Tue, 19 Aug 2025 12:27:32 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 153DCC36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 12:27:29 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e931c858dbbso4149924276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 05:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755606448; x=1756211248;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J/SwjOQHeCvMS2KICUc0pDV0Be0a1R8dCwpqQxZT7wU=;
 b=CNOEkv0tdcf7sW9dYTwRWFR7qg8YYgB1PsN7agumPm1+CDOAJ4REwCrUVdo8xLma4S
 nxzFzZ2KIW0JAPrwHUx61IE7zvuNHEJqWfciZ/oXpiKPytEQp88hMzmI4CH5wCNH/1BI
 Rt2caBP+qpyI1uLRRdIltMfR2ZRJdmeetuWopnCaCRAMYS9VPa5mHmpw9RlwJ3YDmrM6
 28oHJaSmiWV5BPfsa12t2021HMV3fv61r4YbX5MxdmWYpb9aAMuRlmuXvDipIrQ169Ud
 EBz6PTUYBR1sVzZnRE6rg5Jl062Lpwa1qs5bWuewXCYsTzw52Rt+OiN2kYC98M4d+R7u
 MVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755606448; x=1756211248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J/SwjOQHeCvMS2KICUc0pDV0Be0a1R8dCwpqQxZT7wU=;
 b=riJcG1iqhEnIQVJDsNvz4TQmLwMxuo+x55XRezTYzyZSEspfpFNeKrqt2QYDUxTsp5
 IdPSu/klBktZ/2Mdb9rA+9MOYPP1PA+aRPyTtLyFpaoPkDjiHGGgrqH3eE36BMzaXGvF
 nF7FrPeYEMZyUHev8sy5dxr8MlWUG6OplNBBhT67KZcBaGDhKlJ0+EATsPPLyKHBN7vo
 4gcRtQOHCYqRjedZvSlI/r2O4rKs2Gm673B9hFeUGjbfF6ec//G/gUNs8UB6qZyshcad
 zhuKGA86Zh3pxwuN9SEzAAhlRnYKZ67E99c3QlSRTS7kdF9K68MXJmn4BITyZaE5Ju1Y
 nt+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCywPRd6Snf6Yoc6SFyxYboNyN6X65e/XNGC/buHSuDmKxg6VsjIx13xiYSPyp0c0KwsKwKxNqgYq7uQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxFhR6a/M4ZhXO9iRpd3NO0jh9hjGQdOfenzM0GfrnCLlL1/IUE
 ZC+0Ge6shBa5bPbmykGDsXD4O9hiRqtpcl101aJ0o/63ihlcfiScHFe6Y03PzSFubzhHY2LKe4r
 RffadqiZejW0jWsyGlEy4ctiE/2q7GAZRInVDI4Nagw==
X-Gm-Gg: ASbGncuPEqr62nZPlMNcrZu4M4GWM1EV8+TNgRHTmQdOgHPXx3h7I2wqdJ3qNNF9VGU
 0ke1jbiRwcyfZL4c0LJcBvQli0+AA7cEBGfqyj0Jes46ByNWCJCNvhVcq74tpvcEklCuL9Pe5Zv
 QA4S8pQqyGs0B1keRu+Cdfb90faQpj9I/wG0fJBZY0VZqb5PIErGf2SslAAbllnMiQ3cwLWcSVr
 77R88g=
X-Google-Smtp-Source: AGHT+IFkoI+r6cV6WNVq6uXPHBA2uVZLDrE8//ETpYalVmXIBJdJpOfeazQCrWmKXo2jK9mqh7ttDODS+RAFkKAtLFY=
X-Received: by 2002:a05:690c:7444:b0:71a:183e:bfe6 with SMTP id
 00721157ae682-71f9d67abbbmr26169127b3.31.1755606448402; Tue, 19 Aug 2025
 05:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250806114119.1948624-1-joy.zou@nxp.com>
In-Reply-To: <20250806114119.1948624-1-joy.zou@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 19 Aug 2025 14:26:52 +0200
X-Gm-Features: Ac12FXxegWexeGHmDDmyzbg8yYMj_7Nw43OEeLJf9G4Q8J0jYIS4GpVCHqgHvw0
Message-ID: <CAPDyKFrTu6T7VtogZdh=VnZonh81d9xRGBOHuNv5nECSBkL0SQ@mail.gmail.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: imx@lists.linux.dev, peng.fan@nxp.com, alexander.stein@ew.tq-group.com,
 catalin.marinas@arm.com, Frank.Li@nxp.com, edumazet@google.com,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 Markus.Niebel@ew.tq-group.com, festevam@gmail.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 kernel@pengutronix.de, linux-pm@vger.kernel.org, othacehe@gnu.org,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net, linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v8 00/11] Add i.MX91 platform support
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

On Wed, 6 Aug 2025 at 13:42, Joy Zou <joy.zou@nxp.com> wrote:
>
> The design of i.MX91 platform is very similar to i.MX93.
> Extracts the common parts in order to reuse code.
>
> The mainly difference between i.MX91 and i.MX93 is as follows:
> - i.MX91 removed some clocks and modified the names of some clocks.
> - i.MX91 only has one A core.
> - i.MX91 has different pinmux.
>
> ---
> Changes for v8:
> - add Reviewed-by tag for patch #2/3/4/5/6/7/8/9/11.
> - modify commit message for patch #10.
> - move imx91 before imx93 in Makefile for patch #6.
> - modify the commit message to keep wrap at 75 chars for patch #5.
> - Link to v7: https://lore.kernel.org/imx/20250728071438.2332382-1-joy.zou@nxp.com/
>
> Changes for v7:
> - Optimize i.MX91 num_clks hardcode with ARRAY_SIZE()for patch #10.
> - Add new patch in order to optimize i.MX93 num_clks hardcode
>   with ARRAY_SIZE() for patch #9.
> - remove this unused comments for patch #6.
> - align all pinctrl value to the same column for patch #6.
> - add aliases because remove aliases from common dtsi for patch #6.
> - remove fec property eee-broken-1000t from imx91 and imx93 board dts
>   for patch #6 and #7.
> - The aliases are removed from common.dtsi because the imx93.dtsi
>   aliases are removed for patch #4.
> - Add new patch that move aliases from imx93.dtsi to board dts for
>   patch #3.
> - These aliases aren't common, so need to drop in imx93.dtsi for patch #3.
> - Only add aliases using to imx93 board dts for patch #3.
> - patch #3 changes come from review comments:
>   https://lore.kernel.org/imx/4e8f2426-92a1-4c7e-b860-0e10e8dd886c@kernel.org/
> - add clocks constraints in the if-else branch for patch #2.
> - reorder the imx93 and imx91 if-else branch for patch #2.
> - patch #2 changes come from review comments:
>   https://lore.kernel.org/imx/urgfsmkl25woqy5emucfkqs52qu624po6rd532hpusg3fdnyg3@s5iwmhnfsi26/
> - add Reviewed-by tag for patch #2.
> - Link to v6: https://lore.kernel.org/imx/20250623095732.2139853-1-joy.zou@nxp.com/
>
> Changes for v6:
> - add changelog in per patch.
> - correct commit message spell for patch #1.
> - merge rename imx93.dtsi to imx91_93_common.dtsi and move i.MX93
>   specific part from imx91_93_common.dtsi to imx93.dtsi for patch #3.
> - modify the commit message for patch #3.
> - restore copyright time and add modification time for common dtsi for
>   patch #3.
> - remove unused map0 label in imx91_93_common.dtsi for patch #3.
> - remove tmu related node for patch #4.
> - remove unused regulators and pinctrl settings for patch #5.
> - add new modification for aliases change patch #6.
> - Link to v5: https://lore.kernel.org/imx/20250613100255.2131800-1-joy.zou@nxp.com/
>
> Changes for v5:
> - rename imx93.dtsi to imx91_93_common.dtsi.
> - move imx93 specific part from imx91_93_common.dtsi to imx93.dtsi.
> - modify the imx91.dtsi to use imx91_93_common.dtsi.
> - add new the imx93-blk-ctrl binding and driver patch for imx91 support.
> - add new net patch for imx91 support.
> - change node name codec and lsm6dsm into common name audio-codec and
>   inertial-meter, and add BT compatible string for imx91 board dts.
> - Link to v4: https://lore.kernel.org/imx/20250121074017.2819285-1-joy.zou@nxp.com/
>
> Changes for v4:
> - Add one imx93 patch that add labels in imx93.dtsi
> - modify the references in imx91.dtsi
> - modify the code alignment
> - remove unused newline
> - delete the status property
> - align pad hex values
> - Link to v3: https://lore.kernel.org/imx/20241120094945.3032663-1-pengfei.li_1@nxp.com/
>
> Changes for v3:
> - Add Conor's ack on patch #1
> - format imx91-11x11-evk.dts with the dt-format tool
> - add lpi2c1 node
> - Link to v2: https://lore.kernel.org/imx/20241118051541.2621360-1-pengfei.li_1@nxp.com/
>
> Changes for v2:
> - change ddr node pmu compatible
> - remove mu1 and mu2
> - change iomux node compatible and enable 91 pinctrl
> - refine commit message for patch #2
> - change hex to lowercase in pinfunc.h
> - ordering nodes with the dt-format tool
> - Link to v1: https://lore.kernel.org/imx/20241108022703.1877171-1-pengfei.li_1@nxp.com/
>
> Joy Zou (10):
>   dt-bindings: soc: imx-blk-ctrl: add i.MX91 blk-ctrl compatible
>   arm64: dts: freescale: move aliases from imx93.dtsi to board dts
>   arm64: dts: freescale: rename imx93.dtsi to imx91_93_common.dtsi and
>     modify them
>   arm64: dts: imx91: add i.MX91 dtsi support
>   arm64: dts: freescale: add i.MX91 11x11 EVK basic support
>   arm64: dts: imx93-11x11-evk: remove fec property eee-broken-1000t
>   arm64: defconfig: enable i.MX91 pinctrl
>   pmdomain: imx93-blk-ctrl: use ARRAY_SIZE() instead of hardcode number
>   pmdomain: imx93-blk-ctrl: mask DSI and PXP PD domain register on
>     i.MX91
>   net: stmmac: imx: add i.MX91 support
>
> Pengfei Li (1):
>   dt-bindings: arm: fsl: add i.MX91 11x11 evk board
>
>  .../devicetree/bindings/arm/fsl.yaml          |    6 +
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     |   59 +-
>  arch/arm64/boot/dts/freescale/Makefile        |    1 +
>  .../boot/dts/freescale/imx91-11x11-evk.dts    |  674 ++++++++
>  arch/arm64/boot/dts/freescale/imx91-pinfunc.h |  770 +++++++++
>  arch/arm64/boot/dts/freescale/imx91.dtsi      |   71 +
>  .../{imx93.dtsi => imx91_93_common.dtsi}      |  176 +-
>  .../boot/dts/freescale/imx93-11x11-evk.dts    |   20 +-
>  .../boot/dts/freescale/imx93-14x14-evk.dts    |   15 +
>  .../boot/dts/freescale/imx93-9x9-qsb.dts      |   18 +
>  .../dts/freescale/imx93-kontron-bl-osm-s.dts  |   21 +
>  .../dts/freescale/imx93-phyboard-nash.dts     |   21 +
>  .../dts/freescale/imx93-phyboard-segin.dts    |    9 +
>  .../freescale/imx93-tqma9352-mba91xxca.dts    |   11 +
>  .../freescale/imx93-tqma9352-mba93xxca.dts    |   25 +
>  .../freescale/imx93-tqma9352-mba93xxla.dts    |   25 +
>  .../dts/freescale/imx93-var-som-symphony.dts  |   17 +
>  arch/arm64/boot/dts/freescale/imx93.dtsi      | 1512 ++---------------
>  arch/arm64/configs/defconfig                  |    1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   |    2 +
>  drivers/pmdomain/imx/imx93-blk-ctrl.c         |   23 +-
>  21 files changed, 1938 insertions(+), 1539 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
>  copy arch/arm64/boot/dts/freescale/{imx93.dtsi => imx91_93_common.dtsi} (90%)
>  rewrite arch/arm64/boot/dts/freescale/imx93.dtsi (97%)
>

Patch2, 9 and 10 applied for next on my pmdomain tree, thanks!

Note, patch2 (dt change) is also available on my immutable dt branch,
for SoC maintainers to pull-in.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
