Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3FnsHGmbgWlYHwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 07:53:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1C7D57AC
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 07:53:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 952B5C87EC8;
	Tue,  3 Feb 2026 06:53:28 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73FD3C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Feb 2026 20:51:27 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b8871718b00so837266066b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Feb 2026 12:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770065487; x=1770670287;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MjBpuLkcLUaCRKPdP4eX6OjLAhe9FJoKGb09vlloYBU=;
 b=bIbyRiP73pIDIXD9sah5iYzLrf6chLEb5kxDIzuC2ULxKBQSGEyFyLiKNSf0sjOYRH
 CWvFvg+fXDaY6T6XqyEs+uLGcJfow2ttzML0jF0hfIaYArjFVGtKRDElvVpMXCBTaacC
 06rsVZrn1cKd01zyBt7BtGpc5eg+4Pqg7/Ns/wP5IN+Ei8zsNCrcspxqd6Uifs7dT0ad
 n6vafvbAYt6tKlMdtju3PUKAFDyEVnpwe0WlZHkrDkq1x2prGKdZ2BFckxW2UGpSrC7o
 3hAMPfjN0ahbRJQHtrMHqqan+bOO46EO1YuH0VCiQLYMxS4GRSZulscBlX32M+DQcjn4
 9jmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770065487; x=1770670287;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MjBpuLkcLUaCRKPdP4eX6OjLAhe9FJoKGb09vlloYBU=;
 b=CZ3vfoFcjYvVtzaFEMy5UHTmV0FN95ZvvhV2lUlCMohMqiyoyX129+rmUI1IYDeTrI
 +hKWAOOklVq7yx216e0Ner5OmkiieZKMeEdbAxKFb6AQaVX9Vtr+TeJ/gKssUtcwVcl+
 WcdxGCz0dcW2GzRWj/Gn9OwjxMpIUZONhxUSmsxpgFWmOzol6w+LEGqGdP+3q4hrvB2A
 ZMlSYbZSvrwg543kZNwoOzzGVTuDEellbf48b1Qbt9xKnKyM+byVvb+kjGYCkcwoeHT9
 OWzo4iH6RF0eBw/PjXBD8880pJ9g6uk5G95ssMG8B5aqqDCQPGNuGlwz19Im/VxTcaUi
 f1BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMCot3Mbax4ugLpvYMyE5/CELkIOPPvhW4tUhZu3aLPJ7mpZDfm3KnAh/zI2niDC3yVZ+jV4dkUD1/eA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz7N4YqPHCeIBEGC+VAr+QM/HdER5wmmDmzarMadmJBWXFKtrNo
 Ytmyij44JNM1+54dU4cYUQK53Tcvt7Pqj1jpl7VYpfSdxMpo7arAEZHjSDDMkQ==
X-Gm-Gg: AZuq6aLP3h5q4LVQ3j2Rq0DIjfTjiiQ4jVwMTJ5Hv8SQJ82Hl+nBcCtWwMEMAls21uT
 1kNORvhFNw5Of5KnXTz/da60eQSBAA3JqaYmQgqz9WkshNIdncnWMsf7vDUx9qmJXOjdeRb5sdi
 79FwK82hAu/aLDP/+iaEs5ilGWdhbMasQJjO9av6kvrbqnla8966z97tl1fu9pN2fguYonMxEYf
 aiJgl1G0k6ccZc45AKarTEJYszBae70+lmlLg3QcBuCQ8x7pmfdDYEUmkOOG+cEYtv+jchxVr1X
 kMiHSOW/4BuOdQdm0oB937tsLNyikq4w2Vwes/BEi/+2MU/JXaGcpPvTpXI/JxGnOlVmsGai6H4
 ++YzFdvAg2228P3Q2oe63QCEdKcxBhk2bk8cCyVJ5nYkSEfgbgIWICNU9H/HENw4Fb8MOnVI9pf
 vSdKo4Pb4OYvbflJeyC6/f1xYs
X-Received: by 2002:a05:600c:1385:b0:47e:dc64:f1c6 with SMTP id
 5b1f17b1804b1-482db493eb4mr189595615e9.6.1770058495160; 
 Mon, 02 Feb 2026 10:54:55 -0800 (PST)
