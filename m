Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNKOBdvip2mrlAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 08:44:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A11401FBC9B
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 08:44:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 080F5C87ED1;
	Wed,  4 Mar 2026 07:44:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0933C87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 07:44:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 72E3B43422;
 Wed,  4 Mar 2026 07:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F04C19423;
 Wed,  4 Mar 2026 07:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772610263;
 bh=Us0KGNplk7HG7Fg83BdG+51O34emtOY7P1nZiiQ0jEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h14YwVVE6Wj9ayUYI7MGAZoootsuGQ+RsRUIvXmDBYdBvhOGLpsE4P9nw/2i1qmGz
 N+VqJuvhpyVsQ3BBLC2IEcy35P7Ad/6xl3kwoDp9ofcfS11K9avXjLWOkOANI4AyWf
 zJ01vAyxeRvijBP0ed+iFx0t37A5i0q2Lmim14MvcdRkXdKvcAWbmi9LfC7HaHHuYd
 7/rzk8X8A68rxJ7EIcgY3aUvzucihf1RDs3lmV/JqqF5wBtjK2XgakMOwBQlEsoHdv
 /MYd0/fycri9g3fr899YtXuwAMjsl3gXw7WHMGy5a5R7snhJZXIh3OvT7FPtFg0fkX
 B6OXkr5jGjEcQ==
Date: Wed, 4 Mar 2026 08:44:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: lizhi2@eswincomputing.com
Message-ID: <20260304-hot-sponge-of-emphasis-6864db@quoll>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303061637.872-1-lizhi2@eswincomputing.com>
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, alex@ghiti.fr, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] dt-bindings: ethernet:
 eswin: add clock sampling control
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
X-Rspamd-Queue-Id: A11401FBC9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.837];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[eswincomputing.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:16:37PM +0800, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> The second Ethernet controller (eth1) on the EIC7700 SoC may experience
> RX data sampling issues at high speed due to EIC7700-specific receive
> clock to data skew at the MAC input.
> 
> On the EIC7700 SoC, the second Ethernet controller (eth1) requires
> inversion of the internal RGMII receive clock in order to meet RX data
> sampling timing at high speed.
> 
> Describe this SoC-specific difference by introducing a distinct compatible
> string for MAC instances that require internal clock inversion, allowing the
> driver to select the appropriate configuration without relying on per-board
> vendor-specific properties.

Pointless description/paragrapgh. Your explanation why adding a
compatible is "because I need compatible". That's completely redundant.

Explain what is special about this MAC instance, what's different in its
programming model or other characteristics that you claim it is a
different device.

> 
> The rx-internal-delay-ps and tx-internal-delay-ps properties now use
> minimum and maximum constraints to reflect the actual hardware delay
> range (0-2540 ps) applied in 20 ps steps. This relaxes the binding
> validation compared to the previous enum-based definition and avoids
> regressions for existing DTBs while keeping the same hardware limits.
> 
> Treat the RX/TX internal delay properties as optional, board-specific
> tuning knobs and remove them from the example to avoid encouraging
> their use.
> 
> In addition, the binding now includes additional background information
> about the HSP CSR registers accessed by the MAC. The TXD and RXD delay
> control registers are included so the driver can explicitly clear any
> residual configuration left by the bootloader. Background reference for
> the High-Speed Subsystem and HSP CSR block is available in Chapter 10
> ("High-Speed Interface") of the EIC7700X SoC Technical Reference Manual,
> Part 4 (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf):
> https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
> 
> There are currently no in-tree users of the EIC7700 Ethernet driver, so
> these changes are safe.
> 
> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> ---
>  .../bindings/net/eswin,eic7700-eth.yaml       | 75 +++++++++++++++----
>  1 file changed, 59 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> index 91e8cd1db67b..22d1cecea07e 100644
> --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> @@ -20,6 +20,7 @@ select:
>        contains:
>          enum:
>            - eswin,eic7700-qos-eth
> +          - eswin,eic7700-qos-eth-clk-inversion
>    required:
>      - compatible
>  
> @@ -28,9 +29,13 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - const: eswin,eic7700-qos-eth
> -      - const: snps,dwmac-5.20
> +    oneOf:
> +      - items:
> +          - const: eswin,eic7700-qos-eth
> +          - const: snps,dwmac-5.20
> +      - items:
> +          - const: eswin,eic7700-qos-eth-clk-inversion

So just enum for both entries?

Anyway, that's the same device, so you do not get two compatibles. This
should be a property. Which property not sure, maybe all this was
discussed already.


> +          - const: snps,dwmac-5.20
>  
>    reg:
>      maxItems: 1
> @@ -63,16 +68,29 @@ properties:
>        - const: stmmaceth
>  
>    rx-internal-delay-ps:
> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> +    minimum: 0
> +    maximum: 2540
> +    multipleOf: 20
>  
>    tx-internal-delay-ps:
> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> +    minimum: 0
> +    maximum: 2540
> +    multipleOf: 20
>  
>    eswin,hsp-sp-csr:
>      description:
>        HSP CSR is to control and get status of different high-speed peripherals
>        (such as Ethernet, USB, SATA, etc.) via register, which can tune
>        board-level's parameters of PHY, etc.
> +
> +      Additional background information about the High-Speed Subsystem
> +      and the HSP CSR block is available in Chapter 10 ("High-Speed Interface")
> +      of the EIC7700X SoC Technical Reference Manual, Part 4
> +      (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf). The manual is
> +      publicly available at
> +      https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
> +
> +      This reference is provided for background information only.
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
>        - items:
> @@ -81,7 +99,9 @@ properties:
>                           or external clock selection
>            - description: Offset of AXI clock controller Low-Power request
>                           register
> +          - description: Offset of register controlling TXD delay
>            - description: Offset of register controlling TX/RX clock delay
> +          - description: Offset of register controlling RXD delay

As pointed out, you cannot change the order and there is no reason for
doing this explained in commit msg.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
