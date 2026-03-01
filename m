Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEweHWTio2nbRAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 07:53:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C430A1CEB1B
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 07:53:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 654DEC87EC9;
	Sun,  1 Mar 2026 06:53:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB40AC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:53:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9506543C8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6782EC4AF09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772348000;
 bh=uBz5/DsNTkQF53CTWrzktdKlRSarb9rE0O45U+rT51I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hHe0qPKqlA2jRVjg5vABP2Aa6hNExBjEIedvyNDQZXuI7E+qTe5af0cTSaWg6BS5w
 ssd24632XDM6/aEhP9EXoJ/rM+sMNvu5NLZ8F7aPAg9nCBOYI81O4knii0Qd46Gq6/
 HYPxI3Ku/dctrl3SUfMZX+8G5fQgWoA6BffzdVMMh0NTn9Z/1+6NIavwQPJQWDmSlz
 booQh/xG8Szq7fWhYzrIWYyqG8wZxOphFwhbgV5b3mhA98kNIIhb4GSF9pjbnS0+QW
 toXEgIQK4QvCMMj8OFd1xQ6eGUMIQsvCMN9HsGV5X8W5OYRcwgdrHph+V/75AfFzf+
 xNld2+Z7uzHug==
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-65fb991d7e7so4869948a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Feb 2026 22:53:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWe1jSmypRODDardiqsLWvUBRbKqOnBjz6ioxcW+ZMxPqagv0VvwTF0a7z70DxsigzKtl9L3jC0gA7r3g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzs6cJq8O08ftRoxbHbLHMAMfuNOn5sYqbDRTSPNwDlBgIDkIJA
 aZQnyjQznp1f2YyLiy7wFHkJD1gJB4pve7/2WXXLdqimzPT+rG70fcXBIXF+l962sCQACSxbt90
 x+NbOj2XCF/fitALoDOAoD9TIWESWxAc=
X-Received: by 2002:a05:6402:4493:b0:660:475:93f2 with SMTP id
 4fb4d7f45d1cf-660047594bemr3098193a12.18.1772347998875; Sat, 28 Feb 2026
 22:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20260301015348.1720657-1-sashal@kernel.org>
In-Reply-To: <20260301015348.1720657-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:53:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7CpjDY29zPB60d8Ct2NWRrwGf+tJ52oYCL3fjRPEkEDA@mail.gmail.com>
X-Gm-Features: AaiRm50zfa7_kKX2hukVQSNRYw5_Ic-T65iYr0aa-JHwjvscZiMEXArH3ZD0ets
Message-ID: <CAAhV-H7CpjDY29zPB60d8Ct2NWRrwGf+tJ52oYCL3fjRPEkEDA@mail.gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Hongliang Wang <wanghongliang@loongson.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [Linux-stm32] FAILED: Patch "net: stmmac: dwmac-loongson: Set
 clk_csr_i to 100-150MHz" failed to apply to 5.15-stable tree
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[chenhuacai@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashal@kernel.org,m:netdev@vger.kernel.org,m:stable@vger.kernel.org,m:kuba@kernel.org,m:wanghongliang@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:chenhuacai@loongson.cn,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,mail.gmail.com:mid,loongson.cn:email,msgid.link:url]
X-Rspamd-Queue-Id: C430A1CEB1B
X-Rspamd-Action: no action

