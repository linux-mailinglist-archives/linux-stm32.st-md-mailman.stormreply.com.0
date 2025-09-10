Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C48CB512EB
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 11:43:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDCFBC36B3C;
	Wed, 10 Sep 2025 09:43:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 351F1C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 09:43:17 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45cb659e858so45699115e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757497396; x=1758102196;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8+Yb/IxxLIspa6tHUrNInqlVlxK+I+nsywpKyzMZIM8=;
 b=NZFq80a9jql+kM0zKcYSpqEju5HKMHs6ySifrUCi2goe9Ix+r9g1rXBZwQjKRLTLF7
 /emxmWKuBzFEnYTUS++Gt93KZ+AKmKA4f0Vot/QJLJTgPava5aPNXcYEVvDPoIFAMGRH
 b3qMtdQpoBiTdfaQHVJQt8nzBaGyvwtPFUfk0eAOjgC8/XjyziKq/0oZy+/DoE+Yr6F0
 HDDBzbp7lswzPO0UXIRh93nuNCbSYvooLU8cYzZdJnvv8ofo0qK/qNh9GGd0GtT9u/tq
 j1O+ysSF3jGiLIw1E9I+F+1r+1QaP3O6efhXF4DdZ8C7JGum8rR/W4ht78hkQ0JLpU/A
 F6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757497396; x=1758102196;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8+Yb/IxxLIspa6tHUrNInqlVlxK+I+nsywpKyzMZIM8=;
 b=oGK/kragsqwg4n/BuKWgOT8/X3DCRyBSsMiR6kOyWyJuC1B4IwLyhMHtbm6dE4jtg+
 eCEVeJzsHs+i0GpKB9OsxgpOEjyQnDyy0maul/l0GGUA6biSnoIR4Sbd+yt9bgFqshrC
 Nn89fOjgpP9/xuOckkQ90lKiuOFvicftZ0ulQEjmrdPTz0JtC3qalQhQRdiOf65vedYQ
 CYSS8605M3y4s7EyR/grzj/4DmrxoGd/+upXmReuTp2leTzmakGJwAAUdtTFqXoVxlxv
 DlnsDcDsZ4pPOKRsrBRl/mhavGOsmletL8RA44+UKjlkwjbfXIzDSXrINgS0U1eA3LKI
 kbcQ==
X-Gm-Message-State: AOJu0YxFie2XIEsfNYrG08r9Tc3ZXvASkbacfrKa07kYVdSFDL+p92tR
 HSNMy2sa/zRnzRfLGzgUoLL4no3R5oPhhK6GBdyc9N6l4YdWThKF0gIh
X-Gm-Gg: ASbGncs6FOYWBWBFnAUU3C9f4zNzau96T/M+G0u5L89VppiY+oOTHivMlBW2gnHkGXR
 f0OTlBiC05svpKtkoPtnRhke6LMCWFN9bP2V/OVtMK79kFlnAzFeeFe29k2jyOAk0Nycz9hOXs+
 b57qXGfcpbQI9whFVtMXyN+E6H35HgbMGvukG7OEhEl8KVgLr41aTbCkFoQWdmFtfhXdxw1GCe4
 h5AzmqG6aM7IgJDtzi9zuFPVLcyBdHWyMg00AWxlt4kxjGgAOxxZ8aenMMMPBUZlAFu54P2mKlw
 j4XLTLJEEA8PIDBvmpilYmof2+VFpgxSQj3xMeQD/n7KoZ+zSA3yPUwOtjmL/GXIKFuMYlnzPbf
 6nC1DB8jkE4+/tYZCf7OLdZ3/DhalAWSTZEome05T9IJWt9jLDg4c+Qnn+sdZb9gR7jzd40+6U7
 aOK8k17ELg615jD17f2ncQJ1q/Z+dJUFBqUqbAZ2j0gHCPC/Ln0zxmJMC0HyK2+PbmrzyJtUQYt
 BhE
