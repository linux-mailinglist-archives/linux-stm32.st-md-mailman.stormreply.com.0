Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB24B382B5
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 14:43:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 639F0C32E8E;
	Wed, 27 Aug 2025 12:43:48 +0000 (UTC)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3005C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 12:43:46 +0000 (UTC)
Message-ID: <228e871e-a5c7-4570-b672-a97ac3db90c5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1756298625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XXPK9rgm6hm8EGqcOxFtZdeNx/wbCo+a/fjPKpMhLw=;
 b=hLDL+MAeFdO6S6GwZPo1qT89iojAr28gdNsifMukqxo6jLtLXLp09wsQpXUT20NMePmJzl
 +hexT091mG1JyUQ1gBSNCqhuFLf6zoRLv5jpZnmAONL2ZIZL/ysE7sS7x1tgJDZG900Nyw
 /xW7WAPkq+XrMuaOv5g9JWlqYu3+DaU=
Date: Wed, 27 Aug 2025 13:43:31 +0100
MIME-Version: 1.0
To: weishangjuan@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
 rmk+kernel@armlinux.org.uk, faizal.abdul.rahim@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
 jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
 boon.khai.ng@altera.com, 0x1207@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250827081135.2243-1-weishangjuan@eswincomputing.com>
 <20250827081418.2347-1-weishangjuan@eswincomputing.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250827081418.2347-1-weishangjuan@eswincomputing.com>
X-Migadu-Flow: FLOW_OUT
Cc: ningyu@eswincomputing.com, lizhi2@eswincomputing.com,
 linmin@eswincomputing.com
Subject: Re: [Linux-stm32] [PATCH v4 2/2] ethernet: eswin: Add eic7700
	ethernet driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 27/08/2025 09:14, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add Ethernet controller support for Eswin's eic7700 SoC. The driver
> provides management and control of Ethernet signals for the eiC7700
> series chips.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> ---

[...]

> +/**
> + * eic7700_apply_delay - Update TX or RX delay bits in delay parameter value.
> + * @delay_ps: Delay in picoseconds (capped at 12.7ns).
> + * @reg:      Pointer to register value to modify.
> + * @is_rx:    True for RX delay (bits 30:24), false for TX delay (bits 14:8).
> + *
> + * Converts delay to 0.1ns units, caps at 0x7F, and sets appropriate bits.
> + * Only RX or TX bits are updated; other bits remain unchanged.
> + */
> +static inline void eic7700_apply_delay(u32 delay_ps, u32 *reg, bool is_rx)

inlining functions in .c files is discouraged in netdev, let the
compiler decide inlining

> +{
> +	if (!reg)
> +		return;

please, avoid defensive programming. with this check you also mixing
code and variables..

> +
> +	u32 val = min(delay_ps / 100, EIC7700_MAX_DELAY_UNIT);
 > +> +	if (is_rx) {
> +		*reg &= ~EIC7700_ETH_RX_ADJ_DELAY;
> +		*reg |= (val << 24) & EIC7700_ETH_RX_ADJ_DELAY;
> +	} else {
> +		*reg &= ~EIC7700_ETH_TX_ADJ_DELAY;
> +		*reg |= (val << 8) & EIC7700_ETH_TX_ADJ_DELAY;

these 2 assignments should be converted to FIELD_PREP()

> +	}
> +}
> +
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
