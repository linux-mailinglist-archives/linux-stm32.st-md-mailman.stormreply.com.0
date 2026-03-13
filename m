Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJnJHLN3s2mwWgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 03:34:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D827CD04
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 03:34:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98C30C8F29B;
	Fri, 13 Mar 2026 02:34:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3EE0C8F28F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 02:34:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 20E824078B;
 Fri, 13 Mar 2026 02:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D41CC4CEF7;
 Fri, 13 Mar 2026 02:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773369262;
 bh=fI4DMsqLEbxULT+64Hl2jZcUeY9iULBhKP8OUx2adlY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZcCYKwjAaTbe42TPu6skNnR42pX3ozbbmWH6WAa9A+ON5RVxKNJg0YgrHdHdIlH2e
 /SKtBOGHV52hJPL6XqnVnI/RM/P100HpyrxOb7wCh6B5AlpTImeIZVogeSpjBZA28C
 /RDPzVL08Nq3iEGqM33KIJwkzK8MsyCeIrHHGSmoVKPgg2MD/7oc8hb+0GpQSbe7/r
 B/2foPwYR2Uwzw30bQZP+wSmEefkG0vi9eCx4ia+eDY4gaI8CMY3YigLOW+ctNeC1W
 IeRjERcG4zRbRscT5zZubZnp9lJYppdupwyyygvM0nNxaq14tcDX/Xq9jUyUSALKas
 efy3yzSqXsIXQ==
From: Jakub Kicinski <kuba@kernel.org>
To: inochiama@gmail.com
Date: Thu, 12 Mar 2026 19:34:17 -0700
Message-ID: <20260313023417.1577310-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312012232.373713-2-inochiama@gmail.com>
References: <20260312012232.373713-2-inochiama@gmail.com>
MIME-Version: 1.0
Cc: vladimir.oltean@nxp.com, looong.bin@gmail.com, edumazet@google.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 siyanteng@cqsoftware.com.cn, joabreu@synopsys.com, dlan@kernel.org,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com, me@ziyao.cc,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 richardcochran@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, peppe.cavallaro@st.com, wens@kernel.org,
 spacemit@lists.linux.dev, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, dlan@gentoo.org, netdev@vger.kernel.org,
 quentin.schulz@cherry.de, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 palmer@dabbelt.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next, v9,
	1/4] dt-bindings: net: Add support for Spacemit K3 dwmac
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:inochiama@gmail.com,m:vladimir.oltean@nxp.com,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:dlan@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:me@ziyao.cc,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:rmk+kernel@armlinux.org.uk,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:quentin.schulz@cherry.de,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@
 kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,redhat.com,ziyao.cc,vger.kernel.org,eecs.berkeley.edu,bp.renesas.com,armlinux.org.uk,st.com,lists.linux.dev,gentoo.org,cherry.de,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url]
X-Rspamd-Queue-Id: 097D827CD04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
dt-bindings: net: Add support for Spacemit K3 dwmac

The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare MAC
(version 5.40a) with some extra clock. This patch adds the necessary
compatible string for this device, along with a new binding document
defining the required properties.

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 38bc34dc4f09..98ebb6276bc6 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -109,6 +109,7 @@ properties:
>          - snps,dwmac-5.10a
>          - snps,dwmac-5.20
>          - snps,dwmac-5.30a
> +        - snps,dwmac-5.40a
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
>          - sophgo,sg2042-dwmac

[ ... ]

> @@ -656,6 +657,7 @@ allOf:
>                  - snps,dwmac-5.10a
>                  - snps,dwmac-5.20
>                  - snps,dwmac-5.30a
> +                - snps,dwmac-5.40a
>                  - snps,dwxgmac
>                  - snps,dwxgmac-2.10
>                  - st,spear600-gmac

Is snps,dwmac-5.40a missing from the select block? The binding document has
a comment at lines 14-17 stating:

    # Select every compatible, including the deprecated ones. This way, we
    # will be able to report a warning when we have that compatible, since
    # we will validate the node thanks to the select.

Every other snps,dwmac-* version from 3.40a through 5.30a appears in all three
locations: the select block (lines 19-43), the properties.compatible enum
(lines 95-118), and the allOf conditional block (lines 643-673). However,
snps,dwmac-5.40a only appears in the properties.compatible enum and the allOf
block.

Without the entry in the select block, a device tree node using
'snps,dwmac-5.40a' as a standalone compatible (without a vendor-specific first
entry like 'spacemit,k3-dwmac') would not be selected by this schema for
validation.

[ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
