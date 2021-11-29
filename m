Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF37461171
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 10:53:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10F7BC57B6F;
	Mon, 29 Nov 2021 09:53:35 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9686EC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 09:53:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so5572852wmi.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 01:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1tIt1usm4A9wPgma7ntzt4rs6Rj3ONNUEdsoTNnKPZs=;
 b=CyYBPySO96oEWEz4VfwZnYwcIC7Q3+71XMxBYDXGVV9MLS0i5XfkmVGyT70BCchp0f
 O1SE5s/ykmf3HNTUVkOg1fzp3qMQZWmeX8IL8WAMgrc30CNBSmp5t0rj12Aec/hYulXe
 7OczQnuqcT6R8fH6k/oDjXFq/X9VbYsMD7cUl8hTRhNbF+AsQ4ijQk4OVAwa7ffgXg3C
 wubZa+KD27YUQji+drWAcLH20Uw5SaFq0LX6+KKawD4f+RXj/ijYEeFNeKfcGFyOMZ2a
 0+TYXth+jsgmn7OKfjebuMqJ5lDzGjP6XYtmR3wr47dNTHvdespu9hLj45SX0484jR1K
 8wTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1tIt1usm4A9wPgma7ntzt4rs6Rj3ONNUEdsoTNnKPZs=;
 b=U4X+uMmGixRBg24MMF53UWmem+VpfwjSinBKPqC/xJQjwknyHMXKoq6FfUhDqX334c
 FC84fqVN9brDsG7JGp6jbq+Ob6cKApD7ObQYDR1vDb05ICxrI2XXrb5gC7kIo7xHjUyp
 wBn46nrI1ULFlNeoqj6DPWVRikwjkEZROFTRP+D/rdDdm2BuRjy55bwGGYHc1tU3UrX4
 nzTzNGQ6OK+gKiuhU29kSmK+gofufiU2pkQFSJRMezrdNp9+VTFnoRptikw0+bf5/ssj
 /C+PtveUIFAsyNhfAapFLt/AqOnCDROpwPgqnEw0Mnc3chvPOsg2f5WUECPnI+GJgPnB
 ms6g==
X-Gm-Message-State: AOAM531jwxrAnHhkibm6gaCAzDscJsyDbfeLFc9CAGmvnWaiW0YQYZFc
 rh6OBSwdsfXKd1y/qpY3wTwvbA==
X-Google-Smtp-Source: ABdhPJyjEclD14Ye/OjLLAW8LWabyzB1tje+1xrK7n66sr0LMika3eVGTyKyeJ55JoT1Nt4GG64A+A==
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr35074559wmj.9.1638179612995; 
 Mon, 29 Nov 2021 01:53:32 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:8236:a2e5:8d62:e9cd?
 ([2a01:e34:ed2f:f020:8236:a2e5:8d62:e9cd])
 by smtp.googlemail.com with ESMTPSA id v15sm13287125wro.35.2021.11.29.01.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 01:53:32 -0800 (PST)
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
Date: Mon, 29 Nov 2021 10:53:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
Content-Language: en-US
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/4] clocksource/drivers/renesas-ostm:
 Add RZ/G2L OSTM support
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

