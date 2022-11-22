Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6580634214
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 18:02:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AD2CC6504B;
	Tue, 22 Nov 2022 17:02:29 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24570C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 17:02:27 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id g12so25638151wrs.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lUcHxKNUlASZz/X8KuXB0tRt7hDcsZtxJiE2XAUFgK0=;
 b=QfIK0hXCjKJVeI0i0Z8r3P7A0TRBhzEwfNMv7GdcuQ8byRz9v9xDE1/xQXpXzScshj
 gcRiFXtjXNZv8/4+2XGXaKQt8HqXk2FNxHeKAyh92mO8RGEB+hLOLB9m7vlps76+bIZs
 +8VQgUPMrH3lPvJKzA8vevmS9h3ST7QFsdmJBR+FidD4wLQSSf8trA1H01D2AxOYnm2W
 FmWn0UuBVuq5+M7gsiPS8D4iilJqrUkJeDotVIm2JtWeJw3UwpGxtlKBn4VOLRd2TSg9
 LHOv924/g2YRJXGzw6O09VPW72nD14vEKGIey3znmEbYYiQC5/AG/ggvVYgqVastnsMC
 OmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lUcHxKNUlASZz/X8KuXB0tRt7hDcsZtxJiE2XAUFgK0=;
 b=JKO1nPXudTgQVYq7Hmd1vA5OGfqoCwdodU0CVu3WRcVol11FJKx9mkHwt1q21xmg5C
 QV5x0inP1d1/7nBEVUMs9dyzdzPzvU35irwY1hOkFHvSWDUgLVPvoGdnZhHs8O/H7KoQ
 3deItW7V9FG+lrGEjzyT1nZt+pV6/oaZLlORJQDXKo6vt0ljiVA3FcM3X3Yjuv44Wc4r
 msk/FQc23XOZNX7X94oIAYVe9b2LzvPvXTz3NoJ8V+IUg/puFZ/ar6ewKMUjeFopHnZy
 qXrrw0TnghpmgqUsi8c4uS82pDrqVg9UjC7mc1/22l6uz3YbJ5dFb21VhF0G3v6w7KS6
 iD/g==
X-Gm-Message-State: ANoB5pmqAWW5AGx+fDRMlggez+9UnoZNu132WLgdvpaLWU5/Vnar7gIE
 ZdpbUekg43VIpuHa1i96svc=
X-Google-Smtp-Source: AA0mqf49HIMZSzdOoEtBJ9tRmIBfPJn16ehrqs2keL04CLnigLwdWrXYnLZc4qam3NRENhayvSEnGA==
X-Received: by 2002:adf:dd10:0:b0:22e:4f2e:e57 with SMTP id
 a16-20020adfdd10000000b0022e4f2e0e57mr15005618wrm.698.1669136546331; 
 Tue, 22 Nov 2022 09:02:26 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a05600c3b9b00b003cfa81e2eb4sm19846292wms.38.2022.11.22.09.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 09:02:25 -0800 (PST)
Message-ID: <6945a20d-098b-fad3-766e-f4bcb3c37da8@gmail.com>
Date: Tue, 22 Nov 2022 18:02:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221122010753.3126828-1-bero@baylibre.com>
 <20221122010753.3126828-4-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221122010753.3126828-4-bero@baylibre.com>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v2 3/7] dt-bindings: pinctrl: mediatek,
 mt65xx: Deprecate pins-are-numbered
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

CgpPbiAyMi8xMS8yMDIyIDAyOjA3LCBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIHdyb3RlOgo+IE1h
a2UgcGlucy1hcmUtbnVtYmVyZWQgb3B0aW9uYWwgYW5kIGRlcHJlY2F0ZSBpdAo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgPGJlcm9AYmF5bGlicmUuY29tPgoKUmV2
aWV3ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cgo+IC0t
LQo+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY1eHgtcGlu
Y3RybC55YW1sIHwgNSArKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ2NXh4LXBpbmN0cmwueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10NjV4eC1waW5jdHJs
LnlhbWwKPiBpbmRleCAzM2I1Zjc5ZTc0MWFiLi4xYjQ0MzM1YjFlOTQ3IDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10NjV4
eC1waW5jdHJsLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGluY3RybC9tZWRpYXRlayxtdDY1eHgtcGluY3RybC55YW1sCj4gQEAgLTMxLDcgKzMxLDggQEAg
cHJvcGVydGllczoKPiAgICAgcGlucy1hcmUtbnVtYmVyZWQ6Cj4gICAgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZwo+ICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4g
LSAgICAgIFNwZWNpZnkgdGhlIHN1Ym5vZGVzIGFyZSB1c2luZyBudW1iZXJlZCBwaW5tdXggdG8g
c3BlY2lmeSBwaW5zLgo+ICsgICAgICBTcGVjaWZ5IHRoZSBzdWJub2RlcyBhcmUgdXNpbmcgbnVt
YmVyZWQgcGlubXV4IHRvIHNwZWNpZnkgcGlucy4gKFVOVVNFRCkKPiArICAgIGRlcHJlY2F0ZWQ6
IHRydWUKPiAgIAo+ICAgICBncGlvLWNvbnRyb2xsZXI6IHRydWUKPiAgIAo+IEBAIC02Miw3ICs2
Myw2IEBAIHByb3BlcnRpZXM6Cj4gICAKPiAgIHJlcXVpcmVkOgo+ICAgICAtIGNvbXBhdGlibGUK
PiAtICAtIHBpbnMtYXJlLW51bWJlcmVkCj4gICAgIC0gZ3Bpby1jb250cm9sbGVyCj4gICAgIC0g
IiNncGlvLWNlbGxzIgo+ICAgCj4gQEAgLTE1MCw3ICsxNTAsNiBAQCBleGFtcGxlczoKPiAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODEzNS1waW5jdHJsIjsKPiAgICAgICAg
ICAgICByZWcgPSA8MCAweDEwMDBCMDAwIDAgMHgxMDAwPjsKPiAgICAgICAgICAgICBtZWRpYXRl
ayxwY3RsLXJlZ21hcCA9IDwmc3lzY2ZnX3BjdGxfYT4sIDwmc3lzY2ZnX3BjdGxfYj47Cj4gLSAg
ICAgICAgICBwaW5zLWFyZS1udW1iZXJlZDsKPiAgICAgICAgICAgICBncGlvLWNvbnRyb2xsZXI7
Cj4gICAgICAgICAgICAgI2dwaW8tY2VsbHMgPSA8Mj47Cj4gICAgICAgICAgICAgaW50ZXJydXB0
LWNvbnRyb2xsZXI7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
