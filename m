Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AE767BC36
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 21:09:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 376F5C69057;
	Wed, 25 Jan 2023 20:09:27 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42049C69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 20:09:26 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-15eec491b40so22716974fac.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 12:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7GwbvorGn0RsrCr1lYO8AQMjltKd8a/pRgkR5/1pKCQ=;
 b=cneuegp4eaPa4i/+V0nDxFn5m9vnXkr1Pv5GQ8nKmkPeiwv62Gg4P/oj8BWridi+zG
 JtKqr0p42L+U0tZYbyzDnbiL5TCLTDgKaX9qER43NXUIRaT8zY+Hv6thPvy/Egc+NAea
 Xv+mHrPgsQDdvAJWfFZV5M4igP297b8SHSXQcYnZIElFC8oGv33bq7BSa9A6XrabEAq6
 Wn/0GY13vZwL5HmcJJ6ytmpVGvblkXYgfDZel0BygAzaSQ7Mww0wIO+QMjbWntJv/95e
 kZJBtr9nnjKSm7Z54r+PMbQPJ6i4c47/zRwvpsmQpK5dmRUw5DeSnnDqL8V3O5LXQ8Zc
 HPIg==
X-Gm-Message-State: AO0yUKW1iulPBTe2X/ntyh4YaGALJwWPKdDL7ViY6KNFMEojpCArnfF4
 6r/CyI+5+UIp7jSdPElAPEqiWGJj0A==
X-Google-Smtp-Source: AK7set8vWoADu2dFh2Wi0jTLqZLUS3c9WQz5pfsofwNc+7WfeFAiHYC6lXfkVBUekSKcwpURaqmjaA==
X-Received: by 2002:a05:6870:1711:b0:163:3d31:58be with SMTP id
 h17-20020a056870171100b001633d3158bemr1344921oae.45.1674677365046; 
 Wed, 25 Jan 2023 12:09:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j24-20020a056870051800b0013b9ee734dcsm2271007oao.35.2023.01.25.12.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:09:24 -0800 (PST)
Received: (nullmailer pid 2800439 invoked by uid 1000);
 Wed, 25 Jan 2023 20:09:23 -0000
Date: Wed, 25 Jan 2023 14:09:23 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167467736271.2800253.2821370670394691234.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-9-krzysztof.kozlowski@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Korsgaard <jacmet@sunsite.dk>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Tomer Maimon <tmaimon77@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Chester Lin <clin@suse.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Fugang Duan <fugang.duan@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [Linux-stm32] [PATCH v2 11/12] dt-bindings: serial: drop
	unneeded quotes
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


On Tue, 24 Jan 2023 10:19:15 +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs.  No functional impact
> except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml            | 4 ++--
>  .../devicetree/bindings/serial/fsl,s32-linflexuart.yaml       | 2 +-
>  Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml    | 4 ++--
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml      | 2 +-
>  Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml   | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
