Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F7E63739C
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Nov 2022 09:14:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8653C65E41;
	Thu, 24 Nov 2022 08:14:03 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96F00C65073
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Nov 2022 08:14:02 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id b9so1147298ljr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Nov 2022 00:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DeUefraTLOsYVw9xLhjc2jCiF4qkVOolmQaF127DKVk=;
 b=PAL/4lgO3qwcAfVMsmymoQQ9m3TeqyOkDETk9KBNX6z/o9HLwn8RaXvTDlHWiBBDvg
 atY0ccAGfcCtVElHLwQsrm0QhHkHvKqJqM7RMLGPIFIPWuhF0QyVvPm9wRCzT9iCxASw
 LN5V+FcWg/SEJM7UxqmH+AYRIOqBhulcXZfzgGab0XACfOxuhyQKNDmHdtNHKaj/8Zfl
 FplfjNLMeze2dGtr55IUGmbCnmpZu5oViaQ4LvbS85ZhO261UmBzZe6bsie2P1qRpMeU
 ZCqIYWK6+QBAocMAgO6/neFsIvtKZ8dEs27C22xWp0mQ/KCBXyWacaXLkPM597S1fqZP
 NN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DeUefraTLOsYVw9xLhjc2jCiF4qkVOolmQaF127DKVk=;
 b=VDwNkxw7snytffaEzh3BSJzV2FF4PePCvwaPuvmuNOwGkQjhO9Ho3GCzZpj2AZz1HU
 K9wnH2CTiftSGtgqtcXYD3y/xAmSteXj7kZraGSrYD1A699VfNyn39B3RviY90jMv6uq
 187DgxSIv2N7YBblYtnOOIeCcPZUJHVcunDEEcgHkn81qDvMVCBZpuxs0xwED+crnMn/
 9l8qrcpibRmvxOwbE3Y9l1z1QbBDDhMoCq4WlgkLEI5sEAMMnKX3k2+qDlvuaCE61rom
 xO6SaiSaXOucsBMhVJluKiKruBEzMeRs2FPNNaA83YXOiuU6ihRgTaeI7KT4ZB5rsNob
 ecwg==
X-Gm-Message-State: ANoB5pnaGcE0lOYnZ6VE+9E4L5BBbqSpM0SEfcEBtW1rRnOx2T9NILAy
 Vb6ghXnHUwa9lrop5rJOvV8=
X-Google-Smtp-Source: AA0mqf6hK0Yfc6U0TtdSmI9ZQLi93h7zpR/we4ftZe8kBmfGIWxQNqL4Gq2HZFwudP2QWyuNPdZNhg==
X-Received: by 2002:a2e:c52:0:b0:277:9bf:9411 with SMTP id
 o18-20020a2e0c52000000b0027709bf9411mr4006863ljd.504.1669277641653; 
 Thu, 24 Nov 2022 00:14:01 -0800 (PST)
Received: from ?IPV6:2001:999:485:946b:e412:ce24:16c6:ba10?
 ([2001:999:485:946b:e412:ce24:16c6:ba10])
 by smtp.gmail.com with ESMTPSA id
 p12-20020ac24ecc000000b0049a5a59aa68sm52803lfr.10.2022.11.24.00.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 00:14:01 -0800 (PST)
Message-ID: <b2a00199-fccf-5887-1029-99f9e7e55e7f@gmail.com>
Date: Thu, 24 Nov 2022 10:15:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@microchip.com>, vkoul@kernel.org
References: <20221110152528.7821-1-tudor.ambarus@microchip.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20221110152528.7821-1-tudor.ambarus@microchip.com>
Cc: tony@atomide.com, trix@redhat.com, konrad.dybcio@somainline.org,
 linux-tegra@vger.kernel.org, ldewangan@nvidia.com, festevam@gmail.com,
 swati.agarwal@amd.com, f.fainelli@gmail.com, samuel@sholland.org,
 robert.jarzmik@free.fr, michal.simek@xilinx.com, jernej.skrabec@gmail.com,
 jonathanh@nvidia.com, wens@csie.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 linux-arm-msm@vger.kernel.org, shravya.kumbham@xilinx.com,
 ye.xingchen@zte.com.cn, radhey.shyam.pandey@xilinx.com, kernel@pengutronix.de,
 rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com,
 green.wan@sifive.com, lars@metafoo.de, linux-mediatek@lists.infradead.org,
 haojian.zhuang@gmail.com, matthias.bgg@gmail.com, harini.katakam@xilinx.com,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 krzysztof.kozlowski@linaro.org, thierry.reding@gmail.com,
 quic_mojha@quicinc.com, mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org,
 shawnguo@kernel.org, daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH v3] dmaengine: drivers: Use
 devm_platform_ioremap_resource()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMC8xMS8yMDIyIDE3OjI1LCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IHBsYXRmb3JtX2dl
