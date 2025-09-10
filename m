Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9CBB519C6
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 16:43:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84E99C35E00;
	Wed, 10 Sep 2025 14:43:04 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CAA4C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 14:43:03 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-55f6507bd53so7507331e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757515382; x=1758120182;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkhFCZ5ofWJHJ2EhMv0fguBBuTeG4Pes0q1AF4EcfFA=;
 b=z7deeg08qLCzuVUs/ckoKLV2FCcTUPmHk5w1S00hFSGIGvpoJc6gdH0MwTfHO2CPBh
 b+02o0dOJKOHBP/QU5i12UFbYYFRXHfijyQkYqqrUiDDJomAFqPEhvR8Vuz8XLMjpvw5
 GHCO3L4XCqryHBMWUzueeq/hmr/4j4lJVSZ0fShdbtJ0sEE9MG70xblJPWSOcZNtfes9
 ptT6I6XBMLfuZ6atIxccg/GbUVooUcSHGawVhdioyfl4X11gu//Q6lX9gQE/3HyH3zUd
 oh5KN4mM+G5wKfJZ0S46fOTHSC95DMJyNCQPsG/8hNovQFQfGf9eLpQd8EZCtrlZPkiW
 RKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757515382; x=1758120182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UkhFCZ5ofWJHJ2EhMv0fguBBuTeG4Pes0q1AF4EcfFA=;
 b=E4gEV3+WAKjNmi+KjTmrGgrF3/QIwjN5kn1P3ERUY3Kr/VjozD8gqJMWIR+SKXha06
 8Rp/EB8hWWziS9vKzneF51pETBA7XCaH24h7HmtITofWttHdRoQ+Jx24q52vVV3pcv64
 EJi5Wp9YVR6Xv4Xj+9Fo4hVj/TwSwa9Pd0p5ZEsT8NLm46Ho9E5U7dAGwmk0jeq75Lus
 PHnjDNgVnBgEWmd6k1fbKVeio9o+isfN4/ACleiJDtzU/w3Mv+NWu8lBMG01Go9jQAkZ
 9a+0x1gTzmFvPxZpdpm27T/syY7RMNgJ0lVFv7Oek/9OWDcWUa7/gN42LjnIeAQZFwhu
 Iz7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiWunowjoGqlLUJ/1SH2Lq0el7ruY1M1UKflsqxe7l6MIoUdFfgafQ7fEyKagxkoGZCYZBw/gqVlha4g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0oymPAETAHE2sTjYW4Cm54Pkfckv7JVpISWznyTMxueoxufai
 VqMYBbLhRl+oN02gwWnGtHovZ5HGrX8p9KyIkcB2sweuedMUQMhI6EUhYb/Obq70Qby5Px0QDyQ
 UzaEUWgSLBq2vUm6OAcy/crrHl5vsvERzZ3E0kfmJ3w==
X-Gm-Gg: ASbGncsNq7M6xJmsy6NH8EbQMLAy5Y1nUaU3/p9hZn/d08DIsbM5cGCb82HPIDT7Z5t
 sJOTanqXDVvwesVrKqqf7D0zYjYZQXv2eRvIlfobiLp2wx/wzHmegCt8g61AJ/s3p8zIqy84iq8
 9y54qIcvWqCuigyHp5zDHU2KuPjFGnIE2gQsKSGQxfyKid1Ix+MqaBKglw7FptcNxet5O6u4HzA
 S71aEfusx9f6JbsnezPy1vqaiQ5LAgUl28/dMc=
X-Google-Smtp-Source: AGHT+IFwwWMP72rjU0xLemNq3S4L4evCHuBoOQsJ51CqzV+zQGmHuO0tvNuPBH/4DumR325PTGGiK6U/D6n2L75MFaY=
X-Received: by 2002:a05:6512:e82:b0:55f:4429:15a6 with SMTP id
 2adb3069b0e04-5626310e5efmr4881766e87.48.1757515382294; Wed, 10 Sep 2025
 07:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
 <20250910143618.GA4072335-robh@kernel.org>
