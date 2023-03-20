Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E5D6C1F1D
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 19:09:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51B7DC6A606;
	Mon, 20 Mar 2023 18:09:26 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85D13C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 18:09:24 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id bz27so2408384qtb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 11:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679335763;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Ym0Aa6IJr35fCbX8wJyITkzyONp9K1eXcn9gLrMKEM=;
 b=jV+wT9G9dMq++VXoHOITcaMwSKfT7Ne8l6voVfiCeH20VK0uzRJIf9CA2v8jn1mE42
 9De/qJTXiN3NlwKDdk7NArH7WT5H+4m7s71wZTV+2BygDTiQuwk+mRLMpRhBukxFua9x
 67hE9fL+3OgJ1dTRBMXtTwDXEznGIlnqEuoH6BXNz+DtDWm5LZSaKbCnlxFhePXKvQQw
 biWPqZK1eoCZ6HeXFY1w+DmsNHS4W090fENE/el13ZE/cuRLHNVC7Li/p30/Ai1N8xhv
 3ejM9NTyAoTh9dtKbufIgtWOwd6srKtNAzDZ9KiKE0PTE7Lb1wYokPUbe9HLqHLVnTp7
 mdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679335763;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Ym0Aa6IJr35fCbX8wJyITkzyONp9K1eXcn9gLrMKEM=;
 b=S8wRulJaxt2yR6QMskSGh9bK4ey16RdjJxQgL9lGuCt7enojS7jFdMcpDi+JbK5YDY
 nAVzpTmP9LPhwUddcO0188VVjwRxvAX+PLkMAEigLdSXXLBRuPFIMhqzDTHAsDegCfy/
 1gfRM+g/ByWOffWpv6zkdOxgqOWSpoK6h4a70BGTYqrqdr9XffOfet80OinC71+TxVRA
 MJI7niswEgPK0q3DFBb66jXzaTu2BBEe2xIGauT5doIBzhqQTHduQ/mwKwsxDgQDTYMN
 fBB61/M0R4BRezEWS9kuyrjh8hOZvX70j6ZgN1BkwSZB8iwhAcD+jFQT0fmIK92i7ai8
 udrA==
X-Gm-Message-State: AO0yUKW5B4RO2q3+TNz10b+j/vXGAtFG2gvfpgnqg+dw19Xwt01nNBHp
 wUMgXiS10lYpzaGmmuZRtCE=
X-Google-Smtp-Source: AK7set/rOHA8qVlayMALPx0FGjCcSWh/Kq1WvV8aodxfR3XsSBymHa1dS0evHblRHeVucdEeSCUF5g==
X-Received: by 2002:a05:622a:190e:b0:3d7:1979:829e with SMTP id
 w14-20020a05622a190e00b003d71979829emr125230qtc.27.1679335763440; 
 Mon, 20 Mar 2023 11:09:23 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 l16-20020ac84a90000000b003d4ee7879d0sm2042741qtq.56.2023.03.20.11.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 11:09:22 -0700 (PDT)
Message-ID: <82ae9fd5-a4f9-89a6-8040-c64d22a85ebb@gmail.com>
Date: Mon, 20 Mar 2023 11:08:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>,
 Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Michal Simek <michal.simek@xilinx.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Tobias Waldekranz <tobias@waldekranz.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230317233605.3967621-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230317233605.3967621-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: Drop unneeded quotes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 3/17/23 16:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/net/actions,owl-emac.yaml  |  2 +-
>   .../bindings/net/allwinner,sun4i-a10-emac.yaml     |  2 +-
>   .../bindings/net/allwinner,sun4i-a10-mdio.yaml     |  2 +-
>   .../devicetree/bindings/net/altr,tse.yaml          |  2 +-
>   .../bindings/net/aspeed,ast2600-mdio.yaml          |  2 +-
>   .../devicetree/bindings/net/brcm,amac.yaml         |  2 +-
>   .../devicetree/bindings/net/brcm,systemport.yaml   |  2 +-

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
