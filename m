Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1045AD687D
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 09:08:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A513DC36B27;
	Thu, 12 Jun 2025 07:08:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B972C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 07:08:34 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso498065f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 00:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749712114; x=1750316914;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=b7Pe4DM9eAzA6gWze+y1vzNSKpfWbxNREYiER4q37Ko=;
 b=WMYT8I2WyeI8dd1Kd5xbusz46uH0hWaOgtBfpxOXEzMR5NaUX+QIH68v1fntkF4GSA
 6t1ALJkKpTFeSDTgy46KQMO8Hcmi0uU82h4fjzJmIdroKxOGUU4wvUcvZXpZMznqRt3K
 xyUQIP//kO19uoI+tEQvlNcjMicprB3PnK/3TQdMDMv1d+JD07giTD1BxPChM8ZZ9ZRm
 +TWnm9lPD5VDDxN3ufTahKs/KQzSFK8For2kqUMzd5hrJymSB8ZbmSsPLH/qpOmCWPzG
 ih/vVjGBqc2Atbs5ooRIt0lhiH+E3RVhiGOEt+Ib0G+D50Uo62L7OQAFAHcVs7TE0c8N
 jRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749712114; x=1750316914;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b7Pe4DM9eAzA6gWze+y1vzNSKpfWbxNREYiER4q37Ko=;
 b=ONC82LZMfSNs9fJUn8u2Mwy1DG76Xdbu+ohULJ4qezLMEt2wMn6ofKKD3vwtnAxkti
 D6daOFFmSIykQfAR73BdnPmamCMiG8B77BHj2QeMuWX9V4tYldrixG+4dW5a/6qcZhiy
 xmSjf+MuauD94tppOU5GPPMdZMWi9U7Y6waRoKexPb/U2pnLiImln6tkw5rI/iL/YdQI
 98e9nrkAMQJCUryCRlmGdgIIKL9fJXzXPSzPv+0WuhipP/YodMV9jGv2xrDUbDnqEKfg
 muv0dWW/F7NMTQV92gIbJD/WInKqZ26fc9GLmQTZbtlfYs4lwfhFvIKuq09rBY23fZGy
 vHqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHRENfs1R9l55J3XReYrb/0lpYR+CW8UKjOK9nwq+kmSW/pe5gysqwxvx7IzxehWGs41mtP/ipkJTcgA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywg/hC15idwgCxt3kCuV+wu6tK+wLtN/BWsFXUpH7opAuAgCF6O
 Vh16k45CORHYqrU9L+WPEpg+fNsowRBebeXNR/eNPWZA7eWg0PN1cP1G
X-Gm-Gg: ASbGnctnzhOAUtJ7UnFCoRC5Ti/KnvRCv+iVM35lekFMFsoFK7QqQm61KTLGOb7z12m
 G1Dcx9UESCp2hMkvNensbB0AU/BHDkIngP032kZ6cBg1iNwjS9c8BNRSXWKST3kkBedBc2SjaSH
 zC4k0TlTk7ccmjztbTcT9qCSD4P3L3fPcjl6V77f1XY8MuHuwzbTeRw9mv17fjoMnevHekdOmVc
 Lvsj2kyIfsvgJpLh3RWqXqO1kjJTjVBdhsFEB3xXIdMKoTXLtF8wkc+/W/dmOd0pqG/hQyFbKn6
 dix5B4Pf9Cy5+Act04szlnME5kI7crOCmMGj4HkBEBc9DhVXzYW8BoDG0RshxYu6VMkQhiYMlJP
 tXhw7rxS9hXjnqLs790ZImpsLbmM7hbOXDzpZ
X-Google-Smtp-Source: AGHT+IH9n/flMKLj/FWiSLfeeJnfPQDem5Xx/NLRMy+P0OfNN55bI6kHEInXGrhWHgDzIYMLSN833A==
X-Received: by 2002:a05:6000:2087:b0:3a5:52cc:346e with SMTP id
 ffacd0b85a97d-3a55868917fmr4618896f8f.6.1749712114059; 
 Thu, 12 Jun 2025 00:08:34 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673?
 ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a56199b337sm1101091f8f.37.2025.06.12.00.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 00:08:33 -0700 (PDT)
Message-ID: <82d707b22803e2b363a2e0aa0bcf30bc1522f269.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Michael Hennerich
 <michael.hennerich@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Cameron <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Francesco Dolcini
 <francesco@dolcini.it>, =?ISO-8859-1?Q?Jo=E3o?= Paulo
 =?ISO-8859-1?Q?Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>, Leonard
 =?ISO-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,  kernel@pengutronix.de,
 Oleksij Rempel <o.rempel@pengutronix.de>, Roan van Dijk <roan@protonic.nl>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Mudit Sharma
 <muditsharma.info@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>,  =?UTF-8?Q?Ond=C5=99ej?= Jirman
 <megi@xff.cz>, Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>
