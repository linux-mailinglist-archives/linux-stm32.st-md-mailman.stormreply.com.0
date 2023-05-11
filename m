Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6426FF54C
	for <lists+linux-stm32@lfdr.de>; Thu, 11 May 2023 16:59:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2253CC6A5F2;
	Thu, 11 May 2023 14:59:01 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B30EBC65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 14:58:59 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-4501f454581so4070029e0c.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 07:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683817138; x=1686409138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VpO6U7Z1mcKtQslpBIHzR8nzCY5JK29I5far4gQgMlo=;
 b=kKN3/B2JbJVf5rKF4ZI6Zg9LF1s3E60sEfHVHP9UbUqP9yq81zQWR60MUMAJ4fAfjN
 Gel8g1Xnxi5hayYrGVJI40UDFzephMAweqGfKfUYQBSTsicEj2WmtQ15Rg2DjcVLV/ld
 NaoHkM6cRUtI/ikfsF7kNKqRQEFLtO7xLZQLhCRJr/FqGZFoO38bZJsHlKmPZGs8Bik9
 jREETS8YKz8fyWWk0OsvFSm22XIOIIuwCKzo+5kZdjzIULNACR10MRIn0DBvrzPKpDCQ
 kwL2St4jWiYuFot2AnULe5bPxqNQGH/B5ovtEXrDZEfkRVNN4ZlS2lx8ZoTgaWefQNc6
 LplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683817138; x=1686409138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VpO6U7Z1mcKtQslpBIHzR8nzCY5JK29I5far4gQgMlo=;
 b=UFIeJAWlnP9e+DZziFWXxfO7Wml6s/y8RV7VoYq8M4/970+02upVPIfwn34/6oxqsl
 pRs60nJQcV5IflTKBzBGsXitH+hgx+kC/TTEruOimtMpkTZoNh6SBjls98bCYB9xnXny
 6QogEvNQevcAX9pRrUTCfEy+Z9I/mOEtRwnOhg9LNUtY20NMnf26yCO52VoW990E7XOv
 butqgl2lqDQ9dMR5JpMYxPTdAxwNl2t7DjlVcPmkuN0ZCcLNy5jDr5YNsP8eGXf1S0T6
 4UK/yrdK5HNKcy55x5m2UnV0Mgzq09vFGHJ8Apwc1tD97zebVD5GLBoAQinQcgCfOFTq
 MhEg==
X-Gm-Message-State: AC+VfDz5dwgUaNaagux1Kjs8S9Yx9qzlZpKdcFOe/zcvL+txFAGoFNF9
 /F5obAJt4QeeMWDxRFffvHaHEsfE81X75x/XLJmwVQ==
X-Google-Smtp-Source: ACHHUZ7MMZXbQEYaI0ke/9+cA4R2GurFJnuqHXbPsB3wyk49ZXE7ZZzuwXH49+QFkWCEgSBps0X9X5IGzCMlfeGTxTU=
X-Received: by 2002:a1f:c905:0:b0:43f:c280:c10b with SMTP id
 z5-20020a1fc905000000b0043fc280c10bmr8367140vkf.7.1683817138527; Thu, 11 May
 2023 07:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230426-stmpe-dt-bindings-v4-0-36fdd53d9919@linaro.org>
 <20230426-stmpe-dt-bindings-v4-1-36fdd53d9919@linaro.org>
In-Reply-To: <20230426-stmpe-dt-bindings-v4-1-36fdd53d9919@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 May 2023 16:58:47 +0200
Message-ID: <CAMRc=MdsBiV3AvzSPtCuR58w0N9z7o+hUrBDtXUC4a++pECb8w@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: gpio: Convert STMPE
	GPIO to YAML schema
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

