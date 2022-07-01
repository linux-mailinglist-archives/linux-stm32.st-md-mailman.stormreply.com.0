Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2816563307
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Jul 2022 13:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55AE5C640EC;
	Fri,  1 Jul 2022 11:58:23 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AAE0C03FDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Jul 2022 11:58:22 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 cb12-20020a056830618c00b00616b871cef3so1666285otb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Jul 2022 04:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qdF+RSNMgLBcS3xDVeKhnoMiD/rejai4UUkHp1itl9U=;
 b=TzEQ5h3eOkhlUQMq926n84dZVu5OZJQHbLUxkpx/zmlMCEHgG2AK2Boyf77VKLhrs/
 6+gE3Ypu3F+I6oAFJnQScv//WgvXFlMZTqdC/b2wVNZuvB/9YFfMByyz1fzbSCV5joK4
 7mONaT8QxyaG+5jeMT+e62MiOgzdGaWTMz958wLMcAtIwUHSSGI7sOc3fCxO83XDrfcV
 7H5KjjZWF9G53MO64ypwa8u5409HtIgq8chsbg3QZkSnzqQ449cmp/ju6RgVydouy16f
 /DHX08BvzPvBIpYTnHVoV2lKRp5AedH31734YRXEvq4tSzN5HCiG+KnBdzedmZBqKI4+
 baRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qdF+RSNMgLBcS3xDVeKhnoMiD/rejai4UUkHp1itl9U=;
 b=aaQG8b6gDarcJ8ANaU+t4IAGWVehH9dUnbIuJ4QYPvRXJUIyxhRokJ5r5jLgaK3qZi
 /OeZDbJrXrlYjt6mnU4DKbiHQVYqMUcRp1VHryZwvdd+feGYMsm6ai0zNNfkOiibFB+7
 wJ3ZhrDFm8uLC9kIHhT51BC7m6lzQ5dmTrGVjTUE1fO7E/HnWDnkDJdVHj90u79pHXVB
 YFKrs3tvNaIqgVNgbdWw0HyuM2DQxxJHsvJI1rhmtsIeNENf9e1vpYA3nhb64PFktC7L
 q8pTdAc9LylPN6ceFU4jSHQNslkDH0D17NypOupFXzGKE3KnKoZkB2Bn2PlQ/xiVFoTW
 5JIw==
X-Gm-Message-State: AJIora85YQuOwmVFG7sSgvJAcMO/brXYhwCp3VsRuGKUfOX1K5pF9yzj
 LDytbsWDOTc6iSo86vM5IfCHWED+h6aSIgisFnN9jg==
X-Google-Smtp-Source: AGRyM1uVIfszKZu+EFEyXeuG0nfNhO5npeNYP9K8liqWxxdkdNL5DPhuXT+s8Upoys03fUvgc843UBZsFx0VdqRBf9I=
X-Received: by 2002:a9d:2ac2:0:b0:60b:2f8b:eaba with SMTP id
 e60-20020a9d2ac2000000b0060b2f8beabamr6355112otb.348.1656676701137; Fri, 01
 Jul 2022 04:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220624090055.569400-1-etienne.carriere@linaro.org>
 <7329b1e1-6337-5430-e90f-7f4c59c00636@foss.st.com>
In-Reply-To: <7329b1e1-6337-5430-e90f-7f4c59c00636@foss.st.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 1 Jul 2022 13:58:10 +0200
Message-ID: <CAN5uoS_yWujQ=zDHaLqsFuH9w-fnzePhU=CJFwxxLRJOxoEgyw@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix pwr regulators
	references to use scmi
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

Thanks Alex,

By the way, my review tags for other fixes to the scmi DTS files [1],
[2] and [3]:
Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
Tested-by: Etienne Carriere <etienne.carriere@linaro.org>
These are needed for a consistent kernel configuration of these boards.

Br,
etienne

[1] https://lore.kernel.org/lkml/20220624092715.1397827-2-gabriel.fernandez@foss.st.com/
[2] https://lore.kernel.org/lkml/20220624092715.1397827-3-gabriel.fernandez@foss.st.com/
[3] https://lore.kernel.org/lkml/20220624092715.1397827-4-gabriel.fernandez@foss.st.com/

On Fri, 1 Jul 2022 at 13:44, Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Etienne
>
> On 6/24/22 11:00, Etienne Carriere wrote:
> > Fixes stm32mp15*-scmi DTS files introduced in [1] to also access PWR
> > regulators through SCMI service. This is needed since enabling secure
> > only access to RCC clock and reset controllers also enables secure
> > access only on PWR voltage regulators reg11, reg18 and usb33 hence
> > these must also be accessed through SCMI Voltage Domain protocol.
> > This change applies on commit [2] that already corrects issues from
> > commit [1].
> >
> > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > Link: [1] https://lore.kernel.org/linux-arm-kernel/20220422150952.20587-7-alexandre.torgue@foss.st.com
> > Link: [2] https://lore.kernel.org/linux-arm-kernel/20220613071920.5463-1-alexandre.torgue@foss.st.com
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > ---
>
> Applied in stm32-fixes.
>
> Thanks
> Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
