Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F2315989
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 23:33:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7559FC57B53;
	Tue,  9 Feb 2021 22:33:06 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92A80C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 22:33:02 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id h6so21227834oie.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Feb 2021 14:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/iX2s3bt8uDNQWgU3hcnj4j+Eer2ggS9c+8mDGZZ1Nw=;
 b=rHCmF/dXAq+KGJD5/WZ5wL5CeMQfQcYfKrpA6l/VUtq0N9amfaPLNL7BL4mPE3cd0L
 N55NnxPOJ1p8/Mz+ahKbUzcvTWsk30yvah4SyNDljKWyz5ADByFKKI3+lWsgPD5hU8Ic
 Z0rMztw5SD/cTSfb5itfLIbGH94aKn5nJTlnl0B1vPG3niAKEyJk4kCM1PY0rKD0O619
 4xb0FaCY1GcHMZ+dXkSha8ChrbuPaRXA/EtBZVe2C2fJrDqMBGER87OXo18jdQQMNgHs
 tXqhXf4OGJaAEWdCnjvYnl21WH8+mfZWlcHKxx841IWkJY0wK5LGnBpR6VzXT37Mi+fR
 4XMA==
X-Gm-Message-State: AOAM531MluAWga0cMblcsX04WfI2FWYLWCj52rpdtnNK6mjDyrNLJruD
 P6/R8wl3NHXTatKaYDHEKQ==
X-Google-Smtp-Source: ABdhPJxAL4tl4M1dFOxdOSzVRHF28JqawikqUrbVHLugDyPi6f3KKRBBrFMRaXoAD21fp7uKiOdlUQ==
X-Received: by 2002:aca:5f44:: with SMTP id t65mr13529oib.46.1612909981279;
 Tue, 09 Feb 2021 14:33:01 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p16sm26592oic.6.2021.02.09.14.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 14:33:00 -0800 (PST)
Received: (nullmailer pid 337022 invoked by uid 1000);
 Tue, 09 Feb 2021 22:32:58 -0000
Date: Tue, 9 Feb 2021 16:32:58 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20210209223258.GA328873@robh.at.kernel.org>
References: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
 <20210208135609.7685-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208135609.7685-8-Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Joao Pinto <jpinto@synopsys.com>,
 netdev@vger.kernel.org, Lars Persson <larper@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH v2 07/24] dt-bindings: net: dwmac: Detach
 Generic DW MAC bindings
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

On Mon, Feb 08, 2021 at 04:55:51PM +0300, Serge Semin wrote:
> Currently the snps,dwmac.yaml DT bindings file is used for both DT nodes
> describing generic DW MAC devices and as DT schema with common properties
> to be evaluated against a vendor-specific DW MAC IP-cores. Due to such
> dual-purpose design the "compatible" property of the common DW MAC schema
> needs to contain the vendor-specific strings to successfully pass the
> schema evaluation in case if it's referenced from the vendor-specific DT
> bindings. That's a bad design from maintainability point of view, since
> adding/removing any DW MAC-based device bindings requires the common
> schema modification. In order to fix that let's detach the schema which
> provides the generic DW MAC DT nodes evaluation into a dedicated DT
> bindings file preserving the common DW MAC properties declaration in the
> snps,dwmac.yaml file. By doing so we'll still provide a common properties
> evaluation for each vendor-specific MAC bindings which refer to the
> common bindings file, while the generic DW MAC DT nodes will be checked
> against the new snps,dwmac-generic.yaml DT schema.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Add a note to the snps,dwmac-generic.yaml bindings file description of
>   a requirement to create a new DT bindings file for the vendor-specific
>   versions of the DW MAC.
> ---
>  .../bindings/net/snps,dwmac-generic.yaml      | 154 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 139 +---------------
>  2 files changed, 155 insertions(+), 138 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml b/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> new file mode 100644
> index 000000000000..6c3bf5b2f890
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/snps,dwmac-generic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare Generic MAC Device Tree Bindings
> +
> +maintainers:
> +  - Alexandre Torgue <alexandre.torgue@st.com>
> +  - Giuseppe Cavallaro <peppe.cavallaro@st.com>
> +  - Jose Abreu <joabreu@synopsys.com>
> +
> +description:
> +  The primary purpose of this bindings file is to validate the Generic
> +  Synopsys Desginware MAC DT nodes defined in accordance with the select
> +  schema. All new vendor-specific versions of the DW *MAC IP-cores must
> +  be described in a dedicated DT bindings file.
> +
> +# Select the DT nodes, which have got compatible strings either as just a
> +# single string with IP-core name optionally followed by the IP version or
> +# two strings: one with IP-core name plus the IP version, another as just
> +# the IP-core name.
> +select:
> +  properties:
> +    compatible:
> +      oneOf:
> +        - items:
> +            - pattern: "^snps,dw(xg)+mac(-[0-9]+\\.[0-9]+a?)?$"

Use '' instead of "" and you can skip the double \.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +        - items:
> +            - pattern: "^snps,dwmac-[0-9]+\\.[0-9]+a?$"
> +            - const: snps,dwmac
> +        - items:
> +            - pattern: "^snps,dwxgmac-[0-9]+\\.[0-9]+a?$"
> +            - const: snps,dwxgmac
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
