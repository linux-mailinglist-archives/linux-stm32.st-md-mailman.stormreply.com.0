Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7025514A60E
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 15:29:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B299C36B0B;
	Mon, 27 Jan 2020 14:29:46 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3306FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 14:29:44 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id j132so5708294oih.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 06:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4bDe7p5lO4KINhYrTu+OYHhd26DPw/LYZ6CdLSLXKHM=;
 b=MJt3YVtcPLu0CgTv8IRVSerRV8mDVHTvDgTlpmQqQqY8jSMDqzhRy0Y0NuOjCdiIhw
 pp+ju7TEQ+tq2aQedXU/ejGSlc9WwVwiwfAx7QO1alNatYp+kwq0yyRjh8PHNqSYA4Eb
 azvvEdC00n8MMRIZV7FlvoMcuRJf6iFoqH9etrq6WyQmzahvwBM23Cd9R6M6pTY/ndI/
 fCsbmsT34EntJu3qv/MjGiK31fOhH+2saao9wME6zBePNF/9KeNd8RNv9SzH2s+naFwL
 TUbSlNKEAQI734Z27wKj8LMDnEf1FlvQj2TkgFKsq1P1lO5NJpyW3VrXF7GvgZEsSTBi
 OLsQ==
X-Gm-Message-State: APjAAAXmNYI1HU6RmrtA/lW7J31mOBNPqCL0qF035QAIjAJXHa10M0uP
 5xnDm+jCi8PJucBeOAUtLw==
X-Google-Smtp-Source: APXvYqyzZSLvp1ganhAJqIPTmgAZZt+s9TrSOix9chh8UUg49shFxxAcDVWGzOHjVBgKh0nBQrQ3gQ==
X-Received: by 2002:a54:4f04:: with SMTP id e4mr7262766oiy.111.1580135382917; 
 Mon, 27 Jan 2020 06:29:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a5sm369420otl.45.2020.01.27.06.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 06:29:42 -0800 (PST)
Received: (nullmailer pid 4191 invoked by uid 1000);
 Mon, 27 Jan 2020 14:29:41 -0000
Date: Mon, 27 Jan 2020 08:29:41 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20200127142941.GA3436@bogus>
References: <20200124084131.23749-1-amelie.delaunay@st.com>
 <20200124084131.23749-2-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124084131.23749-2-amelie.delaunay@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: usb: dwc2: add
 support for STM32MP15 SoCs USB OTG HS and FS
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

On Fri, Jan 24, 2020 at 09:41:30AM +0100, Amelie Delaunay wrote:
> Add the specific compatible string for the DWC2 IP found in the STM32MP15
> SoCs.
> STM32MP15 SoCs uses sensing comparators to detect Vbus valid levels and
> ID pin state. usb33d-supply described the regulator supplying Vbus and ID
> sensing comparators.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
