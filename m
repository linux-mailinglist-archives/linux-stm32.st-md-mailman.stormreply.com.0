Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EF97394DC
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 03:47:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 252AFC65E4F;
	Thu, 22 Jun 2023 01:47:57 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1904DC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 01:47:56 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-780bd47ef93so41764939f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 18:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687398475; x=1689990475;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A6lwlIACoL/oGFO27bjHDY0Ho8Hok0K/LdTyvT1Aqys=;
 b=eG9xscKFjLP9EkHVjrztAdrVHCN2T1fgMWJOs6vPb+7KW3t2L2vKZpAURyf31S2+iV
 hasj3uJ9ywyX+QKZ41Z4lK6II32IpeZ8HC+pZnLkG+7No+VRfjn+85eWDYymjZSKLnnd
 2dFXBWOcaWBT7m27WIOv8kjSFHJx1yJdGPXHFAmo+pmKjd7KVIHK4pLDeeGCXd93bSpj
 BEtnj7wXzIn0nxLwq2hoGcQcbHWC2oCYCjUe86K2G/h3FV3mErtkYpuT8UGBrG3jIWz2
 5oPyow2f72wxLAXSbS/LZ6K8y6D3zAAtjBj2ZUK3cQYR6Q5GFuCR1pilpLDoHBSe9Fbf
 g1dQ==
X-Gm-Message-State: AC+VfDwg4ljtwytiLCSfo3lFG8Jd4CtK3fqo4oNHZvVEGgM7kShNzUEC
 kCaaZ9xM5JoBMLl1A4cX4g==
X-Google-Smtp-Source: ACHHUZ5xbAsh5HM5f4tHiRpRYvVagaBlyC5jsuZyygZJanfzT8FnpDf6NQwAklw+4yEA1IZrei1NVg==
X-Received: by 2002:a6b:fd16:0:b0:777:b107:dd4d with SMTP id
 c22-20020a6bfd16000000b00777b107dd4dmr13981457ioi.16.1687398474803; 
 Wed, 21 Jun 2023 18:47:54 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a02cd0e000000b004268fbb21f4sm1429030jaq.44.2023.06.21.18.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 18:47:54 -0700 (PDT)
Received: (nullmailer pid 36911 invoked by uid 1000);
 Thu, 22 Jun 2023 01:47:52 -0000
Date: Wed, 21 Jun 2023 19:47:52 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <168739847068.36808.12687973210277426277.robh@kernel.org>
References: <20230620085633.533187-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230620085633.533187-1-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: connector: usb: allow a
	single HS port
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


On Tue, 20 Jun 2023 10:56:33 +0200, Fabrice Gasnier wrote:
> Allow a single HS port to be used e.g. without reg property and a unit
> address. OF graph allows a single port node, without 'reg' property.
> 
> This removes a couple of Warnings or errors on STM32MP boards.
> When using single HS port currently, when doing building with W=1:
> arch/arm/boot/dts/stm32mp157c-dk2.dtb: stusb1600@28: connector:
> Unevaluated properties are not allowed ('port' was unexpected)
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Notes: Other attempts seem to lead to a dead end. Ex: by updating the
> relevant dts files, to use ports, and port@0, make W=1 shows
> ...connector/ports: graph node has single child node
> 'port@0', #address-cells/#size-cells are not necessary.
> But not adding them lead to another "Warning (avoid_default_addr_size)"
> ---
>  .../bindings/connector/usb-connector.yaml     | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Applied, thanks!

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
