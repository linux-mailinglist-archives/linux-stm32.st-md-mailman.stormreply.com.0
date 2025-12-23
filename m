Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D651CD922D
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Dec 2025 12:41:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0748FC8F272;
	Tue, 23 Dec 2025 11:41:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59194C8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 11:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766490111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sLHyZjdhjDBt6Tlyx92GjgIeB1OFSYRftB7W+PXVHI=;
 b=cofKj7gvPWbfDuxsTQXTHbtiquZJt1lbmCmknfDPcbUceNRxMxsk4pRq0VV7t/i5enk3Kp
 d6GVpfWYJk6U1UabcMbfaDuarONGnLHMMxOJVXZfHkJeNxQyiUv4lk50IrgYLO3kWq6e18
 mi1PQxixx3u/8Dm8eMpXSh4NpxLxjPQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681--steeTAwOF-NU8z5L6nWfA-1; Tue, 23 Dec 2025 06:41:47 -0500
X-MC-Unique: -steeTAwOF-NU8z5L6nWfA-1
X-Mimecast-MFC-AGG-ID: -steeTAwOF-NU8z5L6nWfA_1766490107
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4325ddc5babso1206695f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 03:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766490106; x=1767094906;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6sLHyZjdhjDBt6Tlyx92GjgIeB1OFSYRftB7W+PXVHI=;
 b=IpzmtamGGyVozWg/DIe49HWc4QJV3/EBe7k10IIyj7nGAZ9oQgMYUw2XQt3Od4R5XL
 Hr1Wtf5f4u0orq3ok5+gtHPQhkJqHnHqZluUEOe62/IY5aH+3WUDybPyp3IznInXgdd+
 xcPgBwdq5QBoBac6UV76Fjt/madiTqJRxQ4cBkLsbgmKdOeIERFplVYPqTP3HZ9qMJ9T
 RYZXOjXo4gJc7qUHw04yMSyZeHE5RftCjp5/PBiAfqzku3DjgqYsnO+QOojxkl1jP5OC
 5HXVyaHDZ/rrs1DUFS/pDsORCFshUSR5anFJCXUmTEz0TySZ0TdKofJ9C8INeFE4L5F7
 RxeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKY8+FtnRT+xwOs4TwPv8+MFyIdZ1frxplczZf+/saVs5IHBglyd7iAC6PbZ3ABo+4QLDLUhnuNIY6bg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzj0xXAA2FU2A0eFf4UbJ/9hYoI7GQMingWGhFmE04qQy956IpS
 tniiAcV4QRfdo4k4ujoyA+6cl8fvfpxMvV+LIuATW92GII15Ag2L7TT94HZdUxCHl6e+wYnKXNa
 Q04khNX2JS/Ty+fLp84f14fIweb9QWjv9hFDZ1RNgdrHRGqcuY9NgidkRnU8BusZMvaiv6zrHF4
 KVQKYm4w==
X-Gm-Gg: AY/fxX5/WEJYxzFHtWcXZQ/uPTrRaCBgkxy/Eki3Q4FLFdYwcvBUlrDOWCBxoGOJzoS
 eIug6AtRMsP5Ern/PiHgaSUMHEou/+LIMLTIXQqU4bQ/J4yFPcB4WnhUbye5HNUzH3P43NP/FnT
 SpAqXaramTmbkff0IHnH8CLqMXh4EeHq2i3vTpy1TJHifRTesvFHFh3Uj9DNuIWtHWrL9LjQFuq
 lWPW2qrcfNIbG6bU7jLJAL6pNczoTWQsBiqX0d2XnjmYjAGuV2womqsm5GrnFGvmV01Z5cBUM3n
 150hj9NlY3ExxHMqaju4PYt2VV8o9hnTEVOO6CZiQStzR1XwIvkXf+6FXckXKPk25YHE27/BCy2
 rlAtH5XWXEL6U
X-Received: by 2002:a05:6000:2886:b0:42b:4247:b077 with SMTP id
 ffacd0b85a97d-4324e501629mr16143533f8f.41.1766490106524; 
 Tue, 23 Dec 2025 03:41:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPhaXEvdC/d9UBYntc4O15i4YttaJ4C4olbdEgTOb9sXo4XaU7wPfNoTNX8sKpU6s3I2QtjQ==
X-Received: by 2002:a05:6000:2886:b0:42b:4247:b077 with SMTP id
 ffacd0b85a97d-4324e501629mr16143448f8f.41.1766490105967; 
 Tue, 23 Dec 2025 03:41:45 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.164])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea227casm27605658f8f.15.2025.12.23.03.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 03:41:45 -0800 (PST)
Message-ID: <51c7048a-52dc-47e1-97c3-2aa0d6555643@redhat.com>
Date: Tue, 23 Dec 2025 12:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Zhi Li <lizhi2@eswincomputing.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
 Samin Guo <samin.guo@starfivetech.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wcPEQJfEEazZskl5_ZydF-7Lp8DRXfcWbOH86eg1SDs_1766490107
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 0/7] net: stmmac: qcom-ethqos: add
 support for SCMI power domains
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

On 12/19/25 12:42 PM, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> The DTS changes will go in separately.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Quite unusual SoB chain... I think it would be better if you could stick
to one or the other; also the subj prefix should include the target tree
(net-next in this case); finally...

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
