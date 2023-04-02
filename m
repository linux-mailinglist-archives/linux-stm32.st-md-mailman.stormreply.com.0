Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A212B6D371E
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 12:18:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 686ECC65E56;
	Sun,  2 Apr 2023 10:18:47 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 883C1C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 10:18:46 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id cn12so106469371edb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Apr 2023 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680430726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/rAiXCax5IEv3GbtrRjNdKeaqlkFvh50Ja+hlmWJztM=;
 b=CZ6AIWc+LYoqh0eKEeSfubGzY7nIZAjyELJDiSiiYYbEOgKtzDqCe3DdPPU2HH7+6l
 XyE76sN9/H2OjdE+O6lBy8jz9tirH524AiHcq1uu6AWrGQVgzo7qvWaxmZKqTdWk0xhq
 cnFbpfbEBkdTCWpkG0xdGy7sedCy1zlVtGLZDH3RJ0nB9toyOSb8AnnyEUDn4EUF8Vtk
 iOAiBOR+Ggh5Q4EdePZCLxCfhws6xkFYnx50q2m/KqpmtBgbz9yCfA70877PIDqFQUfn
 lTbFradnLqyvCRVf2pcUT4UXXy20oY+tZMVT5JF8h9Gvuv37ODIhzGz74Q2d91Tbt8U4
 l1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680430726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/rAiXCax5IEv3GbtrRjNdKeaqlkFvh50Ja+hlmWJztM=;
 b=AAr1DxBjL8TcwWsnR8S7N8VjKARsp7Dnw/72n1bOWhaafzeRwNyUOhCV3qI+qN6TFz
 WDNMTY95oXJp3CF93We083nHyYPR/YkccQ2YJN6JPdH7qfihe3sgdLGbRw1atA3tolKA
 cpx4L7I9xkF8G6VLxDNO7mJYowvTUWbmNz/IDq2W9jUBoWThwdeNR9DbBI8BUOFHcQMH
 DKg7s7Evfca0YLxsZmmxiKRP1CIDccGUZJxslyyfUwrksee9xR7L3A/pVmb9yc4pL1Z7
 mBUg7wwza77S9M/ly7lJ+mgZyMm2SRJfzab/uBv9DkRlpwk/GueqsEn5aGMaHw9zF8QS
 W3Sg==
X-Gm-Message-State: AAQBX9fWuaRopFHNYP/CA8SIc6hK+HN+C2H5Pt8i8V86G0qhlI11szKq
 zK9ky/MdrCYjLVeOlN5HLP2Fcg==
X-Google-Smtp-Source: AKy350a58/ZGMnWVhUq5Dhq9lLiSkEtxFuGyfG7+T6kIeXZ4waLFXxIO23QvKHjBcWD0NzsEIN9V1g==
X-Received: by 2002:a05:6402:cc:b0:500:5627:a20b with SMTP id
 i12-20020a05640200cc00b005005627a20bmr30009201edu.1.1680430726087; 
 Sun, 02 Apr 2023 03:18:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5?
 ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
 by smtp.gmail.com with ESMTPSA id
 a65-20020a509ec7000000b004fbf6b35a56sm3133164edf.76.2023.04.02.03.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 03:18:45 -0700 (PDT)
Message-ID: <626b9c03-2425-3d26-b088-66412f386657@linaro.org>
Date: Sun, 2 Apr 2023 12:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-8-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-8-5bd58fd1dd1f@linaro.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 08/20] dt-bindings: timer: oxsemi,
 rps-timer: remove obsolete bindings
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

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 timer bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
