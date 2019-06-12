Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7B41E31
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 09:47:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76F37C5DBC8
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 07:47:32 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FCB7C5DBC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 07:47:31 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c14so6895plo.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 00:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RTEvowjVOZ1tt6yW3tt8znN/f0k1q7mGY13SshYdHu0=;
 b=ev+kVdsEuZay+u/9fs+NWPIBWNJyQcyQ6Ur5EFF5tKrCyVYcgNizj2gLPu5bxid0Hz
 tPLF7jTePnup5KqcxVjCHful3j9gTdvqX+Qriam8LVoek6qX29ezGElZwt6zYBEcb2SN
 Q37YLJtAP03GlRDoXXFwr55GafpU0rlhDZGhQcl3SWX6gJA9KQpqiKwUOmlIGxRiYosn
 dr9HK/RZVUvizdrr5OpBpHn4ChblEUXYJHENQsSph+PYnec44Z2CFtv0zFRptfx7TiLd
 S7/PaXMj+7j/nP3bEQCPT+x48srxZ2LXHIsDlMch7Ni6dFdgIfKRdUiOcsa/OwOyp9cP
 OrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RTEvowjVOZ1tt6yW3tt8znN/f0k1q7mGY13SshYdHu0=;
 b=qc8QX4puyM4YCz904lsyP7olPgNQtWBCGMpp+S22LmnQ35dOHKebZ9O8wGHxyoN5De
 PjKO3zL7ZEuYJ6yj2HsgHLTFwWskhwGxTjDa209lBltb9rlUP6cD+oM+EiUo8OXlqzbB
 y0PykcAirFj9dQeSKo5y1gO/sMJPzDlS6PEHMN5dMt+7LF9I2WGa1CBkRSnX75h4XmBV
 +6AZnAaaPdfkyl4zbWarJiqWvvDwwjU+QLgQlXDim2JlsrFScmCsIq/zvVqw0/FeLjob
 hnXtbwHii/6aFU5EfjEH/+PL+e6edx9LqNVswCuocoQBwTA2CM9csbiWv4TJ1ioUEmOu
 wrqQ==
X-Gm-Message-State: APjAAAWWE9i6SHoLyXo59L2M2JmZG+gXMw1lsiHzzr0hwnuWUSVJsfZz
 RSBD5XSH+H/ePwT85jdsyR/g
X-Google-Smtp-Source: APXvYqxdFNwHHUupAjw3XvuIJ/ZVdpM65R2uvHP1jCdfRej7cyXAdncrWoLq1ppn8UtyJYh5XGiOKw==
X-Received: by 2002:a17:902:968b:: with SMTP id
 n11mr43028455plp.120.1560325649660; 
 Wed, 12 Jun 2019 00:47:29 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:894:d456:15b5:9ca9:e3ec:c06a])
 by smtp.gmail.com with ESMTPSA id v5sm16896474pfm.22.2019.06.12.00.47.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Jun 2019 00:47:28 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:17:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
Message-ID: <20190612074720.GA5513@Mani-XPS-13-9360>
References: <20190531063849.26142-1-manivannan.sadhasivam@linaro.org>
 <20190531063849.26142-3-manivannan.sadhasivam@linaro.org>
 <CAL_Jsq+N7NA7m+dp+zpwFeZLM6B+OwRrqZdzKkJp2TRWi_e3Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+N7NA7m+dp+zpwFeZLM6B+OwRrqZdzKkJp2TRWi_e3Mw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, loic pallardy <loic.pallardy@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 2/4] dt-bindings: arm: stm32: Convert
 STM32 SoC bindings to DT schema
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

Hi Rob,

On Mon, Jun 10, 2019 at 03:57:43PM -0600, Rob Herring wrote:
> On Fri, May 31, 2019 at 12:39 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > This commit converts STM32 SoC bindings to DT schema using jsonschema.
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../devicetree/bindings/arm/stm32/stm32.yaml  | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> 
> Converting implies removal of something. The schema looks fine though.
> 

Ah, sorry. I forgot to delete the .txt file. Will do it in next revision.

Thanks,
Mani

> >
> > diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > new file mode 100644
> > index 000000000000..f53dc0f2d7b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > @@ -0,0 +1,29 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/stm32/stm32.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: STMicroelectronics STM32 Platforms Device Tree Bindings
> > +
> > +maintainers:
> > +  - Alexandre Torgue <alexandre.torgue@st.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: st,stm32f429
> > +
> > +      - items:
> > +          - const: st,stm32f469
> > +
> > +      - items:
> > +          - const: st,stm32f746
> > +
> > +      - items:
> > +          - const: st,stm32h743
> > +
> > +      - items:
> > +          - const: st,stm32mp157
> > +...
> > --
> > 2.17.1
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
