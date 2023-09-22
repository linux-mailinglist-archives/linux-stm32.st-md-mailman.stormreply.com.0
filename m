Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B01CF7AAE8C
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 11:46:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4427BC6C82F;
	Fri, 22 Sep 2023 09:46:12 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE580C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 09:46:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DCA0ACE23A8;
 Fri, 22 Sep 2023 09:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B323C433C7;
 Fri, 22 Sep 2023 09:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695375967;
 bh=2ZqJg/JyagscC0zGrbJOL5exgL9GpMI8zoZzbRLoF7E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i1h9hc1vyL0d8fPYkZb5zjoNiQWrTzzy1UDHQi43TnS5vQG3oCUVHGV5CACeQmXV4
 hv2g/krywG9c+snlMzxsinwKjADXi0ZxxdDRv7UlO0wmcqcQ7sXGHnqsy2O4JlJvjr
 yBuQ+A/6MXrwNBm9vKlClwtxzXUXV5WmuR4EtFrPBmYYc+a+I8ozQkgbtzByDB74dJ
 Yss8T/iwWJlChVk46FIOC2IW/gzC6Mu41gGF5E+5jlyqCSsTC8xjFnOaTS69pb8igl
 sRcswxE7sfkCoIagyUp9JFI9cFVtwYpIpmDN3pUUkksRveUDMTmZTVBUBEwdVKjFAS
 LUoen6AzOSbQw==
Date: Fri, 22 Sep 2023 10:45:52 +0100
From: Simon Horman <horms@kernel.org>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <20230922094552.GY224399@kernel.org>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
 <20230921121946.3025771-2-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921121946.3025771-2-yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Jean Delvare <jdelvare@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 platform-driver-x86@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/5] arch: x86: Add IPC
 mailbox accessor function and add SoC register access
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

On Thu, Sep 21, 2023 at 08:19:42PM +0800, Choong Yong Liang wrote:
> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
> - Add support to use IPC command allows host to access SoC registers
> through PMC firmware that are otherwise inaccessible to the host due to
> security policies.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Chao Qin <chao.qin@intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

...

> diff --git a/include/linux/platform_data/x86/intel_pmc_ipc.h b/include/linux/platform_data/x86/intel_pmc_ipc.h
> new file mode 100644
> index 000000000000..25ba57b8a7ea
> --- /dev/null
> +++ b/include/linux/platform_data/x86/intel_pmc_ipc.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Intel Core SoC Power Management Controller Header File
> + *
> + * Copyright (c) 2023, Intel Corporation.
> + * All Rights Reserved.
> + *
> + * Authors: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> + *          David E. Box <david.e.box@linux.intel.com>
> + */
> +#ifndef INTEL_PMC_IPC_H
> +#define INTEL_PMC_IPC_H
> +
> +#define IPC_SOC_REGISTER_ACCESS			0xAA
> +#define IPC_SOC_SUB_CMD_READ			0x00
> +#define IPC_SOC_SUB_CMD_WRITE			0x01
> +
> +struct pmc_ipc_cmd {
> +	u32 cmd;
> +	u32 sub_cmd;
> +	u32 size;
> +	u32 wbuf[4];
> +};
> +
> +/**
> + * intel_pmc_core_ipc() - PMC IPC Mailbox accessor

nit: intel_pmc_ipc()

> + * @ipc_cmd:  struct pmc_ipc_cmd prepared with input to send
> + * @rbuf:     Allocated u32[4] array for returned IPC data
> + *
> + * Return: 0 on success. Non-zero on mailbox error
> + */
> +int intel_pmc_ipc(struct pmc_ipc_cmd *ipc_cmd, u32 *rbuf);
> +
> +#endif /* INTEL_PMC_IPC_H */
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
