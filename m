Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1E142BA9
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 18:02:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1F4DC67C67
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 16:02:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35413C67C66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 16:02:16 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9773921744
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 16:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560355334;
 bh=metd6bfdlEBpzQ+ceKHY3yudA9GwzpuxQi/0AJYZuR8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BpnF2iOKSK+jY7unE/MwXLWK43vtt7PP1oCjwKuMsh3zl6D7wCyQlPqrZO/0Mgduw
 Wg6lTA9cesMM+9j7w0HylZOSDLOSDPD/e+9TIdNMRx2gxfJ6Qfucesc/xdJU/Nkdlp
 s67QT25gBaeazOJ2u8fFb1DKOa2K0tuBp3ih/S50=
Received: by mail-qk1-f169.google.com with SMTP id m14so10648213qka.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 09:02:14 -0700 (PDT)
X-Gm-Message-State: APjAAAWWr+FMs0NiMpknvx5vyYEzBfdIlFFpGjjA45tPfHCjYqKcEJWE
 CAw6oFD8Rc0Gfnk35EBU6kS4bVLEVdJFbJbFnA==
X-Google-Smtp-Source: APXvYqybvPsqmqFny7a/JtFlhcTlJvlaZutyfLURiANi3yYx5Ws3TiRMG/YwRYEOIfUSRlyBWiQ9Ld6YtcnmxxUqqK4=
X-Received: by 2002:a37:a6c9:: with SMTP id
 p192mr68957195qke.184.1560355333838; 
 Wed, 12 Jun 2019 09:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190612075451.8643-1-manivannan.sadhasivam@linaro.org>
 <20190612075451.8643-3-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190612075451.8643-3-manivannan.sadhasivam@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 12 Jun 2019 10:02:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLRTK=7Ch7V-WA07_zxWMNGXmRH7=1TRR9m-zY7h_-YYQ@mail.gmail.com>
Message-ID: <CAL_JsqLRTK=7Ch7V-WA07_zxWMNGXmRH7=1TRR9m-zY7h_-YYQ@mail.gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: devicetree@vger.kernel.org, loic pallardy <loic.pallardy@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 2/4] dt-bindings: arm: stm32: Convert
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

On Wed, Jun 12, 2019 at 1:55 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> This commit converts STM32 SoC bindings to DT schema using jsonschema.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/arm/stm32/stm32.txt   | 10 -------
>  .../devicetree/bindings/arm/stm32/stm32.yaml  | 29 +++++++++++++++++++
>  2 files changed, 29 insertions(+), 10 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