dF9yZXNvdXJjZSgpIGFuZCBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoKSBhcmUgd3JhcHBlZCB1cCBp
biB0aGUKPiBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKSBoZWxwZXIuIFVzZSB0aGUg
aGVscGVyIGFuZCBnZXQgcmlkIG9mIHRoZQo+IGxvY2FsIHZhcmlhYmxlIGZvciBzdHJ1Y3QgcmVz
b3VyY2UgKi4gV2Ugbm93IGhhdmUgYSBmdW5jdGlvbiBjYWxsIGxlc3MuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPgo+IEFja2Vk
LWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgo+IC0tLQo+IHYz
Ogo+IC0gZml4IGVycm9ycyByZXBvcnRlZC1ieSBsa3BAaW50ZWwuY29tCj4gLSBsa3BAaW50ZWwu
Y29tIGJ1aWx0IHN1Y2Nlc3NmdWxseSBmZXcgY29uZmlncywgYWxsIHNob3VsZCBiZSBnb29kIG5v
dy4KPiAKPiB2MjoKPiAtIHJlYmFzZSBvbiBkbWEvbmV4dC4gczNjMjR4eCB3YXMgcmVtb3ZlZCwg
dGh1cyBkcm9wIHRoZSBjaGFuZ2VzIGZvciBpdC4KPiAtIGNvbGxlY3QgQWNrZWQtYnkKPiAKPiAg
IGRyaXZlcnMvZG1hL2JjbTI4MzUtZG1hLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0t
Cj4gICBkcml2ZXJzL2RtYS9kbWEtYXhpLWRtYWMuYyAgICAgICAgICAgICAgICAgICAgIHwgIDQg
Ky0tLQo+ICAgZHJpdmVycy9kbWEvZHctYXhpLWRtYWMvZHctYXhpLWRtYWMtcGxhdGZvcm0uYyB8
ICA0ICstLS0KPiAgIGRyaXZlcnMvZG1hL2ZzbC1lZG1hLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgOCArKystLS0tLQo+ICAgZHJpdmVycy9kbWEvZnNsLXFkbWEuYyAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDEwICsrKy0tLS0tLS0KPiAgIGRyaXZlcnMvZG1hL2lkbWE2NC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gICBkcml2ZXJzL2RtYS9pbWctbWRjLWRt
YS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICAgZHJpdmVycy9kbWEvaW14LWRt
YS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgIGRyaXZlcnMvZG1hL2lt
eC1zZG1hLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gICBkcml2ZXJzL2Rt
YS9tY2YtZWRtYS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKy0tLS0KPiAgIGRyaXZl
cnMvZG1hL21lZGlhdGVrL210ay1oc2RtYS5jICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gICBk
cml2ZXJzL2RtYS9tbXBfcGRtYS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+
ICAgZHJpdmVycy9kbWEvbW1wX3RkbWEuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICst
LS0KPiAgIGRyaXZlcnMvZG1hL21veGFydC1kbWEuYyAgICAgICAgICAgICAgICAgICAgICAgfCAg
NCArLS0tCj4gICBkcml2ZXJzL2RtYS9tdl94b3JfdjIuYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDcgKystLS0tLQo+ICAgZHJpdmVycy9kbWEvbXhzLWRtYS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA0ICstLS0KPiAgIGRyaXZlcnMvZG1hL25icGZheGkuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNCArLS0tCj4gICBkcml2ZXJzL2RtYS9weGFfZG1hLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICAgZHJpdmVycy9kbWEvcWNvbS9iYW1fZG1hLmMg
ICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgIGRyaXZlcnMvZG1hL3NmLXBkbWEvc2Yt
cGRtYS5jICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gICBkcml2ZXJzL2RtYS9zaC91c2It
ZG1hYy5jICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICAgZHJpdmVycy9kbWEvc3Rt
MzItZG1hbXV4LmMgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgIGRyaXZlcnMvZG1h
L3N0bTMyLW1kbWEuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gICBkcml2ZXJz
L2RtYS9zdW40aS1kbWEuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICAgZHJp
dmVycy9kbWEvc3VuNmktZG1hLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAg
IGRyaXZlcnMvZG1hL3RlZ3JhMjEwLWFkbWEuYyAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0t
Cj4gICBkcml2ZXJzL2RtYS90aS9jcHBpNDEuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMTAg
KysrLS0tLS0tLQo+ICAgZHJpdmVycy9kbWEvdGkvb21hcC1kbWEuYyAgICAgICAgICAgICAgICAg
ICAgICB8ICA0ICstLS0KCkZvciBvbWFwLWRtYToKQWNrZWQtYnk6IFBldGVyIFVqZmFsdXNpIDxw
ZXRlci51amZhbHVzaUBnbWFpbC5jb20+Cgo+ICAgZHJpdmVycy9kbWEveGlsaW54L3p5bnFtcF9k
bWEuYyAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgIDI5IGZpbGVzIGNoYW5nZWQsIDM2IGlu
c2VydGlvbnMoKyksIDEwMCBkZWxldGlvbnMoLSkKPiAtLSAKUMOpdGVyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
