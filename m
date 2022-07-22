Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E86BA58694F
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 14:00:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB406C64106;
	Mon,  1 Aug 2022 12:00:12 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A49CC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 16:00:10 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 17so4862884pfy.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J4ZhqBj8u5Lze6oGnxKkGLM9ZzOx9hvE2Nh2ZpNRSvs=;
 b=PNAs3OZ09qihfaX1VzQXYD1QM9ufbRcbZ0A7jLPsa8U0QP5IfyNo0NPx+uM8wVPe/7
 +gbJMpuWRyWDX+lLCV5IEmDU/J9OKGqvMFmXqU+lJzMJQbtCvVocYMCV6VsMdglmqnEn
 NSzwUcEX8HWL8I3rmxmr6Tqk8cQhAKLw7JZ5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J4ZhqBj8u5Lze6oGnxKkGLM9ZzOx9hvE2Nh2ZpNRSvs=;
 b=pm4KoA07ySYcmpGawS7vKEB3t/lJH1G0yu0AO9FM8nB7dc2RSZz3JxFOxsYxqyoh8/
 r0HCwiFH2q5mkAmIWynSQt8ANxBX50qDjTkeUT9sPW+NSzQeR1aouy/a9NV5xKAyyRSK
 OdPKbA5oVU7dW088Bhzv72w+tto/lieOB6akGssLSFvCHVp4sARcylWb15a7TI+su2oE
 0yxgAQTDhDhcpQ3faWiGrthEQ2POVj/xdJ6SW0PKg8e1C8Pby8CyKaiWvPASedEVp10/
 5BGNNHj0fRz/VeLsMq8PMuOopFejA3O0CbjfLUz83YUKeVdD50GknMnmtPm3qPPTIFsr
 KcgQ==
X-Gm-Message-State: AJIora9npFONCF/XzoxFpW2JisVS/mdIQXYfduMzdGXptbP0939sgBJf
 rX/3PIPhzWmVY/Y/ksDVKDc6hg==
X-Google-Smtp-Source: AGRyM1tgKqIrMyj2L4X/1T63jTUda2P7qFegf2dygZBc2HK52m3PF385tbAOmbv7b8/r5kyI3xdmcg==
X-Received: by 2002:a05:6a00:1703:b0:52b:39a4:4632 with SMTP id
 h3-20020a056a00170300b0052b39a44632mr450427pfc.29.1658505607778; 
 Fri, 22 Jul 2022 09:00:07 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:42b0:2897:3725:985a])
 by smtp.gmail.com with UTF8SMTPSA id
 j13-20020a170902da8d00b0015e8d4eb285sm3995951plx.207.2022.07.22.09.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 09:00:07 -0700 (PDT)
Date: Fri, 22 Jul 2022 09:00:05 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YtrJhQD2FbqhS+5e@google.com>
References: <20220722130554.236925-1-fabrice.gasnier@foss.st.com>
 <20220722130554.236925-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220722130554.236925-3-fabrice.gasnier@foss.st.com>
X-Mailman-Approved-At: Mon, 01 Aug 2022 12:00:11 +0000
Cc: devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] usb: misc: onboard-hub: add support
 for Microchip USB2514B USB 2.0 hub
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

Hi Fabrice

On Fri, Jul 22, 2022 at 03:05:52PM +0200, Fabrice Gasnier wrote:
> Add support for Microchip USB2514B USB 2.0 hub to the onboard usb hub
> driver. Adopt the generic usb-device compatible ("usbVID,PID") as
> discussed with Matthias in [1].

The reference isn't really relevant in the commit message.

> Some STM32MP1 boards have this hub on-board, with a supply that needs to
> be enabled for proper operation.
> 
> [1] https://lore.kernel.org/lkml/YW9CUabfA0HrtTAq@google.com/
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/usb/misc/onboard_usb_hub.c | 2 ++
>  drivers/usb/misc/onboard_usb_hub.h | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index 6b9b949d17d30..929a4e724ec12 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -310,6 +310,7 @@ static struct platform_driver onboard_hub_driver = {
>  /************************** USB driver **************************/
>  
>  #define VENDOR_ID_REALTEK	0x0bda
> +#define VENDOR_ID_MICROCHIP	0x0424

nit: let's sort the vendor ids alphabetically

>  
>  /*
>   * Returns the onboard_hub platform device that is associated with the USB
> @@ -387,6 +388,7 @@ static const struct usb_device_id onboard_hub_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
> +	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */

ditto

>  	{}
>  };
>  MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index d3a5b6938582e..43d6af4230dfd 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -11,6 +11,7 @@ static const struct of_device_id onboard_hub_match[] = {
>  	{ .compatible = "usbbda,5411" },
>  	{ .compatible = "usbbda,414" },
>  	{ .compatible = "usbbda,5414" },
> +	{ .compatible = "usb424,2514" },

Let's also sort the vendor ids alphanumerically (not necessarily applicable for
the product ids, here it makes sense to group the PIDs of the same hub chip
together).
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