T24gMTIvMTEvMjAyMSAxOTo0NCwgQmlqdSBEYXMgd3JvdGU6Cj4gUlovRzJMIFNvQyBoYXMgR2Vu
ZXJpYyBUaW1lciBNb2R1bGUoYS5rLmEgT1NUTSkgd2hpY2ggbmVlZHMgdG8KPiBkZWFzc2VydCB0
aGUgcmVzZXQgbGluZSBiZWZvcmUgYWNjZXNzaW5nIGFueSByZWdpc3RlcnMuCj4gCj4gVGhpcyBw
YXRjaCBhZGRzIGFuIGVudHJ5IHBvaW50IGZvciBSWi9HMkwgc28gdGhhdCB3ZSBjYW4gZGVhc3Nl
cnQKPiB0aGUgcmVzZXQgbGluZSBpbiBwcm9iZSBjYWxsYmFjay4KCldoYXQgaXMgdGhlIGNvbm5l
Y3Rpb24gYmV0d2VlbiBhZGRpbmcgdGhlIHJlc2V0IGxpbmUgY29udHJvbCBhbmQgdGhlCnBsYXRm
b3JtIGRyaXZlciBhdCB0aGUgZW5kIG9mIHRoZSBkcml2ZXIgPwoKPiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+Cj4gUmV2aWV3ZWQtYnk6IExhZCBQ
cmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiAtLS0K
PiB2Mi0+djM6Cj4gICogQWRkZWQgcmVzZXRfY29udHJvbF9wdXQoKSBvbiBlcnJvciBwYXRoLgo+
ICAqIGVuYWJsZWQgc3VwcHJlc3NfYmluZF9hdHRycyBpbiBvc3RtX2RldmljZV9kcml2ZXIgc3Ry
dWN0dXJlCj4gdjEtPnYyOgo+ICAqIEFkZGVkIHJlc2V0IGhhbmRsaW5nIGluc2lkZSBvc3RtX2lu
aXQKPiAgKiBVc2VkIHNhbWUgY29tcGF0aWJsZSBmb3IgYnVpbHRpbiBkcml2ZXIgYXN3ZWxsCj4g
LS0tCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3RtLmMgfCAzOSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS9yZW5l
c2FzLW9zdG0uYyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3RtLmMKPiBpbmRleCAz
ZDA2YmE2NjAwOGMuLjIxZDEzOTI2MzdiOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291
cmNlL3JlbmVzYXMtb3N0bS5jCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9yZW5lc2FzLW9z
dG0uYwo+IEBAIC05LDYgKzksOCBAQAo+ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9jbG9ja2NoaXBzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4K
PiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgv
cmVzZXQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkX2Nsb2NrLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9zbGFiLmg+Cj4gIAo+IEBAIC0xNTksNiArMTYxLDcgQEAgc3RhdGljIGludCBfX2luaXQg
b3N0bV9pbml0X2Nsa2V2dChzdHJ1Y3QgdGltZXJfb2YgKnRvKQo+ICAKPiAgc3RhdGljIGludCBf
X2luaXQgb3N0bV9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gIHsKPiArCXN0cnVjdCBy
ZXNldF9jb250cm9sICpyc3RjOwo+ICAJc3RydWN0IHRpbWVyX29mICp0bzsKPiAgCWludCByZXQ7
Cj4gIAo+IEBAIC0xNjYsNiArMTY5LDE0IEBAIHN0YXRpYyBpbnQgX19pbml0IG9zdG1faW5pdChz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ICAJaWYgKCF0bykKPiAgCQlyZXR1cm4gLUVOT01FTTsK
PiAgCj4gKwlyc3RjID0gb2ZfcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlKG5w
LCBOVUxMKTsKPiArCWlmIChJU19FUlIocnN0YykpIHsKPiArCQlyZXQgPSBQVFJfRVJSKHJzdGMp
Owo+ICsJCWdvdG8gZXJyX2ZyZWU7Cj4gKwl9Cj4gKwo+ICsJcmVzZXRfY29udHJvbF9kZWFzc2Vy
dChyc3RjKTsKPiArCj4gIAl0by0+ZmxhZ3MgPSBUSU1FUl9PRl9CQVNFIHwgVElNRVJfT0ZfQ0xP
Q0s7Cj4gIAlpZiAoc3lzdGVtX2Nsb2NrKSB7Cj4gIAkJLyoKPiBAQCAtMTc4LDcgKzE4OSw3IEBA
IHN0YXRpYyBpbnQgX19pbml0IG9zdG1faW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ICAK
PiAgCXJldCA9IHRpbWVyX29mX2luaXQobnAsIHRvKTsKPiAgCWlmIChyZXQpCj4gLQkJZ290byBl
cnJfZnJlZTsKPiArCQlnb3RvIGVycl9yZXNldDsKPiAgCj4gIAkvKgo+ICAJICogRmlyc3QgcHJv
YmVkIGRldmljZSB3aWxsIGJlIHVzZWQgYXMgc3lzdGVtIGNsb2Nrc291cmNlLiBBbnkKPiBAQCAt
MjAzLDkgKzIxNCwzNSBAQCBzdGF0aWMgaW50IF9faW5pdCBvc3RtX2luaXQoc3RydWN0IGRldmlj
ZV9ub2RlICpucCkKPiAgCj4gIGVycl9jbGVhbnVwOgo+ICAJdGltZXJfb2ZfY2xlYW51cCh0byk7
Cj4gK2Vycl9yZXNldDoKPiArCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KHJzdGMpOwo+ICsJcmVzZXRf
Y29udHJvbF9wdXQocnN0Yyk7Cj4gIGVycl9mcmVlOgo+ICAJa2ZyZWUodG8pOwo+ICAJcmV0dXJu
IHJldDsKPiAgfQo+ICAKPiAgVElNRVJfT0ZfREVDTEFSRShvc3RtLCAicmVuZXNhcyxvc3RtIiwg
b3N0bV9pbml0KTsKPiArCj4gKyNpZmRlZiBDT05GSUdfQVJDSF9SOUEwN0cwNDQKPiArc3RhdGlj
IGludCBfX2luaXQgb3N0bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICt7
Cj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICsKPiArCXJldHVybiBvc3Rt
X2luaXQoZGV2LT5vZl9ub2RlKTsKPiArfQo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgb3N0bV9vZl90YWJsZVtdID0gewo+ICsJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LG9zdG0iLCB9LAo+ICsJeyAvKiBzZW50aW5lbCAqLyB9Cj4gK307Cj4gKwo+ICtzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciBvc3RtX2RldmljZV9kcml2ZXIgPSB7Cj4gKwkuZHJpdmVyID0g
ewo+ICsJCS5uYW1lID0gInJlbmVzYXNfb3N0bSIsCj4gKwkJLm9mX21hdGNoX3RhYmxlID0gb2Zf
bWF0Y2hfcHRyKG9zdG1fb2ZfdGFibGUpLAo+ICsJCS5zdXBwcmVzc19iaW5kX2F0dHJzID0gdHJ1
ZSwKPiArCX0sCj4gK307Cj4gK2J1aWx0aW5fcGxhdGZvcm1fZHJpdmVyX3Byb2JlKG9zdG1fZGV2
aWNlX2RyaXZlciwgb3N0bV9wcm9iZSk7Cj4gKyNlbmRpZgo+IAoKCi0tIAo8aHR0cDovL3d3dy5s
aW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFy
bz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8
CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
