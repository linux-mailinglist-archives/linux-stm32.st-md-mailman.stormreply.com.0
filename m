Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A274B0B
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2019 12:05:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E87CC32EA3;
	Thu, 25 Jul 2019 10:05:46 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55534C35E02
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 10:05:44 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id v22so35959757qkj.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 03:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7MqY5TdYDukrmEcvyvH1Gy2JxiZVpxAfuPKcTJpAIOc=;
 b=bZG05YAAVga3Lrh/0yIRiZu0OwBZ1sptqRJR8ItXyufWxbjZiVGIoqJ0QpP+TPerhF
 VS0hlrNFycUS3jM5WWtRoTESWbMzjpbMJgoMIj2JvhSvGV8FVTTpKMFtDJdX9DvdLpM6
 9DRwIIX/Qy19YhgVSoNRaga21XU0ELRRBHGN2XVRcrCVDHwsYoEyrRoa/m2wMLE0DfON
 diKx1f2P1O9zbznpnDIteD9wOHwQ/zzPS3GCxbbLKKO1EAKn3XcjR9ESC3eEnrRNBXfq
 D5x8VcJmwr7IFSNLpFwemFmEYv6f9thE4MW8BI/eQmHOwtYrPEkfgzCM7MUc4qpuJRo3
 GiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7MqY5TdYDukrmEcvyvH1Gy2JxiZVpxAfuPKcTJpAIOc=;
 b=mpsPvRrFhroyLY4XPOHh4UXKmGAsidw0sDogmF4SaP/zOsRCgtZsjQKLS0aQ6TpgPu
 phsXuIJFjkeHWDW4KdWU42j0+lKBWMn65O6mzhEjdRNexTt+EJ+TWeQhe3Bb+cP3O/1j
 4U0qBySTM5lKfBRyV5J+i9AYcBSqqh6QJNbpqcWJOaxIfNRh+4ys7v8ZbDurz5qIOCFG
 fq07nZvXlQvP9LCuuNOLA3gmZ3MD68kF5XWbiUYbzesGgNbF+BOYo1XJ+6mGOFwAcRE1
 109mrO4dPIcAZYRYjP8m0AWuY7/+yFSsP/hnPxcxdibhVhMsbc2qTa8aMYOwotFA9W0C
 haKA==
X-Gm-Message-State: APjAAAU6s11CZElc56myzGK8dGZReB+f05o28EhKnr09RZW0BHkXNNKS
 6p4b/hKrKlag0MTdfKLWLlSOT7Y2PJ99u14L3OHbIA==
X-Google-Smtp-Source: APXvYqyhCeRsfUMKnaFdLn3aJWF2r7C0su+s5w1UqLu1cTlcNydCdWit5JkkqefwAGH3hmKajOG/V6rCyDq9aRuGQfA=
X-Received: by 2002:a37:bcc7:: with SMTP id
 m190mr56245928qkf.433.1564049143158; 
 Thu, 25 Jul 2019 03:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
 <1563811560-29589-2-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1563811560-29589-2-git-send-email-olivier.moysan@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 25 Jul 2019 12:05:32 +0200
Message-ID: <CA+M3ks5v7vF_mPBr4mkwsHidc-N4jfJDgqWWE7qRv0LDsYJ-pQ@mail.gmail.com>
To: Olivier Moysan <olivier.moysan@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 jernej.skrabec@siol.net, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Jyri Sarha <jsarha@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] drm/bridge: sii902x: fix missing
	reference to mclk clock
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

TGUgbHVuLiAyMiBqdWlsLiAyMDE5IMOgIDE4OjA2LCBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5t
b3lzYW5Ac3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBBZGQgZGV2bV9jbGtfZ2V0IGNhbGwgdG8gcmV0
cmlldmUgcmVmZXJlbmNlIHRvIG1hc3RlciBjbG9jay4KPgo+IEZpeGVzOiBmZjU3ODE2MzRjNDEg
KCJkcm0vYnJpZGdlOiBzaWk5MDJ4OiBJbXBsZW1lbnQgSERNSSBhdWRpbyBzdXBwb3J0IikKPgo+
IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2FuIDxvbGl2aWVyLm1veXNhbkBzdC5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Cj4gQWNrZWQtYnk6IEFuZHJ6
ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dC4K
VGhhbmtzLApCZW5qYW1pbgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4
LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3NpaTkwMnguYwo+IGluZGV4IGMyZjk3ZTU5OTdhMS4uOTYyOTMxYzIwZWZlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBAQCAtNzUxLDYgKzc1MSw3IEBAIHN0YXRpYyBpbnQg
c2lpOTAyeF9hdWRpb19jb2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4ICpzaWk5MDJ4LAo+ICAgICAg
ICAgICAgICAgICBzaWk5MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5jZVtpXSB8PSBhdWRpb19m
aWZvX2lkW2ldIHwKPiAgICAgICAgICAgICAgICAgICAgICAgICBpMnNfbGFuZV9pZFtsYW5lc1tp
XV0gfCBTSUk5MDJYX1RQSV9JMlNfRklGT19FTkFCTEU7Cj4KPiArICAgICAgIHNpaTkwMngtPmF1
ZGlvLm1jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAibWNsayIpOwo+ICAgICAgICAgaWYgKElTX0VS
UihzaWk5MDJ4LT5hdWRpby5tY2xrKSkgewo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwg
IiVzOiBObyBjbG9jayAoYXVkaW8gbWNsaykgZm91bmQ6ICVsZFxuIiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBfX2Z1bmNfXywgUFRSX0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKSk7Cj4gLS0K
PiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
