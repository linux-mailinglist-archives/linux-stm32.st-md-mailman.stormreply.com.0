Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBE0A4F76A
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 07:46:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9720BC78F6D;
	Wed,  5 Mar 2025 06:46:26 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DBE1CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 06:46:24 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7c3cf3afc2bso146052485a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Mar 2025 22:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741157183; x=1741761983;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9bNA98XHBa6A4NtZ0UQAOT1rpXsRwMwVDy3StPnIDc=;
 b=HMSySK3BLacF5oGO6HZxtDhm1qCvuIOyAWIXlEnindq6R0IHvcu8FaMZl5dX9319OG
 kpcVJOBHKRE8GZ5JDY/p7Bfyj2O0We3OfAlFxCiMa6os2dPqJzf8mMarpRzQnlwByDjb
 ShwD311Uq+E+YiapmoB9le4H4YvJ+1Xyp0HhT2T1/SfERDBK/Jl46nEHk0QlV1yjjoan
 Pm7nFO/qVMvMCEpRcib00YRaHZ1J/odAFATQHnMtrKLCRkRCx70kSUWuVmqHq/DIgipD
 AnGXNvBRpohCRmk3IvQjH72Xx7Yxz6DX3qSJXu5LiSVSSgc7SgNEUu3QbKCYVF/mhYmO
 Csrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741157183; x=1741761983;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z9bNA98XHBa6A4NtZ0UQAOT1rpXsRwMwVDy3StPnIDc=;
 b=WnDKu5MptA3FIbS4qH0G3UnebFAYjqnilH8PLOKJv14wRKqaUtB//TxDHF6mp5Zv69
 36sgbOz03idIP7SpPXK13MzrgKUshntvXA8Iueqy2m8Wc4odx3uI9iMdTxRvhxqIkvzz
 a/5M91izA6eZ+zz9GK87HLUOM2Z9s+E4HTVNvkKYCOOnbv1z0oha43ZGzs6NH0tXdocJ
 qpCF9pZDWuLTr2I1MEQsEVa476ABRz/o20G1ZjeTYN56dRZDSYUu2JGT1vC/VNU3CUwl
 40t7Hwcf7MfX2Hl/Rpqhpz+OPltPKZQJXk3BW2hWM4mgayiGqTzZiXHKmQpoVEwBCen9
 0l2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4nTmuu1okre08ZA2aAIx+ocgqAOBq9VGt6KYHW5iIQyMorR6ybrHuBiUfifERpyXXP9aG8nSm6oEzUQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx+US+9PROyCjqRfE3/WpucyVRM+iljH2CLHl3Mi9kxkPn/Ft2/
 zgbJbGLHnQMYMQucc3DahlMOmKM0N01tSBkeh3VozMVArK/XFa0G
X-Gm-Gg: ASbGnctHBfIHjpJTXvrCLyk75RTGbBKI01iLRmleqltTjeOZgZOfo1yJ7x5NLk6tHDg
 hVOo3IE4KOBIHlP9PRy/HM8ydgON4yiIj1WwTgO9EEGrDcjFfTg5lIbNlncH+nHT8qP6Iz5iq7Q
 g/e76mb+8yqNYClSjqfPjh7cGj9wN9DRCudgJbbwAFDMD2njzOLxm3ESMDt4ZMX4hUjWwi8ljnI
 ONOFYQNq0s8h/TVOfgdcS0E5uU+BtmYZjhGJ4FDQffSXQ7TYwtBvjMJlbzWS4FYPDRbORP6wBL3
 dO2jRqGG4tnAqYpmZPIm
X-Google-Smtp-Source: AGHT+IELWtfqwszYoCcC2kmAJwyH6o+bHtBOPZmt0BU2jCIoX9fDIaH8na6Ue5jCSeNPLr38nklDeg==
X-Received: by 2002:a05:620a:63c1:b0:7c3:b7c0:cd79 with SMTP id
 af79cd13be357-7c3d8ee1cadmr311033785a.38.1741157183364; 
 Tue, 04 Mar 2025 22:46:23 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c36feea6fbsm848972785a.22.2025.03.04.22.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 22:46:22 -0800 (PST)
Date: Wed, 5 Mar 2025 14:45:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Message-ID: <n7jfcncujogjlysfd6v5bbt7tzun2sicx3r3jq3s5ogm5k4ths@y7wwlyijemgx>
References: <20250305063920.803601-1-inochiama@gmail.com>
 <20250305063920.803601-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250305063920.803601-2-inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Chen Wang <unicorn_wang@outlook.com>, Furong Xu <0x1207@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Simon Horman <horms@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Lothar Rubusch <l.rubusch@gmail.com>,
 sophgo@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Hariprasad Kelam <hkelam@marvell.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v6 1/4] dt-bindings: net: Add
 support for Sophgo SG2044 dwmac
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

On Wed, Mar 05, 2025 at 02:39:13PM +0800, Inochi Amaoto wrote:
> The GMAC IP on SG2044 is almost a standard Synopsys DesignWare
> MAC (version 5.30a) with some extra clock.
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
>  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 91e75eb3f329..02ab6a9aded2 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -32,6 +32,7 @@ select:
>            - snps,dwmac-4.20a
>            - snps,dwmac-5.10a
>            - snps,dwmac-5.20
> +          - snps,dwmac-5.30a
>            - snps,dwxgmac
>            - snps,dwxgmac-2.10
>  
> @@ -98,8 +99,10 @@ properties:
>          - snps,dwmac-4.20a
>          - snps,dwmac-5.10a
>          - snps,dwmac-5.20
> +        - snps,dwmac-5.30a
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
> +        - sophgo,sg2044-dwmac
>          - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
>          - thead,th1520-gmac
> @@ -631,6 +634,7 @@ allOf:
>                  - snps,dwmac-4.20a
>                  - snps,dwmac-5.10a
>                  - snps,dwmac-5.20
> +                - snps,dwmac-5.30a
>                  - snps,dwxgmac
>                  - snps,dwxgmac-2.10
>                  - st,spear600-gmac
> diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> new file mode 100644
> index 000000000000..4dd2dc9c678b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2044 DWMAC glue layer
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - sophgo,sg2044-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sophgo,sg2044-dwmac
> +      - const: snps,dwmac-5.30a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: GMAC main clock
> +      - description: PTP clock
> +      - description: TX clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ptp_ref
> +      - const: tx
> +
> +  dma-noncoherent: true

Hi, Krzysztof,

I add this property due to the discussion on PCIe binding of SG2044, it
can be found on link [1]. As a similar change (at link [2]) was acked by
Conor. I preserve your tag on this binding. If you have any further
requirement, please let me know. I will appreciate it.

[1] https://lore.kernel.org/all/20250221013758.370936-2-inochiama@gmail.com/
[2] https://lore.kernel.org/all/20250303065649.937233-1-inochiama@gmail.com/

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
