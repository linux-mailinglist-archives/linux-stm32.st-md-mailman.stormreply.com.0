Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7828D0384
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2024 16:26:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 540ACC6B47E;
	Mon, 27 May 2024 14:26:32 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9066FCFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2024 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1716819939; x=1717424739; i=markus.elfring@web.de;
 bh=WBD5fZbJKASRGqCVJjwjF0/sBlA3tJ1is50PhfAuexQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=vX3VhVktvAsC3VEpXA8voazwMQsxjS3krCXirqMDaKAZ3hS5dLEBLJJcYH/CnQUD
 LX884yPHk6T2CjcYkXrEWl3j7h+qjsuQr6krfiSjSbT9o7hELP6R1MOL3ePslfGIM
 nUn+Cno9/WCN6Qt7tnw9wJkEH43RGHNxZEMJFx1wgs5oyZoUK9bL3MJfGys243Jnt
 RWe1fGAwlia3NmWKjA9buWb62mNSN4PEffNKdBdV4ee2XJY9EETUDzwTlBNTo8KlT
 kv2IvCfd4sTrUVWvA5STc6LBECDk34micjPSbDUs3ES7nw1m899uLKkS35frEPwr4
 gv2XA0CeWBiz5oCAtw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mtgyj-1sV3WP3CJT-017EBc; Mon, 27
 May 2024 16:25:38 +0200
Message-ID: <96beb071-ec2c-475f-8fa2-d519a1b1dc28@web.de>
Date: Mon, 27 May 2024 16:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@nxp.com>, soc@kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chester Lin <chester62515@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Damien Le Moal <dlemoal@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Hal Feng <hal.feng@starfivetech.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Jacky Bai <ping.bai@nxp.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Orson Zhai
 <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>
References: <20240504-pinctrl-cleanup-v2-4-26c5f2dc1181@nxp.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240504-pinctrl-cleanup-v2-4-26c5f2dc1181@nxp.com>
X-Provags-ID: V03:K1:+RyPoq5wWT0ZiaKtbHEM7oUjpYEVZsaQY6N7Y3GqAcCCbvu/2JH
 u2A1o9G2LZb7XdHLU3H69K/ZAgfhJvU9jxdpYiqAnNWG9BA1SqA6BdADoQmnmuaRrP6fAil
 8Vj3+benFoPx5AOFPUxJJt7XUQwXd4D4fxOV2u0S4nMX3GZIShaRs493PFfPvepvyAbRCtv
 sA0TyVvmVIL0Nk6+KE4zA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:31oKYLNiYt8=;Hxns51jU3fPbLxYZhS6Zxy9O8BL
 qcSJkc+8tI81FYEgYUDEjPFyxO5CsD0G4Yr1KM0HiJM1RAdO+budqXdzmwIJQJO5p6Qgg2nVe
 YKgM7j5yLFrWsSzyaik+NFTvY+PW6VUe11QHVHkDricbyYHE5P9qzbTg86+yeRiFSOOQZksg9
 Xdrs6r2eTX9AowMfEJqKIKNofU6TcDdmBmEh2hd5cMEugRlaO/xU/ubiYD/XRmfkiGEw2Tk9X
 NW8zaQg81GL2PPwft4f4poEafCoYwl+CIrmPHqURH/2YArZiC4UDm9VTu3lTVR8WSADgs2juL
 WzjmfuF3Nb/H8VSJqqzY977EL7BYu0JfjXhqczsj/AJHIU8x7U9FkHQwVLD+/aW9Q5b/a9OPw
 LI1zUhjAqpzjkl9ILHME5dfhA7gkD4YfqDP0iVyWu+VnmZh/pblaybHt4rD5ZI5OfaaxJKTej
 VGs+IMuQBrMttXj/4DWsuAy6tL2ASvq9ajbc+W4PfJFRO8eiyAiXlRr8A1ilG3Wwi2usEs8x0
 pyhK5u8Ye84ZDNXC0xiObkf3AMdCBhIc+0OAJbS7S/lr4Wa88XoId5G8Ib9v3q3Danb/+yyUK
 5YECHUaogBhuwKJTAPf6awFWX25sWIKFsuMiL9bOP098OSKsVamHNvrpo4VNiI2KTPlO3jYMF
 m4zC6H3fMiyTT6q5AwrZQbBuPo5FStw2mq46jULp/VkrI2I5mP81da+ZdY2nuNi0JHqnAsXYb
 nCNKXCaTB/N8hkFz1ZJ6BaXlj9tzCbHQ/4RlK/pJC38X/hUvhfMryOHSpF+68/zEebizBSnT2
 Xmop5HdbEWKcl91rEpyYcoeHY0XK5F3NVihbciHAlOag4=
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Peng Fan <peng.fan@oss.nxp.com>, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 04/20] pinctrl: starfive: Use scope
 based of_node_put() cleanups
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

PiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwIHRvIHNpbXBsaWZ5IGNvZGUu
CgpJIHNlZSBvcHBvcnR1bml0aWVzIHRvIGltcHJvdmUgYWZmZWN0ZWQgZnVuY3Rpb24gaW1wbGVt
ZW50YXRpb25zIGFub3RoZXIgYml0LgoKCuKApgo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9zdGFy
Zml2ZS9waW5jdHJsLXN0YXJmaXZlLWpoNzEwMC5jCuKApgo+IEBAIC01NDMsMTggKzU0MCwxOCBA
QCBzdGF0aWMgaW50IHN0YXJmaXZlX2R0X25vZGVfdG9fbWFwKHN0cnVjdCBwaW5jdHJsX2RldiAq
cGN0bGRldiwKPiAgCQkJcGlucyA9IGRldm1fa2NhbGxvYyhkZXYsIG5waW5zLCBzaXplb2YoKnBp
bnMpLCBHRlBfS0VSTkVMKTsKPiAgCQkJaWYgKCFwaW5zKSB7Cj4gIAkJCQlyZXQgPSAtRU5PTUVN
Owo+IC0JCQkJZ290byBwdXRfY2hpbGQ7Cj4gKwkJCQlnb3RvIGZyZWVfbWFwOwo+ICAJCQl9Cj4K
PiAgCQkJcGlubXV4ID0gZGV2bV9rY2FsbG9jKGRldiwgbnBpbnMsIHNpemVvZigqcGlubXV4KSwg
R0ZQX0tFUk5FTCk7Cj4gIAkJCWlmICghcGlubXV4KSB7Cj4gIAkJCQlyZXQgPSAtRU5PTUVNOwo+
IC0JCQkJZ290byBwdXRfY2hpbGQ7Cj4gKwkJCQlnb3RvIGZyZWVfbWFwOwo+ICAJCQl9CuKApgo+
IEBAIC02MjMsOCArNjIwLDYgQEAgc3RhdGljIGludCBzdGFyZml2ZV9kdF9ub2RlX3RvX21hcChz
dHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsCj4gIAltdXRleF91bmxvY2soJnNmcC0+bXV0ZXgp
Owo+ICAJcmV0dXJuIDA7Cj4KPiAtcHV0X2NoaWxkOgo+IC0Jb2Zfbm9kZV9wdXQoY2hpbGQpOwo+
ICBmcmVlX21hcDoKPiAgCXBpbmN0cmxfdXRpbHNfZnJlZV9tYXAocGN0bGRldiwgbWFwLCBubWFw
cyk7Cj4gIAltdXRleF91bmxvY2soJnNmcC0+bXV0ZXgpOwrigKYKPiArKysgYi9kcml2ZXJzL3Bp
bmN0cmwvc3RhcmZpdmUvcGluY3RybC1zdGFyZml2ZS1qaDcxMTAuYwrigKYKPiBAQCAtMTc1LDE4
ICsxNzUsMTggQEAgc3RhdGljIGludCBqaDcxMTBfZHRfbm9kZV90b19tYXAoc3RydWN0IHBpbmN0
cmxfZGV2ICpwY3RsZGV2LAo+ICAJCXBpbnMgPSBkZXZtX2tjYWxsb2MoZGV2LCBucGlucywgc2l6
ZW9mKCpwaW5zKSwgR0ZQX0tFUk5FTCk7Cj4gIAkJaWYgKCFwaW5zKSB7Cj4gIAkJCXJldCA9IC1F
Tk9NRU07Cj4gLQkJCWdvdG8gcHV0X2NoaWxkOwo+ICsJCQlnb3RvIGZyZWVfbWFwOwo+ICAJCX0K
Pgo+ICAJCXBpbm11eCA9IGRldm1fa2NhbGxvYyhkZXYsIG5waW5zLCBzaXplb2YoKnBpbm11eCks
IEdGUF9LRVJORUwpOwo+ICAJCWlmICghcGlubXV4KSB7Cj4gIAkJCXJldCA9IC1FTk9NRU07Cj4g
LQkJCWdvdG8gcHV0X2NoaWxkOwo+ICsJCQlnb3RvIGZyZWVfbWFwOwo+ICAJCX0K4oCmCj4gQEAg
LTIzMyw4ICsyMzMsNiBAQCBzdGF0aWMgaW50IGpoNzExMF9kdF9ub2RlX3RvX21hcChzdHJ1Y3Qg
cGluY3RybF9kZXYgKnBjdGxkZXYsCj4gIAkqbnVtX21hcHMgPSBubWFwczsKPiAgCXJldHVybiAw
Owo+Cj4gLXB1dF9jaGlsZDoKPiAtCW9mX25vZGVfcHV0KGNoaWxkKTsKPiAgZnJlZV9tYXA6Cj4g
IAlwaW5jdHJsX3V0aWxzX2ZyZWVfbWFwKHBjdGxkZXYsIG1hcCwgbm1hcHMpOwo+ICAJbXV0ZXhf
dW5sb2NrKCZzZnAtPm11dGV4KTsKCgoxLiBFeGNlcHRpb24gaGFuZGxpbmcgaXMgcmVwZWF0ZWQg
YSBmZXcgdGltZXMgYWxzbyBhY2NvcmRpbmcgdG8gbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZXMu
CiAgIEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gdXNlIGEgY29ycmVzcG9uZGluZyBsYWJlbCBs
aWtlIOKAnGVfbm9tZW3igJ0KICAgc28gdGhhdCBhbm90aGVyIGJpdCBvZiBkdXBsaWNhdGUgc291
cmNlIGNvZGUgY2FuIGJlIGF2b2lkZWQ/CiAgIGh0dHBzOi8vd2lraS5zZWkuY211LmVkdS9jb25m
bHVlbmNlL2Rpc3BsYXkvYy9NRU0xMi1DLitDb25zaWRlcit1c2luZythK2dvdG8rY2hhaW4rd2hl
bitsZWF2aW5nK2ErZnVuY3Rpb24rb24rZXJyb3Ird2hlbit1c2luZythbmQrcmVsZWFzaW5nK3Jl
c291cmNlcwoKMi4gV2lsbCBkZXZlbG9wbWVudCBpbnRlcmVzdHMgZ3JvdyBmb3IgdGhlIHVzYWdl
IG9mIGEgc3RhdGVtZW50IGxpa2Ug4oCcZ3VhcmQobXV0ZXgpKCZzZnAtPm11dGV4KTvigJ0/CgoK
UmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
