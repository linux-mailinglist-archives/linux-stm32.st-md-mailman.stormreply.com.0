Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD5F146CD7
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2020 16:30:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AC73C36B0C;
	Thu, 23 Jan 2020 15:30:10 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DF8CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 15:30:06 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id w21so3085901otj.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 07:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YHqBGj/ukTPkl69zvdBgkmcYaLWB1N0Qj6YD43sxU/8=;
 b=fUwG6gjZNRF7DeAeFNjggun4C5zwun079dqG7fhpnv+QODgkdyuU55FYhERUCvpon3
 J1laIuRWhofqShBcW2MKa+ZsSSN45f2BMbCv1estbpDvuzd3+Sl5rgrv1moLWWuIzv2a
 fL5Ho32ubBsolP5cdHQzHtqlK2bkiyBINLnLz8ozB33gl0aTmS4OfsYSn/gfwyE4zRzs
 q/JsYXf4lwip8xnz1ANIh30FBvPl3DmFiRwSN7eOt62i2QiPqO8o+2rtJAJbaWJrxgez
 Uqz3WcUwYSDO1J7HKtW+eKzs4m+qMmOEhVqdqg8oZWIEzuZSTtOVgpKWKm7l48J6EV77
 fEOA==
X-Gm-Message-State: APjAAAWlYLa4R0j0g4NvU/t9L27p/bAX5GkbyPegiDpUemaHrKb5QtAw
 uDsmQk/EtUQw3UH9ZUhkVQ==
X-Google-Smtp-Source: APXvYqxkWG8AeF8EXXnGTWZ4IdGe6xCc6yw9d5YQpXCkxvBsnWb6O8ACMvnxGdINcohg5IvNyDKtDQ==
X-Received: by 2002:a05:6830:4ca:: with SMTP id
 s10mr11737763otd.268.1579793404638; 
 Thu, 23 Jan 2020 07:30:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p24sm891368oth.28.2020.01.23.07.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 07:30:04 -0800 (PST)
Received: (nullmailer pid 12956 invoked by uid 1000);
 Thu, 23 Jan 2020 15:30:02 -0000
Date: Thu, 23 Jan 2020 09:30:02 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200123153002.GA14241@bogus>
References: <20200123083432.21997-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123083432.21997-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, pmeerw@pmeerw.net,
 fabrice.gasnier@st.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, knaack.h@gmx.de, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: stm32: convert dfsdm to
	json-schema
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

On Thu, Jan 23, 2020 at 09:34:31AM +0100, Olivier Moysan wrote:
> Convert the STM32 DFSDM bindings to DT schema format
> using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> The DT check still returns some warnings on this bindings:
> dfsdm@4400d000: filter@4: 'st,adc-channels' is a required property
> dfsdm@4400d000: filter@5: 'st,adc-channels' is a required property ...
> 
> These warnings occur because some disabled nodes do not provides the
> required properties. These nodes are included from SoC DT,
> and do not provides by default the properties which are board dependent.

We handle disabled nodes, but not when they are child nodes.

> As workaround in DFSDM yaml bindings, the properties
> (like st,adc-channels) could be defined as required,
> only for the nodes which are in enabled state.

We should handle this in the tooling, not the schemas. I entered an 
issue to track this[1].

> ---
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.txt   | 135 -------
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 332 ++++++++++++++++++
>  2 files changed, 332 insertions(+), 135 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml

Applied.

[1] https://github.com/devicetree-org/dt-schema/issues/32
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
