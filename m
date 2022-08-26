Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA55A217B
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Aug 2022 09:12:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DA3FC640F6;
	Fri, 26 Aug 2022 07:12:34 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47303C04004
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 07:12:33 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id s1so869149lfp.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 00:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=TsGga+p3/E9an7wI98rRb/MFwrywOK8BvinFvruEnr4=;
 b=P42W/vx34Oi+AYvrGS4jqaKlFDewTQhYL4ODI5SFqrhkKEDPUmG5xuyuoz6/7/3WvV
 bpYw1dlQLRoPG+DiwwlfJxCdGmlPdnf/UCBNIowzO+wyD8JVTESRd84prKTjzIryZqJi
 0maAw46JHNlMVTaDLJ5espB4KYWCgnXqPBKJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=TsGga+p3/E9an7wI98rRb/MFwrywOK8BvinFvruEnr4=;
 b=KOrce//2k0L6PThaFwowYyCYdpm9zTs5tqbQiuks9+PsRj5E1xUOiPbVf7J7Lnk8xG
 4JLaKoa8B/WXC9bngQ7A6ioYVXfm8yANjAj8Kw7UdZS4Sh3qm/l2OgmQD4L7HFVL9kZn
 Ol5x9rXTyDKc58HHAG2H5c6S0rianNT2akVFXhFT7yW1UgZKWfvzh42l+hYMLdP/99De
 7qdJsiFs/eupUtDvVC4/3UxEG1LGicbPOdxczrm9v4zIncfefc7v9BOdsOe7H0+i9E86
 l/Pwb1z4b/TGBVFRM3TYrm7Jx0FioRTQLURl+v6Rpn7SMjNI27hj52sqIorNhvo36eOL
 soLw==
X-Gm-Message-State: ACgBeo3i+XIYoTAhkbQRI3VECMB7pXeV1S8sVFKwJzTg+wBh9y/yuXD3
 xEjdk5VpE6/372SAZxb6J+Bu8zFlHzZUJtOydQbA2w==
X-Google-Smtp-Source: AA6agR7CkxZMhLsDqNufa2XQws9YeFkWd1TvveuOauUFwiJpdK+2brKqI5N9qCf01ayFkWEcv+/FL2+Q6RobfuyrFxU=
X-Received: by 2002:a05:6512:1585:b0:48d:158:7013 with SMTP id
 bp5-20020a056512158500b0048d01587013mr2305322lfb.536.1661497952481; Fri, 26
 Aug 2022 00:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
 <20220820082936.686924-2-dario.binacchi@amarulasolutions.com>
 <fe2041cc-dd8b-6695-1fc8-6c1c49dd7220@linaro.org>
In-Reply-To: <fe2041cc-dd8b-6695-1fc8-6c1c49dd7220@linaro.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Aug 2022 09:12:21 +0200
Message-ID: <CABGWkvrdqE=1JpOvzs9u9j_gYFsDuKQ92ruzwc=CJQBB5jaj4g@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>, Dario Binacchi <dariobin@libero.it>
Subject: Re: [Linux-stm32] [RFC PATCH v2 1/4] dt-bindings: net: can: add
	STM32 bxcan DT bindings
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

