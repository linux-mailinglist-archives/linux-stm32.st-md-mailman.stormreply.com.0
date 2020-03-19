Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8641218BDB3
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2020 18:12:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34770C36B0B;
	Thu, 19 Mar 2020 17:12:38 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08113C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 17:12:35 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id d15so3080423iog.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1uRh6l5+Das1Y3n6fQwU4j/xxpeTRicxLD15NbO6tg0=;
 b=HKCIG5DU06CNIKlbpSSPk/YlvlyEYVgiU2fwsDn+pbJlcWpm6YJfPOLW7FVohXFgi4
 o7UC9axKIvnwkJP2/8UNHSIjg64Ji0/xKVHdyntGtT22kOCXjpuoDz12viwJNL6sR8ow
 E77hn6fbcdfgM1PnYHvdry3Gd791j7+2H/4BYMeVE3Zrj0DBL2PVwLDTzlIo97+DyTEe
 YFtaGvKQn6q4811LDVOBEqyJaW7dJHXk6kxjAEs5hR24zIyFIWNMjbTlXEdI41vjwdON
 liUBwweSMlMlEUYM2R9GBvfxujAgNW27bgd0VqoGa4UYmW4ivqESlregnK+N91YVFLZq
 LEXQ==
X-Gm-Message-State: ANhLgQ344EIL/C1nwEfNdYzIYS11qnfWhYP0szoSlZNLRfWNVETba9za
 t5/OWPayfC0tzUAmUpsJFA==
X-Google-Smtp-Source: ADFU+vuKqzfgjxCKo37tHMP37T6SVQAWNqhv2cJ1n9k92m0g5Fa3b4S8sTBFsnX2NLnRpxQf1jtqMg==
X-Received: by 2002:a02:bb09:: with SMTP id y9mr4239389jan.33.1584637954714;
 Thu, 19 Mar 2020 10:12:34 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id h29sm1064995ili.19.2020.03.19.10.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 10:12:34 -0700 (PDT)
Received: (nullmailer pid 17676 invoked by uid 1000);
 Thu, 19 Mar 2020 17:12:31 -0000
Date: Thu, 19 Mar 2020 11:12:31 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200319171231.GA17071@bogus>
References: <1584543037-32095-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584543037-32095-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: dac: stm32-dac: convert
 bindings to json-schema
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

On Wed, 18 Mar 2020 15:50:37 +0100, Fabrice Gasnier wrote:
> Convert the STM32 DAC binding to DT schema format using json-schema
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  .../devicetree/bindings/iio/dac/st,stm32-dac.txt   |  63 ------------
>  .../devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 110 +++++++++++++++++++++
>  2 files changed, 110 insertions(+), 63 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/iio/dac/st,stm32-dac.yaml#

See https://patchwork.ozlabs.org/patch/1257568
Please check and re-submit.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
