Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CC174B3A5
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jul 2023 17:07:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CEC1C6B45C;
	Fri,  7 Jul 2023 15:07:31 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6621BC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jul 2023 15:07:30 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-78362f574c9so72390339f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Jul 2023 08:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688742449; x=1691334449;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A4Q5tL8Q206IfLWZzoyH9okE3A87KjcmbofZ6mTqsrc=;
 b=JuUm/O+SKScwEXEcsRQYCFJxBObZNHFL3UyQI9RNmJo8e+iDrdqqoc/Dml2x/MTx/a
 gW30girXbQkUmV6kj37I6WixRhprxCs6sPlITFLfv1bHOANpuXWb9J2pSc6+ecED6oG8
 Fb3jK7QVp+InI1x8gKl/1kzCGAuZgpGsA3bGgnwtjr50Ql3q9bWXgqvVGluIkXOGw/aD
 IO3f8e7VJQ88CsvVnfUnWSLBfI1WRSecIqEwWH9E9GBZJBFFBsayjKVKdr894naEynX5
 Xe1s69Ox5blbuS/gLK7PA4ahOm6UUlspJu13ZXLf0SBKrMhm0YRsVdPlSNuHljbGI6dd
 dF5g==
X-Gm-Message-State: ABy/qLZtmJm5MgLwp5QR4JShUmg14lqgKlppjbzZ2cXHYZ857OhP3EaF
 eYMhgaTiRb1mWsjaReiPhw==
X-Google-Smtp-Source: APBJJlGXPgJvWDBMVTtll9d+6jXrCeBMq5n/RgRvf6i5hIMGSlbfHY2db0Kk6Tahydw1jOWNCMMfRg==
X-Received: by 2002:a5e:c016:0:b0:785:d017:c16f with SMTP id
 u22-20020a5ec016000000b00785d017c16fmr6407660iol.14.1688742449091; 
 Fri, 07 Jul 2023 08:07:29 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a056638022b00b0042b149aeccdsm1361629jaq.104.2023.07.07.08.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 08:07:28 -0700 (PDT)
Received: (nullmailer pid 311406 invoked by uid 1000);
 Fri, 07 Jul 2023 15:07:24 -0000
Date: Fri, 7 Jul 2023 09:07:24 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <20230707150724.GA112541-robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
 <20230706150906.GB3858320-robh@kernel.org>
 <d13f935c-568b-3c0d-8e7d-006b7d4e7d50@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d13f935c-568b-3c0d-8e7d-006b7d4e7d50@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, hugues.fruchet@foss.st.com, lee@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alsa-devel@alsa-project.org, richardcochran@gmail.com,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 05/10] firewall: introduce stm32_firewall
	framework
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

On Fri, Jul 07, 2023 at 03:43:15PM +0200, Gatien CHEVALLIER wrote:
> 
> 
> On 7/6/23 17:09, Rob Herring wrote:
> > On Wed, Jul 05, 2023 at 07:27:54PM +0200, Gatien Chevallier wrote:
> > > Introduce a firewall framework that offers to firewall consumers different
> > > firewall services such as the ability to check their access rights against
> > > their firewall controller(s).
> > > 
> > > The firewall framework offers a generic API that is defined in firewall
> > > controllers drivers to best fit the specificity of each firewall.
> > > 
> > > There are various types of firewalls:
> > > -Peripheral firewalls that filter accesses to peripherals
> > > -Memory firewalls that filter accesses to memories or memory regions
> > > -Resource firewalls that filter accesses to internal resources such as
> > > reset and clock controllers
> > 
> > How do resource firewalls work? Access to registers for some clocks in a
> > clock controller are disabled? Or something gates off clocks/resets to
> > a block?
> 
> To take a practical example:
> 
> A clock controller can be firewall-aware and have its own firewall registers
> to configure. To access a clock/reset that is handled this way, a device
> would need to check this "resource firewall". I thought that for these kinds
> of hardware blocks, having a common API would help.

