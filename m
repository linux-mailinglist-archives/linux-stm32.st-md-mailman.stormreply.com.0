Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE1C44FCB
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2019 01:04:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83CCBCBFEAC
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2019 23:04:47 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B662BCBFEAB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2019 23:04:45 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m14so490052qka.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2019 16:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WvdSBZS6GY1RJhEJtYBVxaPueBDOjU15Kwk1F3xhAKw=;
 b=rOiwEYn585D6tEWYmX5XsXo07Ji8pcjY4jcOz+c5SlyFagVFDVbClBawBKXsDcYUoM
 E+aA/UqVP2L0Riwhnx0wC46Ko7d4P5qVjiK9Pc6eX8NgK44dJF3lv7Zm6cm/RNGp+YxE
 Z4SDeOB3M8odUPciemPNTR28w6do3WcMIVCqvyN96tiol5vOJMIR4Gt0iIQpYIL+4i5k
 t0OWU3HaFaltNcLKvaN/nK3JkUPzb5J26iFcHVGfXJAQWl/lJo6qJBBEaDlANsg/OmzP
 UBoJ/pMpy4Dh0beV7j1Ag6Du80+bdL6Nh/ZaLffYR0oKwy0S9d0VmLqP152oUuQbQ262
 cBVQ==
X-Gm-Message-State: APjAAAVVx9ZJWnjAmXgqIioFnPVY5J1xYG9cSTWJVX7nvEYjtWUN8CtK
 monteKFbx0/Vijm/N9jWfA==
X-Google-Smtp-Source: APXvYqzScKZ4qE7itNJAlKiopqo9SW2cEVK0YP4JF71kRJYGkwf5iKWWerwdZXEFYIG+JjdrDheMmw==
X-Received: by 2002:a37:aa8e:: with SMTP id t136mr6599276qke.222.1560467084536; 
 Thu, 13 Jun 2019 16:04:44 -0700 (PDT)
Received: from localhost ([64.188.179.243])
 by smtp.gmail.com with ESMTPSA id y20sm736495qka.14.2019.06.13.16.04.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 16:04:43 -0700 (PDT)
Date: Thu, 13 Jun 2019 17:04:42 -0600
From: Rob Herring <robh@kernel.org>
To: Gerald BAEZA <gerald.baeza@st.com>
Message-ID: <20190613230442.GA7783@bogus>
References: <1558366019-24214-1-git-send-email-gerald.baeza@st.com>
 <1558366019-24214-3-git-send-email-gerald.baeza@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558366019-24214-3-git-send-email-gerald.baeza@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "will.deacon@arm.com" <will.deacon@arm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Gerald BAEZA <gerald.baeza@st.com>, "olof@lixom.net" <olof@lixom.net>,
 "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/5] dt-bindings: perf: stm32: ddrperfm
	support
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

On Mon, 20 May 2019 15:27:16 +0000, Gerald BAEZA wrote:
> The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.
> 
> This documentation indicates how to enable stm32-ddr-pmu driver on
> DDRPERFM peripheral, via the device tree.
> 
> Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
> ---
>  .../devicetree/bindings/perf/stm32-ddr-pmu.txt       | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
