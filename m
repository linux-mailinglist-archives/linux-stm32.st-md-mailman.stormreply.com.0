Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE46F01D9
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Apr 2023 09:37:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92F20C6907C;
	Thu, 27 Apr 2023 07:37:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D0A4C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 07:37:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso54411915e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 00:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682581024; x=1685173024;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oxehQfcmJryVNtOnqjPU8dcl4daH8QR4oPGx8PetHgc=;
 b=A9A1kf0aU5n5maWaTYSpwFq+dFDGkdZCkeAcCwkLD9kYlmE85jcd+hdkN4nKiQWQe+
 RVnhbx9f5wFVudnxQnUsSqLoUc+G3JM+O42GX9gNZfKeD8PN2HWTR2M+4STfmZxQqx7A
 ULQDVvEq1TUhKtYHjEQgZl7Jn4EVzSTkmRE2Oecxpq3Lqgdq1vonGcIN3aUKzLbJD2io
 FpSv3YS013V0nX3CVl5ec1a5D04GehDx526Kyx7RUB+XA1EFrTaBRu+mhMmPRXhFDy36
 7PFiOvnoAlRW92DFpieLR1YprFoJEGerJot6aeQ7uIG8PKhFuzZejCpTBKtwwOV0mzu8
 YerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682581024; x=1685173024;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oxehQfcmJryVNtOnqjPU8dcl4daH8QR4oPGx8PetHgc=;
 b=E0SxO4pHLHHa1Dp2TxNwexWqz3ZapUhVR2gHvxoO9cVtx32jySpz+Bi6h7/REdmIgZ
 /WpxZHf7uoVYIIY6FVBhpqpBNbuOtHA2oVodxz12KDQXNRi/ymnVCvhc+NvbvGFGW8ey
 s/YxoKKyOeXWZy/DM7hKjjOQO0NT2dzXXfwDqxGcq5g/oTduu6kwEr5JGI5KJau6yzgj
 l3mZEDg/kXI4eYPcHWzKfRTvTl94srd1PAZ06cVmC6NrJ7HuDPVdRC0PVn7PZpfbjQVO
 IfIFFOx6mY0H/YbnAqy4TXlmCHL3M3xRDOyJblZgludRZfPQMVI4g4jC4kPTz4i+y6j2
 B5hg==
X-Gm-Message-State: AC+VfDzZeMD43/zniOM4Qa1gQ4Orpd4zcIM+jxXn8OnqdnR+jZ9PTVEI
 KQwCwVjQjfuVGVLtJSB3zQ4Jh/nDHxhlFQ==
X-Google-Smtp-Source: ACHHUZ6j08kRlenxNEOxuCRn5D3dpBgWAxIWK0iOstSqplZ+yyO01YFGKwmwZRllZUj/HWkWlwS2Ow==
X-Received: by 2002:a5d:5312:0:b0:2f0:df59:1ea7 with SMTP id
 e18-20020a5d5312000000b002f0df591ea7mr504125wrv.31.1682581024316; 
 Thu, 27 Apr 2023 00:37:04 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a5d6306000000b002fed865c55esm17706733wru.56.2023.04.27.00.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 00:37:03 -0700 (PDT)
Message-ID: <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
Date: Thu, 27 Apr 2023 09:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, ca-ES, es-ES
To: Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

