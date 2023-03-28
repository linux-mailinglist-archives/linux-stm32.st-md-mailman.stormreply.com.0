Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B3E6CBAAE
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 11:29:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B50F6C6905A;
	Tue, 28 Mar 2023 09:29:13 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25CCBC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 09:29:12 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id i6so14204806ybu.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 02:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679995751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yFB98fl8c+VxJhat2aITQJylt85+D41Na+tueFpnBAE=;
 b=h6Vz5hHsFbSVlybmIlvV3llRGY6zxdMBPqd7vuRnJb91gssIrU+JkHC8x3k8jk99aZ
 TUV+/AV65p6lGjzaxQBmfrutizEWwOo+EZeXN/NHKK4LwatIFW/QwCXbyNZ7bW8Vvnd5
 K2dz4isaG3Fg9/yhee6xJqIWq4kl98h+rwO8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679995751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yFB98fl8c+VxJhat2aITQJylt85+D41Na+tueFpnBAE=;
 b=kHdf4wYA40tq5xkObAwTSBWkvfi3SBh3+u631gTBny6A1WMNXsOLgJCGg3XY+wr6hj
 GgRpNpe2XQVPa7vy79DWuM4Rnx6bnzXLu8qo3MvbLb4u9dWxMy4h897i0GAhc5NXnDfm
 vYsiJG/UGA5Cw0ocupM61ntobCQosX+OS6GloQy7FgxkDeg6C7NdZ0M9WRYft4YRR82x
 nyumuAZgHHiJSaw48Rl+c/Oev+QbuDk4IroUEoI139kXXOqM0TDC0rcRfPFHSSDQ3MQI
 x4faZD0Tnc3WUWlpuF+teC0rSbw+f3c3Lcx+QHlmT/9hnfrRghXRhkPrLwAEmOD1Dhpx
 jEwA==
X-Gm-Message-State: AAQBX9dgj83jcjULeYyj+s0pvfHI2U0hvrvztop78HY1JqXbrtggp7lr
 4PiU92QB9CZAxxgfhdevLSDxg5tBiasVkWhf4uDrNw==
X-Google-Smtp-Source: AKy350afBwmCZQBALVcAA/Tbw4Xqq5Zxd871dGI57F78yPyqoxYIijJLMdgmt6M0w+Y8hISHOAZdDyJishaV0ICRHKo=
X-Received: by 2002:a05:6902:188f:b0:b78:bced:2e3d with SMTP id
 cj15-20020a056902188f00b00b78bced2e3dmr7396712ybb.3.1679995751012; Tue, 28
 Mar 2023 02:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230328073328.3949796-1-dario.binacchi@amarulasolutions.com>
 <20230328084710.jnrwvydewx3atxti@pengutronix.de>
In-Reply-To: <20230328084710.jnrwvydewx3atxti@pengutronix.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 28 Mar 2023 11:28:59 +0200
Message-ID: <CABGWkvq0gOMw2J9GpLS=w+qg-3xhAst6KN9kvCuZnV9bSBJ3CA@mail.gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wolfgang Grandegger <wg@grandegger.com>,
 devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 michael@amarulasolutions.com, netdev@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v10 0/5] can: bxcan: add support for ST
	bxCAN controller
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

