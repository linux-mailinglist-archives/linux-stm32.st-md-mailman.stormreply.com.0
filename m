Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFB3A4ECF8
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 20:15:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CC40C78F6A;
	Tue,  4 Mar 2025 19:15:20 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9E5FC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 19:15:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1820EA4491D;
 Tue,  4 Mar 2025 19:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA93C4CEE5;
 Tue,  4 Mar 2025 19:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741115717;
 bh=m8gpsFcvErC+OBg1crSKmlYcazdRoOwZ0xMnwbncoLg=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=Wd+VYz5Z5pmq6PMWBMCh4meGD69gSJjcGdaQqppo0JES4AT8CP7BglSfJgGMVA3y7
 UTxQvO0wRGmTbAZ1rh01lKFGskbhM75iCjZ6guHgUT/y704xVrwXatSv5etp8opAL/
 hMX2QJSLGU+L4BspbNuRwWw7D+P0z4vZhF8JcjMhBRoudk+xaT0kjlBU8ik1AI4bbJ
 /804WbtwyRXPPLHq2RrTziJNifSXLCDEj8XSDDzcF/V/DkuC7iaKTrjOhKSmKp2bfF
 1M63SfvUoiIkLLZzovZrXd1NTBWJJQ7O8Xg5BWl8JiUITB6tWMIjQ2m2VpPjnnVLjG
 opGhzPH4Pok/A==
Date: Tue, 04 Mar 2025 13:15:15 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250304173229.3215445-2-fabrice.gasnier@foss.st.com>
References: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
 <20250304173229.3215445-2-fabrice.gasnier@foss.st.com>
Message-Id: <174111571576.3307031.12348647271786435979.robh@kernel.org>
Cc: linux-pwm@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 daniel.lezcano@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, will@kernel.org,
 krzk+dt@kernel.org, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/8] dt-bindings: mfd: stm32-lptimer:
 add support for stm32mp25
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


On Tue, 04 Mar 2025 18:32:22 +0100, Fabrice Gasnier wrote:
> Add a new stm32mp25 compatible to stm32-lptimer dt-bindings, to support
> STM32MP25 SoC. Some features has been updated or added to the low-power
> timer:
> - new capture compare channels
> - up to two PWM channels
> - PWM input capture
> - peripheral interconnect in stm32mp25 has been updated (new triggers).
> - registers/bits has been added or revisited (IER access).
> So introduce a new compatible to handle this diversity.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in V2:
> - Use fallback compatibles, along with stm32mp25 specific compatible
> - trigger identifier can be up to 4 (e.g. from LPTIM1..5)
> ---
>  .../bindings/mfd/st,stm32-lptimer.yaml        | 40 ++++++++++++++++---
>  1 file changed, 34 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:26:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:29:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:67:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:70:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:87:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:90:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:103:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:106:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:120:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:123:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250304173229.3215445-2-fabrice.gasnier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