CgpPbiAyNS8wNC8yMDIzIDE3OjU3LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBUdWUsIEFwciAy
NSwgMjAyMyBhdCAyOjI44oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4gd3JvdGU6Cj4+Cj4+IEhpIFJvYiwKPj4KPj4gT24gVHVlLCBBcHIgMjUsIDIwMjMgYXQg
MTI6MTbigK9BTSBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPiB3cm90ZToKPj4+IEkg
aGF2ZSBhIHNjcmlwdFsxXSB0aGF0IGRvZXMgdGhlIGNvbnZlcnNpb24gd3JpdHRlbiB0aGUgbGFz
dCB0aW1lIHRoaXMKPj4+IGNhbWUgdXAuIEp1c3QgaGF2ZSB0byBhZ3JlZSBvbiBkaXJlY3Rvcnkg
bmFtZXMuIEkgdGhpbmsgdGhlIGVhc2llc3QKPj4+IHdvdWxkIGJlIGZvciBBcm5kL09sb2YgdG8g
cnVuIGl0IGF0IHRoZSBlbmQgb2YgYSBtZXJnZSB3aW5kb3cgYmVmb3JlCj4+PiByYzEuCj4+Cj4+
ICJlbWV2MiIgYW5kICJzaDciIGFyZSBtaXNzaW5nIGZvciByZW5lc2FzLgo+IAo+IE5vIGRvdWJ0
IGl0J3MgYmVlbiBiaXRyb3R0aW5nIChvciBJIG1heSBoYXZlIG1pc3NlZCBzb21lKS4KPiAKPj4g
RG9lcyB5b3VyIHNjcmlwdCBhbHNvIGNhdGVyIGZvciAuZHRzIGZpbGVzIG5vdCBtYXRjaGluZyBh
bnkgcGF0dGVybiwKPj4gYnV0IGluY2x1ZGluZyBhIC5kdHNpIGZpbGUgdGhhdCBkb2VzIG1hdGNo
IGEgcGF0dGVybj8KPiAKPiBJIGFzc3VtZSBJIGJ1aWx0IGV2ZXJ5dGhpbmcgYWZ0ZXIgbW92aW5n
LCBidXQgbWF5YmUgbm90Li4uCj4gCj4gVGhhdCdzIGFsbCBqdXN0ICJkZXRhaWxzIi4gRmlyc3Qs
IHdlIG5lZWQgYWdyZWVtZW50IG9uIGEpIG1vdmluZwo+IHRoaW5ncyB0byBzdWJkaXJzIGFuZCBi
KSBkb2luZyBpdCAxLWJ5LTEgb3IgYWxsIGF0IG9uY2UuIFNvIGZhciB3ZSd2ZQo+IGJlZW4gc3R1
Y2sgb24gYSkgZm9yIGJlaW5nICd0b28gbXVjaCBjaHVybicuCj4gCgpJIHRoaW5rIGl0IG1ha2Vz
IHNlbnNlIHRvIG1vdmUgdGhlbSBhbmQgcHJvYmFibHkgdGhlIGJlc3Qgd2F5IHRvIGRvIHNvIGlz
LCBhcyAKeW91IHByb3Bvc2VkOiB0aGF0IEFybmQgb3IgT2xvZiBydW4gdGhlIHNjcmlwdCB0byBt
b3ZlIHRoZW0ganVzdCBiZWZvcmUgLXJjMQoKUmVnYXJkcywKTWF0dGhpYXMKCj4gT25lIG5pY2Ug
dGhpbmcgd2l0aCBzdWJkaXJzIGlzICdtYWtlIENIRUNLX0RUQlM9eQo+IGFyY2gvYXJtL2Jvb3Qv
ZHRzL2Zvby8nIGNhbiBidWlsZCBldmVyeXRoaW5nIGZvciBhIHBsYXRmb3JtIGZhbWlseQo+IHdp
dGhvdXQgaGF2aW5nIHRvIG1lc3Mgd2l0aCB0aGUga2NvbmZpZy4gTWF5YmUgbW9zdCBmb2xrcyBk
b24ndCBjYXJlLAo+IGJ1dCBJIGRvLiBNeSBDSSBqb2IgcnVubmluZyBzY2hlbWEgY2hlY2tzIGxv
b2tzIGxpa2UgdGhpcyB0byBkZWFsIHdpdGgKPiBncm91cGluZyB0aGUgYXJtIGR0cyBmaWxlcyAo
dGhpcyBsaXN0IGlzIHByb2JhYmx5IG91dCBvZiBkYXRlIHRvbywgYnV0Cj4gbGVzcyBzbyk6Cj4g
Cj4gICAgICAgICAgaWYgWyAiJEFSQ0giID0gImFybSIgXTsgdGhlbgo+ICAgICAgICAgICAgICBW
RU5ET1JfTElTVD0iYWxwaGFzY2FsZSBhbHBpbmUgYXJ0cGVjIGFzcGVlZCBheG0gYmNtIGN4OQo+
IChlY3h8aGlnaGJhbmspIFwKPiAgICAgICAgICAgICAgICBlZm0gZXA3IGlteDEgaW14MjMgaW14
MjggaW14MjcgaW14NSBpbXg2IGlteDcgbHMgdmYgcWNvbSBcCj4gICAgICAgICAgICAgICAgKGFt
M3xhbTR8YW01fGRyYXxrZXlzdG9uZXxvbWFwfGNvbXB1bGFifGxvZ2ljcGR8ZWxwaWRhfG1vdG9y
b2xhLWNwY2FwfGRhfGRtKQo+IFwKPiAgICAgICAgICAgICAgICBuc3BpcmUgYXJtYWRhIGRvdmUg
a2lya3dvb2Qgb3Jpb24gbXZlYnUgbW1wMiBiZXJsaW4gcHhhCj4gKGFybS18aW50ZWd8bXBzfHZl
KSBcCj4gICAgICAgICAgICAgICAgKGF0OTF8c2FtYXx1c2JffHRueV98bXBhMTYwMHxhbmltZW9f
aXB8YWtzLWNkdXxldGhlcm51dDV8ZXZrLXBybzN8cG05ZzQ1fGdlODYpCj4gXAo+ICAgICAgICAg
ICAgICAgIGV4eW5vcyBzM2MgczVwIGdlbWluaSAoaGlzaXxoaTN8aGlwKSBtdCBtZXNvbiBtb3hh
IG51dm8KPiBscGMgb3dsIG94OCBcCj4gICAgICAgICAgICAgICAgKHI3fHI4fHI5fGVtZXYyfHNo
NzNhfGdyLXxpd2cpIChya3xydjExKSBzb2NmcGdhIHN0bQo+IChzdGl8c3QtcGluKSBzdGUgXAo+
ICAgICAgICAgICAgICAgIHNwZWFyIChzdW58YXhwKSB0ZWdyYSB1bmlwaCAodnQ4NTAwfHdtOCkg
eGVuIHp5bnEiCj4gICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICBWRU5ET1JfTElTVD0kKGxz
IGFyY2gvJEFSQ0gvYm9vdC9kdHMvIHwgeGFyZ3MpCj4gICAgICAgICAgZmkKPiAKPiBSb2IKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
