Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F9E6794BC
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 11:06:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2B4EC65E72;
	Tue, 24 Jan 2023 10:06:44 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 381DFC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 10:06:43 +0000 (UTC)
Received: from [192.168.1.141] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MmD6U-1otgns42Vs-00i8Qx; Tue, 24 Jan 2023 11:06:29 +0100
Message-ID: <45528830-d59a-4c8b-5b76-2e683c2c6964@i2se.com>
Date: Tue, 24 Jan 2023 11:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Simek <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>, Le Ray
 <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230124091916.45054-1-krzysztof.kozlowski@linaro.org>
X-Provags-ID: V03:K1:93ulo0PlqXqG5/52B3bZ3mfpX/fbI2HdhNtc3AuLxgKQl2dxSyA
 /kJkZ7NeRKreYzG5ax4gsYEQSTwH8yygbh7vEtHYYFwTpBZPdev84Mx3OJaAU1mPR2u2MKv
 vnOjns7+asiWML/aEgPvFrMy3n7cCAB7qWD90wKMTlXMsTG2OvRrP0vJoFgY7ANNIySelYu
 fM48s9RMBQWREZhb7cuBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VczEPCxySYQ=;U0Lzc/tH6qc3i8FdF6E0O/w2p33
 Rf11TjOB+akTwm0k3YDF/CofSRH8x/BDseAI/U/Tn594gBt0St1mGo09JEYietjXutJGqAa38
 zaL10VqH0zF7IKZzZ5Z1m08FP08Hku7dGolSylwNAaZ2y1rLGrHYqFyc+M37tlOd4V/KYz/s/
 yPTfVxC1z8FodPfbMSQcVSl+rUIPp/vGCjgLT/ut4XDlL6w+TK7v/HFgJl0sHHVNaieHwS1Ea
 b4NV0O0fSO7293v0aENxUFLcK06FbqeaifKcoESN4aA8zQAFHfrYcQMOIEW282GMu10cwpWFd
 AdBAUt1TOyQGva+5yTnreOJjQuxcR5RsWNwO6OIj7FVzwe8OYZpcfvtzWiyAQPvaNDlZTFXOZ
 4x9WSxOjyQMQo1PyKhAUMTtuQx85DunFFoRMThVzMM/6QUENiZuW9Rcd3PeP5Vnc/bgLd6rbl
 H4jigRxjDGgJuKqrKb5GnE23xpYOgwb8v4NX72tbbq/9P/kyvziwUZFOyeN/pDyt7VDJDlByy
 jZKE/3ERTx1japcd0XrLKLJAhUfA2UrgguOdT1zBQZpe7Nu3Xsa0vJSz07Orp1L8GV41dZTOk
 57XR3M44hao1bm5JYn6UzhqkyhT70Zi3Iy8m3UNpsTcXFBzpT8t7SEoIryrsEG4qXm0djOnTI
 h58bXWDP2g/fsSCP4wz1Hu2KLbYyzj7GsP1bgbwh9Q==
Subject: Re: [Linux-stm32] [PATCH v2 03/12] dt-bindings: serial: pl011:
 allow ARM Primecell properties
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

Am 24.01.23 um 10:19 schrieb Krzysztof Kozlowski:
> Reference ARM Primecell bindings to allow typical Primecell device node properties:
>
>    broadcom/bcm2711-rpi-400.dtb: serial@7e201000: Unevaluated properties are not allowed ('arm,primecell-periphid' was unexpected)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>

Thanks

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
