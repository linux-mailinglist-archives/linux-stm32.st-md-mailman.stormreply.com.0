Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E59F771171
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Aug 2023 20:31:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56571C6B46E;
	Sat,  5 Aug 2023 18:31:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7711FC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 18:31:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5357060DEB;
 Sat,  5 Aug 2023 18:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6F2C433C7;
 Sat,  5 Aug 2023 18:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691260260;
 bh=8A0dIW8Ncx95axIcP4Bjov5VDnhG33vLjWhpY8dE0f4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i5PiXd4rnGVWyam+yeyRvqSbBy3qYS7ih/44/RmHm2/i2s143mEYoP33L7gw8s7wy
 OOSTE/BRpZx5rRk3GrKogKm+fHMTc95gdpl5Z+gLtyOIAz/2lpr0zKSGu1I5Tphauh
 1jJaStj2FWU5/6DSrabMJe/8M3H/dNCmL/h0fqAuqK3ozaDcXWsBPsTHJ2OwrTxjsn
 Cn2IhSjU+iJNBwb4KRkV/OP8ilu5COn1KNfLDuoaWvPHpXdHYv5AXaCCt7yduvSKJ1
 sX2ZqPsH1bl8DJDr+VLIIx72d7IPCfVJWMmIU4BNmLyXvcCEM/XCbqdZvm9hM5DKI/
 nmA4Gw5RZdd1Q==
Date: Sat, 5 Aug 2023 19:30:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andrei Coardos <aboutphysycs@gmail.com>
Message-ID: <20230805193052.690c87e8@jic23-huawei>
In-Reply-To: <20230802133509.29381-1-aboutphysycs@gmail.com>
References: <20230802133509.29381-1-aboutphysycs@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org,
 Alexandru Ardelean <alex@shruggie.ro>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: trigger: stm32-lptimer-trigger:
 remove unneeded platform_set_drvdata()
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

On Wed,  2 Aug 2023 16:35:09 +0300
Andrei Coardos <aboutphysycs@gmail.com> wrote:

> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Also,
> the private data is defined in this driver, so there is no risk of it being
> accessed outside of this driver file.
> 
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
> 
> Changelog V1->V2:
> 
> * https://lore.kernel.org/linux-iio/CAH3L5QpuoDYU6qvWH7_z5Yx0cW2qPMbCA8AFEYAPsiEkSzCiwQ@mail.gmail.com/T/#t
> * Adjusted the returning values of the function
> 
> 
>  drivers/iio/trigger/stm32-lptimer-trigger.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
> index df2416e33375..ab1cc6a05f26 100644
> --- a/drivers/iio/trigger/stm32-lptimer-trigger.c
> +++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
> @@ -88,11 +88,7 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
>  	priv->dev = &pdev->dev;
>  	priv->trg = stm32_lptim_triggers[index];
>  
> -	ret = stm32_lptim_setup_trig(priv);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return stm32_lptim_setup_trig(priv);
Both of us failed to notice ret isn't used any more.  Anyhow, I cleaned that
up after spotting the build warning.

Jonathan

>  }
>  
>  static const struct of_device_id stm32_lptim_trig_of_match[] = {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