X-Google-Smtp-Source: AGHT+IG++5gaOV3PJKYuJ0A9nAeEycj+nF32F/RTHqK48mjNiX/HpSzosqAvPkjm4CBA9YvRx7JU+A==
X-Received: by 2002:a05:600c:c48e:b0:45b:6743:2242 with SMTP id
 5b1f17b1804b1-45dddee9cc4mr128836755e9.22.1757497396149; 
 Wed, 10 Sep 2025 02:43:16 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:c6d5:9a0c:a4c1:1e58?
 (2a02-8440-7135-4f4c-c6d5-9a0c-a4c1-1e58.rev.sfr.net.
 [2a02:8440:7135:4f4c:c6d5:9a0c:a4c1:1e58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df1ba282dsm25183485e9.5.2025.09.10.02.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 02:43:15 -0700 (PDT)
Message-ID: <22a485b9-1b86-41d3-a42c-f813eea94697@gmail.com>
Date: Wed, 10 Sep 2025 11:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com>
 <9a46c8a8-1d25-410c-9fa2-267eb4040390@foss.st.com>
 <19e664da-df4c-4bc0-84ce-41e4364f10bc@gmail.com>
 <7cfb167a-26df-4abf-a6ec-73813a1a0986@foss.st.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <7cfb167a-26df-4abf-a6ec-73813a1a0986@foss.st.com>
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-perf-users@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 01/20] bus: firewall: move
 stm32_firewall header file in include folder
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

T24gMTAvMDkvMjAyNSAxMDo0MiwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4gCj4gCj4gT24g
OS8xMC8yNSAwOTo0NywgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3RlOgo+PiBPbiAwOS8wOS8yMDI1
IDE0OjI1LCBHYXRpZW4gQ0hFVkFMTElFUiB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gOS85LzI1IDEy
OjEyLCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+Pj4gRnJvbTogQ2zDqW1lbnQgTGUgR29m
ZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+Pj4+Cj4+Pj4gT3RoZXIgZHJpdmVy
IHRoYW4gcmlmc2MgYW5kIGV0enBjIGNhbiBpbXBsZW1lbnQgZmlyZXdhbGwgb3BzLCBzdWNoIGFz
Cj4+Pj4gcmNjLgo+Pj4+IEluIG9yZGVyIGZvciB0aGVtIHRvIGhhdmUgYWNjZXNzIHRvIHRoZSBv
cHMgYW5kIHR5cGUgb2YgdGhpcyBmcmFtZXdvcmssCj4+Pj4gd2UgbmVlZCB0byBnZXQgdGhlIGBz
dG0zMl9maXJld2FsbC5oYCBmaWxlIGluIHRoZSBpbmNsdWRlLyBmb2xkZXIuCj4+Pj4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5z
dC5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5j
bGVtZW50QGdtYWlsLmNvbT4KPj4+PiAtLS0KPj4+PiDCoCBkcml2ZXJzL2J1cy9zdG0zMl9ldHpw
Yy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICstLQo+
Pj4+IMKgIGRyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDMgKy0tCj4+Pj4gwqAgZHJpdmVycy9idXMvc3RtMzJfcmlmc2Mu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArLS0KPj4+
PiDCoCB7ZHJpdmVycyA9PiBpbmNsdWRlL2xpbnV4fS9idXMvc3RtMzJfZmlyZXdhbGwuaCB8IDAK
Pj4+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jIGIvZHJpdmVy
cy9idXMvc3RtMzJfZXR6cGMuYwo+Pj4+IGluZGV4IDdmYzBmMTY5NjBiZS4uNDkxOGExNGU1MDdl
IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmMKPj4+PiArKysgYi9k
cml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jCj4+Pj4gQEAgLTUsNiArNSw3IEBACj4+Pj4gwqAgI2lu
Y2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+Cj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4K
Pj4+PiArI2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0zMl9maXJld2FsbC5oPgo+Pj4+IMKgICNpbmNs
dWRlIDxsaW51eC9kZXZpY2UuaD4KPj4+PiDCoCAjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4+Pj4g
wqAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KPj4+PiBAQCAtMTYsOCArMTcsNiBAQAo+Pj4+IMKg
ICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPj4+PiDCoCAjaW5jbHVkZSA8bGlu
dXgvdHlwZXMuaD4KPj4+PiAtI2luY2x1ZGUgInN0bTMyX2ZpcmV3YWxsLmgiCj4+Pj4gLQo+Pj4+
IMKgIC8qCj4+Pj4gwqDCoCAqIEVUWlBDIHJlZ2lzdGVycwo+Pj4+IMKgwqAgKi8KPj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYyBiL2RyaXZlcnMvYnVzLyAKPj4+
PiBzdG0zMl9maXJld2FsbC5jCj4+Pj4gaW5kZXggMmZjOTc2MWRhZGVjLi5lZjQ5ODgwNTRiNDQg
MTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYwo+Pj4+ICsrKyBi
L2RyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMKPj4+PiBAQCAtNSw2ICs1LDcgQEAKPj4+PiDC
oCAjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KPj4+PiDCoCAjaW5jbHVkZSA8bGludXgvYml0
cy5oPgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmg+Cj4+Pj4gwqAg
I2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0zMl9maXJld2FsbF9kZXZpY2UuaD4KPj4+PiDCoCAjaW5j
bHVkZSA8bGludXgvZGV2aWNlLmg+Cj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+Pj4+
IEBAIC0xOCw4ICsxOSw2IEBACj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+Pj4g
wqAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPj4+PiAtI2luY2x1ZGUgInN0bTMyX2ZpcmV3YWxs
LmgiCj4+Pj4gLQo+Pj4+IMKgIC8qIENvcnJlc3BvbmRzIHRvIFNUTTMyX0ZJUkVXQUxMX01BWF9F
WFRSQV9BUkdTICsgZmlyZXdhbGwgSUQgKi8KPj4+PiDCoCAjZGVmaW5lIFNUTTMyX0ZJUkVXQUxM
X01BWF9BUkdTIChTVE0zMl9GSVJFV0FMTF9NQVhfRVhUUkFfQVJHUyArIDEpCj4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYnVzL3N0bTMyX3JpZnNjLmMgYi9kcml2ZXJzL2J1cy9zdG0zMl9yaWZz
Yy5jCj4+Pj4gaW5kZXggNGNmMWI2MDAxNGI3Li42NDNkZGQwYTVmNTQgMTAwNjQ0Cj4+Pj4gLS0t
IGEvZHJpdmVycy9idXMvc3RtMzJfcmlmc2MuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvYnVzL3N0bTMy
X3JpZnNjLmMKPj4+PiBAQCAtNSw2ICs1LDcgQEAKPj4+PiDCoCAjaW5jbHVkZSA8bGludXgvYml0
ZmllbGQuaD4KPj4+PiDCoCAjaW5jbHVkZSA8bGludXgvYml0cy5oPgo+Pj4+ICsjaW5jbHVkZSA8
bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmg+Cj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2Rldmlj
ZS5oPgo+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPj4+PiDCoCAjaW5jbHVkZSA8bGlu
dXgvaW5pdC5oPgo+Pj4+IEBAIC0xNiw4ICsxNyw2IEBACj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4
L3BsYXRmb3JtX2RldmljZS5oPgo+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+Pj4+
IC0jaW5jbHVkZSAic3RtMzJfZmlyZXdhbGwuaCIKPj4+PiAtCj4+Pj4gwqAgLyoKPj4+PiDCoMKg
ICogUklGU0Mgb2Zmc2V0IHJlZ2lzdGVyCj4+Pj4gwqDCoCAqLwo+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2J1cy9zdG0zMl9maXJld2FsbC5oIGIvaW5jbHVkZS9saW51eC9idXMvIAo+Pj4+IHN0
bTMyX2ZpcmV3YWxsLmgKPj4+PiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPj4+PiByZW5hbWUgZnJv
bSBkcml2ZXJzL2J1cy9zdG0zMl9maXJld2FsbC5oCj4+Pj4gcmVuYW1lIHRvIGluY2x1ZGUvbGlu
dXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmgKPj4+Pgo+Pgo+PiBIaSBHYXRpZW4KPj4KPj4+IEFzIHRo
ZSBmaXJld2FsbCBoZWFkZXIgaXMgbW92ZWQgdG8gYSBkZWRpY2F0ZWQgZmlyZXdhbGwgZGlyZWN0
b3J5LAo+Pgo+PiBJIGRvbid0IG1vdmUgaXQgdG8gYSBkZWRpY2F0ZWQgZmlyZXdhbGwgZGlyZWN0
b3J5IGp1c3QgdG8gdGhlICJidXMiIAo+PiBkaXJlY3Rvcnkgd2hlcmUgdGhlICJzdG0zMl9maXJl
d2FsbF9kZXZpY2UuaCIgaGVhZGVyIGZpbGUgaXMgYWxyZWFkeSAKPj4gbG9jYXRlZC4KPj4KPiAK
PiBZZXMsIG15IGJhZCwgSSBtaXhlZCBteSB3b3JkcyB0aGVyZS4KPiAKPj4+IG1heWJlIGl0IHdv
dWxkIGJlIGNvaGVyZW50IHRvIGNyZWF0ZSB0aGUgc2FtZSBraW5kIG9mIGRpcmVjdG9yeQo+Pj4g
Zm9yIHRoZSBzb3VyY2VzIGFzIG5vbi1idXNlcyBkcml2ZXJzIHVzZSBpdC4gSSBjYW4gdGVzdCBp
dCBvbiBteQo+Pj4gc2lkZSBpZiB5b3UncmUgd2lsbGluZyB0byBtYWtlIHRoZSBjaGFuZ2UuCj4+
Cj4+IERvIHlvdSBtZWFuIGNyZWF0ZSBhbiBpbmNsdWRlL2xpbnV4L2J1cy9maXJld2FsbC8gZGly
ZWN0b3J5ID8KPj4KPiAKPiBSYXRoZXIgaW5jbHVkZS9saW51eC9maXJld2FsbC8oc3RtMzIvKS4g
YW5kIGEgZHJpdmVycy9maXJld2FsbC8oc3RtMzIvKQo+IGRpcmVjdG9yeSBmb3IgdGhlIGZpcmV3
YWxsIGZpbGVzIHdvdWxkIGJlIGdyZWF0LiBJZiB0aGF0J3Mgbm90IHRvbyBtdWNoCj4gb2YgYSBi
dXJkZW4uCgpJIHRoaW5rcyB0aGF0J3MgYSBiaXQgdG9vIG11Y2ggZm9yIHRoaXMgb25lLgpBcyB5
b3UncmUgdGhlIGZpcmV3YWxsIG1haW50YWluZXIgSSB3b3VsZCBuZWVkIHRvIG1vZGlmeSB5b3Vy
IGVudHJ5IGluIAp0aGUgTUFJTlRBSU5FUiBmaWxlIChhbmQgSSBqdXN0IHNlZSB0aGF0IHlvdXIg
ZW50cnkgaXMgbGFja2luZyB0aGUgCmhlYWRlciBmaWxlIHBhdGgpLgpGb3Igbm93IEkgdGhpbmsg
aXQgaXMgbm90IHVyZ2VudCBuZWl0aGVyIG1hbmRhdG9yeS4KTWF5YmUgaW4gYSBuZXh0IHBhdGNo
IHNlcmllcyA/CkV2ZW4gaW4gdGhlIGRyaXZlciBidXMgZGlyZWN0b3J5IHRoZXJlIGlzIG5vIHZl
bmRvciBwb2xpY3kgc28gYWRkaW5nIGEgCnBhdGggbGlrZSBkcml2ZXJzL2J1cy97c3RtMzIvfGZp
cmV3YWxsL31zdG0zMl9maXJld2FsbC5jIGlzIGEgYml0IApvdmVybGFwcGluZyBhcyB3aXRoIHRo
ZSBmaWxlbmFtZSB3ZSBhbHJlYWR5IGtub3cgaXQgaXMgU1QgYW5kIGl0cyBmaXJld2FsbC4KTGV0
IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsgIQoKQlIsCkNsw6ltZW50CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
