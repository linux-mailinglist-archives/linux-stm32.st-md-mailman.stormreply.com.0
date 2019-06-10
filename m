Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC0D3BF08
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 23:58:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C6E2D1DEA7
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 21:58:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56972D1DEA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 21:58:56 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE2132145D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 21:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560203935;
 bh=0PkPVdz5GVGKK3sk7TXqMD/2uCtfIwQXWAIEJPKPXS4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vEfoYgbBq11nuojqIl5e9i7RXs8dtqVAB0ysyomiAsFQ60a3iO7+gRazCHpKv3+Hj
 d6Jk8KCJYSMSnVxDbznJoY7vuau7PB2vH0B4qYiipoC0DJtvfp0xKOURJglbDN1y8m
 CxMGrgGUwRyGnnzsA56KLz3KKAuNcrJE1e+3LTTY=
Received: by mail-qt1-f177.google.com with SMTP id n11so10059966qtl.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 14:58:54 -0700 (PDT)
X-Gm-Message-State: APjAAAXf63SGLAm/M2ikWeN3HT/wBHUbpA/oHgroZtoqi/Spg3kSgKkz
 aUEKPl/j/k8Yg/xiJcMYl5fXjjOex85CmMmo1g==
X-Google-Smtp-Source: APXvYqzYmsQ1fTULRa5HAKFvUASBSBcpANP6JQU7H9+hyVCTO/yhwj4BIvezOoVzR8ZhDpYU91B05EHec2kVcFmKG98=
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr61757193qtc.300.1560203934207; 
 Mon, 10 Jun 2019 14:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190531063849.26142-1-manivannan.sadhasivam@linaro.org>
 <20190531063849.26142-4-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190531063849.26142-4-manivannan.sadhasivam@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jun 2019 15:58:43 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLjKu_1Gep348-ERQgJrZ6vM2RxB2UW4heqGGg5syEFWw@mail.gmail.com>
Message-ID: <CAL_JsqLjKu_1Gep348-ERQgJrZ6vM2RxB2UW4heqGGg5syEFWw@mail.gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: devicetree@vger.kernel.org, loic pallardy <loic.pallardy@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 3/4] dt-bindings: arm: stm32: Document
 Avenger96 devicetree binding
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

On Fri, May 31, 2019 at 12:39 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> This commit documents Avenger96 devicetree binding based on
> STM32MP157 SoC.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
