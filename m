Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG1EDFVH5mnSuAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2026 17:33:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E0742E548
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2026 17:33:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E90BC5663A;
	Mon, 20 Apr 2026 15:33:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C04EBC56612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 15:33:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C177B600CB;
 Mon, 20 Apr 2026 15:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB776C2BCB6;
 Mon, 20 Apr 2026 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776699217;
 bh=Kjn532amPlaxRPE+ZdGcJATDJi/VPSFQUdv5WzNh3iQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J11F5QCYiqW9f+FhXzUDFhRkgicfaczvTTTau4KaRSn4neTbdcCd30wvVz/YZ1xCe
 oqPzbdI7kX/dtrKjpsCniam/m5IYQjV9mnNscDlUPk1jxAJf+XG2db3Q3W0JLWMigt
 tCfZHRso3vpYoNYVcPdfu2ZWNzQfmRpdjfabXCibgYFVndLyK+D49fJhW9hd6qbbzn
 LZtYOXco0BhQ2tuyTBhBreacs4LEtyimjQIUSdpkiNbl1uQb+WFncUtq/cm78GpJ8L
 orroCGJd+BUumTBtViNQ/EByhVV4NsxbKCyR5kzZywq3H5uWtys5+FDxtqotCSOmuk
 PquIH7zpKJr8g==
Date: Mon, 20 Apr 2026 17:33:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <20260420-messy-elite-panther-a7ffbc@quoll>
References: <20260417024523.107786-1-minda.chen@starfivetech.com>
 <20260417024523.107786-3-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260417024523.107786-3-minda.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next v2 2/5] dt-bindings: net: starfive,
 jh7110-dwmac: Add JHB100 support
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:minda.chen@starfivetech.com,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,kernel.org,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net];
	NEURAL_SPAM(0.00)[0.170];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B9E0742E548
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 10:45:20AM +0800, Minda Chen wrote:
> Add StarFive JHB100 dwmac support and compatible.
> The JHB100 dwmac shares the same driver code as the JH7110 dwmac,

Please describe the hardware or programming interface, not driver code.

> which contains 2 SGMII interfaces, 1 RGMII/RMII interface and
> 1 RMII interface.
> JHB100 dwmac has only one reset signal and one main interrupt
> line.


Drop all below, not relevant.

> 
> Please refer to below:
> 
> JHB100: reset-names = "stmmaceth";
> 
> Example usage of JHB100 in the device tree:
> 
> gmac0: ethernet@11b80000 {
>         compatible = "starfive,jhb100-dwmac",
>                      "snps,dwmac-5.20";
>         interrupts = <225>;
>         interrupt-names = "macirq";
>         ...
> };
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 23 +++++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 38bc34dc4f09..85cd3252e8b1 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -115,6 +115,7 @@ properties:
>          - sophgo,sg2044-dwmac
>          - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
> +        - starfive,jhb100-dwmac
>          - tesla,fsd-ethqos
>          - thead,th1520-gmac
>  
> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> index 0d1962980f57..edc246a71ce3 100644
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -18,6 +18,7 @@ select:
>          enum:
>            - starfive,jh7100-dwmac
>            - starfive,jh7110-dwmac
> +          - starfive,jhb100-dwmac
>    required:
>      - compatible
>  
> @@ -30,6 +31,9 @@ properties:
>        - items:
>            - const: starfive,jh7110-dwmac
>            - const: snps,dwmac-5.20
> +      - items:
> +          - const: starfive,jhb100-dwmac

So that's an enum in previous "items" list.... but your commit msg said
your devices are compatible, so confusing.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