Received: from [192.168.0.7] ([86.124.200.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482db623407sm125687055e9.0.2026.02.02.10.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 10:54:54 -0800 (PST)
Message-ID: <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
Date: Mon, 2 Feb 2026 20:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
X-Mailman-Approved-At: Tue, 03 Feb 2026 06:53:28 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Clark Wang <xiaoning.wang@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Wei Fang <wei.fang@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: provide flag to
	disable EEE
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ovidiupanaitoss@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:imx@lists.linux.dev,m:edumazet@google.com,m:laurent.pinchart@ideasonboard.com,m:stefan.klug@ideasonboard.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:ghidoliemanuele@gmail.com,m:kieran.bingham@ideasonboard.com,m:o.rempel@pengutronix.de,m:xiaoning.wang@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:dan.scally@ideasonboard.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:wei.fang@nxp.com,m:shawnguo@kernel.org,m:davem@davemloft.net,m:hkallweit1@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiupanaitoss@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,lists.linux.dev,google.com,ideasonboard.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,pengutronix.de,nxp.com,redhat.com,lists.infradead.org,vger.kernel.org,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: EA1C7D57AC
X-Rspamd-Action: no action


Hi Russell,

On 11/24/25 1:27 PM, Russell King (Oracle) wrote:
> Some platforms have problems when EEE is enabled, and thus need a way
> to disable stmmac EEE support. Add a flag before the other LPI related
> flags which tells stmmac to avoid populating the phylink LPI
> capabilities, which causes phylink to call phy_disable_eee() for any
> PHY that is attached to the affected phylink instance.
> 
> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
> to the receive clock domain, and takes four clock cycles to clear, this
> leads to interrupt storms as the interrupt remains asserted for some
> time after the LPI control and status register is read.
> 
> This problem becomes worse when the receive clock from the PHY stops
> when the receive path enters LPI state - which means that lpi_intr_o
> can not deassert until the clock restarts. Since the LPI state of the
> receive path depends on the link partner, this is out of our control.
> We could disable RX clock stop at the PHY, but that doesn't get around
> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
> 
> Previously, iMX8MP worked around this by disabling gigabit EEE, but
> this is insufficient - the problem is also visible at 100M speeds,
> where the receive clock is slower.
> 
> There is extensive discussion and investigation in the thread linked
> below, the result of which is summarised in this commit message.
> 

We are seeing the same lpi_intr_o interrupt storm on the Renesas RZ/V2H
EVK (dwmac-renesas-gbeth.c). On this platform, lpi_intr_o is routed as a
separate, dedicated interrupt line to the CPU rather than being OR'd
with the main DWMAC interrupt as on iMX8MP. This corresponds to the
"eth_lpi" interrupt in the stmmac bindings:
"""
- description: The interrupt that occurs when Rx exits the LPI state
const: eth_lpi
"""

Looking through the other glue drivers/device-trees, it looks to me that
every platform that defines a separate "eth_lpi" irq might have the
interrupt storm problem.

To fix this issue on these platforms, rather than disabling EEE
altogether, would it be possible to just not request the eth_lpi
interrupt and let EEE continue to work? Perhaps a new flag could let
each platform decide.

If not, maybe this patch could be merged to add the flag that disables
EEE and I will just send a patch to disable EEE on our platforms as well.

Thanks,
Ovidiu


> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart@ideasonboard.com
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> For Laurent to add to a patch series appropriately adding
> STMMAC_FLAG_EEE_DISABLE to dwmac-imx.c
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
>  include/linux/stmmac.h                            | 9 +++++----
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 6cacedb2c9b3..ca0eee58a8a8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1324,7 +1324,12 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
>  				 config->supported_interfaces,
>  				 pcs->supported_interfaces);
>  
> -	if (priv->dma_cap.eee) {
> +	/* Some platforms, e.g. iMX8MP, wire lpi_intr_o to the same interrupt
> +	 * used for stmmac's main interrupts, which leads to interrupt storms.
> +	 * STMMAC_FLAG_EEE_DISABLE allows EEE to be disabled on such platforms.
> +	 */
> +	if (priv->dma_cap.eee &&
> +	    !(priv->plat->flags & STMMAC_FLAG_EEE_DISABLE)) {
>  		/* Assume all supported interfaces also support LPI */
>  		memcpy(config->lpi_interfaces, config->supported_interfaces,
>  		       sizeof(config->lpi_interfaces));
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index f1054b9c2d8a..5ed49d5363ee 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -187,10 +187,11 @@ enum dwmac_core_type {
>  #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
>  #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
>  #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
> -#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
> -#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
> -#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
> -#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
> +#define STMMAC_FLAG_EEE_DISABLE			BIT(10)
> +#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(11)
> +#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(12)
> +#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(13)
> +#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(14)
>  
>  struct mac_device_info;
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