SGkgS3J6eXN6dG9mLAoKT24gVHVlLCBBdWcgMjMsIDIwMjIgYXQgMzo0MSBQTSBLcnp5c3p0b2Yg
S296bG93c2tpCjxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24g
MjAvMDgvMjAyMiAxMToyOSwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gPiBBZGQgZG9jdW1lbnRh
dGlvbiBvZiBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIFNUTTMyIGJhc2ljIGV4dGVuZGVk
Cj4gPiBDQU4gKGJ4Y2FuKSBjb250cm9sbGVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpb2JpbkBsaWJlcm8uaXQ+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBC
aW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPgo+ID4gLS0t
Cj4gPgo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+IC0gQ2hhbmdlIHRoZSBmaWxlIG5hbWUgaW50byAn
c3Qsc3RtMzItYnhjYW4tY29yZS55YW1sJy4KPiA+IC0gUmVuYW1lIGNvbXBhdGlibGVzOgo+ID4g
ICAtIHN0LHN0bTMyLWJ4Y2FuLWNvcmUgLT4gc3Qsc3RtMzJmNC1ieGNhbi1jb3JlCj4gPiAgIC0g
c3Qsc3RtMzItYnhjYW4gLT4gc3Qsc3RtMzJmNC1ieGNhbgo+ID4gLSBSZW5hbWUgbWFzdGVyIHBy
b3BlcnR5IHRvIHN0LGNhbi1tYXN0ZXIuCj4gPiAtIFJlbW92ZSB0aGUgc3RhdHVzIHByb3BlcnR5
IGZyb20gdGhlIGV4YW1wbGUuCj4gPiAtIFB1dCB0aGUgbm9kZSBjaGlsZCBwcm9wZXJ0aWVzIGFz
IHJlcXVpcmVkLgo+ID4KPiA+ICAuLi4vYmluZGluZ3MvbmV0L2Nhbi9zdCxzdG0zMi1ieGNhbi55
YW1sICAgICAgfCAxMzYgKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEz
NiBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvY2FuL3N0LHN0bTMyLWJ4Y2FuLnlhbWwKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jYW4vc3Qsc3Rt
MzItYnhjYW4ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2Fu
L3N0LHN0bTMyLWJ4Y2FuLnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAw
MDAwMDAwMDAwMDAuLjI4ODYzMWI1NTU2ZAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jYW4vc3Qsc3RtMzItYnhjYW4ueWFt
bAo+ID4gQEAgLTAsMCArMSwxMzYgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+
ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL25ldC9jYW4vc3Qsc3RtMzItYnhj
YW4ueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogU1RNaWNyb2VsZWN0cm9uaWNzIGJ4Q0FOIGNv
bnRyb2xsZXIKPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogU1RNaWNyb2VsZWN0cm9uaWNzIEJ4Q0FO
IGNvbnRyb2xsZXIgZm9yIENBTiBidXMKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0g
RGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4g
Kwo+ID4gK2FsbE9mOgo+ID4gKyAgLSAkcmVmOiBjYW4tY29udHJvbGxlci55YW1sIwo+ID4gKwo+
ID4gK3Byb3BlcnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBlbnVtOgo+ID4gKyAg
ICAgIC0gc3Qsc3RtMzJmNC1ieGNhbi1jb3JlCj4gPiArCj4gPiArICByZWc6Cj4gPiArICAgIG1h
eEl0ZW1zOiAxCj4gPiArCj4gPiArICByZXNldHM6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiAr
Cj4gPiArICBjbG9ja3M6Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIElucHV0IGNs
b2NrIGZvciByZWdpc3RlcnMgYWNjZXNzCj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArCj4gPiAr
ICAnI2FkZHJlc3MtY2VsbHMnOgo+ID4gKyAgICBjb25zdDogMQo+ID4gKwo+ID4gKyAgJyNzaXpl
LWNlbGxzJzoKPiA+ICsgICAgY29uc3Q6IDAKPiA+ICsKPiA+ICthZGRpdGlvbmFsUHJvcGVydGll
czogZmFsc2UKPiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAg
LSByZWcKPiA+ICsgIC0gcmVzZXRzCj4gPiArICAtIGNsb2Nrcwo+ID4gKyAgLSAnI2FkZHJlc3Mt
Y2VsbHMnCj4gPiArICAtICcjc2l6ZS1jZWxscycKPiA+ICsKPiA+ICtwYXR0ZXJuUHJvcGVydGll
czoKPgo+IE5vIGltcHJvdmVtZW50cyBoZXJlLCBzbyBteSBjb21tZW50IHN0YXkuIFBsZWFzZSBm
aXggaXQuCgpTb3JyeSwgSSdmZiBmaXggaXQgaW4gdmVyc2lvbiAzLgoKPgo+Cj4gPiArICAiXmNh
bkBbMC05XSskIjoKPiA+ICsgICAgdHlwZTogb2JqZWN0Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+
ID4gKyAgICAgIEEgQ0FOIGJsb2NrIG5vZGUgY29udGFpbnMgdHdvIHN1Ym5vZGVzLCByZXByZXNl
bnRpbmcgZWFjaCBvbmUgYSBDQU4KPiA+ICsgICAgICBpbnN0YW5jZSBhdmFpbGFibGUgb24gdGhl
IG1hY2hpbmUuCj4KPiBJIHN0aWxsIGRvIG5vdCB1bmRlcnN0YW5kIHdoeSB5b3UgbmVlZCBjaGls
ZHJlbi4gWW91IGRpZCBub3QgQ0MgbWUgb24KPiBkcml2ZXIgY2hhbmdlLCBzbyBkaWZmaWN1bHQg
dG8gc2F5LiBZb3UgZGlkIG5vdCBkZXNjcmliZSB0aGUgcGFyZW50CgpPbiB0aGUgbmV4dCBzdWJt
aXNzaW9ucyBJJ2xsIHNlbmQgeW91IGFsbCB0aGUgc2VyaWVzIHBhdGNoZXMuCgo+IGRldmljZSAt
IHRoZXJlIGlzIG5vIGRlc2NyaXB0aW9uLgoKT2ssIEknbGwgZG8gaXQuCgo+IFdoeSBkbyB5b3Ug
bmVlZCBwYXJlbnQgZGV2aWNlIGF0IGFsbD8KPiBUaGlzIGxvb2tzIGxpa2Ugc29tZSBkcml2ZXIt
ZHJpdmVuLWJpbmRpbmdzIGluc3RlYWQgb2YganVzdCByZWFsCj4gaGFyZHdhcmUgZGVzY3JpcHRp
b24uCgpUaGUgdHdvIGRldmljZXMgYXJlIG5vdCBpbmRlcGVuZGVudC4KQXMgZGVzY3JpYmVkIGlu
IHRoZSByZWZlcmVuY2UgbWFudWFsIFJNMDM4NiAoU1RNMzJGNDY5eHggYW5kIFNUTTMyRjQ3OXh4
CmFkdmFuY2VkIEFybcKuLWJhc2VkIDMyLWJpdCBNQ1VzKSBpbiBwYXJhZ3JhcGggMzQuMiwgdGhl
IGJ4Q0FOIGNvbnRyb2xsZXIgaXMgYQpkdWFsIENBTiBwZXJpcGhlcmFsIGNvbmZpZ3VyYXRpb246
CgrigKIgQ0FOMTogTWFzdGVyIGJ4Q0FOIGZvciBtYW5hZ2luZyB0aGUgY29tbXVuaWNhdGlvbiBi
ZXR3ZWVuIGEgU2xhdmUgYnhDQU4gYW5kCnRoZSA1MTItYnl0ZSBTUkFNIG1lbW9yeQrigKIgQ0FO
MjogU2xhdmUgYnhDQU4sIHdpdGggbm8gZGlyZWN0IGFjY2VzcyB0byB0aGUgU1JBTSBtZW1vcnku
CgpTbywgaWYgSSB3YW50IHRvIHVzZSBDQU4yIG9ubHkgKGFuZCBub3QgQ0FOMSksIEkgbmVlZCB0
byBiZSBhYmxlIHRvIHVzZSBzaGFyZWQKcmVzb3VyY2VzIHdpdGggQ0FOMSB3aXRob3V0IGhhdmlu
ZyB0byBwcm9iZSB0aGUgQ0FOMSBkcml2ZXIuIElNSE8gaGVyZSBpcyB0aGUKanVzdGlmaWNhdGlv
biBvZiB0aGUgcGFyZW50IG5vZGUuCgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCgo+Cj4gQmVz
dCByZWdhcmRzLAo+IEtyenlzenRvZgoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpFbWJlZGRlZCBM
aW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpW
aWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIg
MjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMu
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
