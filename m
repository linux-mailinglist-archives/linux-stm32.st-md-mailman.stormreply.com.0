Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 564C69F9A54
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 20:23:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F220FC69063;
	Fri, 20 Dec 2024 19:23:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5079ECFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 19:23:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 341FE5C66E5;
 Fri, 20 Dec 2024 19:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25C5C4CECD;
 Fri, 20 Dec 2024 19:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734722608;
 bh=8MxBm/f/RHRQ3Gf57kt1o4LmZnVEmLGOSZcQVADCAN0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=djOfBf0+CwiRSXzRXh+w8lKqe3/DU+eQhTOIe0cGk6wkQTcpqHTvU1TSs9S7Bzx3E
 +HnsJKzzQ25RD9xjhgHXyWJzyVedM7Ic9gxUmlWzffxj9UEUguIMq5LB6KbUWJKS0B
 FWK21rN7nNx1/D11q1enDMD2180jDVum3lxYNAKkDWUv3QMXJCEzcoBB75/ud0TZDq
 SGvxMPzdlLsNI0ehKXwtubqZPbxBR56FpXTty+XDavwLi1ATLO0+hQjifU5ckT+fft
 sRFgiDAWHt1uP/vnsfjia8wzsc1qTDn+ETwEhNfsx07R+O/KvOy4bAqbokry5hKMMK
 6E1wi8mMwZabg==
Date: Fri, 20 Dec 2024 19:23:17 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20241220192317.1266a34e@jic23-huawei>
In-Reply-To: <20241220095927.1122782-4-fabrice.gasnier@foss.st.com>
References: <20241220095927.1122782-1-fabrice.gasnier@foss.st.com>
 <20241220095927.1122782-4-fabrice.gasnier@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, ukleinek@kernel.org,
 krzk+dt@kernel.org, will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 3/9] iio: trigger: stm32-timer: add
 support for stm32mp25
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

On Fri, 20 Dec 2024 10:59:21 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> this new HW variant. Add TIM20 trigger definitions that can be used by
> the stm32 analog-to-digital converter. Use compatible data to identify
> it.
> As the counter framework is now superseding the deprecated IIO counter
> interface (IIO_COUNT), don't support it. Only register IIO trigger
> devices for ADC usage. So, make the valids_table a cfg option.
> 
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
I'm not seeing any compile time dependencies, so I've picked this one up.
Applied to the togreg branch of iio.git and pushed out initially as testing
to let 0-day see if I missed anything.

Thanks,

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
