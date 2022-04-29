Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B0B514F11
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Apr 2022 17:18:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E66DBC6047D;
	Fri, 29 Apr 2022 15:18:40 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCFA5C5F1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Apr 2022 15:18:39 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id q8so8409137oif.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Apr 2022 08:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h5I147M5SAG5aKSeTFIpJ9Fdg0GC9tCoery/v4BvAoc=;
 b=v/+aNcXX4YR1IoRvtUlakb+LsFM2N+1/QWV4G2u84zMm1cUQvFIYk1k0ibQowWA/Hs
 iTAACc+oQi+/qhuzLD3fS5z/qq7MP72rPjco6FlR+62qFnNI7KvTPwW+sJnLLWc639rO
 btswq6uJ2DtlkAeUnr1QUg7DckFtOqlQGLBQpmJ/bVPpAb/p0MkbNYgSSdyhSeu2RgYW
 d+Y1kDvTk8WkHMNFKXv8P7GdEZXYn/kRwISRU9mTPPE2S4ahiDZ69PNxcknr3uUiVoFT
 UmZqexAFy2rYufNt5gx8W0T8FNVCMA3bLcY6MsVfjZLP+bBvcdUqNQYGMra7dJff6B0R
 4AjQ==
X-Gm-Message-State: AOAM5328sK/Nc6aKyRBxd7FnddJoYK658AHN+fDshj2GfdIbyTqyZxMD
 iE5zFaMPG1tCsWv7MDlrtQ==
X-Google-Smtp-Source: ABdhPJw1fKhbwx6lx70lrdW0UswFjeYAMQ8BdI+q1NecOx0z8DU6TRguS9yHIi1JzMEh2mVexnvGug==
X-Received: by 2002:a05:6808:1886:b0:322:f55c:133d with SMTP id
 bi6-20020a056808188600b00322f55c133dmr1691725oib.217.1651245518636; 
 Fri, 29 Apr 2022 08:18:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m18-20020a4add12000000b0035eb4e5a6d3sm852822oou.41.2022.04.29.08.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:18:38 -0700 (PDT)
Received: (nullmailer pid 2284027 invoked by uid 1000);
 Fri, 29 Apr 2022 15:18:36 -0000
Date: Fri, 29 Apr 2022 10:18:36 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <YmwBzLrTilOPdX5m@robh.at.kernel.org>
References: <Yk3nShkFzNJaI3/Z@robh.at.kernel.org>
 <YlVAy95eF/9b1nmu@orome>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YlVAy95eF/9b1nmu@orome>
Cc: devicetree@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Nancy Yuen <yuenn@google.com>,
 soc@kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>
Subject: Re: [Linux-stm32] [RESEND PATCH] arm64: dts: tegra: Fix boolean
 properties with values
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

On Tue, Apr 12, 2022 at 11:05:15AM +0200, Thierry Reding wrote:
> On Wed, Apr 06, 2022 at 02:17:30PM -0500, Rob Herring wrote:
> > Boolean properties in DT are present or not present and don't take a value.
> > A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
> > matter.
> > 
> > It may have been intended that 0 values are false, but there is no change
> > in behavior with this patch.
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Can someone apply this for 5.18.
> > 
> >  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi            | 8 ++++----
> >  .../boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts    | 8 ++++----
> >  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi            | 6 +++---
> >  arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi            | 6 +++---
> >  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi            | 6 +++---
> >  arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi            | 8 ++++----
> >  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts        | 8 ++++----
> >  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts             | 4 ++--
> >  8 files changed, 27 insertions(+), 27 deletions(-)
> 
> This causes multiple regressions on Tegra boards. The reason for this is
> that these properties are not in fact boolean, despite what the DT
> bindings say. If you look at the code that handles these, you'll notice
> that they are single-cell properties, typically with <0> and <1> values.
> What may have led to the conclusion that these are boolean is that there
> is also a special case where these can be left out, but the meaning of
> that is not the "false" (<0>) value. Instead, leaving these out means
> that the values should be left at whatever is currently in the register.

The majority of users do use boolean in their DT.

Treating these as tri-state doesn't make much sense because what does 
setting the pin to !push-pull mean? Isn't that just open-drain or 
open-source for which also have boolean values? Allowing these to have 
values is unnecessary and enables more invalid combinations.

> See pinconf_generic_parse_dt_config() and parse_dt_cfg() specifically in
> drivers/pinctrl/pinconf-generic.c.

of_property_read_u32() will return -EOVERFLOW on a boolean value and 
then the default value (0) is used. However, at least for QCom the value 
is ignored.

Looking at max77620, the value is used. However, it is clear that 
push-pull and open-drain operate on the same register bit.

> Arnd, can you please revert this so that these boards can be unbroken?

That's fine for now...

> It's a bit unfortunate because there seem to be other platforms that
> also employ these in the boolean form that Rob mentioned, but I think it
> is those that probably need fixing instead. Not sure what the intentions
> were for those.

I still think it's Tegra that needs fixing. The question is to what 
extent forwards and backwards compatibity is needed on these platforms? 
I'm not sure if we can fix new dtb with old kernel. A new dtb with a 
stable kernel update would be plausible. It may work just replacing 
'drive-push-pull = <0>' cases with 'drive-open-drain'.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