In-Reply-To: <20250910143618.GA4072335-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 16:42:50 +0200
X-Gm-Features: Ac12FXw3DEUYlNQHBVzd7vCIYANNaG3yJ5y0y_Zklwl-sYjU6Q6eUcIMkXz0GhY
Message-ID: <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgNDozNuKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMDM6NDM6MzhQTSArMDIw
MCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+IE9uIFdlZCwgU2VwIDEwLCAyMDI1IGF0
IDM6MzjigK9QTSBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+
ID4KPiA+ID4KPiA+ID4gT24gV2VkLCAxMCBTZXAgMjAyNSAxMDowNzozOSArMDIwMCwgQmFydG9z
eiBHb2xhc3pld3NraSB3cm90ZToKPiA+ID4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
YXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPiA+ID4KPiA+ID4gPiBEZXNjcmliZSB0
aGUgZmlybXdhcmUtbWFuYWdlZCB2YXJpYW50IG9mIHRoZSBRQ29tIERlc2lnbldhcmUgTUFDLiBB
cyB0aGUKPiA+ID4gPiBwcm9wZXJ0aWVzIGhlcmUgZGlmZmVyIGEgbG90IGZyb20gdGhlIEhMT1Mt
bWFuYWdlZCB2YXJpYW50LCBsZXRzIHB1dCBpdAo+ID4gPiA+IGluIGEgc2VwYXJhdGUgZmlsZS4K
PiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRv
c3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbmV0L3Fjb20sZXRocW9zLXNjbWkueWFtbCAgfCAxMDEgKysrKysrKysr
KysrKysrKysrKysrCj4gPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3
bWFjLnlhbWwgICAgICAgIHwgICA0ICstCj4gPiA+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ID4gPiAgMyBmaWxlcyBjaGFu
Z2VkLCAxMDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+Cj4gPiA+Cj4gPiA+
IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBvbiB5
b3VyIHBhdGNoOgo+ID4gPgo+ID4gPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6Cj4gPiA+Cj4g
PiA+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6Cj4gPiA+IC9idWlsZHMvcm9iaGVycmlu
Zy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9yZW5lc2FzLHJ6bjEtZ21hYy5leGFtcGxlLmR0YjogZXRoZXJuZXRANDQwMDAwMDAgKHJlbmVz
YXMscjlhMDZnMDMyLWdtYWMpOiBwb3dlci1kb21haW5zOiBbWzQyOTQ5NjcyOTVdXSBpcyB0b28g
c2hvcnQKPiA+ID4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sIwo+ID4gPiAvYnVpbGRzL3JvYmhl
cnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9uZXQvcmVuZXNhcyxyem4xLWdtYWMuZXhhbXBsZS5kdGI6IGV0aGVybmV0QDQ0MDAwMDAwIChy
ZW5lc2FzLHI5YTA2ZzAzMi1nbWFjKTogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFs
bG93ZWQgKCdjbG9jay1uYW1lcycsICdjbG9ja3MnLCAnaW50ZXJydXB0LW5hbWVzJywgJ2ludGVy
cnVwdHMnLCAncGh5LW1vZGUnLCAncG93ZXItZG9tYWlucycsICdyZWcnLCAncngtZmlmby1kZXB0
aCcsICdzbnBzLG11bHRpY2FzdC1maWx0ZXItYmlucycsICdzbnBzLHBlcmZlY3QtZmlsdGVyLWVu
dHJpZXMnLCAndHgtZmlmby1kZXB0aCcgd2VyZSB1bmV4cGVjdGVkKQo+ID4gPiAgICAgICAgIGZy
b20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L3JlbmVzYXMs
cnpuMS1nbWFjLnlhbWwjCj4gPiA+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGlu
dXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21h
Yy5leGFtcGxlLmR0YjogZXRoZXJuZXRANDQwMDAwMDAgKHJlbmVzYXMscjlhMDZnMDMyLWdtYWMp
OiBwb3dlci1kb21haW5zOiBbWzQyOTQ5NjcyOTVdXSBpcyB0b28gc2hvcnQKPiA+ID4gICAgICAg
ICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL25ldC9zbnBz
LGR3bWFjLnlhbWwjCj4gPiA+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21hYy5leGFt
cGxlLmR0YjogZXRoZXJuZXRAMTEwMWMwMDAgKG1lZGlhdGVrLG10MjcxMi1nbWFjKTogcG93ZXIt
ZG9tYWluczogW1s0Mjk0OTY3Mjk1LCA0XV0gaXMgdG9vIHNob3J0Cj4gPiA+ICAgICAgICAgZnJv
bSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9uZXQvbWVkaWF0ZWst
ZHdtYWMueWFtbCMKPiA+ID4gL2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L21lZGlhdGVrLWR3bWFjLmV4YW1w
bGUuZHRiOiBldGhlcm5ldEAxMTAxYzAwMCAobWVkaWF0ZWssbXQyNzEyLWdtYWMpOiBVbmV2YWx1
YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ21hYy1hZGRyZXNzJywgJ3BoeS1tb2Rl
JywgJ3JlZycsICdzbnBzLHJlc2V0LWRlbGF5cy11cycsICdzbnBzLHJlc2V0LWdwaW8nLCAnc25w
cyxyeHBibCcsICdzbnBzLHR4cGJsJyB3ZXJlIHVuZXhwZWN0ZWQpCj4gPiA+ICAgICAgICAgZnJv
bSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9uZXQvbWVkaWF0ZWst
ZHdtYWMueWFtbCMKPiA+ID4gL2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L21lZGlhdGVrLWR3bWFjLmV4YW1w
bGUuZHRiOiBldGhlcm5ldEAxMTAxYzAwMCAobWVkaWF0ZWssbXQyNzEyLWdtYWMpOiBwb3dlci1k
b21haW5zOiBbWzQyOTQ5NjcyOTUsIDRdXSBpcyB0b28gc2hvcnQKPiA+ID4gICAgICAgICBmcm9t
IHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL25ldC9zbnBzLGR3bWFj
LnlhbWwjCj4gPiA+Cj4gPgo+ID4gVGhlc2Ugc2VlbSB0byBiZSBhIGZhbHNlLXBvc2l0aXZlcyB0
cmlnZ2VyZWQgYnkgbW9kaWZ5aW5nIHRoZQo+ID4gaGlnaC1sZXZlbCBzbnBzLmR3bWFjLnlhbWwg
ZmlsZT8KPgo+IE5vLiBZb3UganVzdCBtYWRlIDMgcG93ZXItZG9tYWlucyByZXF1aXJlZCBmb3Ig
ZXZlcnlvbmUuCj4KCldpdGggYSBtYXhJdGVtczogMz8KCldoYXQgaXMgdGhlIGNvcnJlY3QgYXBw
cm9hY2ggdGhlbj8KCkJhcnRvc3oKCj4gWW91IGhhdmUgdG8gdGVzdCB3aXRob3V0IERUX1NDSEVN
QV9GSUxFUyBzZXQgc28gdGhhdCBldmVyeSBleGFtcGxlIGlzCj4gdGVzdGVkIHdpdGggZXZlcnkg
cG9zc2libGUgc2NoZW1hLgo+Cj4gUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
