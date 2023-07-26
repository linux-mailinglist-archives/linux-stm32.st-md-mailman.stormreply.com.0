Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 250DD7640CC
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 22:57:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0BAAC6B45C;
	Wed, 26 Jul 2023 20:57:34 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DCD0C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 20:57:33 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so66594b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 13:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690405052; x=1691009852;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=40xe9fvFJ9sOsupKilGdDObjo09oxlOirIRg3aGbZbs=;
 b=aghccPiw+p9jl5oj4/mcOtE1wC1J1UAJ2zUK/5yyjyk1dFvroG7sU6HuGwpy9/hvVj
 5jK+Jb3SxNJ5ZQIFHmq3EExt5e9K5UJ4J13mbKBPTqxwJ5djmgPP30A/L6rafMnaawiv
 DHONLr/aScs0ReBeBekOjIRVTu0W3tPcZ4NTpBDC9cMzvmQSp6Y2UdwdNx+LG0E81zy3
 pSBmUU8BFSyB4tjXLaaGKaFvhZbQ836OmdxBiK4bGLRdPL3sbNomzAKelKvSLeV9VEni
 8LzVfDBqMBOw7bIYBmYiiJVZdxrjXfslOoK1xcJxmbJFTcBfwY1JE4AvVf+o8G9CmVUc
 iNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690405052; x=1691009852;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40xe9fvFJ9sOsupKilGdDObjo09oxlOirIRg3aGbZbs=;
 b=P6E0Jnh/Ia6uakNCm0O6MFpyhOPgViYuBUAH2D6ryM6RyWX/Ttb8KpN5oSn/utmCA6
 0xyqtIIgluof3Zy83XhDGwRL1wYPLxQei6KiaGNuDEktJ1QWA8cGdRYyBxCCbTlEyWOz
 zjYZLvfOHoqLDJkFoKk3VH/nvGrO0WZD7tjk6k1+vrGdHnknpGCJkrJ6bkIZYu94pjCD
 uuxyO/MSC5/8Tzo3KMmWQZAzNliLp0+53WgJS+4OsaK3wJzl/kuYcrhxmiTqp1/9zdha
 eaGbX8kVmSz7V7Yv254zDtfuI31V9ZJgl0DMKDCGiTd9O0ZKVMg8iPEH69mwAJxMC8DZ
 RFYw==
X-Gm-Message-State: ABy/qLaed8ypJrLrHfOfSlp8AOh56SQ/JoRrrHA1PlmKSpWpESqOzgqn
 Hn8Ftsi/PaZuNWorEnozPsk=
X-Google-Smtp-Source: APBJJlFwOFlKgUr5EHQGcfI4UKTPdcLNmhmJVe7LY3hHHwZO0dDZEIG8OC7wGY1Ci/7PEnT5pj2+sA==
X-Received: by 2002:a05:6a00:4a0e:b0:677:3439:874a with SMTP id
 do14-20020a056a004a0e00b006773439874amr3577463pfb.3.1690405051983; 
 Wed, 26 Jul 2023 13:57:31 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8000:54:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 n10-20020aa7904a000000b00682c864f35bsm27660pfo.140.2023.07.26.13.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 13:57:31 -0700 (PDT)
Date: Wed, 26 Jul 2023 13:57:28 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <ZMGIuKVP7BEotbrn@hoboy.vegasvil.org>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Jul 24, 2023 at 12:01:31PM +0200, Johannes Zink wrote:

Earlier versions of the IP core return zero from these...

> +#define	PTP_TS_INGR_LAT	0x68	/* MAC internal Ingress Latency */
> +#define	PTP_TS_EGR_LAT	0x6c	/* MAC internal Egress Latency */

and so...

> +static void correct_latency(struct stmmac_priv *priv)
> +{
> +	void __iomem *ioaddr = priv->ptpaddr;
> +	u32 reg_tsic, reg_tsicsns;
> +	u32 reg_tsec, reg_tsecsns;
> +	u64 scaled_ns;
> +	u32 val;
> +
> +	/* MAC-internal ingress latency */
> +	scaled_ns = readl(ioaddr + PTP_TS_INGR_LAT);
> +
> +	/* See section 11.7.2.5.3.1 "Ingress Correction" on page 4001 of
> +	 * i.MX8MP Applications Processor Reference Manual Rev. 1, 06/2021
> +	 */
> +	val = readl(ioaddr + PTP_TCR);
> +	if (val & PTP_TCR_TSCTRLSSR)
> +		/* nanoseconds field is in decimal format with granularity of 1ns/bit */
> +		scaled_ns = ((u64)NSEC_PER_SEC << 16) - scaled_ns;
> +	else
> +		/* nanoseconds field is in binary format with granularity of ~0.466ns/bit */
> +		scaled_ns = ((1ULL << 31) << 16) -
> +			DIV_U64_ROUND_CLOSEST(scaled_ns * PSEC_PER_NSEC, 466U);
> +
> +	reg_tsic = scaled_ns >> 16;
> +	reg_tsicsns = scaled_ns & 0xff00;
> +
> +	/* set bit 31 for 2's compliment */
> +	reg_tsic |= BIT(31);
> +
> +	writel(reg_tsic, ioaddr + PTP_TS_INGR_CORR_NS);

here reg_tsic = 0x80000000 for a correction of -2.15 seconds!

@Jakub  Can you please revert this patch?

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