We already have the concept of 'protected clocks' which are ones 
controlled by secure mode which limits what Linux can do with them. I 
think you should extend this mechanism if needed and use the existing 
clock/reset APIs for managing resources.

> > 
> > It might make more sense for "resource" accesses to be managed within
> > those resource APIs (i.e. the clock and reset frameworks) and leave this
> > framework to bus accesses.
> > 
> 
> Okay, I'll drop this for V2 if you find that the above explaination do not
> justify this.
> 
> > > A firewall controller must be probed at arch_initcall level and register
> > > to the framework so that consumers can use their services.
> > 
> > initcall ordering hacks should not be needed. We have both deferred
> > probe and fw_devlinks to avoid that problem.
> > 
> 
> Greg also doubts this.
> 
> Drivers like reset/clock controllers drivers (core_initcall level) will have
> a dependency on the firewall controllers in order to initialize their
> resources. I was not sure how to manage these dependencies.
> 
> Now, looking at init/main.c, I've realized that core_initcall() level comes
> before arch_initcall() level...
> 
> If managed by fw_devlink, the feature-domains property should be supported
> as well I suppose? I'm not sure how to handle this properly. I'd welcome
> your suggestion.

DT parent/child child dependencies are already handled which might be 
enough for you. Otherwise, adding a new provider/consumer binding is a 
couple of lines to add the property names. See drivers/of/property.c.

> > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > > ---
> > >   MAINTAINERS                               |   5 +
> > >   arch/arm64/Kconfig.platforms              |   1 +
> > >   drivers/bus/Kconfig                       |  10 +
> > >   drivers/bus/Makefile                      |   1 +
> > >   drivers/bus/stm32_firewall.c              | 252 ++++++++++++++++++++++
> > >   drivers/bus/stm32_firewall.h              |  83 +++++++
> > 
> > Why something stm32 specific? We know there are multiple platforms
> > wanting something in this area. Wasn't the last attempt common?
> > 
> > For a common binding, I'm not eager to accept anything new with only 1
> > user.
> > 
> 
> Last attempt was common for the feature-domain bindings. The system-bus
> driver was ST-specific. I don't know if other platforms needs this kind
> of framework. Are you suggesting that this framework should be generic? Or
> that this framework should have a st-specific property?

Ah right, the posting for SCMI device permissions was the binding only. 
The binding should be generic and support more than 1 user. That somewhat 
implies a generic framework, but not necessarily.

> I've oriented this firewall framework to serve ST purpose. There may be a
> need for other platforms but I'm not sure that this framework serves them
> well. One can argue that it is quite minimalist and covers basic purposes of
> a hardware firewall but I would need more feedback from other vendors to
> submit it as a generic one.

We already know there are at least 2 users. Why would we make the 2nd 
user refactor your driver into a common framework?

[...]

> > > +int stm32_firewall_get_firewall(struct device_node *np,
> > > +				struct stm32_firewall *firewall)
> > > +{
> > > +	struct stm32_firewall_controller *ctrl;
> > > +	struct of_phandle_args args;
> > > +	u32 controller_phandle;
> > > +	bool match = false;
> > > +	size_t i;
> > > +	int err;
> > > +
> > > +	if (!firewall)
> > > +		return -EINVAL;
> > > +
> > > +	/* The controller phandle is always the first argument of the feature-domains property. */
> > > +	err = of_property_read_u32(np, "feature-domains", &controller_phandle);
> > 
> > Why do you need to parse the property twice?
> > 
> 
> The first parsing is to have the first argument, which is the controller
> phandle. The second parsing is here to get the firewall arguments based on
> the number of arguments defined by #feature-domain-cells. Maybe using
> of_property_read_u32_array() would be better. 

No. It's not a u32 array. It's a phandle+args property, so you should 
only use phandle+args APIs.

> I did not want to close the
> door for supporting several feature domain controllers, hence multiple
> phandles. of_parse_phandle_with_args() seemed fine for this purpose but the
> phandle is parsed out.

There's an iterator for handling multiple phandle+args cases.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
