Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 729E75F380C
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Oct 2022 23:47:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EB4EC64114;
	Mon,  3 Oct 2022 21:47:16 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13CFBC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Oct 2022 21:47:15 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id hy2so24959726ejc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Oct 2022 14:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zAYgLaSnCGfa8SU+NH6gwotTtGoSsucybfqj2dUgdAM=;
 b=YlWmmsM7lTJJGalVIwZ9dwi8cj/06pB914EX3vdbkQ3SAmGQFMmvAyIvLc21049fjQ
 Fq4dKUjUbDjZniZlY+L9WcljP/jjGnSu+cSYmxose2/WpSOLsoawP4Xcl7VZ6ORwWEoF
 C3Bm+q2lDDpi+O+luWwuJNztaWEEKEUIqvOTlR2FGWc+GjaEqy8Tf+PD1fH2Bksm1u1N
 kNOMMRVretuRpg00tiGhLEiW9PJpMer6GqP1jMFj7UytD2kTeRekHkkcIZziOMcQqgpK
 /cL+BT1r1aDm9dKSjGNFD7mE3FO/0nSJLXHCOmup6GEsWJoWrrZ6zmx0lM1ACD0HX4uP
 iPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zAYgLaSnCGfa8SU+NH6gwotTtGoSsucybfqj2dUgdAM=;
 b=NWkluwM9gfnnxaVB6fwZuEpgBXMqKRVmScdXO7Rlmd1sdWkZRjSC608n+3z0juOD46
 2Zg8oamY1HBDgXbnu2KsT/wLeTgz9ZeJC/gOQqCXU15477jStW9l+XsBFJpFSkyuicAn
 1D+UImxRjkNx5XgRZkBL/pHw1aMo4x6YYdkinzVdDQ6mUEfqs4Z7UcORX6/ZaKgSelsD
 nLBb0qj7elUAe49U/dINT1+3mdArPUB+CPhCbKKqowbKX5ks+0PJmWRPujXOIJAjn8Ni
 1nd4KGo8uFriwa6014u587hBcs2cFJq/+bqg2XnaJShb/TzOEdvI26USzzNLV4NfFOmV
 Kuvg==
X-Gm-Message-State: ACrzQf2kKRQp1QgNRDVphRm3ogz0TiyHGVAZng8vJt4k2lqsfIeqKmT9
 stmKqSAajdHO6gZCOBT3jacRtXRrwpWlNtn1DPz26Q==
X-Google-Smtp-Source: AMsMyM6hJR0vYBEC7jTZoz6vd6S+i+o5RvWHLL1I4lSo6pa/Vl3uXej9EsG3CXyFZAW/4PjitKY0liOJGmvl0h0VKM0=
X-Received: by 2002:a17:906:8a46:b0:781:71fc:d23f with SMTP id
 gx6-20020a1709068a4600b0078171fcd23fmr16909585ejc.500.1664833634721; Mon, 03
 Oct 2022 14:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220927191736.299702-1-marex@denx.de>
 <20220927191736.299702-3-marex@denx.de>
In-Reply-To: <20220927191736.299702-3-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Oct 2022 23:47:03 +0200
Message-ID: <CACRpkdZwaHJUd4DEOiKXQ96x3UJfQSCz0oxr5d0QpBCnvEydYA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: Drop MMCI
	interrupt-names
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

On Tue, Sep 27, 2022 at 9:17 PM Marek Vasut <marex@denx.de> wrote:

> The pl18x MMCI driver does not use the interrupt-names property,
> the binding document has been updated to recommend this property
> be unused, remove it.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
