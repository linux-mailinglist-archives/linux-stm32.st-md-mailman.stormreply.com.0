Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FDF6903C6
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 10:32:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A68F9C6A5EA;
	Thu,  9 Feb 2023 09:32:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C121C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 09:32:25 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id d14so1097474wrr.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Feb 2023 01:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3eL7i9b5wRY0WQmCcwLWaepV6oMtyTPsC0kIIjAbWos=;
 b=BRQ7FvOa7WzSiV9lkz2IJt8gO7JaWUx8exju0lZChG71KN1KtoPl+nRG2tNFgvNh+Y
 dNXXQ6b0oEhKK6B/zFwlCax2PavvZxrkry8H5BejD/nVC9fcWi2wlKpkJkwXsrul8qHj
 eI6IeiZGDUWE9y3z3wx2qE6JOSi8RsUPHLS/P0P97DW0GgSN9izSzHKQVKQMrwaNOVmr
 EVzu+BlHkixgNObqr177mOh3BOTcp9Cxsg6r5BU84mAf8VvLzQyi7/z6io0bMMIt5/O2
 WeW7kCJVzjDXho+Dj94lBcWidpEFZ3N0rYVewGdYnOwMQRh3t/ay1L+C2FVI67c9xIoV
 AKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3eL7i9b5wRY0WQmCcwLWaepV6oMtyTPsC0kIIjAbWos=;
 b=ySLWdQLWlHf119Rcc15JoYAOJrOzHzuhTSQ+Z3WnXRFDvUYDB/LjBLgfSalsvWT3C7
 edQ1YhwNEyhbkkizeTHX/R32iPqXriO5lbsMWKXSbYQl6BENotvFrIgHETNrAorrFe3N
 jV4th6vvaPA/C/p2lkJFhrAkZv/RVNJ/zgVj0BapnFRWgUrZgLyxlXSw2AJemd/+d0Z+
 dqOVQRBLKMkwW/KW982xCEM3nvgB7CibP8yS9vlWi07L2vLnpMhQuD83ZAwoXw168lJu
 903wFpjbb6RW0uWPeAIVQ7oSYcKcAUGFzKlMwEYD6i7QUbnM/AQiGEtEpihmw4JMCLCR
 Iw7g==
X-Gm-Message-State: AO0yUKWD9uDhCFeJ1rRYeIkipTnv3C8j4l/UgcBsTtq4cb5Wh8XASTdi
 sgfJWF4YOul63dCw/yKQYz1WBw==
X-Google-Smtp-Source: AK7set8I2xZbbr8G3cp/CpHdQlhfy0CfuBS3MAzNnpmRXGn+oP+zQZcQ4KmZTBzwEZBwmmC6Ow2r0Q==
X-Received: by 2002:a05:6000:136c:b0:2c3:db87:977c with SMTP id
 q12-20020a056000136c00b002c3db87977cmr9632412wrz.12.1675935144773; 
 Thu, 09 Feb 2023 01:32:24 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 t12-20020adfe44c000000b002c3dd9bb283sm803503wrm.37.2023.02.09.01.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 01:32:24 -0800 (PST)
Message-ID: <9f0a1202-1a98-22e1-873b-2d70ed63de72@linaro.org>
Date: Thu, 9 Feb 2023 10:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Alain Volmat <avolmat@me.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20230209091659.1409-1-avolmat@me.com>
 <20230209091659.1409-11-avolmat@me.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209091659.1409-11-avolmat@me.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/11] dt-bindings: clock: remove stih416
	bindings
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

On 09/02/2023 10:16, Alain Volmat wrote:
> Remove the stih416 clock dt-bindings since this platform is no
> more supported.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
