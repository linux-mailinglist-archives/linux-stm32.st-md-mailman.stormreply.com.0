Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E04261110F
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Oct 2022 14:20:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4435C0AA15;
	Fri, 28 Oct 2022 12:20:07 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18B35C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 12:20:06 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id u132so6009456oib.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 05:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oXfLpDCmhpYq4HH4XZjvhvxoznYz709MBGPQiDR4vds=;
 b=ssunzR548W0VZPeXwCUZpCqC8CeGPJHNoO0Dgr7PIfotxPsCpqt9BuYc2BX4jAEcFo
 nAvzL0l/nNpiX4bhO23pQH0KjKumveoIe2tAXsEeaZe5M735H31ANlakY9MdHVos0Xuh
 WPN6bWfVH2azCzbL6XDS3ziy0ZHUrefGwGIoMlVpIWJhTdCISLFzyZOjoojKG8jlkvoc
 c/p8xfVUtBTBVuQP0tDseCC0X4B2kEbjvqMt9HX2UKqvC6s7cecmdRyVeJtyqYHeCs42
 RhTTlsRz2E24ifJkYX9Uld+LjFtYbnDHCYBZM/moHg3/WpMuR+gG+41N8e68zK/7QDk5
 Do3A==
X-Gm-Message-State: ACrzQf0/PMvkmkKypnuOVeybwfnTU2pm63N3j2pw3LK7HtgOzNQyx+aU
 Vpduyla+h4K6XXw14uTGCA==
X-Google-Smtp-Source: AMsMyM7ApNXmyllBFXT9bjWaGtbPJryCpIgtjZ+9Z85lvm0/ygNxIxaaj+kVgkY/pzoI3f/RSgFFQg==
X-Received: by 2002:a05:6808:1404:b0:355:4cd4:b10b with SMTP id
 w4-20020a056808140400b003554cd4b10bmr7941560oiv.207.1666959604826; 
 Fri, 28 Oct 2022 05:20:04 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 el21-20020a056870f69500b0013c955f64dbsm24173oab.41.2022.10.28.05.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:20:04 -0700 (PDT)
Received: (nullmailer pid 1079528 invoked by uid 1000);
 Fri, 28 Oct 2022 12:20:05 -0000
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20221027225020.215149-1-marex@denx.de>
References: <20221027225020.215149-1-marex@denx.de>
Message-Id: <166695949015.1076858.14693081553001271349.robh@kernel.org>
Date: Fri, 28 Oct 2022 07:20:05 -0500
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] [RFC] dt-bindings: nvmem: syscon: Add
	syscon backed nvmem bindings
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2872427995406389990=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2872427995406389990==
Content-Type: text/plain

On Fri, 28 Oct 2022 00:50:18 +0200, Marek Vasut wrote:
> Add trivial bindings for driver which permits exposing syscon backed
> register to userspace. This is useful e.g. to expose U-Boot boot
> counter on various platforms where the boot counter is stored in
> random volatile register, like STM32MP15xx TAMP_BKPxR register.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Rafał Miłecki <rafal@milecki.pl>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  .../bindings/nvmem/nvmem-syscon.yaml          | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/nvmem/nvmem-syscon.example.dts:24.17-35: Warning (reg_format): /example-0/tamp@5c00a000/nvmem-syscon:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/nvmem/nvmem-syscon.example.dts:22.26-25.15: Warning (unit_address_vs_reg): /example-0/tamp@5c00a000/nvmem-syscon: node has a reg or ranges property, but no unit name
Documentation/devicetree/bindings/nvmem/nvmem-syscon.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/nvmem/nvmem-syscon.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/nvmem/nvmem-syscon.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/nvmem/nvmem-syscon.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/nvmem/nvmem-syscon.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/nvmem/nvmem-syscon.example.dts:22.26-25.15: Warning (avoid_default_addr_size): /example-0/tamp@5c00a000/nvmem-syscon: Relying on default #address-cells value
Documentation/devicetree/bindings/nvmem/nvmem-syscon.example.dts:22.26-25.15: Warning (avoid_default_addr_size): /example-0/tamp@5c00a000/nvmem-syscon: Relying on default #size-cells value
Documentation/devicetree/bindings/nvmem/nvmem-syscon.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/nvmem-syscon.example.dtb: tamp@5c00a000: 'nvmem-syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


--===============2872427995406389990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2872427995406389990==--
