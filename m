Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BE1341429
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 05:29:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93092C57B7C;
	Fri, 19 Mar 2021 04:29:05 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 748B3C57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:29:03 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id z136so4743692iof.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 21:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=77EAi3x6RSk+HaqpjBCCrupeL7eTqd2Gni0r4hhnRTY=;
 b=Av0mvs/1QDNsl+ACn3AMio1ANWZxSy27ALnryooHEksD+19Qjf1YH873gIgKT99kIb
 umXkWRr5r8O+xEzYgmuhITER3BJepmJlpA49kvYCaBQ0Gs3oUJ0Y0P+rtgD7zkoec2DS
 hPo5IAu9a11vAAoLycxXhWTXB2Myk4UweaEO/kiQzrb9LBtWrNlmMNjJ2EPBA7SP96iX
 6qqU41cvUsGy72fAtVyC7WHqCogQWkeBsvf2XGp/Bn0jwPJObqyaqS8jST8ZmaWYX5OW
 N6UU5ESDSvkgWo9gtQAFuI9kSIGJmH5t7VDFz991crSSjgdCFfPX91OpQSeegc41+mvw
 drGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=77EAi3x6RSk+HaqpjBCCrupeL7eTqd2Gni0r4hhnRTY=;
 b=qETrTp5/PZWMSVyFvZ+GFC+Xsick/LbQ4u0AGnIg4kW+5VztZ4i1fV7qifmRKuQS/r
 YZc6yZ5lYt5PxjX19E7fBLJ2aZKzEXnjcCrzoYGklNcqR2fqx3TbOnp0t0hI4UaoaVOK
 kJcOlKrRnfzIo3h8kQgnjju2XQ0OOs5rc4ZNIvvOrpb077F/k9gJyNXa3LRXP0FIbLnu
 75WTKJLHEPmky6rUuX8GU09ZK9cwq+zh57TUCdPK2ARL4KxGB+j253SDoYEBEzIjdeay
 289OSJtk508JQ8mjFuSVbkH3HoapLCVqJ8+WrPyMsW4mWlC4SPGe0+OCFPINdI4l8Do/
 gRgg==
X-Gm-Message-State: AOAM5326g9PVKLsgMR7CPkjoVkkylHmolyYKK+k+0JMp6tKaA4rD8Ep8
 vuXR7v+5NSoHZPglXkMt0mc1nrIdLio0eTIWrtdyEWjDB5FL4H3E
X-Google-Smtp-Source: ABdhPJymXjj1dWzAvDvLcfggYqYjavGJzkjtuYIsSBDQSfVLN0qs2L4pO18/cvZe8ong+1rygx+Dn1HaTmH7Mj00ipA=
X-Received: by 2002:a05:6638:d47:: with SMTP id d7mr9834886jak.2.1616128142127; 
 Thu, 18 Mar 2021 21:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
 <1615801436-3016-10-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1615801436-3016-10-git-send-email-dillon.minfei@gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 19 Mar 2021 12:28:26 +0800
Message-ID: <CAL9mu0Lfj+n4uk2rT8QnDtRveHn2gLx4ut6fLCByt0w9e08vwQ@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@st.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux@armlinux.org.uk,
 Vladimir Murzin <vladimir.murzin@arm.com>, afzal.mohd.ma@gmail.com, 
 gregkh@linuxfoundation.org, erwan.leray@st.com, erwan.leray@foss.st.com, 
 linux-serial@vger.kernel.org, lkp@intel.com
Subject: Re: [Linux-stm32] [PATCH v3 9/9] dt-bindings: serial: stm32: add
 phandle 'bluetooth' to fix dtbs_check warrning
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

No changes, Just loop lkp in.


Hi lkp,

Sorry for the late reply, thanks for your report.
This patch is to fix the build warning message.

Thanks.
Regards

On Mon, Mar 15, 2021 at 5:45 PM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
> when run make dtbs_check with 'bluetoothi brcm,bcm43438-bt'
> dts enabled on stm32h7, there is a warrning popup:
>
> >> arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800: 'bluetooth'
>    does not match any of the regexes: 'pinctrl-[0-9]+'
>
> to make dtbs_check happy, so add a phandle bluetooth
>
> Fixes: 500cdb23d608 ("ARM: dts: stm32: Add STM32H743 MCU and STM32H743i-EVAL board")
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> index 8631678283f9..5e674840e62d 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> @@ -50,6 +50,11 @@ properties:
>      minItems: 1
>      maxItems: 2
>
> +  bluetooth:
> +    type: object
> +    description: |
> +      phandles to the usart controller and bluetooth
> +
>  # cts-gpios and rts-gpios properties can be used instead of 'uart-has-rtscts'
>  # or 'st,hw-flow-ctrl' (deprecated) for making use of any gpio pins for flow
>  # control instead of dedicated pins.
> --
> 1.9.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
