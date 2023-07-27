Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EBD76485C
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jul 2023 09:20:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD52AC6B463;
	Thu, 27 Jul 2023 07:20:29 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43709C6B45C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 07:20:29 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qOvIF-0000DH-VE; Thu, 27 Jul 2023 09:20:16 +0200
Message-ID: <729dd79e-83aa-0237-1edd-1662a6ae28cd@pengutronix.de>
Date: Thu, 27 Jul 2023 09:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US, de-DE
To: Richard Cochran <richardcochran@gmail.com>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <ZMGIuKVP7BEotbrn@hoboy.vegasvil.org>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <ZMGIuKVP7BEotbrn@hoboy.vegasvil.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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

Hi Richard,

On 7/26/23 22:57, Richard Cochran wrote:
> On Mon, Jul 24, 2023 at 12:01:31PM +0200, Johannes Zink wrote:
> 
> Earlier versions of the IP core return zero from these...
> 
>> +#define	PTP_TS_INGR_LAT	0x68	/* MAC internal Ingress Latency */
>> +#define	PTP_TS_EGR_LAT	0x6c	/* MAC internal Egress Latency */
> 

good catch. Gonna send a v3 with a check to and set the values for dwmac v5 only.

Best regards
Johannes


> and so...
> 
>> +static void correct_latency(struct stmmac_priv *priv)
>> +{
>> +	void __iomem *ioaddr = priv->ptpaddr;
>> +	u32 reg_tsic, reg_tsicsns;
>> +	u32 reg_tsec, reg_tsecsns;
>> +	u64 scaled_ns;
>> +	u32 val;
>> +
>> +	/* MAC-internal ingress latency */
>> +	scaled_ns = readl(ioaddr + PTP_TS_INGR_LAT);
>> +
>> +	/* See section 11.7.2.5.3.1 "Ingress Correction" on page 4001 of
>> +	 * i.MX8MP Applications Processor Reference Manual Rev. 1, 06/2021
>> +	 */
>> +	val = readl(ioaddr + PTP_TCR);
>> +	if (val & PTP_TCR_TSCTRLSSR)
>> +		/* nanoseconds field is in decimal format with granularity of 1ns/bit */
>> +		scaled_ns = ((u64)NSEC_PER_SEC << 16) - scaled_ns;
>> +	else
>> +		/* nanoseconds field is in binary format with granularity of ~0.466ns/bit */
>> +		scaled_ns = ((1ULL << 31) << 16) -
>> +			DIV_U64_ROUND_CLOSEST(scaled_ns * PSEC_PER_NSEC, 466U);
>> +
>> +	reg_tsic = scaled_ns >> 16;
>> +	reg_tsicsns = scaled_ns & 0xff00;
>> +
>> +	/* set bit 31 for 2's compliment */
>> +	reg_tsic |= BIT(31);
>> +
>> +	writel(reg_tsic, ioaddr + PTP_TS_INGR_CORR_NS);
> 
> here reg_tsic = 0x80000000 for a correction of -2.15 seconds! >
> @Jakub  Can you please revert this patch?
> 
> Thanks,
> Richard
> 
> 

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
