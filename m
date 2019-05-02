Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B283B123A3
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 22:51:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64B92C7129E
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 20:51:29 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E82FC7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 20:51:27 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w197so2871628oia.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 13:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W0M/s2a9tlTFv/FTWip3G2NKE0kpp0LnOAR85a1p4R0=;
 b=DvL9m7ka3WsMhCsa/hAvqN0Wk+H681TNBBzVJ05WF4WTvFwuitofmBR0PzdI2iJa98
 ROuuj0QYKXugP+DrnCW5SDHCcEogmYWCqZSEDBQpE4El5HrTdL8RgOVct1ZY0cWG0Hn6
 aOpSAAY5JkfKQs1dqydscVNdjAm2M+U7Anp294rJaA9RB2YjWP9kwH5sVypjgk/xY3gW
 6t9EH37Prw/K8i+DJ+w1BZK7SVsa1kIONjGi2iu1Y8xvEmt1cGADm8rxAyISWWUEElzp
 zhoTZfgVmgvOPLNHLEC6UGCqaOL7VllzpKZ3rb6uyfLiudJwNyFsGfzh2k6qcm27REvB
 oPBg==
X-Gm-Message-State: APjAAAWCszP+yq9G4bBjyl+0q/2gSx8q/RsCdGBns0L2aiRLCf393Ee3
 olnY95u0rDwz08dVua5AQQ==
X-Google-Smtp-Source: APXvYqzDbdYwgPCIEAr+hiFN60T0e7ZJougtcItHrR9eZtQEVRkQfvLf64qmrsDMjgQaRmbSto/j/w==
X-Received: by 2002:a54:4698:: with SMTP id k24mr3819905oic.104.1556830286202; 
 Thu, 02 May 2019 13:51:26 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w5sm21290otg.34.2019.05.02.13.51.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 13:51:24 -0700 (PDT)
Date: Thu, 2 May 2019 15:51:24 -0500
From: Rob Herring <robh@kernel.org>
To: Gerald BAEZA <gerald.baeza@st.com>
Message-ID: <20190502205124.GA17384@bogus>
References: <1556532194-27904-1-git-send-email-gerald.baeza@st.com>
 <1556532194-27904-3-git-send-email-gerald.baeza@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556532194-27904-3-git-send-email-gerald.baeza@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "will.deacon@arm.com" <will.deacon@arm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "olof@lixom.net" <olof@lixom.net>,
 "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/5] dt-bindings: perf: stm32: ddrperfm
	support
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

On Mon, Apr 29, 2019 at 10:03:37AM +0000, Gerald BAEZA wrote:
> The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.
> 
> This documentation indicates how to enable stm32-ddr-pmu driver on
> DDRPERFM peripheral, via the device tree.
> 
> Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
> ---
>  .../devicetree/bindings/perf/stm32-ddr-pmu.txt         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
> 
> diff --git a/Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt b/Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
> new file mode 100644
> index 0000000..dabc4c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
> @@ -0,0 +1,18 @@
> +* STM32 DDR Performance Monitor (DDRPERFM)
> +
> +Required properties:
> +- compatible: must be "st,stm32-ddr-pmu".
> +- reg: physical address and length of the registers set.
> +- clocks: list of phandles and specifiers to all input clocks listed in
> +	  clock-names property.
> +- clock-names: "bus" corresponds to the DDRPERFM bus clock and "ddr" to
> +	       the DDR frequency.

You have 'resets' in the dts.

> +
> +Example:
> +	ddrperfm: perf@5a007000 {
> +		compatible = "st,stm32-ddr-pmu";
> +		reg = <0x5a007000 0x400>;
> +		clocks = <&rcc DDRPERFM>, <&rcc PLL2_R>;
> +		clock-names = "bus", "ddr";
> +	};
> +
> -- 
> 2.7.4
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
