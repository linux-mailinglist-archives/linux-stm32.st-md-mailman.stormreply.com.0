Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBBEC5AD2A
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 01:44:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8538C628B7;
	Fri, 14 Nov 2025 00:44:45 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C37BAC1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 00:44:44 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b55517e74e3so1195025a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 16:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763081083; x=1763685883;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5LXJv7wRXF9U/cick5b/LfhiRGQebQw7e2o2OTwwBSk=;
 b=ZuApVRvKkCZ/El/rtoA8n4ZDhXrgEVVH9T1amdBCQhqbhV1oanNj/twwhgcapmygyg
 Bdeg8iUPqxDODqhApuOJHzZRXqXghu8p2KxcMa47Z2u/roJU+6e2LfKiPPNRv377yfxS
 +peayHhjKxiMM1Ql8QskmFMhZlF8iWIqj1qYRjkHSYDsAaBIuHar9nshHRDEuZl8InG6
 8HG8nW74O0zdJ3M5y+jbypkNI8c03uLe1TyapkP/7PM3ilROitGgAZQM5DOYI+NWWgrY
 7FyG4vYpTzQEGy4/CtQ8m7IfIpaeU40wa40oziU7wNKydEv35rO3dh39Zlh/Y+5yrDKg
 8x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763081083; x=1763685883;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LXJv7wRXF9U/cick5b/LfhiRGQebQw7e2o2OTwwBSk=;
 b=dUBDNaB5z1the2PtK5mEHnCUkunvkphM/6WReRy9R5ICe2KUBrH0/p08CYyzedV8v+
 2kEZc7MrCkw6xTt3fcjLIwgKB9U9SoGDzRbbC+UxLckWb9+5ZfkYrtIXHHOG4a1VrUfo
 5eh31Ul+lXibwEd4TdRLVRu3mBfEUfijhkE+Z+YCo7LLYQmho1rAbLKrlYC99vJHCeFW
 1+Ydl37mE036Qzv3dXHJin+s3Y8kSpPH1HcuQVUwYZJliRGHzXZiksiVfy4Gtlk8M5gv
 QYXOj0DZ/Ltgv6o4JjghlMwh3leTaYamWLthTxHc/ekndxVYn0yhbwpSFzapeFB7t8ff
 j8Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtrR5uWzNC4MbrDLFYFg2PRfnE7if3TNNY4hYAM33HORt57NvAv5ZbcB2UCPfZxprM3z2dnwArgfEaoQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyoRIXumKI+ywgV2ioyOxYoaeqyl4/jQQEQ5NBAqgsHw7xn8qSY
 OlaS62dl3bMxq1WAHfTdbKZMR8p355Rfeaj64FvyQPlrnLcgSD/fFtf8
X-Gm-Gg: ASbGnctDIH68expc/cQpFNpOJPpQmm3uJ4uk7q9VgAZ6jGgwwRsX8GXdQ/N2LrHm6gx
 eUYcyUfm2JJflXoqyIvYbRYchYZT4TOANgezrWTPKRWF/WXLq+6wg3EUH+LZPzKfh2JaHFKal4X
 T/9paA6qwbkfHT7WUBUkCW/gz6PZF9mugjjfitfJu1uu9tTx3dy7x9atFj3TkZ6g3Sj3TNAI+WH
 /k7uvevnWlnlJ7r5Nj3X0WBBrxpcDQa3lS/mGSOtxQh3Ov/9agQ484b+KY+b0zX3VTkOYjGQs7C
 gWKB7a5CG0HZgqilCeh2CF5U5DoTaTqKlNYixHpmNh+IPacoE/yRM67w7ewBrPCJvAHk7tisbHj
 ImXHowMKsRaz25x41NocolMSXpkGOweSesm+foTTLlV1p1/Oox9aaQ86h+hE2A2aaSTDTIYlJWh
 g=
X-Google-Smtp-Source: AGHT+IEIKjjPhOVUqGPDpl5dOo+GAofGTEs4SPWCZYKYPUBqhOjG64m/9E3v+5NweXcdOCz4DDVv4g==
X-Received: by 2002:a05:701a:ca8c:b0:119:e569:f62b with SMTP id
 a92af1059eb24-11b41707c45mr465043c88.36.1763081082981; 
 Thu, 13 Nov 2025 16:44:42 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b060885e3sm3672341c88.0.2025.11.13.16.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 16:44:42 -0800 (PST)
Date: Fri, 14 Nov 2025 08:44:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>
Message-ID: <yjl3gnf2gwh327wbbwcbkxwnqy5tyhwutffovlxhcm7b4vr2xu@he4tg6bcrduu>
References: <20251114003805.494387-1-inochiama@gmail.com>
 <20251114003805.494387-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114003805.494387-2-inochiama@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Yao Zi <ziyao@disroot.org>,
 Han Gao <rabenda.cn@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, sophgo@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v8 1/3] dt-bindings: net: sophgo,
 sg2044-dwmac: add phy mode restriction
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

On Fri, Nov 14, 2025 at 08:38:03AM +0800, Inochi Amaoto wrote:
> As the ethernet controller of SG2044 and SG2042 only supports
> RGMII phy. Add phy-mode property to restrict the value.
> 
> Also, since SG2042 has internal rx delay in its mac, make
> only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> 
> Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> index ce21979a2d9a..e8d3814db0e9 100644
> --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> @@ -70,6 +70,25 @@ required:
>  
>  allOf:
>    - $ref: snps,dwmac.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sophgo,sg2042-dwmac
> +    then:
> +      properties:
> +        phy-mode:
> +          enum:

> +            - rgmii-rxid
> +            - rgmii-id

Hi, Conor,

I have restricted the phy-mode with wrong mode here, it should be
rgmii-rxid instead of rgmii-txid as the SG2042 always add rx delay
in their mac. As this is more like a mistake for me when writing
the binding, I keep you tag with the fix. If you need something
further, please let me know.

Regards,
Inochi

> +    else:
> +      properties:
> +        phy-mode:
> +          enum:
> +            - rgmii
> +            - rgmii-rxid
> +            - rgmii-txid
> +            - rgmii-id
>  
>  unevaluatedProperties: false
>  
> -- 
> 2.51.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
