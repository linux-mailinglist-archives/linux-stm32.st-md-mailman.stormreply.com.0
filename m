Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90660A43E99
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 13:02:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 574AEC78039;
	Tue, 25 Feb 2025 12:02:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5815FC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:02:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6A0C95C0DB1;
 Tue, 25 Feb 2025 12:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59010C4CEDD;
 Tue, 25 Feb 2025 12:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740484971;
 bh=5u7h0X12oKtvzpOzqx7CcREHMSTIyV6i4dduMgVCWvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jJ7r2+KtuJ3s25tsKTKD4y4Q8/vruepuHAt4+eVPb1PzmCX+NBcjxDUliictUO29V
 3Onn/6qF2ZoaT0/fNmUiyGfz1KZFKg6gdLnT65gT5bXKfjgrD9DlMn14UAzM0USD4R
 DHx2Ji4oYzbv9IHsEjgw8UFdjsLOCc/JQBN9judAOkDnwPE0ajl6jcDtcRHXmd0jjT
 utTWIU9YZVLF1YLCPRncQ64YAZ6xb6LgG8vIjfFFxiA6UvTTJNHysNFk/GYYmCKpbS
 /uoMPnrQQoqISJqqGjS/y8BTaI+m1p9rQ8QHyczw1GPk4oML1Va9sJDpISunAtyZR2
 rWz+mOISKk/pg==
Date: Tue, 25 Feb 2025 13:02:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250225-purring-herring-of-reputation-1aed2f@krzk-bin>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-5-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224180150.3689638-5-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 ukleinek@kernel.org, linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 will@kernel.org, tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH 4/8] clocksource: stm32-lptimer: add
	stm32mp25 support
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

On Mon, Feb 24, 2025 at 07:01:46PM +0100, Fabrice Gasnier wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Add the support of the new compatible for STM32MP25 SoC in driver, as
> described in Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> and used in arch/arm64/boot/dts/st/stm32mp251.dtsi.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/clocksource/timer-stm32-lp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
> index a4c95161cb22..db055348e2cc 100644
> --- a/drivers/clocksource/timer-stm32-lp.c
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -197,6 +197,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id stm32_clkevent_lp_of_match[] = {
>  	{ .compatible = "st,stm32-lptimer-timer", },
> +	{ .compatible = "st,stm32mp25-lptimer-timer", },
>  	{},

Same question.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
