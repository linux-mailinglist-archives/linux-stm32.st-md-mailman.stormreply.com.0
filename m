Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E37A7887C
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Apr 2025 09:05:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29D4AC78F9A;
	Wed,  2 Apr 2025 07:05:46 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 346C5C78F98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Apr 2025 07:05:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 176E6435CB;
 Wed,  2 Apr 2025 07:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACCBC4CEE5;
 Wed,  2 Apr 2025 07:05:42 +0000 (UTC)
Date: Wed, 2 Apr 2025 09:05:39 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <20250402-ginger-hare-of-action-dc3fff@krzk-bin>
References: <20250401224644.3389181-1-daniel.lezcano@linaro.org>
 <20250401224644.3389181-3-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250401224644.3389181-3-daniel.lezcano@linaro.org>
Cc: S32@nxp.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Larisa.Grigore@nxp.com,
 linux-kernel@vger.kernel.org,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, thomas.fossati@linaro.org,
 tglx@linutronix.de, ghennadi.procopciuc@nxp.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 2/2] clocksource/drivers/nxp-timer: Add
 the System Timer Module for the s32gx platforms
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

On Wed, Apr 02, 2025 at 12:46:42AM +0200, Daniel Lezcano wrote:
> +
> +static const struct of_device_id nxp_stm_of_match[] = {
> +	{ .compatible = "nxp,s32g2-stm" },
> +	{ .compatible = "nxp,s32g3-stm" },

Drop, the entire point of me asking for compatibility is not to have
useless entries for the same devices.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nxp_stm_of_match);
> +
> +static struct platform_driver nxp_stm_probe = {
> +	.probe	= nxp_stm_timer_probe,
> +	.driver	= {
> +		.name		= "nxp-stm",
> +		.of_match_table	= of_match_ptr(nxp_stm_of_match),

Drop of_match_ptr, you have here a warning.

> +	},
> +};
> +module_platform_driver(nxp_stm_probe);
> +
> +MODULE_DESCRIPTION("NXP System Timer Module driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