Date: Thu, 12 Jun 2025 07:09:04 +0100
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/28] iio: zero init stack with { }
	instead of memset()
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

T24gV2VkLCAyMDI1LTA2LTExIGF0IDE3OjM4IC0wNTAwLCBEYXZpZCBMZWNobmVyIHdyb3RlOgo+
IEpvbmF0aGFuIG1lbnRpb25lZCByZWNlbnRseSB0aGF0IGhlIHdvdWxkIGxpa2UgdG8gZ2V0IGF3
YXkgZnJvbSB1c2luZwo+IG1lbXNldCgpIHRvIHplcm8taW5pdGlhbGl6ZSBzdGFjayBtZW1vcnkg
aW4gdGhlIElJTyBzdWJzeXN0ZW0uIEFuZCB3ZQo+IGhhdmUgaXQgb24gZ29vZCBhdXRob3JpdHkg
dGhhdCBpbml0aWFsaXppbmcgYSBzdHJ1Y3Qgb3IgYXJyYXkgd2l0aCA9IHsgfQo+IGlzIHRoZSBw
cmVmZXJyZWQgd2F5IHRvIGRvIHRoaXMgaW4gdGhlIGtlcm5lbCBbMV0uIFNvIGhlcmUgaXMgYSBz
ZXJpZXMKPiB0byB0YWtlIGNhcmUgb2YgdGhhdC4KPiAKPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWlpby8yMDI1MDUwOTA5NDIuNDhFQkYwMUJAa2Vlc2Nvb2svCj4gCj4gLS0t
CgpSZXZpZXdlZC1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KCj4gRGF2aWQgTGVj
aG5lciAoMjgpOgo+IMKgwqDCoMKgwqAgaWlvOiBhY2NlbDogYWR4bDM3MjogdXNlID0geyB9IGlu
c3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogYWNjZWw6IG1zYTMxMTogdXNlID0g
eyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogYWRjOiBkbG4yLWFkYzog
dXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogYWRjOiBtdDYz
NjAtYWRjOiB1c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiBh
ZGM6IHJvY2tjaGlwX3NhcmFkYzogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKg
wqDCoMKgIGlpbzogYWRjOiBydHE2MDU2OiB1c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+
IMKgwqDCoMKgwqAgaWlvOiBhZGM6IHN0bTMyLWFkYzogdXNlID0geyB9IGluc3RlYWQgb2YgbWVt
c2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogYWRjOiB0aS1hZHMxMDE1OiB1c2UgPSB7IH0gaW5zdGVh
ZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiBhZGM6IHRpLWFkczExMTk6IHVzZSA9IHsg
fSBpbnN0ZWFkIG9mIG1lbXNldCgpCj4gwqDCoMKgwqDCoCBpaW86IGFkYzogdGktbG1wOTIwNjQ6
IHVzZSA9IHsgfSBpbnN0ZWFkIG9mIG1lbXNldCgpCj4gwqDCoMKgwqDCoCBpaW86IGFkYzogdGkt
dHNjMjA0NjogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzog
Y2hlbWljYWw6IHNjZDR4OiB1c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKg
wqAgaWlvOiBjaGVtaWNhbDogc2NkMzA6IHVzZSA9IHsgfSBpbnN0ZWFkIG9mIG1lbXNldCgpCj4g
wqDCoMKgwqDCoCBpaW86IGNoZW1pY2FsOiBzdW5yaXNlX2NvMjogdXNlID0geyB9IGluc3RlYWQg
b2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogZGFjOiBhZDM1NTJyOiB1c2UgPSB7IH0gaW5z
dGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiBpbXU6IGludl9pY200MjYwMDogdXNl
ID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogaW11OiBpbnZfbXB1
NjA1MDogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogbGln
aHQ6IGJoMTc0NTogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlp
bzogbGlnaHQ6IGx0cjUwMTogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDC
oMKgIGlpbzogbGlnaHQ6IG9wdDQwNjA6IHVzZSA9IHsgfSBpbnN0ZWFkIG9mIG1lbXNldCgpCj4g
wqDCoMKgwqDCoCBpaW86IGxpZ2h0OiB2ZW1sNjAzMDogdXNlID0geyB9IGluc3RlYWQgb2YgbWVt
c2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogbWFnbmV0b21ldGVyOiBhZjgxMzNqOiB1c2UgPSB7IH0g
aW5zdGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiBwcmVzc3VyZTogYm1wMjgwOiB1
c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiBwcmVzc3VyZTog
bXBsMzExNTogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzog
cHJlc3N1cmU6IG1wcmxzMDAyNXBhOiB1c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+IMKg
wqDCoMKgwqAgaWlvOiBwcmVzc3VyZTogenBhMjMyNjogdXNlID0geyB9IGluc3RlYWQgb2YgbWVt
c2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogcHJveGltaXR5OiBpcnNkMjAwOiB1c2UgPSB7IH0gaW5z
dGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiB0ZW1wZXJhdHVyZTogdG1wMDA2OiB1
c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+IAo+IMKgZHJpdmVycy9paW8vYWNjZWwvYWR4
bDM3Mi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICst
LQo+IMKgZHJpdmVycy9paW8vYWNjZWwvbXNhMzExLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArLS0tCj4gwqBkcml2ZXJzL2lpby9hZGMvZGxuMi1h
ZGMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0ICst
LS0KPiDCoGRyaXZlcnMvaWlvL2FkYy9tdDYzNjAtYWRjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICstLQo+IMKgZHJpdmVycy9paW8vYWRjL3JvY2tjaGlw
X3NhcmFkYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0ICstLS0KPiDCoGRy
aXZlcnMvaWlvL2FkYy9ydHE2MDU2LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCA0ICstLS0KPiDCoGRyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArLS0KPiDCoGRy
aXZlcnMvaWlvL2FkYy90aS1hZHMxMDE1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCA0ICstLS0KPiDCoGRyaXZlcnMvaWlvL2FkYy90aS1hZHMxMTE5LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0ICstLS0KPiDCoGRyaXZl
cnMvaWlvL2FkYy90aS1sbXA5MjA2NC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDQgKy0tLQo+IMKgZHJpdmVycy9paW8vYWRjL3RpLXRzYzIwNDYuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgKy0tCj4gwqBkcml2ZXJzL2lp
by9jaGVtaWNhbC9zY2QzMF9jb3JlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDMgKy0tCj4gwqBkcml2ZXJzL2lpby9jaGVtaWNhbC9zY2Q0eC5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArLS0KPiDCoGRyaXZlcnMvaWlvL2NoZW1pY2Fs
L3N1bnJpc2VfY28yLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2ICsrLS0tLQo+
IMKgZHJpdmVycy9paW8vZGFjL2FkMzU1MnIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgKy0tCj4gwqBkcml2ZXJzL2lpby9pbXUvaW52X2ljbTQy
NjAwL2ludl9pY200MjYwMF9hY2NlbC5jIHwgNSArKy0tLQo+IMKgZHJpdmVycy9paW8vaW11L2lu
dl9pY200MjYwMC9pbnZfaWNtNDI2MDBfZ3lyby5jwqAgfCA1ICsrLS0tCj4gwqBkcml2ZXJzL2lp
by9pbXUvaW52X21wdTYwNTAvaW52X21wdV9hY3BpLmPCoMKgwqDCoMKgwqDCoCB8IDQgKy0tLQo+
IMKgZHJpdmVycy9paW8vaW11L2ludl9tcHU2MDUwL2ludl9tcHVfcmluZy5jwqDCoMKgwqDCoMKg
wqAgfCA2ICsrLS0tLQo+IMKgZHJpdmVycy9paW8vbGlnaHQvYmgxNzQ1LmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArLS0tCj4gwqBkcml2ZXJzL2lp
by9saWdodC9sdHI1MDEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCA0ICstLS0KPiDCoGRyaXZlcnMvaWlvL2xpZ2h0L29wdDQwNjAuY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArLS0tCj4gwqBkcml2ZXJzL2lp
by9saWdodC92ZW1sNjAzMC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgNCArLS0tCj4gwqBkcml2ZXJzL2lpby9tYWduZXRvbWV0ZXIvYWY4MTMzai5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArLS0tCj4gwqBkcml2ZXJzL2lpby9wcmVzc3Vy
ZS9ibXAyODAtY29yZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNSArLS0tLQo+
IMKgZHJpdmVycy9paW8vcHJlc3N1cmUvbXBsMzExNS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCAzICstLQo+IMKgZHJpdmVycy9paW8vcHJlc3N1cmUvbXBybHMwMDI1
cGFfaTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNSArLS0tLQo+IMKgZHJpdmVycy9paW8v
cHJlc3N1cmUvenBhMjMyNi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCA0ICstLS0KPiDCoGRyaXZlcnMvaWlvL3Byb3hpbWl0eS9pcnNkMjAwLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICstLQo+IMKgZHJpdmVycy9paW8vdGVtcGVyYXR1
cmUvdG1wMDA2LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArLS0tCj4g
wqAzMCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCA4NSBkZWxldGlvbnMoLSkKPiAt
LS0KPiBiYXNlLWNvbW1pdDogNGM2MDczZmVjMmZlZTQ4MjdmYTBkZDhhNGFiNGU2ZjdiYmMwNWVl
Ngo+IGNoYW5nZS1pZDogMjAyNTA2MTEtaWlvLXplcm8taW5pdC1zdGFjay13aXRoLWluc3RlYWQt
b2YtbWVtc2V0LTBkMTJkNDFhN2VjYgo+IAo+IEJlc3QgcmVnYXJkcywKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
