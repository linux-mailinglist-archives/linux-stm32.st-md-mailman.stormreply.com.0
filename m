Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BDA140CFD
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2020 15:48:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD241C36B0F;
	Fri, 17 Jan 2020 14:48:41 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 383A9C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 14:48:40 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id d62so22330024oia.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 06:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dyE4NzvdMsyKga26H8tQKOSJjEOPcWYAXtxjXIGSauM=;
 b=Eqmu/ePSmoSOJhJEeLsqmOMrUsSY+XaD0TWL1GeRFNJmY4do5M3Ag0qBudkCkwF+EA
 6Evkw3LV71uP9YuMPtBj8qs9RySVGLnktFXhRCQN1YAs3ZE5Lvg7IUDIOQw4FK0seJ2N
 j4LBmVlwLMy8Jgdbwsu2J4YkXmXDyII/s9QK+gnnkdIKrhkrZv2kLYermlxFEuVwzoLi
 XJbpAgHWp73Df0bFzQ/b5Dr8f9SXtmdxhbc5k0nMsVic9Sdc++3yCqXpEYtbVQRlQspN
 hdf1taCoL/peQiG2NQrCCN66XJ0cPw11TEaAD90iJ05R9y4BLtbLfsvaGvPHwyD6ct5f
 AY9A==
X-Gm-Message-State: APjAAAXYLhcn1AW0xv0Ok3A69ACPZS25rmy7k7jcnvpBvMS5NqSTipy/
 qv5wzOOhM7nZmXfRypTakw==
X-Google-Smtp-Source: APXvYqyABfMThOmRvFNhbdQGFqiqtT+906MusSLrADtaBvi+FGDgJmdep6F7xH8DXrsB8rHtfy/eFA==
X-Received: by 2002:a54:4117:: with SMTP id l23mr3541405oic.140.1579272518846; 
 Fri, 17 Jan 2020 06:48:38 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f4sm7824851oij.25.2020.01.17.06.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 06:48:38 -0800 (PST)
Received: (nullmailer pid 13001 invoked by uid 1000);
 Fri, 17 Jan 2020 14:48:37 -0000
Date: Fri, 17 Jan 2020 08:48:37 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20200117144837.GA27455@bogus>
References: <20200116144524.16070-1-amelie.delaunay@st.com>
 <20200116144524.16070-2-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116144524.16070-2-amelie.delaunay@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCHv2 1/2] dt-bindings: usb: dwc2: add support
 for STM32MP15 SoCs USB OTG HS and FS
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

On Thu, Jan 16, 2020 at 03:45:23PM +0100, Amelie Delaunay wrote:
> Add the specific compatible string for the DWC2 IP found in the STM32MP15
> SoCs.
> STM32MP15 SoCs uses sensing comparators to detect Vbus valid levels and
> ID pin state. usb33d-supply described the regulator supplying Vbus and ID
> sensing comparators.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index 71cf7ba32237..0b86250b97a9 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -58,6 +58,8 @@ properties:
>        - const: st,stm32f4x9-fsotg
>        - const: st,stm32f4x9-hsotg
>        - const: st,stm32f7-hsotg
> +      - const: st,stm32mp15-fsotg
> +      - const: st,stm32mp15-hsotg
>        - const: samsung,s3c6400-hsotg
>  
>    reg:
> @@ -103,6 +105,10 @@ properties:
>    vusb_a-supply:
>      description: phandle to voltage regulator of analog section.
>  
> +  vusb33d_supply:

Not a valid regulator property.

> +    description: reference to the external VBUS and ID sensing comparators, in
> +      order to perform OTG operation, used on STM32MP15 SoCs.

Are they external or part of the SoC? When we have Vbus sense and ID 
GPIOs, those go in the connector node, so this probably should too if 
these are board components.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
