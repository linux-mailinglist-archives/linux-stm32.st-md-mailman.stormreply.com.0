Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FCD22F704
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jul 2020 19:50:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE81DC36B27;
	Mon, 27 Jul 2020 17:50:02 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 704F3C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 17:50:01 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id dk23so6076548ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 10:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E3P4kvBv8Rleuknjs/EKTdnAw0nGwmEOuGwij7lqxeU=;
 b=jLtvF/aQ5RtTONzbSrQDOZ1CQZgDhxf9HDJmnPZud7lgph0ilkpZaU78GtBhDuvd/2
 XmfXbx35DAI4/SglbNcNHF7h7zU7e4p0cA0f0vciUXtNUk85F31iGXiz12kBr4+fWgRD
 hb+sgtPHobb0bF263fhJxgjNXPA4nZiC0u01RdMJ7iuCtNx9s8Wrvl2lOVSatGcBy6Y7
 SWxtFNAI6SpEcTTrI96iv1FIfoF6atpJdLZ4tM/SjnLDB5flQ6szb6JfblsDE3BNMXVY
 wbvsp0o3+hXk3D4C2T0BZgwg2apRKpQYk/XrcaLxEAIr98Y9MMoaRATEJKcwDv8Sgoh8
 61aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E3P4kvBv8Rleuknjs/EKTdnAw0nGwmEOuGwij7lqxeU=;
 b=c+gyz4rskI2iwCi2jxl/n9i9D3FQKBWyY5XEWrlvgQ/pSZvE88BFynl2T+wamdya09
 RbenWoWVyQrERCJY2hUWFJl8RpqOxcwJuM2ZOBmLbXiIbRr2ki6f6RD3AMNC86IUcI6Q
 CZBGFyE7K78ip6JrfmWWgd+QyURfm+CPOobnrxdAKp4EIwhoWKLI3DdcRzFsaMjYurVC
 RArVUnBh11CcpBuhD7BQhhgmpMg57wjPHUMDSg6c6eUQnE4iXMv48Oa523TA7GhKz1i+
 WSEjQyTGgbesHddn7hK6bg2klI3Xvu5na4RuBH7BOL/3AYuHIWR8bpJ6UTGulfcLhkjx
 +OfA==
X-Gm-Message-State: AOAM533jMR6SN5V7lG/4NbVWZKBthW/zwUVlDUeYHJYzh4GWkEYCJJvL
 2P4BoejigufWYF4iKM8S+ibqvjFQC18ATRXKstw=
X-Google-Smtp-Source: ABdhPJx00cueCvmkr54gaDTC1tq+EK0jdh4p/C2xAIh4A01uMkWJLB4IiShofhBWPvcEAq/5YL+6MG9izDKcQfaj+q4=
X-Received: by 2002:a17:906:aad2:: with SMTP id
 kt18mr4042699ejb.537.1595872200937; 
 Mon, 27 Jul 2020 10:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200727092346.19780-1-amelie.delaunay@st.com>
 <20200727092346.19780-4-amelie.delaunay@st.com>
In-Reply-To: <20200727092346.19780-4-amelie.delaunay@st.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Jul 2020 19:49:50 +0200
Message-ID: <CAFBinCCXuUC4PHgrobYjj=yjA3Tz73Wwx0KWz+B6PfCw_OSi_w@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/3] usb: dwc2: don't use ID/Vbus
 detection if usb-role-switch on STM32MP15 SoCs
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

Hi Amelie,

On Mon, Jul 27, 2020 at 11:23 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:
[...]
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index a3611cdd1dea..65f8596f6795 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -183,9 +183,11 @@ static void dwc2_set_stm32mp15_fsotg_params(struct dwc2_hsotg *hsotg)
>  static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
>  {
>         struct dwc2_core_params *p = &hsotg->params;
> +       struct device_node *np = hsotg->dev->of_node;
>
>         p->otg_cap = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
> -       p->activate_stm_id_vb_detection = true;
> +       p->activate_stm_id_vb_detection =
> +               !of_property_read_bool(np, "usb-role-switch");
the rest of params.c uses device_property_read_* instead of of_read_property_*
I thought I'd mention it so you can decide yourself whether this is
fine or needs to be changed


Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
