Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A12350D243
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Apr 2022 16:31:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B03B3C5F1F1;
	Sun, 24 Apr 2022 14:31:19 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BBECC5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Apr 2022 14:31:18 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id el3so10857145edb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Apr 2022 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=u3QVJwfNjgJmoiAOLcoG8RwtXh56A34hlU88O2ii/8k=;
 b=MFZ4GG9GYjdNpPSj5vXgIzZDpeYh3jdZWMFdCcsUNDizK4crz4ma2bFtUNasWv4xJh
 KDF+YL9TiHRYzZdvwnOPikOyas5VuRGgktTIsemnDJjKrsnqIlRgwISK4ch/6Hp5T7L3
 WpWhuMQAP38r0cOD7giVTLw/SEDreGNesfVDdYLWITw7PmHBR1eNf/kjlUg2PcXyBRUy
 FZcddRslgsMKzZCQ/K6oDzjOd0MpXHSwxbU2NGpGVDEIbfl6TaMZUEibbVbVi9R1T0ij
 dU5G5di7WVE/LngHBdYoXfh/iuOELFDiIYljFs/DP+LfUW3EkmWQIs/U6AzTByKbyv8o
 w7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u3QVJwfNjgJmoiAOLcoG8RwtXh56A34hlU88O2ii/8k=;
 b=jbJpCo3Vhl75Of088kGVpeCgUs+59EXeevuNmLIdPsAoB7Pw+0yN+tNolYWBOMaZnD
 XgfxzqJuFssvXbeeyo5EH8BtZDH5PjYgDujR7wAYwQhCCiVFbHYYs/BHoXdYnxm/mp3t
 1QPzOHpqKi/KoVqnCoLhrGA8YRDZuc3j3nzgk5Pa4DnZf7G+E78pz0xXIUPITiH/KroD
 jVcJWtiObrJyVRcQYd1CwkEEb4LK4XBkpxD73T3W7zV5Gi6VnIgLrQyXNTptQqcKmgh4
 eL4t9qqJZMR1oSTef9QA3znAL4FSEPzik/qnbVJ5v363zNVgyGz4z2xxkQbLgeZw5dLv
 2xNQ==
X-Gm-Message-State: AOAM5319y6HXLZWGIgcky/RMuIcO7c6FbfiMu4WeoKvzgMhVPAanEhDu
 lQgcUZV0HMCJt/4Dq6ob8I6NEA==
X-Google-Smtp-Source: ABdhPJyr3a/X7xebWBhj+iwrw6o6THmHab/G81bT41Wf1gG5ohsXHdOdBIRm/TGI4QqtcKtzXUbqkw==
X-Received: by 2002:a05:6402:34cd:b0:424:793:9f65 with SMTP id
 w13-20020a05640234cd00b0042407939f65mr14453088edc.88.1650810678196; 
 Sun, 24 Apr 2022 07:31:18 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 p24-20020a056402045800b0041614c8f79asm3317174edw.88.2022.04.24.07.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 07:31:17 -0700 (PDT)
Message-ID: <f7c7ff89-a6db-dc54-ef29-cd3431bbe8c9@linaro.org>
Date: Sun, 24 Apr 2022 16:31:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220423202452.148092-1-biju.das.jz@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220423202452.148092-1-biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm:
 Document Renesas RZ/G2UL OSTM
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

On 23/04/2022 22:24, Biju Das wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/G2UL SoC.
> OSTM module is identical to one found RZ/G2L SoC. No driver changes are
> required as generic compatible string "renesas,ostm" will be used as a
> fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