SGksIFNhc2hhLAoKT24gU3VuLCBNYXIgMSwgMjAyNiBhdCA5OjUz4oCvQU0gU2FzaGEgTGV2aW4g
PHNhc2hhbEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoZSBwYXRjaCBiZWxvdyBkb2VzIG5vdCBh
cHBseSB0byB0aGUgNS4xNS1zdGFibGUgdHJlZS4KPiBJZiBzb21lb25lIHdhbnRzIGl0IGFwcGxp
ZWQgdGhlcmUsIG9yIHRvIGFueSBvdGhlciBzdGFibGUgb3IgbG9uZ3Rlcm0KPiB0cmVlLCB0aGVu
IHBsZWFzZSBlbWFpbCB0aGUgYmFja3BvcnQsIGluY2x1ZGluZyB0aGUgb3JpZ2luYWwgZ2l0IGNv
bW1pdAo+IGlkIHRvIDxzdGFibGVAdmdlci5rZXJuZWwub3JnPi4KSSBoYXZlIGFscmVhZHkgc3Vi
bWl0IGEgcGF0Y2ggZm9yIDUuMTUgc29tZSBkYXlzIGFnbzoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbG9vbmdhcmNoLzIwMjYwMjE4MTIxMzEwLjI1NDUxNDktMS1jaGVuaHVhY2FpQGxvb25nc29u
LmNuL1QvI3UKCkh1YWNhaQo+Cj4gVGhhbmtzLAo+IFNhc2hhCj4KPiAtLS0tLS0tLS0tLS0tLS0t
LS0gb3JpZ2luYWwgY29tbWl0IGluIExpbnVzJ3MgdHJlZSAtLS0tLS0tLS0tLS0tLS0tLS0KPgo+
IEZyb20gZTFhYTVlZjg5MmZiNGZhOTAxNGEyNWU4N2I2NGI5NzM0NzkxOWQzNyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKPiBGcm9tOiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBsb29uZ3Nvbi5j
bj4KPiBEYXRlOiBUdWUsIDMgRmViIDIwMjYgMTQ6Mjk6MDEgKzA4MDAKPiBTdWJqZWN0OiBbUEFU
Q0hdIG5ldDogc3RtbWFjOiBkd21hYy1sb29uZ3NvbjogU2V0IGNsa19jc3JfaSB0byAxMDAtMTUw
TUh6Cj4KPiBDdXJyZW50IGNsa19jc3JfaSBzZXR0aW5nIG9mIExvb25nc29uIFNUTU1BQyAoaW5j
bHVkaW5nIExTN0ExMDAwLzIwMDAKPiBhbmQgTFMySzEwMDAvMjAwMC8zMDAwKSBhcmUgY29weSAm
IHBhc3RlIGZyb20gb3RoZXIgZHJpdmVycy4gSW4gZmFjdCwKPiBMb29uZ3NvbiBTVE1NQUMgdXNl
IDEyNU1IeiBjbG9ja3MgYW5kIG5lZWQgNjIgZnJlcSBkaXZpc2lvbiB0byB3aXRoaW4KPiAyLjVN
SHosIG1lZXRpbmcgbW9zdCBQSFkgTURDIHJlcXVpcmVtZW50LiBTbyBmaXggYnkgc2V0dGluZyBj
bGtfY3NyX2kKPiB0byAxMDAtMTUwTUh6LCBvdGhlcndpc2Ugc29tZSBQSFlzIG1heSBsaW5rIGZh
aWwuCj4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVzOiAzMGJiYTY5ZDdkYjQw
ZTcgKCJzdG1tYWM6IHBjaTogQWRkIGR3bWFjIHN1cHBvcnQgZm9yIExvb25nc29uIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBIb25nbGlhbmcgV2FuZyA8d2FuZ2hvbmdsaWFuZ0Bsb29uZ3Nvbi5jbj4KPiBT
aWduZWQtb2ZmLWJ5OiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBsb29uZ3Nvbi5jbj4KPiBMaW5r
OiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjAyMDMwNjI5MDEuMjE1ODIzNi0xLWNoZW5o
dWFjYWlAbG9vbmdzb24uY24KPiBTaWduZWQtb2ZmLWJ5OiBKYWt1YiBLaWNpbnNraSA8a3ViYUBr
ZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy1sb29uZ3Nvbi5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMKPiBpbmRleCAxMDdhN2M4NGFjZTgwLi5jMDVl
M2U3YTUzOWNmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLWxvb25nc29uLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gQEAgLTkxLDggKzkxLDggQEAgc3RhdGljIHZvaWQg
bG9vbmdzb25fZGVmYXVsdF9kYXRhKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+ICAgICAgICAgLyog
R2V0IGJ1c19pZCwgdGhpcyBjYW4gYmUgb3ZlcndyaXR0ZW4gbGF0ZXIgKi8KPiAgICAgICAgIHBs
YXQtPmJ1c19pZCA9IHBjaV9kZXZfaWQocGRldik7Cj4KPiAtICAgICAgIC8qIGNsa19jc3JfaSA9
IDIwLTM1TUh6ICYgTURDID0gY2xrX2Nzcl9pLzE2ICovCj4gLSAgICAgICBwbGF0LT5jbGtfY3Ny
ID0gU1RNTUFDX0NTUl8yMF8zNU07Cj4gKyAgICAgICAvKiBjbGtfY3NyX2kgPSAxMDAtMTUwTUh6
ICYgTURDID0gY2xrX2Nzcl9pLzYyICovCj4gKyAgICAgICBwbGF0LT5jbGtfY3NyID0gU1RNTUFD
X0NTUl8xMDBfMTUwTTsKPiAgICAgICAgIHBsYXQtPmNvcmVfdHlwZSA9IERXTUFDX0NPUkVfR01B
QzsKPiAgICAgICAgIHBsYXQtPmZvcmNlX3NmX2RtYV9tb2RlID0gMTsKPgo+IC0tCj4gMi41MS4w
Cj4KPgo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
