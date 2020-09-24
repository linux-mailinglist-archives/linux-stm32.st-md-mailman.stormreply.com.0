Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 673E2276824
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Sep 2020 07:16:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D813C3FAD8;
	Thu, 24 Sep 2020 05:16:44 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A27EC32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 05:16:41 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id v14so971443pjd.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 22:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=BA8EEqUH0ikl52ISZx94+ASPHcs2uYjeyxNIUaBk9nQ=;
 b=tFt0DZf2JB8gSip3T9rC0G/Aqp5shdUsHkXEEOaoJdm9BcXnwVshaNHpgkfn1VIjEM
 p+G3zCeGHdAHvTCQgypO4X0SrXosqytvaNwgGw8SKQrlj0kG0FdAdjs/TdlR+ao7NrJu
 XDWXhT9Y8Ph85HDk11TQ3C0bZFhtjKHvNArximCHPNcq19mG52LxNKnLA2ELQP7NTFam
 r8iVST4UJuEqwpe7EcKe+WRHT87jTQctQxSYrp4EvM8468rnpmj129oaegF7FCOI9ybk
 Ph4sKtizwi4k4dqc6PvxVDv4m3SnYMVQqULxq+x8gUJhbrzEjYIYV6mj6/00hkb9hwPg
 RsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=BA8EEqUH0ikl52ISZx94+ASPHcs2uYjeyxNIUaBk9nQ=;
 b=AnIm+f7/MjN455AUu7PYtARWC0Yi5AdtH18LjCBDLbI9ghuiNW9iE7qX4L+Or0WPzE
 pMjOmzOopcAIWGpuXG4cEtIswbGIoczTiuVbtNx8AdYMxRLdRuhyvBJyan002/konM4S
 CMV6gCeddpQEbvVoFriv34BW46VJzqQwCBUukYub3qmvEdoWjLPN5xC9HXHXRWRwO95n
 s68yFKz4LxJcbyqbqGiGIYtTReUaxG8wTVRuT+kRJRJbZW9jv5+QsQ5f2h8Jo/XaHzWA
 Z9AgvRs5pcsnDRFd2Xhe+eUye2lHF91UR5kVImEm+3zQ9Vj3Yn7rpwOyeIBaUwmPBXrq
 nUHA==
X-Gm-Message-State: AOAM531Sb6uDIyhAFAevQx9AwgTL9KIhjVP/fsTKasBdfR3IT/41237L
 suOEvMHJbtASckNdGoYrKuv9
X-Google-Smtp-Source: ABdhPJxS4ZHCj5PsCKdD5h1azWEHFQtDCWQ5Xqlc0fwcCQmx3AUlCsysZvg9wnSCj9DF8obO7GCXCQ==
X-Received: by 2002:a17:902:aa02:b029:d2:43ef:5dac with SMTP id
 be2-20020a170902aa02b02900d243ef5dacmr3020792plb.62.1600924599814; 
 Wed, 23 Sep 2020 22:16:39 -0700 (PDT)
Received: from ?IPv6:2409:4072:6d80:ea8c:4827:e640:206e:12?
 ([2409:4072:6d80:ea8c:4827:e640:206e:12])
 by smtp.gmail.com with ESMTPSA id 138sm1331505pfu.180.2020.09.23.22.16.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Sep 2020 22:16:39 -0700 (PDT)
Date: Thu, 24 Sep 2020 10:46:32 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20200923232535.241437-1-marex@denx.de>
References: <20200923232535.241437-1-marex@denx.de>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>,linux-arm-kernel@lists.infradead.org
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <0D1E174A-2217-4785-B4E5-79135AAF76F1@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable thermal sensor
	support on stm32mp15xx-dhcor
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



On 24 September 2020 4:55:35 AM IST, Marek Vasut <marex@denx.de> wrote:
>Enable STM32 Digital Thermal Sensor driver for stm32mp15xx-dhcor SoMs.
>
>Fixes: 94cafe1b6482 ("ARM: dts: stm32: Add Avenger96 devicetree support
>based on STM32MP157A")

The change looks good but what does this patch fixes? 

Thanks, 
Mani

>Signed-off-by: Marek Vasut <marex@denx.de>
>Cc: Alexandre Torgue <alexandre.torgue@st.com>
>Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>Cc: linux-stm32@st-md-mailman.stormreply.com
>To: linux-arm-kernel@lists.infradead.org
>---
> arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
>b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
>index 04fbb324a541..803eb8bc9c85 100644
>--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
>+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
>@@ -21,6 +21,10 @@ memory@c0000000 {
> 	};
> };
> 
>+&dts {
>+	status = "okay";
>+};
>+
> &i2c4 {
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&i2c4_pins_a>;

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
