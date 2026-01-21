Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C2QHPv8cGmgbAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 17:21:15 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 053B459D07
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 17:21:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB256C35E3C;
	Wed, 21 Jan 2026 16:21:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38744C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 16:21:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDD414169D;
 Wed, 21 Jan 2026 16:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97712C4CEF1;
 Wed, 21 Jan 2026 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769012471;
 bh=NGyz5uwtzeGyvCVcwevBJVgXM2mV1JFZjaxPNVyzlf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cFjVUj4H0wsckTkiSoxCEJxs+g1YF+sMLWNTHKCN39KcZ9O/bqtqPigbyqBHcrl6N
 3hG/VgHHw8puwjROLu4lRTxSQpWTe/Cjs6i2kC6GYqqS2VIZEymFmeLkboIuxnyf3F
 K8OYBfpuLkC8lVrd1wruo+keYfzUfqkD6uccp+TGLQ6v31JrUFlzWilKaBFXtIu/lH
 O664njCntVWQIdJx/nLzAbpY2KUQxxwCk4WVXgK3pINcQ96LXfWJrKZqg2kq38r4cC
 /6L4R9+46JTP7u5WegP+KZCt3suZdhkwS3TzQeLvVmzX4tROTrrGM7V5HItgn6mKYb
 kfuFuG65fgl5g==
Date: Wed, 21 Jan 2026 10:21:10 -0600
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20260121162110.GA3314848-robh@kernel.org>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260121071315.940130-2-inochiama@gmail.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
 Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Jose Abreu <joabreu@synopsys.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Yao Zi <ziyao@disroot.org>, Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/3] dt-bindings: net: Add
 support for Spacemit K3 dwmac
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:inochiama@gmail.com,m:vladimir.oltean@nxp.com,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:jernej.skrabec@gmail.com,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:quentin.schulz@cherry.de,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:ziyao@disroot.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:rmk+kernel@armlinux.org.uk,m:yong.liang.choong@linux.intel.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:jernejskrabec
 @gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,google.com,lists.infradead.org,st-md-mailman.stormreply.com,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,cherry.de,kernel.org,redhat.com,vger.kernel.org,eecs.berkeley.edu,disroot.org,bp.renesas.com,armlinux.org.uk,linux.intel.com,st.com,lists.linux.dev,gentoo.org,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 053B459D07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 03:13:09PM +0800, Inochi Amaoto wrote:
> The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> MAC (version 5.40a) with some extra clock.
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
>  .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index dd3c72e8363e..3c2c6cb6b10b 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -34,6 +34,7 @@ select:
>            - snps,dwmac-5.10a
>            - snps,dwmac-5.20
>            - snps,dwmac-5.30a
> +          - snps,dwmac-5.40a

You don't need this in select as the spacemit schema references this 
one.

>            - snps,dwxgmac
>            - snps,dwxgmac-2.10
>  
> @@ -108,6 +109,7 @@ properties:
>          - snps,dwmac-5.10a
>          - snps,dwmac-5.20
>          - snps,dwmac-5.30a
> +        - snps,dwmac-5.40a
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
>          - sophgo,sg2042-dwmac
> @@ -653,6 +655,7 @@ allOf:
>                  - snps,dwmac-5.10a
>                  - snps,dwmac-5.20
>                  - snps,dwmac-5.30a
> +                - snps,dwmac-5.40a
>                  - snps,dwxgmac
>                  - snps,dwxgmac-2.10
>                  - st,spear600-gmac
> diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> new file mode 100644
> index 000000000000..e69f3b60c51f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/spacemit,k3-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Spacemit K3 DWMAC glue layer
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: spacemit,k3-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: spacemit,k3-dwmac
> +      - const: snps,dwmac-5.40a
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
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: MAC interrupt
> +      - description: MAC wake interrupt
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: macirq
> +      - const: eth_wake_irq
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: stmmaceth
> +
> +  spacemit,apmu:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to the syscon node which control the glue register
> +          - description: offset of the control register
> +          - description: offset of the dline register
> +

Drop blank line

> +    description:
> +      A phandle to syscon with offset to control registers for this MAC
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - resets
> +  - reset-names

spacemit,apmu is not required? Looks like the driver requires it.

> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    eth0: ethernet@cac80000 {

Drop unused label.

> +      compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
> +      reg = <0xcac80000 0x2000>;
> +      clocks = <&syscon_apmu 66>, <&syscon_apmu 68>,
> +               <&syscon_apmu 69>;
> +      clock-names = "stmmaceth", "ptp_ref", "tx";
> +      interrupts = <131 IRQ_TYPE_LEVEL_HIGH>, <276 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-names = "macirq", "eth_wake_irq";
> +      phy-mode = "rgmii-id";
> +      phy-handle = <&phy0>;
> +      resets = <&syscon_apmu 67>;
> +      reset-names = "stmmaceth";
> +      spacemit,apmu = <&syscon_apmu 0x384 0x38c>;
> +    };
> +
> -- 
> 2.52.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
