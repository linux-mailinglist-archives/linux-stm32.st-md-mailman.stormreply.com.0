Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9238D5F380A
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Oct 2022 23:46:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29652C64114;
	Mon,  3 Oct 2022 21:46:59 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38FDDC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Oct 2022 21:46:57 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id s30so12700401eds.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Oct 2022 14:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zAYgLaSnCGfa8SU+NH6gwotTtGoSsucybfqj2dUgdAM=;
 b=RVCHdxanJVyFUUSS93q51N8+I1tKBI9oAEVRe7ilmYWZ9MVp144gXBv1kYTZdfHXIo
 9lc93g5a6zAwnxi+IvV2eQNDN8yVYIRsARw/tGeVX/FTGHISN76GQUHSB3tL9GTLt00u
 eaJXvON2TmHWt2QX/iHVvDkb5d9bfrmez1YjXEUlbBiEdj27TfLdfIFFL5y6gpQ+HB9g
 6Kokd8mvIrOqXQULEHmMy46RbGcqbunOiWoiW2Wx86hYFaA4BXH7JGY8TsdecRAaO+fZ
 zdlQsot4zbqHoFw4uG+RwUovIZPv27RaBx1HSDOxt7kpH+qPCULMl4xg+lh8TgQkDJci
 hOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zAYgLaSnCGfa8SU+NH6gwotTtGoSsucybfqj2dUgdAM=;
 b=6wD4pHr+VtyiT6q7ccZwF0zGxyrAxxVq/lOoCc2nh5a5kPkox+uM6RckW+WeXw7NU6
 qaj00IJbprU1A36a0Ai6vLl47mjlZQoAAT3tw5iyCkCTcbCs/+71pVLrhGNyWqATPkcW
 a0m2sRGH4Q2Ei4YuXzhTIw8U0wpyl+CKUUdSiU/aFFASRbpBqyvYhOs9sMSTFVwehK9U
 0xNZB8OOCWnJ5sgvgzKJCpo5KMZKFxOtwws2Jj8Y4nMXiB0Yhk9fk+hOaZlz0ZI0YZ4W
 qvaeyZeGdvgnGeIH5LPo1ANA9OtFu5iG0Q227hUF/k2xIqymZj+AqW3eRmbsKtOJ3QT9
 pPkg==
X-Gm-Message-State: ACrzQf03tTLVWdQmcOTINcaEeAT+2MGWO2SRkPhVdU79nGRw1EuCQkT+
 41hljzLuMlR65uA3/88C3bE5G9AG1fCIQBfCY6pGkg==
X-Google-Smtp-Source: AMsMyM5UrjbvOzcq6FmvgXykvlePJByBD7ZIVQlTnIbpQrim0/itLwb6Rh67og69RE+wWbcGISW74QVzBjgoCyQJcgw=
X-Received: by 2002:a05:6402:2690:b0:452:3a85:8b28 with SMTP id
 w16-20020a056402269000b004523a858b28mr20040077edd.158.1664833616720; Mon, 03
 Oct 2022 14:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220927191736.299702-1-marex@denx.de>
 <20220927191736.299702-2-marex@denx.de>
In-Reply-To: <20220927191736.299702-2-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Oct 2022 23:46:45 +0200
Message-ID: <CACRpkdZRq0oOXfn0-SHG5Rv0=f_Lb=-+Yy0ST_tY9+JPqxwV6Q@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] ARM: dts: qcom: Drop MMCI
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
