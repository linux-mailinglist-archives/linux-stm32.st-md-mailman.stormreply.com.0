Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9C1456E77
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Nov 2021 12:50:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B069C5E2CC;
	Fri, 19 Nov 2021 11:50:23 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF438C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 11:50:22 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637322622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W6POUtH0WDjnpAZtH7GQuxf8NJaaCIqaSsDxPmV6kD0=;
 b=lWRkikNjJqFLkzp8GfhLlK48dWK3PnwvmzuzmcLeugYBWXERU++QA5o3aodUozL/UU6Bk5
 q4mkTxizBm3JsAWHrEjZYw1tfoI4YAPLHPyyErTkyh8IdsuuXN1T1P64mJULdpqO3XavSA
 K+TeZ2+0ReY64Z/pIx9AA3HEcK9YO5NOcbTk2V6jgZBAMzqn0uMr6Buw7LnB1Ca+/EwGT+
 rfLh6dxKAKXlgF1Wz1HYQ24X86Wj7e+4dUgqGrV2azvmwfv+1/d/NLG9yt6mJdSUb3J2YH
 +shzf2Ayjz9QloPIYth0xdrawUF/2jWdW7YQaTbZeuS9PzOLg+wTrHD3Kqzxnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637322622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W6POUtH0WDjnpAZtH7GQuxf8NJaaCIqaSsDxPmV6kD0=;
 b=54dZLbDVlE9rd1vOqGyu5HTixoKcrtmVLROgHRGExJiS69IYlMpPi2uUTD2JrWUP0GuZMX
 glQETqFGnlGETCCQ==
To: Kurt Kanzenbach <kurt@linutronix.de>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
In-Reply-To: <20211119081010.27084-1-kurt@linutronix.de>
References: <20211119081010.27084-1-kurt@linutronix.de>
Date: Fri, 19 Nov 2021 12:50:21 +0100
Message-ID: <87mtm0l5z6.ffs@tglx>
MIME-Version: 1.0
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Benedikt Spranger <b.spranger@linutronix.de>,
 Voon Weifeng <weifeng.voon@intel.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Caclucate clock
 domain crossing error only once
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

Kurt,

On Fri, Nov 19 2021 at 09:10, Kurt Kanzenbach wrote:

> The clock domain crossing error (CDC) is calculated at every fetch of Tx or Rx
> timestamps. It includes a division. Especially on arm32 based systems it is
> expensive. It also saves the two conditionals.

This does not make sense. What you want to say here is:

  It also requires two conditionals in the hotpath.

> Therefore, move the calculation to the PTP initialization code and just use the
> cached value in the timestamp retrieval functions.

Maybe:

  Add a compensation value cache to struct plat_stmmacenet_data and
  subtract it unconditionally in the RX/TX functions which spares the
  conditionals.

  The value is initialized to 0 and if supported calculated in the PTP
  initialization code.

or something to that effect.

> +	/* Calculate the clock domain crossing (CDC) error if necessary */
> +	priv->plat->cdc_error_adj = 0;
> +	if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate)
> +		priv->plat->cdc_error_adj = (2 * NSEC_PER_SEC) /
> +			priv->plat->clk_ptp_rate;

Nit. Just let stick it out. We lifted the 80 char limitation some time ago.

Thanks,

        tglx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
