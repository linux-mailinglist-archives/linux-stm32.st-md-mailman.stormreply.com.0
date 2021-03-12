Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AC7338FD0
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 15:23:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4714FC57B53;
	Fri, 12 Mar 2021 14:23:40 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EB9AC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 14:23:39 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id o9so25901713iow.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 06:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ZmH44YRtFRRzhiVu0fvhNooqcCOgV0svXvgD6Zd8yJQ=;
 b=nh8YxSFuNVOvkvxBZ+jm1CmFOl3/2lfg3HgB9MU6ay7xegR9whtpdvFhHvc2zw+VMm
 MMUPtmscqr8KEFiQIJ3VXNuNfMrIWltpUSVb6XoWKzBR5FURgbKFJW2jBqdqCNOz/nJi
 /mXivDQVVGhBGWt6mW+61/BBlwqz8WDdTPRCYTrd5e7dpGpbHhIybsof/PDbZ/TKEhy4
 NXWQS9lYc7NMR7S5utZWoDAvGgIZoi2F/59KrfKkuCM/ZJ4vq4ucSE5hiekkAsarKYnP
 RSZLbiIR8sZdcHAecr7V5+8F00yHyQkfg38mRBnYuLDKCbBcRij3d/bOpSxRevKNxgfH
 CIKQ==
X-Gm-Message-State: AOAM532XOGawAbMibc8bXz0hKXBP3fSbRqpcCCU5VD47ZUBZIYvxQ2it
 j3LTYXlZel4CAWBjpI2E2A==
X-Google-Smtp-Source: ABdhPJxRPIqMZxLRKnf4tIhDsaPK5p8Vi8pbfKdHHTZJ/vkkYGFNLMknnLWvg6u3ZnTdR5rwFwJHHg==
X-Received: by 2002:a5d:8050:: with SMTP id b16mr10004247ior.201.1615559018073; 
 Fri, 12 Mar 2021 06:23:38 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id w13sm2973938ilg.48.2021.03.12.06.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 06:23:37 -0800 (PST)
Received: (nullmailer pid 2976053 invoked by uid 1000);
 Fri, 12 Mar 2021 14:23:29 -0000
From: Rob Herring <robh@kernel.org>
To: Martin Devera <devik@eaxlabs.cz>
In-Reply-To: <20210312102713.27776-1-devik@eaxlabs.cz>
References: <YEsjMJae3cGOdyjG@kroah.com>
 <20210312102713.27776-1-devik@eaxlabs.cz>
Date: Fri, 12 Mar 2021 07:23:29 -0700
Message-Id: <1615559009.788146.2976052.nullmailer@robh.at.kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Le Ray <erwan.leray@st.com>
Subject: Re: [Linux-stm32] [PATCH v6 1/2] dt-bindings: serial: Add
	rx-tx-swap to stm32-usart
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, 12 Mar 2021 11:27:12 +0100, Martin Devera wrote:
> Add new rx-tx-swap property to allow for RX & TX pin swapping.
> 
> Signed-off-by: Martin Devera <devik@eaxlabs.cz>
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> v6:
>   - add version changelog
> v5:
>   - yaml fixes based on Rob Herring comments
>     - add serial.yaml reference
>     - move compatible from 'then' to 'if'
> v3:
>   - don't allow rx-tx-swap for st,stm32-uart (suggested
>     by Fabrice Gasnier)
> v2:
>   - change st,swap to rx-tx-swap (suggested by Rob Herring)
> ---
>  .../devicetree/bindings/serial/st,stm32-uart.yaml  | 29 ++++++++++++++--------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/serial/st,stm32-uart.yaml:81:12: [warning] wrong indentation: expected 10 but found 11 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1451861

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