SGkgTWFyYywKCk9uIFR1ZSwgTWFyIDI4LCAyMDIzIGF0IDEwOjQ34oCvQU0gTWFyYyBLbGVpbmUt
QnVkZGUgPG1rbEBwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiAyOC4wMy4yMDIzIDA5OjMz
OjIzLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiA+IFRoZSBzZXJpZXMgYWRkcyBzdXBwb3J0IGZv
ciB0aGUgYmFzaWMgZXh0ZW5kZWQgQ0FOIGNvbnRyb2xsZXIgKGJ4Q0FOKQo+ID4gZm91bmQgaW4g
bWFueSBsb3ctIHRvIG1pZGRsZS1lbmQgU1RNMzIgU29Dcy4KPiA+Cj4gPiBUaGUgZHJpdmVyIGhh
cyBiZWVuIHRlc3RlZCBvbiB0aGUgc3RtMzJmNDY5aS1kaXNjb3ZlcnkgYm9hcmQgd2l0aCBhCj4g
PiBrZXJuZWwgdmVyc2lvbiA1LjE5LjAtcmMyIGluIGxvb3BiYWNrICsgc2lsZW50IG1vZGU6Cj4g
Pgo+ID4gaXAgbGluayBzZXQgY2FuMCB0eXBlIGNhbiBiaXRyYXRlIDEyNTAwMCBsb29wYmFjayBv
biBsaXN0ZW4tb25seSBvbgo+ID4gaXAgbGluayBzZXQgdXAgY2FuMAo+ID4gY2FuZHVtcCBjYW4w
IC1MICYKPiA+IGNhbnNlbmQgY2FuMCAzMDAjQUMuQUIuQUQuQUUuNzUuNDkuQUQuRDEKPiA+Cj4g
PiBGb3IgdWJvb3QgYW5kIGtlcm5lbCBjb21waWxhdGlvbiwgYXMgd2VsbCBhcyBmb3Igcm9vdGZz
IGNyZWF0aW9uIEkgdXNlZAo+ID4gYnVpbGRyb290Ogo+ID4KPiA+IG1ha2Ugc3RtMzJmNDY5X2Rp
c2NvX3NkX2RlZmNvbmZpZwo+ID4gbWFrZQo+ID4KPiA+IGJ1dCBJIGhhZCB0byBwYXRjaCBjYW4t
dXRpbHMgYW5kIGJ1c3lib3ggYXMgY2FuLXV0aWxzIGFuZCBpcHJvdXRlIGFyZQo+ID4gbm90IGNv
bXBpbGVkIGZvciBNTVUtbGVzcyBtaWNyb2NvdHJvbGxlcnMuIEluIHRoZSBjYXNlIG9mIGNhbi11
dGlscywKPiA+IHJlcGxhY2luZyB0aGUgY2FsbHMgdG8gZm9yaygpIHdpdGggdmZvcmsoKSwgSSB3
YXMgYWJsZSB0byBjb21waWxlIHRoZQo+ID4gcGFja2FnZSB3aXRoIHdvcmtpbmcgY2FuZHVtcCBh
bmQgY2Fuc2VuZCBhcHBsaWNhdGlvbnMsIHdoaWxlIGluIHRoZQo+ID4gY2FzZSBvZiBpcHJvdXRl
LCBJIHJhbiBpbnRvIG1vcmUgdGhhbiBvbmUgcHJvYmxlbSBhbmQgZmluYWxseSBJIGRlY2lkZWQK
PiA+IHRvIGV4dGVuZCBidXN5Ym94J3MgaXAgbGluayBjb21tYW5kIGZvciBDQU4tdHlwZSBkZXZp
Y2VzLiBJJ20gc3RpbGwKPiA+IHdvbmRlcmluZyBpZiBpdCB3YXMgcmVhbGx5IG5lY2Vzc2FyeSwg
YnV0IHRoaXMgd2F5IEkgd2FzIGFibGUgdG8gdGVzdAo+ID4gdGhlIGRyaXZlci4KPgo+IEFwcGxp
ZWQgdG8gbGludXgtY2FuLW5leHQuCgpKdXN0IG9uZSBsYXN0IHF1ZXN0aW9uOgpUbyB0ZXN0IHRo
aXMgc2VyaWVzLCBhcyBkZXNjcmliZWQgaW4gdGhlIGNvdmVyIGxldHRlciwgSSBjb3VsZCBub3Qg
dXNlCnRoZSBpcHJvdXRlMgpwYWNrYWdlIHNpbmNlIHRoZSBtaWNyb2NvbnRyb2xsZXIgaXMgd2l0
aG91dCBNTVUuIEkgdGhlbiBleHRlbmRlZCBidXN5Ym94IGZvcgp0aGUgaXAgbGluayBjb21tYW5k
LiBJIGFjdHVhbGx5IGFsc28gYWRkZWQgdGhlIHJ0bmwtbGluay1jYW4uYwphcHBsaWNhdGlvbiB0
byB0aGUKbGlibW5sIGxpYnJhcnkuIFNvIG5vdyBJIGZpbmQgbXlzZWxmIHdpdGggdHdvIGFwcGxp
Y2F0aW9ucyB0aGF0IGhhdmUKYmVlbiB1c2VmdWwKdG8gbWUgZm9yIHRoaXMgdHlwZSBvZiB1c2Ug
Y2FzZS4KRGlkIEkgZG8gdXNlbGVzcyB3b3JrIGJlY2F1c2UgSSBjb3VsZCB1c2Ugb3RoZXIgdG9v
bHM/IElmIGluc3RlYWQgdGhlIHRvb2xzIGZvcgp0aGlzIHVzZSBjYXNlIGFyZSBtaXNzaW5nLCB3
aGF0IGRvIHlvdSB0aGluayBpcyBiZXR0ZXIgdG8gZG8/ClN1Ym1pdCB0byB0aGVpciByZXNwZWN0
aXZlIHJlcG9zIG9yIGFkZCB0aGlzIGZ1bmN0aW9uYWxpdHkgdG8gYW5vdGhlcgpwcm9qZWN0IHRo
YXQKSSBoYXZlbid0IGNvbnNpZGVyZWQgPwoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPgo+
IFRoYW5rcywKPiBNYXJjCj4KPiAtLQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAg
IHwgTWFyYyBLbGVpbmUtQnVkZGUgICAgICAgICAgIHwKPiBFbWJlZGRlZCBMaW51eCAgICAgICAg
ICAgICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlICB8Cj4gVmVydHJldHVuZyBO
w7xybmJlcmcgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0xMjkgIHwKPiBB
bXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiB8IEZheDogICArNDktNTEyMS0yMDY5MTct
NTU1NSB8CgoKCi0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZl
bG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2Fu
ZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAK
aW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
