Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A305147FD
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 12:00:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3682DCA8E53
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 10:00:03 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98553CA8E52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 10:00:00 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u17so6483957pfn.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 May 2019 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eMBEkWY+yoHOv35+4+osAhTZrDmIt7AwEsIPJqdF/3o=;
 b=JWm3C8gHUmsaKnWdHgIGhPMh/OdZYaZQZwQeJOd6DQUH8Gbjik2AaWwJWpbsZ2eTPw
 XQshzRWWqcz5SFWEFbJaozTWLHBtF7VQYwkSL0l+6EG5Lk90/zvLj/WyTC45NDe21H6c
 8JNF2pmDC5CLdVhl+wjvk8oRWyVwSZ2xt31md96O9o6569tOiNNvI5v0w0RQS59ENndp
 9K5/4HnuUqIx14sw3XKE7k6JMpo7lk6i6L0l3j7+vIJzJlzzKQEvPEZYJPMmIGxPlrmq
 HCOdCrd8KniiDBVkCjk7A1gRn7FNDvhO0c7X6Yq5gUOuEYxIq/YrZuZS3ynwenNhvcp8
 v+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eMBEkWY+yoHOv35+4+osAhTZrDmIt7AwEsIPJqdF/3o=;
 b=gU8fx/vvda4A6YBe7jOF09GoAdu2+N3Pr5Fbd/LE7nbBXvZyANs6fVkNPFH22o0Ok2
 kpNzCkXnwErAfoUxCBS4mDNJNrGz6n3bK9rjEVmqBAXZ2DKqYUwMSaO1M7suahpIqvGA
 eJ07SA+zjJA3rviaqBSThnG1CGJuqvBzuCEZ7qYYXYMGZgxUtKiSesYNLSnVG2rihlQu
 B4+fHbioTJtI2MDz99fRNZVA+ABLc9nRun1KR2d69I+sMYi+dKSlMDQMQ0e+rgZH3hWg
 NQDWHoOugm8sfF5nnkRTGxaUX5IA1Fr12cMQ/RRp89ob+JDdhDQMLHKkrOZblP3rdDuC
 0Liw==
X-Gm-Message-State: APjAAAXWZUHZyDMJJUSBBz4ezzN+74ZDlk7rbjR8quXVo33KU0IajH28
 mtBqM0p2dDOCSPXlpY3A+5pp
X-Google-Smtp-Source: APXvYqzICVCOo980QxHqvj2nEfRkxI54XQPzFRDJGVrhybfA1++ueDo5q6nHCcSILwUj169XUgJEfw==
X-Received: by 2002:a62:3501:: with SMTP id c1mr32740299pfa.184.1557136798385; 
 Mon, 06 May 2019 02:59:58 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:611b:55a4:e119:3b84:2d86:5b07])
 by smtp.gmail.com with ESMTPSA id u123sm934037pfu.67.2019.05.06.02.59.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 02:59:57 -0700 (PDT)
Date: Mon, 6 May 2019 15:29:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20190506095951.GA23734@Mani-XPS-13-9360>
References: <20190503053123.6828-1-manivannan.sadhasivam@linaro.org>
 <20190503053123.6828-3-manivannan.sadhasivam@linaro.org>
 <369b2593-71b6-0b00-b72c-041967ffba73@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <369b2593-71b6-0b00-b72c-041967ffba73@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32mp157: Add missing
	pinctrl definitions
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

Hi Alex,

On Fri, May 03, 2019 at 09:13:27AM +0200, Alexandre Torgue wrote:
> Hi Mani
> 
> On 5/3/19 7:31 AM, Manivannan Sadhasivam wrote:
> > Add missing pinctrl definitions for STM32MP157 MPU.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 62 +++++++++++++++++++++++
> >   1 file changed, 62 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> > index 85c417d9983b..0b5bcf6a7c97 100644
> > --- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> > +++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> > @@ -241,6 +241,23 @@
> >   				};
> >   			};
> > +			i2c1_pins_b: i2c1-2 {
> > +				pins {
> > +					pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
> > +						 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
> > +					bias-disable;
> > +					drive-open-drain;
> > +					slew-rate = <0>;
> > +				};
> > +			};
> > +
> > +			i2c1_pins_sleep_b: i2c1-3 {
> > +				pins {
> > +					pinmux = <STM32_PINMUX('F', 14, ANALOG)>, /* I2C1_SCL */
> > +						 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
> > +				};
> > +			};
> > +
> >   			i2c2_pins_a: i2c2-0 {
> >   				pins {
> >   					pinmux = <STM32_PINMUX('H', 4, AF4)>, /* I2C2_SCL */
> > @@ -258,6 +275,23 @@
> >   				};
> >   			};
> > +			i2c2_pins_b: i2c2-2 {
> > +				pins {
> > +					pinmux = <STM32_PINMUX('Z', 0, AF3)>, /* I2C2_SCL */
> > +						 <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
> 
> You can't do that. <STM32_PINMUX('Z', 0, AF3)> has to be declared in
> pincontroller-z. So in your case, you have to define 2 groups for i2C2 for
> your default state (the same for the sleep state).
> 

Ah, yes I failed to note pincontroller z. Will fix it in next revision!

Thanks,
Mani

> regards
> Alex
> 
> 
> 
> 
> > +					bias-disable;
> > +					drive-open-drain;
> > +					slew-rate = <0>;
> > +				};
> > +			};
> > +
> > +			i2c2_pins_sleep_b: i2c2-3 {
> > +				pins {
> > +					pinmux = <STM32_PINMUX('Z', 0, ANALOG)>, /* I2C2_SCL */
> > +						 <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
> > +				};
> > +			};
> > +
> >   			i2c5_pins_a: i2c5-0 {
> >   				pins {
> >   					pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
> > @@ -599,6 +633,34 @@
> >   					bias-disable;
> >   				};
> >   			};
> > +
> > +			uart4_pins_b: uart4-1 {
> > +				pins1 {
> > +					pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
> > +					bias-disable;
> > +					drive-push-pull;
> > +					slew-rate = <0>;
> > +				};
> > +				pins2 {
> > +					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
> > +					bias-disable;
> > +				};
> > +			};
> > +
> > +			uart7_pins_a: uart7-0 {
> > +				pins1 {
> > +					pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
> > +					bias-disable;
> > +					drive-push-pull;
> > +					slew-rate = <0>;
> > +				};
> > +				pins2 {
> > +					pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
> > +						 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
> > +						 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
> > +					bias-disable;
> > +				};
> > +			};
> >   		};
> >   		pinctrl_z: pin-controller-z@54004000 {
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
