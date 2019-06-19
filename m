Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA86C4BC01
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 16:47:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ADECC57169
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 14:47:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9D8DC57168
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:47:38 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 427F72166E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560955657;
 bh=MispwiBeGhFnc70/V895Ut0pfCpszgeSw5NVXb/tVqE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UtqG5Q7O8kyz0HVnCptfeQpM5R6jfDGYeTfYLwvI6q/0SZ4o6PXqkVCPTICjtHVVa
 DBBz/iW04N6UCDfKNGSMzAY+V2sJ0ShYJkox90+pzW71p5Rt+h69+RHD8zQvMNGI8F
 x/2cl2r7QSkT06+DC3ICEfHDuPoOv/E8uUn88lqk=
Received: by mail-qt1-f174.google.com with SMTP id s15so20161515qtk.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 07:47:37 -0700 (PDT)
X-Gm-Message-State: APjAAAXsdmBhRRXPqtY0/ledo5pTfrmI88m0ehrp34rRhWqPNHcqZktB
 EYDHGPENuFxXgE8a1yWguTyiDl8iNN8BSVuCWg==
X-Google-Smtp-Source: APXvYqzxfiq+J/8q3EtSbIQaJxlL5XeiaNwyKA4fxgTdB/b6ypNd2gAyff/wVi4H6PtRE56OBERhjbnLodMppIC8+hc=
X-Received: by 2002:a0c:b627:: with SMTP id f39mr34545269qve.72.1560955656548; 
 Wed, 19 Jun 2019 07:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <07bc6b607cf1ad88214b7ce528fadf0b1ce30784.1560937626.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <07bc6b607cf1ad88214b7ce528fadf0b1ce30784.1560937626.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 19 Jun 2019 08:47:24 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+69nL40xUxYAEWaixEqs9=oNdbp-59Jogx8o2wyYFdnw@mail.gmail.com>
Message-ID: <CAL_Jsq+69nL40xUxYAEWaixEqs9=oNdbp-59Jogx8o2wyYFdnw@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 11/16] dt-bindings: net: dwmac:
	Deprecate the PHY reset properties
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

On Wed, Jun 19, 2019 at 3:47 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Even though the DWMAC driver uses some driver specific properties, the PHY
> core has a bunch of generic properties and can deal with them nicely.
>
> Let's deprecate our specific properties.
>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Use the deprecated keyword instead of duplicating them
>
> Changes from v1:
>   - New patch
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
