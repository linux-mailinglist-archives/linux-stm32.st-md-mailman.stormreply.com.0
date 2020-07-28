Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF27231254
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jul 2020 21:18:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DC0DC36B27;
	Tue, 28 Jul 2020 19:18:38 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B85CEC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 19:18:35 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c2so9783240edx.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 12:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oa15p4iXa6GJWXcRKbHat247Q7cvm1xa0u7tYmwOk/s=;
 b=blU+NE79hmQP+AWK2v6QHIjREnaP4/YLScYIEh3rWReHYQ1hpM4CB6natewhEcZJg3
 At/DtAoJ9fBGj4g3ZnXIMFH10prYf+AFTHKPO+8fGRN1w55P9BQqv5CG5MoRsyeuOUGy
 POKNlHiYWWDnRAmGiURfH6NrFotdNYkduTjxfX1eU8AGv+UrcTi8XLXCxBpX95UH/nrL
 VkdM0HjfPkXJVbmw5xo9QFfmCuDC7uGtgEvhLlgy6LaFCwHAms40eJR1/qxhoNZR63Us
 RkobSo+XmF/XkyPrpesTskiyKBR75/rYao7GhgZ+zXjoQJs1dT76PdO1tV+cozSe21+o
 52EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oa15p4iXa6GJWXcRKbHat247Q7cvm1xa0u7tYmwOk/s=;
 b=YlYL6hcas/XaVXaAdwOehlFyXwIVYYqJk/2awk2X5KvAv6p0TXvzza5NXO+pg0SsC4
 ebyx/cpVNhCJyYdag1e09aZtYujioLWNkMrag0/4mHN4qeW70Al9hWvu+1aJm7mEHl9S
 pZTwctzMnyW7zp1sdV+KTPzjXtUSGtpSG1pJ40U6lYbtVTHd+1jlddWXmeADg48JBPMc
 N+YA9MV6tdWoO6g3W9SDTBNG611x8lR11N5bq6nCWYxuQ5Fgnv+HVZHtgVsU0dnJ1MEk
 IX+Wcbup3I2NRVNMjPsKcLeVFRBDRYH8Pccl3YwVf6xtO82FJh/DdmjuIOGNcDu+ALks
 R7ow==
X-Gm-Message-State: AOAM5310m4wxyPJumd9eCrzwBZAhmXqJBpcfnt6Cg58tn6vbc4DunfIU
 qP+TdUixF7rX669h5CEDup3AN+GTKuTvDntQsx8=
X-Google-Smtp-Source: ABdhPJy5S7ubQoYm3tHb4jW0VlpjbyrDB7KIdVKen1wY3pcq2mMJd8xXnF7ClZtX7lLSpJPEPi2etzzsUrRn6G+1/8E=
X-Received: by 2002:a05:6402:1d0a:: with SMTP id
 dg10mr26396667edb.110.1595963915038; 
 Tue, 28 Jul 2020 12:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200728074602.14218-1-amelie.delaunay@st.com>
 <20200728074602.14218-4-amelie.delaunay@st.com>
In-Reply-To: <20200728074602.14218-4-amelie.delaunay@st.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 28 Jul 2020 21:18:24 +0200
Message-ID: <CAFBinCDd_9HJA4TT2mS007xFyO4jovt+Xrpejppzzq2Ty-JDmg@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 3/3] usb: dwc2: don't use ID/Vbus
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

On Tue, Jul 28, 2020 at 9:46 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:
>
> If usb-role-switch is present in the device tree, it means that ID and Vbus
> signals are not connected to the OTG controller but to an external
> component (GPIOs, Type-C controller). In this configuration, usb role
> switch is used to force valid sessions on STM32MP15 SoCs.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
thank you for updating this patch - please add my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
