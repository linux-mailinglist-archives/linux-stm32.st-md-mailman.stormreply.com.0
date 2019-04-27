Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E7AB402
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Apr 2019 18:56:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E423C46D50
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Apr 2019 16:56:54 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1579C46D4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2019 16:56:52 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w24so3036005plp.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2019 09:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hvtq7zNAnrPZFqg7B9biXnElsoCmOPrVGVZCJ5gJhp4=;
 b=oY1Z64KccFbyy0wq9QVwJe0jyd7/RsnZQ/RB8ENhLnlCZjeajuJNoHTIn7SX0vVdqi
 LrjUFiFbUCa4YxtQMvMdljRqdgTGgHHDLQHj1H0QA9OyD05A3DqADEj8/N1oJhoproXe
 y/9kGhYlwLp4EsGsStj0io0eywSB1DQAT/MNckNred9ws5HfIqcstfSMDAPbD8MvPnJX
 2J5O4rkODzSg+rHTATqNxgK3wELuL9CMGwJhxNvPTwUcOewrX3KyYIsv9M0jMOJs122I
 lwv9AJyObKXTquKg208AUDBouu50hh5Yb0ErQ0TMHegRiHTmh4VYhwlqWwTjE8E8Ev7q
 0hPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hvtq7zNAnrPZFqg7B9biXnElsoCmOPrVGVZCJ5gJhp4=;
 b=OW/+MB1ZvOzxeiEHS1ljkHIsTpnIAtXSUFc6QuViF7ZZOC4j1gkU1OEjseZAs0J7iH
 /1+8cSPqpntZsJjE6RSmzYnNSuDd9bNNn0JGF5M+6H5RDXIpkUn6m7gySFyg6TdQDFHT
 jpWb38638Kz4J+kmcRTcmsDNjBWuEZQ027M5fjcGhbghBgs0/p+YaTi1xtxeSYJJTVsR
 WJ/NntOQbq3zz68Lzbexkbp2FUbh18uC6258DT/Wz9Hwa+AfSVtU4Rx3LHYLkyHFOxdw
 YkEzHp5nAXT7Ah4r/XyL+HrDRBD+7NEmflsFyVWBEHZAaQSB3l42SKYWHHKvah2Oiyw3
 ct/A==
X-Gm-Message-State: APjAAAXUkXclXd+RjGV4Zz8fL1n/9hD80WC7WxZF+bkHI0moDqz6LjbR
 dI/UNS7ZCscuYLbYUBikKP0=
X-Google-Smtp-Source: APXvYqwSU6ZbpDR62x+bxBE8Veh7kQjbUVRkiAHr91sHGmJIgIdCZpoTZH34EFyaTXPIL5o++jb2hg==
X-Received: by 2002:a17:902:2b87:: with SMTP id
 l7mr53015721plb.130.1556384211138; 
 Sat, 27 Apr 2019 09:56:51 -0700 (PDT)
Received: from [10.230.28.107] ([192.19.223.250])
 by smtp.gmail.com with ESMTPSA id w65sm473514pfb.59.2019.04.27.09.56.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Apr 2019 09:56:49 -0700 (PDT)
To: =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Fugang Duan <fugang.duan@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta
 <salil.mehta@huawei.com>, Woojung Huh <woojung.huh@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Kalle Valo
 <kvalo@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Li Yang <leoyang.li@nxp.com>
References: <1556320002-26213-1-git-send-email-ynezz@true.cz>
 <1556320002-26213-3-git-send-email-ynezz@true.cz>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <f335fb31-ed1b-efd1-9cd3-a88b4a7fadf0@gmail.com>
Date: Sat, 27 Apr 2019 09:56:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556320002-26213-3-git-send-email-ynezz@true.cz>
Content-Language: en-US
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Alban Bedel <albeu@free.fr>, linux-oxnas@groups.io,
 Frank Rowand <frowand.list@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 2/4] dt-bindings: doc: Reflect new NVMEM
 of_get_mac_address behaviour
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

CgpPbiA0LzI2LzIwMTkgNDowNiBQTSwgUGV0ciDFoHRldGlhciB3cm90ZToKPiBBcyBvZl9nZXRf
bWFjX2FkZHJlc3Mgbm93IHN1cHBvcnRzIE5WTUVNIHVuZGVyIHRoZSBob29kLCB3ZSBzaG91bGQK
PiB1cGRhdGUgdGhlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gd2l0aCB0aGUgbmV3IG52bWVtLWNl
bGwqIHByb3BlcnRpZXMuCj4gV2hpbGUgYXQgaXQsIGZpeCBhbHNvIG90aGVyIG1pc3NpbmcgcHJv
cGVydGllcyBzdXBwb3J0ZWQgYnkKPiBvZl9nZXRfbWFjX2FkZHJlc3MuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUGV0ciDFoHRldGlhciA8eW5lenpAdHJ1ZS5jej4KCldoaWxlIEkgYXBwcmVjaWF0ZSB5
b3VyIGVmZm9ydCBpbiBtYWtpbmcgdGhlIGJpbmRpbmdzIHVwIHRvIGRhdGUgYW5kCmNvbnNpc3Rl
bnQsIHRoaXMgZG9lcyByZWFsbHkgc2NhbGUgd2VsbCBhbmQgaXMgYW4gZXJyb3IgcHJvbmUgZXhl
cmNpc2UsCmhvdyBhYm91dCBjb25zb2xpZGF0aW5nIGFsbCBNQUMgYWRkcmVzcyByZWxhdGVkIHBy
b3BlcnRpZXMgaW50byB0aGUKZXRoZXJuZXQudHh0IGRvY3VtZW50IGxpa2UgeW91IGp1c3QgZGlk
IGFuZCB1cGRhdGUgYWxsIGJpbmRpbmdzIHRvCmluZGljYXRlIHNvbWV0aGluZyBhbG9uZyB0aGUg
bGluZXMgb2Y6CgpGb3IgYWxsIG90aGVyIHN0YW5kYXJkIEV0aGVybmV0IHJlbGF0ZWQgcHJvcGVy
dGllcywgcGxlYXNlIHJlZmVyIHRvCmV0aGVybmV0LnR4dCBvciBzb21ldGhpbmcgbGlrZSB0aGF0
PwotLSAKRmxvcmlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