T24gTW9uLCBNYXkgOCwgMjAyMyBhdCAyOjM14oCvUE0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IFRoaXMgcmV3cml0ZXMgdGhlIFNUTVBFIEdQSU8g
YmluZGluZ3MgdG8gYSBZQU1MIHNjaGVtYS4KPgo+IFdlIGFkZCB0aGUgcHJvcGVydGllcyB0aGF0
IGFyZSB1c2VkIGluIHRoZSB3aWRlbHkgdXNlZAo+IFNUTVBFIEdQSU8gZGV2aWNlIG5vZGVzIGZv
dW5kIGluIHRoZSB3aWxkLCBtb3N0IG5vdGFibHkKPiBpbnRlcnJ1cHQgc3VwcG9ydCwgc28gaW50
ZXJydXB0LWNlbGxzIGFuZAo+IGludGVycnVwdC1jb250cm9sbGVyIGlzIG5vdyBwYXJ0IG9mIHRo
ZSBiaW5kaW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4KPiAtLS0KPiBDaGFuZ2VMb2cgdjMtPnY0Ogo+IC0gUmVhbGl6ZSB0aGF0
IHRoZXJlIHdlcmUgYWN0dWFsbHkgc29tZSBvbGQgYmluZGluZ3Mgc28gd2UKPiAgIG5lZWQgdG8g
Z2V0IHJpZCBvZiB0aGVtIGFzIHBhcnQgb2YgdGhpcyBwYXRjaC4KPiAtIEZpeCBibGFuayBsaW5l
cyBhZnRlciBkZXNjcmlwdGlvbjoga2V5d29yZC4KPiBDaGFuZ2VMb2cgdjItPnYzOgo+IC0gVXNl
IGEgY29tcGFjdCBob2cgbm9kZSBzY2hlbWEgYmFja2VkIGJ5IHRoZSBzdGFuZGFyZCBob2cKPiAg
IHNjaGVtYS4KPiBDaGFuZ2VMb2cgdjEtPnYyOgo+IC0gTmV3IHBhdGNoIHNwbGl0IG9mZiBmcm9t
IHRoZSBNRkQgcGF0Y2guCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vZ3Bp
by1zdG1wZS50eHQgICAgICAgIHwgMTcgLS0tLS0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncGlvL3N0LHN0bXBlLWdwaW8ueWFtbCAgICB8IDUzICsrKysrKysrKysrKysrKysrKysrKysK
PiAgMiBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9ncGlv
LXN0bXBlLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8t
c3RtcGUudHh0Cj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggYjMzZjhmMDJjMGQ3
Li4wMDAwMDAwMDAwMDAKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Z3Bpby9ncGlvLXN0bXBlLnR4dAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSwxNyArMCwwIEBACj4g
LVNUTVBFIGdwaW8KPiAtLS0tLS0tLS0tLQo+IC0KPiAtUmVxdWlyZWQgcHJvcGVydGllczoKPiAt
IC0gY29tcGF0aWJsZTogInN0LHN0bXBlLWdwaW8iCj4gLQo+IC1PcHRpb25hbCBwcm9wZXJ0aWVz
Ogo+IC0gLSBzdCxub3JlcXVlc3QtbWFzazogYml0bWFzayBzcGVjaWZ5aW5nIHdoaWNoIEdQSU9z
IHNob3VsZCBfbm90XyBiZSByZXF1ZXN0YWJsZQo+IC0gICBkdWUgdG8gZGlmZmVyZW50IHVzYWdl
IChlLmcuIHRvdWNoLCBrZXlwYWQpCj4gLQo+IC1Ob2RlIHNob3VsZCBiZSBjaGlsZCBub2RlIG9m
IHN0bXBlIG5vZGUgdG8gd2hpY2ggaXQgYmVsb25ncy4KPiAtCj4gLUV4YW1wbGU6Cj4gLSAgICAg
ICBzdG1wZV9ncGlvIHsKPiAtICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdG1wZS1n
cGlvIjsKPiAtICAgICAgICAgICAgICAgc3Qsbm9yZXF1ZXN0LW1hc2sgPSA8MHgyMD47ICAgICAv
L2dwaW8gNSBjYW4ndCBiZSB1c2VkCj4gLSAgICAgICB9Owo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zdCxzdG1wZS1ncGlvLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zdCxzdG1wZS1ncGlvLnlhbWwKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjJjMGNhZTczNDI1Cj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9n
cGlvL3N0LHN0bXBlLWdwaW8ueWFtbAo+IEBAIC0wLDAgKzEsNTMgQEAKPiArIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEu
Mgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9ncGlvL3N0LHN0
bXBlLWdwaW8ueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogU1RNaWNyb2VsZWN0b25pY3MgUG9ydCBFeHBh
bmRlciAoU1RNUEUpIEdQSU8gQmxvY2sKPiArCj4gK2Rlc2NyaXB0aW9uOgo+ICsgIFNUTWljcm9l
bGVjdHJvbmljcyBQb3J0IEV4cGFuZGVyIChTVE1QRSkgaXMgYSBzZXJpZXMgb2Ygc2xvdwo+ICsg
IGJ1cyBjb250cm9sbGVycyBmb3IgdmFyaW91cyBleHBhbmRlZCBwZXJpcGhlcmFscyBzdWNoIGFz
IEdQSU8sIGtleXBhZCwKPiArICB0b3VjaHNjcmVlbiwgQURDLCBQV00gb3Igcm90YXRvci4gSXQg
Y2FuIGNvbnRhaW4gb25lIG9yIHNldmVyYWwgZGlmZmVyZW50Cj4gKyAgcGVyaXBoZXJhbHMgY29u
bmVjdGVkIHRvIFNQSSBvciBJMkMuIFRoZXNlIGJpbmRpbmdzIHBlcnRhaW4gdG8gdGhlCj4gKyAg
R1BJTyBwb3J0aW9ucyBvZiB0aGVzZSBleHBhbmRlcnMuCj4gKwo+ICttYWludGFpbmVyczoKPiAr
ICAtIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiArCj4gK3Byb3Bl
cnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiBzdCxzdG1wZS1ncGlvCj4gKwo+
ICsgICIjZ3Bpby1jZWxscyI6Cj4gKyAgICBjb25zdDogMgo+ICsKPiArICAiI2ludGVycnVwdC1j
ZWxscyI6Cj4gKyAgICBjb25zdDogMgo+ICsKPiArICBncGlvLWNvbnRyb2xsZXI6IHRydWUKPiAr
Cj4gKyAgaW50ZXJydXB0LWNvbnRyb2xsZXI6IHRydWUKPiArCj4gKyAgc3Qsbm9yZXF1ZXN0LW1h
c2s6Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgQSBiaXRtYXNrIG9mIEdQSU8gbGluZXMg
dGhhdCBjYW5ub3QgYmUgcmVxdWVzdGVkIGJlY2F1c2UgZm9yCj4gKyAgICAgIGZvciBleGFtcGxl
IG5vdCBiZWluZyBjb25uZWN0ZWQgdG8gYW55dGhpbmcgb24gdGhlIHN5c3RlbQo+ICsgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gKwo+ICtwYXR0ZXJu
UHJvcGVydGllczoKPiArICAiXi4rLWhvZygtWzAtOV0rKT8kIjoKPiArICAgIHR5cGU6IG9iamVj
dAo+ICsKPiArICAgIHJlcXVpcmVkOgo+ICsgICAgICAtIGdwaW8taG9nCj4gKwo+ICthZGRpdGlv
bmFsUHJvcGVydGllczogZmFsc2UKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+
ICsgIC0gIiNncGlvLWNlbGxzIgo+ICsgIC0gIiNpbnRlcnJ1cHQtY2VsbHMiCj4gKyAgLSBncGlv
LWNvbnRyb2xsZXIKPiArICAtIGludGVycnVwdC1jb250cm9sbGVyCj4KPiAtLQo+IDIuMzQuMQo+
CgpBcHBsaWVkLCB0aGFua3MhCgpCYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
