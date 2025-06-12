Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D037AD6C8F
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 11:48:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8A10C3F92E;
	Thu, 12 Jun 2025 09:48:21 +0000 (UTC)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5AB3C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 03:00:30 +0000 (UTC)
X-QQ-mid: esmtpgz14t1749697213t65c22161
X-QQ-Originating-IP: IF1P/oCMu5+Z6gtoOhY0chVmlDO4Lfc/wt6ay8GGmZA=
Received: from [192.168.125.115] ( [113.104.142.205])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 12 Jun 2025 11:00:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7120148681061884487
Message-ID: <E9D57DC946595F4F+762b7c45-ba5f-4bba-86d3-4eeea7643157@linux.starfivetech.com>
Date: Thu, 12 Jun 2025 11:00:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: MwQdfXoP8nuz5XryFdT9mMm5fPxIgvtrmAX83IcgZtRvrqA2KW6dPH7Y
 UeTHfCncUD9Jw4FWoJXE6riCJ0qi42Tk97iYaZpQDy6wJAfOvCIKqsmZDUCum60Nt/3VI2Q
 yJVcRouYmizOR86phNyTK+P+HakgJ6+pEI/aqw0RtOKyLhZuLSgKBoynOzcJ5/6RTkE9B5J
 puSgBmWvIPLeHjJGbyL8JGWYM0Nq3MrWOa1r/0AXtg6DhVMXhlnJrE7o5AjgqjW10RrA+AE
 5WE2g15YJe2NJklbaucjk0x4K8cryOhRte7230lqlcmRn8gpi1TBaGEDPQGwtFvcvdoODoQ
 ViN+9EEw1CGjxsqKDswvwoYTmth4hbIF00mxePxjRvyPRJjjMTtZkxWQCXbu1vuVrNj0GU6
 H92XK6yvShN0RwLay58+1CtT7J1hb0JjCTpQXCEQqh09Y5crsfflVW1nGPua30VSNL7ga/0
 UQX6RQAQO+yxCdRUPZxoU63SFxIZUYPEw1pf8oT+7AIJCL/uwu2l8C4BOgYTwfYJlWu/teS
 RSfgRojHYXOVP7I5iHZ7gVrjzenWIqpCyTviHWQQynv7hQMcsSB3U6GtG66WBSgNeu/pNRe
 Tocet3yEmZ3qO9qBY3680fHoGxJmX+2gy3Wb0wK+bE2SNQOLvmC3RBmuKh+u5aotwInZ0Qq
 umP8CAGdPjIaX38kcieoKqhzStBo4Jie2+ZSoghn6Ck5Fvs44muufEOzqH43fyGx2hZ+7Ru
 mBMHQxMbcFRzFfjZAC8A6JHUscRn/CTbwVv9Uqwt1BFk9oEFE4NFxraS/6Th3U3Al2wGXFi
 Etyp8vXKhF4yCKJnAVYSzS8gpG9LuTHIDswn/A6QbJ4k+aoGh3DBxSpg+w4K6/MMu+IZPej
 HjFmIJRGP9uvo8Wq6JIzSVfeV5ogrg4FMF7F7BzfszsyHR/FtAtCLA6MUurCWMMxSs4OcYZ
 ut8Fd0Jmm3ZCA/D7WJRiH33XX8PvGYHAZM67TrNlbvIJmEudSrGb/Q0o0
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Thu, 12 Jun 2025 09:48:19 +0000
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 16/17] pinctrl: Constify static
	'pinctrl_desc'
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

On 6/11/2025 2:13 PM, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/berlin/berlin.c                    | 2 +-
>  drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
>  drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
>  drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
>  drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
>  drivers/pinctrl/pinctrl-k210.c                     | 2 +-
>  drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-
>  drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
>  drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
>  drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)
> 
...
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 27f99183d994dccb92aac81ca42228bdb9225e87..aeaa0ded7c1e5ee7f9c5e4113bfd208fb844ba7d 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -898,7 +898,7 @@ static const struct pinconf_ops starfive_pinconf_ops = {
>  	.is_generic = true,
>  };
>  
> -static struct pinctrl_desc starfive_desc = {
> +static const struct pinctrl_desc starfive_desc = {
>  	.name = DRIVER_NAME,
>  	.pins = starfive_pins,
>  	.npins = ARRAY_SIZE(starfive_pins),
> 

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
