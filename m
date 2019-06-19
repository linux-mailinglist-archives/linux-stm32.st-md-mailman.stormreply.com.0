Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9514BAD4
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 16:10:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 097F3C56630
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 14:10:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 068E5C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:10:27 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CCF321873
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560953425;
 bh=eAkETR1airFEdkrvmqxKAnHpAPALZYjF/U5gjIALrUM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UuVQ+dfW0se8BadL24kxy8KpYt7nswO2DeKP9VFDc4smOqGT+DUiRX0yB2SodJEw6
 CeSGRrMV5AncEhb1NwIH0SZMxo3PI6/ZbYRrgYvx+eCJzBIBd/BfQAnhOGveFtLUgY
 NJcF4UvAjiAAShvHlsvcpVNeAgNYZa70+fg9sNY8=
Received: by mail-qk1-f176.google.com with SMTP id m14so10963161qka.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 07:10:25 -0700 (PDT)
X-Gm-Message-State: APjAAAUOY3RDnFJ3I0+D/o79vbLURNqioGKE+2Jf+LhSvkJs6UYb1qWB
 vXuPjeJi2rYt0tiK10nUc6ZQhXnOAlNONfs+Aw==
X-Google-Smtp-Source: APXvYqw9X46Mgu2RprjLazOYn0ITq1U9dAZj6F7rqFtXuTxJ4ZNpg2PAEqixE+a2M0Jx4daY2/u8dIsGscF4zKKrR5U=
X-Received: by 2002:a37:a6c9:: with SMTP id
 p192mr102502666qke.184.1560953424738; 
 Wed, 19 Jun 2019 07:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <a9c556114ab21793d100f31361da01a579bae84e.1560937626.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <a9c556114ab21793d100f31361da01a579bae84e.1560937626.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 19 Jun 2019 08:10:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLyByqjpdSoebU7xboupmnbZb5q3D2L_oQt_sigBQeMnQ@mail.gmail.com>
Message-ID: <CAL_JsqLyByqjpdSoebU7xboupmnbZb5q3D2L_oQt_sigBQeMnQ@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 10/16] dt-bindings: net: sun8i-emac:
 Convert the binding to a schemas
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

On Wed, Jun 19, 2019 at 3:48 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch our Allwinner H3 EMAC controller binding to a YAML schema to enable
> the DT validation. Since that controller is based on a Synopsys IP, let's
> add the validation to that schemas with a bunch of conditionals.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Switch to phy-connection-type instead of phy-mode
>   - Change the delay enum to using multipleOf
>
> Changes from v1:
>   - Add specific binding document
> ---
>  Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml | 321 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/net/dwmac-sun8i.txt                | 201 +---------------------------------------------
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml                |  15 +++-
>  3 files changed, 336 insertions(+), 201 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/dwmac-sun8i.txt

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
